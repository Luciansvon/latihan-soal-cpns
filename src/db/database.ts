import * as SQLite from 'expo-sqlite';

let db: SQLite.SQLiteDatabase | null = null;

export async function getDatabase(): Promise<SQLite.SQLiteDatabase> {
  if (db) return db;
  db = await SQLite.openDatabaseAsync('latihan_soal.db');
  await runMigrations(db);
  return db;
}

const MIGRATIONS: string[] = [
  // Migration 001: initial schema
  `
  CREATE TABLE IF NOT EXISTS local_question_packs (
    id              TEXT PRIMARY KEY,
    exam_type       TEXT NOT NULL,
    subject         TEXT NOT NULL,
    title           TEXT NOT NULL,
    description     TEXT,
    version         INTEGER NOT NULL DEFAULT 1,
    question_count  INTEGER NOT NULL DEFAULT 0,
    storage_path    TEXT,
    downloaded_at   INTEGER NOT NULL,
    is_synced       INTEGER NOT NULL DEFAULT 1
  );

  CREATE TABLE IF NOT EXISTS local_questions (
    id                    TEXT PRIMARY KEY,
    pack_id               TEXT NOT NULL,
    exam_type             TEXT NOT NULL,
    subject               TEXT NOT NULL,
    subtopic              TEXT,
    question_type         TEXT NOT NULL DEFAULT 'MULTIPLE_CHOICE',
    difficulty            TEXT NOT NULL DEFAULT 'SEDANG',
    question_text         TEXT NOT NULL,
    question_image_url    TEXT,
    options               TEXT NOT NULL,
    correct_option        TEXT NOT NULL,
    tkp_scores            TEXT,
    explanation_text      TEXT,
    explanation_image_url TEXT,
    tags                  TEXT,
    FOREIGN KEY (pack_id) REFERENCES local_question_packs(id)
  );

  CREATE INDEX IF NOT EXISTS idx_lq_pack ON local_questions(pack_id);
  CREATE INDEX IF NOT EXISTS idx_lq_subject ON local_questions(exam_type, subject);
  CREATE INDEX IF NOT EXISTS idx_lq_subtopic ON local_questions(subject, subtopic);

  CREATE TABLE IF NOT EXISTS local_sessions (
    id                    TEXT PRIMARY KEY,
    user_id               TEXT NOT NULL,
    session_type          TEXT NOT NULL,
    exam_type             TEXT,
    subject               TEXT,
    tryout_template_id    TEXT,
    total_questions       INTEGER NOT NULL,
    answered_count        INTEGER NOT NULL DEFAULT 0,
    correct_count         INTEGER NOT NULL DEFAULT 0,
    total_score           INTEGER NOT NULL DEFAULT 0,
    max_score             INTEGER NOT NULL DEFAULT 0,
    duration_seconds      INTEGER,
    section_scores        TEXT,
    completed             INTEGER NOT NULL DEFAULT 0,
    started_at            INTEGER NOT NULL,
    completed_at          INTEGER,
    is_synced             INTEGER NOT NULL DEFAULT 0
  );

  CREATE INDEX IF NOT EXISTS idx_ls_user ON local_sessions(user_id);
  CREATE INDEX IF NOT EXISTS idx_ls_user_completed ON local_sessions(user_id, completed);
  CREATE INDEX IF NOT EXISTS idx_ls_unsynced ON local_sessions(is_synced);

  CREATE TABLE IF NOT EXISTS local_answers (
    id              TEXT PRIMARY KEY,
    user_id         TEXT NOT NULL,
    question_id     TEXT NOT NULL,
    session_id      TEXT NOT NULL,
    selected_option TEXT NOT NULL,
    is_correct      INTEGER NOT NULL,
    score_earned    INTEGER NOT NULL DEFAULT 0,
    time_spent_ms   INTEGER,
    answered_at     INTEGER NOT NULL,
    is_synced       INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY (session_id) REFERENCES local_sessions(id)
  );

  CREATE INDEX IF NOT EXISTS idx_la_session ON local_answers(session_id);
  CREATE INDEX IF NOT EXISTS idx_la_user ON local_answers(user_id);
  CREATE INDEX IF NOT EXISTS idx_la_unsynced ON local_answers(is_synced);

  CREATE TABLE IF NOT EXISTS local_bookmarks (
    user_id         TEXT NOT NULL,
    question_id     TEXT NOT NULL,
    note            TEXT,
    created_at      INTEGER NOT NULL,
    is_synced       INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY (user_id, question_id)
  );

  CREATE TABLE IF NOT EXISTS local_user_state (
    user_id         TEXT PRIMARY KEY,
    username        TEXT,
    xp_total        INTEGER NOT NULL DEFAULT 0,
    level           INTEGER NOT NULL DEFAULT 1,
    streak_current  INTEGER NOT NULL DEFAULT 0,
    streak_longest  INTEGER NOT NULL DEFAULT 0,
    streak_last_date TEXT,
    learning_style  TEXT,
    last_synced_at  INTEGER
  );

  CREATE TABLE IF NOT EXISTS download_queue (
    pack_id         TEXT PRIMARY KEY,
    status          TEXT NOT NULL DEFAULT 'PENDING',
    progress        REAL NOT NULL DEFAULT 0,
    error_message   TEXT,
    created_at      INTEGER NOT NULL,
    updated_at      INTEGER NOT NULL
  );

  CREATE TABLE IF NOT EXISTS schema_migrations (
    version     INTEGER PRIMARY KEY,
    applied_at  INTEGER NOT NULL
  );
  `,
];

async function runMigrations(database: SQLite.SQLiteDatabase): Promise<void> {
  await database.execAsync(`
    CREATE TABLE IF NOT EXISTS schema_migrations (
      version     INTEGER PRIMARY KEY,
      applied_at  INTEGER NOT NULL
    );
  `);

  const applied = await database.getAllAsync<{ version: number }>(
    'SELECT version FROM schema_migrations ORDER BY version ASC'
  );
  const appliedVersions = new Set(applied.map((r) => r.version));

  for (let i = 0; i < MIGRATIONS.length; i++) {
    const version = i + 1;
    if (appliedVersions.has(version)) continue;

    await database.withTransactionAsync(async () => {
      await database.execAsync(MIGRATIONS[i]);
      await database.runAsync(
        'INSERT INTO schema_migrations (version, applied_at) VALUES (?, ?)',
        version,
        Date.now()
      );
    });
  }
}

export async function closeDatabase(): Promise<void> {
  if (db) {
    await db.closeAsync();
    db = null;
  }
}
