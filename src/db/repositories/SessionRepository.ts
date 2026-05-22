import { getDatabase } from '../database';
import type { PracticeSession, UserAnswer } from '../../types/session.types';

export const SessionRepository = {
  async createSession(session: PracticeSession): Promise<void> {
    const db = await getDatabase();
    await db.runAsync(
      `INSERT INTO local_sessions
        (id, user_id, session_type, exam_type, subject, tryout_template_id,
         total_questions, answered_count, correct_count, total_score, max_score,
         duration_seconds, section_scores, completed, started_at, completed_at, is_synced)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      session.id, session.userId, session.sessionType,
      session.examType ?? null, session.subject ?? null,
      session.tryoutTemplateId ?? null,
      session.totalQuestions, session.answeredCount, session.correctCount,
      session.totalScore, session.maxScore,
      session.durationSeconds ?? null,
      session.sectionScores ? JSON.stringify(session.sectionScores) : null,
      session.completed ? 1 : 0,
      session.startedAt, session.completedAt ?? null,
      session.isSynced ? 1 : 0
    );
  },

  async updateSession(session: PracticeSession): Promise<void> {
    const db = await getDatabase();
    await db.runAsync(
      `UPDATE local_sessions SET
        answered_count = ?, correct_count = ?, total_score = ?, max_score = ?,
        duration_seconds = ?, section_scores = ?, completed = ?,
        completed_at = ?, is_synced = ?
       WHERE id = ?`,
      session.answeredCount, session.correctCount, session.totalScore, session.maxScore,
      session.durationSeconds ?? null,
      session.sectionScores ? JSON.stringify(session.sectionScores) : null,
      session.completed ? 1 : 0,
      session.completedAt ?? null,
      session.isSynced ? 1 : 0,
      session.id
    );
  },

  async getSession(id: string): Promise<PracticeSession | null> {
    const db = await getDatabase();
    const row = await db.getFirstAsync<any>(
      'SELECT * FROM local_sessions WHERE id = ?',
      id
    );
    return row ? mapSession(row) : null;
  },

  async getSessionsByUser(userId: string, limit = 50): Promise<PracticeSession[]> {
    const db = await getDatabase();
    const rows = await db.getAllAsync<any>(
      'SELECT * FROM local_sessions WHERE user_id = ? AND completed = 1 ORDER BY started_at DESC LIMIT ?',
      userId, limit
    );
    return rows.map(mapSession);
  },

  async getUnsyncedSessions(userId: string): Promise<PracticeSession[]> {
    const db = await getDatabase();
    const rows = await db.getAllAsync<any>(
      'SELECT * FROM local_sessions WHERE user_id = ? AND is_synced = 0 AND completed = 1',
      userId
    );
    return rows.map(mapSession);
  },

  async markSessionSynced(sessionId: string): Promise<void> {
    const db = await getDatabase();
    await db.runAsync(
      'UPDATE local_sessions SET is_synced = 1 WHERE id = ?',
      sessionId
    );
  },

  async getSessionStats(userId: string): Promise<{
    totalSessions: number;
    totalCorrect: number;
    totalAnswered: number;
    totalScore: number;
  }> {
    const db = await getDatabase();
    const row = await db.getFirstAsync<any>(
      `SELECT
        COUNT(*) as total_sessions,
        SUM(correct_count) as total_correct,
        SUM(answered_count) as total_answered,
        SUM(total_score) as total_score
       FROM local_sessions
       WHERE user_id = ? AND completed = 1`,
      userId
    );
    return {
      totalSessions: row?.total_sessions ?? 0,
      totalCorrect: row?.total_correct ?? 0,
      totalAnswered: row?.total_answered ?? 0,
      totalScore: row?.total_score ?? 0,
    };
  },
};

export const AnswerRepository = {
  async saveAnswers(answers: UserAnswer[]): Promise<void> {
    if (answers.length === 0) return;
    const db = await getDatabase();
    await db.withTransactionAsync(async () => {
      for (const a of answers) {
        await db.runAsync(
          `INSERT OR REPLACE INTO local_answers
            (id, user_id, question_id, session_id, selected_option, is_correct,
             score_earned, time_spent_ms, answered_at, is_synced)
           VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
          a.id, a.userId, a.questionId, a.sessionId,
          a.selectedOption, a.isCorrect ? 1 : 0,
          a.scoreEarned, a.timeSpentMs ?? null,
          a.answeredAt, a.isSynced ? 1 : 0
        );
      }
    });
  },

  async getAnswersBySession(sessionId: string): Promise<UserAnswer[]> {
    const db = await getDatabase();
    const rows = await db.getAllAsync<any>(
      'SELECT * FROM local_answers WHERE session_id = ? ORDER BY answered_at ASC',
      sessionId
    );
    return rows.map(mapAnswer);
  },

  async getUnsyncedAnswers(userId: string): Promise<UserAnswer[]> {
    const db = await getDatabase();
    const rows = await db.getAllAsync<any>(
      'SELECT * FROM local_answers WHERE user_id = ? AND is_synced = 0',
      userId
    );
    return rows.map(mapAnswer);
  },

  async markAnswersSynced(sessionId: string): Promise<void> {
    const db = await getDatabase();
    await db.runAsync(
      'UPDATE local_answers SET is_synced = 1 WHERE session_id = ?',
      sessionId
    );
  },

  async getAccuracyBySubject(userId: string): Promise<Record<string, { correct: number; total: number }>> {
    const db = await getDatabase();
    const rows = await db.getAllAsync<any>(
      `SELECT q.subject, COUNT(*) as total, SUM(a.is_correct) as correct
       FROM local_answers a
       JOIN local_questions q ON q.id = a.question_id
       WHERE a.user_id = ?
       GROUP BY q.subject`,
      userId
    );
    const result: Record<string, { correct: number; total: number }> = {};
    for (const row of rows) {
      result[row.subject] = { correct: row.correct ?? 0, total: row.total };
    }
    return result;
  },
};

function mapSession(row: any): PracticeSession {
  return {
    id: row.id,
    userId: row.user_id,
    sessionType: row.session_type,
    examType: row.exam_type,
    subject: row.subject,
    tryoutTemplateId: row.tryout_template_id,
    totalQuestions: row.total_questions,
    answeredCount: row.answered_count,
    correctCount: row.correct_count,
    totalScore: row.total_score,
    maxScore: row.max_score,
    durationSeconds: row.duration_seconds,
    sectionScores: row.section_scores ? JSON.parse(row.section_scores) : undefined,
    completed: row.completed === 1,
    startedAt: row.started_at,
    completedAt: row.completed_at,
    isSynced: row.is_synced === 1,
  };
}

function mapAnswer(row: any): UserAnswer {
  return {
    id: row.id,
    userId: row.user_id,
    questionId: row.question_id,
    sessionId: row.session_id,
    selectedOption: row.selected_option,
    isCorrect: row.is_correct === 1,
    scoreEarned: row.score_earned,
    timeSpentMs: row.time_spent_ms,
    answeredAt: row.answered_at,
    isSynced: row.is_synced === 1,
  };
}
