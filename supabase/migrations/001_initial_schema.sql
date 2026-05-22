-- ============================================================
-- Latihan Soal CPNS/TNI/Polri — Initial Schema
-- ============================================================

-- ENUM TYPES
CREATE TYPE exam_type AS ENUM ('CPNS', 'TNI', 'POLRI');
CREATE TYPE subject_type AS ENUM (
  'TWK', 'TIU', 'TKP',
  'PSIKOTES', 'MATEMATIKA',
  'BAHASA_INDONESIA', 'PENGETAHUAN_UMUM',
  'KEDINASAN', 'PENGETAHUAN_HUKUM'
);
CREATE TYPE question_type AS ENUM ('MULTIPLE_CHOICE', 'TKP_SCALE');
CREATE TYPE difficulty_level AS ENUM ('MUDAH', 'SEDANG', 'SULIT');
CREATE TYPE session_type AS ENUM ('PRACTICE', 'TRYOUT', 'CHALLENGE');

-- ============================================================
-- PROFILES (extends auth.users)
-- ============================================================
CREATE TABLE public.profiles (
  id                UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  username          TEXT UNIQUE NOT NULL,
  full_name         TEXT,
  avatar_url        TEXT,
  target_exam       exam_type NOT NULL DEFAULT 'CPNS',
  target_date       DATE,
  province          TEXT,
  xp_total          INTEGER NOT NULL DEFAULT 0,
  level             SMALLINT NOT NULL DEFAULT 1,
  streak_current    SMALLINT NOT NULL DEFAULT 0,
  streak_longest    SMALLINT NOT NULL DEFAULT 0,
  streak_last_date  DATE,
  learning_style    JSONB,
  -- e.g. {"visual":70,"auditory":30,"reading":80,"kinesthetic":40,"activist":60,"reflector":70,"theorist":80,"pragmatist":50}
  created_at        TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at        TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Auto-create profile on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, username, full_name)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'username', split_part(NEW.email, '@', 1)),
    COALESCE(NEW.raw_user_meta_data->>'full_name', '')
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE PROCEDURE public.handle_new_user();

-- ============================================================
-- QUESTION PACKS
-- ============================================================
CREATE TABLE public.question_packs (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  exam_type       exam_type NOT NULL,
  subject         subject_type NOT NULL,
  title           TEXT NOT NULL,
  description     TEXT,
  version         INTEGER NOT NULL DEFAULT 1,
  question_count  INTEGER NOT NULL DEFAULT 0,
  file_size_kb    INTEGER,
  storage_path    TEXT,               -- path in Supabase Storage
  is_free         BOOLEAN NOT NULL DEFAULT TRUE,
  is_published    BOOLEAN NOT NULL DEFAULT FALSE,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================================
-- QUESTIONS
-- ============================================================
CREATE TABLE public.questions (
  id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  pack_id               UUID NOT NULL REFERENCES question_packs(id) ON DELETE CASCADE,
  exam_type             exam_type NOT NULL,
  subject               subject_type NOT NULL,
  subtopic              TEXT,
  question_type         question_type NOT NULL DEFAULT 'MULTIPLE_CHOICE',
  difficulty            difficulty_level NOT NULL DEFAULT 'SEDANG',
  question_text         TEXT NOT NULL,
  question_image_url    TEXT,
  options               JSONB NOT NULL,
  -- [{"id":"A","text":"..."},{"id":"B","text":"..."}]
  correct_option        TEXT NOT NULL,
  tkp_scores            JSONB,
  -- {"A":5,"B":4,"C":3,"D":2,"E":1}
  explanation_text      TEXT,
  explanation_image_url TEXT,
  ai_explanation_cache  JSONB,
  -- {"visual":"...","reading":"...","kinesthetic":"...","auditory":"..."}
  tags                  TEXT[],
  version               INTEGER NOT NULL DEFAULT 1,
  created_at            TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at            TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_questions_pack ON public.questions(pack_id);
CREATE INDEX idx_questions_exam_subject ON public.questions(exam_type, subject);
CREATE INDEX idx_questions_subtopic ON public.questions(subject, subtopic);

-- ============================================================
-- TRYOUT TEMPLATES
-- ============================================================
CREATE TABLE public.tryout_templates (
  id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  exam_type         exam_type NOT NULL,
  title             TEXT NOT NULL,
  description       TEXT,
  duration_minutes  SMALLINT NOT NULL,
  passing_score     INTEGER,
  sections          JSONB NOT NULL,
  -- [{"subject":"TWK","questionCount":30,"passingScore":65},...]
  is_free           BOOLEAN NOT NULL DEFAULT TRUE,
  is_published      BOOLEAN NOT NULL DEFAULT FALSE,
  created_at        TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================================
-- PRACTICE SESSIONS
-- ============================================================
CREATE TABLE public.practice_sessions (
  id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id               UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  session_type          session_type NOT NULL,
  exam_type             exam_type,
  subject               subject_type,
  tryout_template_id    UUID REFERENCES tryout_templates(id),
  total_questions       INTEGER NOT NULL,
  answered_count        INTEGER NOT NULL DEFAULT 0,
  correct_count         INTEGER NOT NULL DEFAULT 0,
  total_score           INTEGER NOT NULL DEFAULT 0,
  max_score             INTEGER NOT NULL DEFAULT 0,
  duration_seconds      INTEGER,
  section_scores        JSONB,
  -- {"TWK":{"score":75,"correct":15,"total":30,"passed":true},...}
  completed             BOOLEAN NOT NULL DEFAULT FALSE,
  started_at            TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at          TIMESTAMPTZ
);

CREATE INDEX idx_sessions_user ON public.practice_sessions(user_id);
CREATE INDEX idx_sessions_user_completed ON public.practice_sessions(user_id, completed);
CREATE INDEX idx_sessions_started ON public.practice_sessions(user_id, started_at DESC);

-- ============================================================
-- USER ANSWERS
-- ============================================================
CREATE TABLE public.user_answers (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id         UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  question_id     UUID NOT NULL REFERENCES questions(id),
  session_id      UUID NOT NULL REFERENCES practice_sessions(id) ON DELETE CASCADE,
  selected_option TEXT NOT NULL,
  is_correct      BOOLEAN NOT NULL,
  score_earned    SMALLINT NOT NULL DEFAULT 0,
  time_spent_ms   INTEGER,
  answered_at     TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_answers_user ON public.user_answers(user_id);
CREATE INDEX idx_answers_session ON public.user_answers(session_id);
CREATE INDEX idx_answers_question ON public.user_answers(question_id);

-- ============================================================
-- BOOKMARKS
-- ============================================================
CREATE TABLE public.bookmarks (
  user_id         UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  question_id     UUID NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
  note            TEXT,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  PRIMARY KEY (user_id, question_id)
);

-- ============================================================
-- ACHIEVEMENTS
-- ============================================================
CREATE TABLE public.achievements (
  id                TEXT PRIMARY KEY,
  title             TEXT NOT NULL,
  description       TEXT NOT NULL,
  icon_name         TEXT NOT NULL,
  xp_reward         INTEGER NOT NULL DEFAULT 0,
  category          TEXT NOT NULL,
  condition_type    TEXT NOT NULL,
  condition_value   INTEGER NOT NULL
);

CREATE TABLE public.user_achievements (
  user_id           UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  achievement_id    TEXT NOT NULL REFERENCES achievements(id),
  earned_at         TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  PRIMARY KEY (user_id, achievement_id)
);

-- ============================================================
-- DAILY CHALLENGES
-- ============================================================
CREATE TABLE public.daily_challenges (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  challenge_date  DATE NOT NULL UNIQUE,
  exam_type       exam_type,
  question_ids    UUID[] NOT NULL,
  xp_reward       INTEGER NOT NULL DEFAULT 50,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE public.daily_challenge_completions (
  user_id         UUID NOT NULL REFERENCES profiles(id),
  challenge_date  DATE NOT NULL,
  session_id      UUID REFERENCES practice_sessions(id),
  xp_earned       INTEGER,
  completed_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  PRIMARY KEY (user_id, challenge_date)
);

-- ============================================================
-- USER DOWNLOADS
-- ============================================================
CREATE TABLE public.user_downloads (
  user_id         UUID NOT NULL REFERENCES profiles(id),
  pack_id         UUID NOT NULL REFERENCES question_packs(id),
  pack_version    INTEGER NOT NULL,
  downloaded_at   TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  PRIMARY KEY (user_id, pack_id)
);

-- ============================================================
-- ROW LEVEL SECURITY
-- ============================================================
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.practice_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_answers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.bookmarks ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_achievements ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_downloads ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.daily_challenge_completions ENABLE ROW LEVEL SECURITY;

-- Profiles: own only
CREATE POLICY "profiles_own" ON public.profiles
  USING (auth.uid() = id) WITH CHECK (auth.uid() = id);

-- Sessions: own only
CREATE POLICY "sessions_own" ON public.practice_sessions
  USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- Answers: own only
CREATE POLICY "answers_own" ON public.user_answers
  USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- Bookmarks: own only
CREATE POLICY "bookmarks_own" ON public.bookmarks
  USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- Achievements: own read
CREATE POLICY "user_achievements_own" ON public.user_achievements
  USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- Downloads: own only
CREATE POLICY "downloads_own" ON public.user_downloads
  USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- Daily challenge completions: own only
CREATE POLICY "challenge_completions_own" ON public.daily_challenge_completions
  USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- Questions, packs, achievements catalog, tryouts, daily challenges: public read for authenticated
ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.question_packs ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.achievements ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.tryout_templates ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.daily_challenges ENABLE ROW LEVEL SECURITY;

CREATE POLICY "questions_public_read" ON public.questions
  FOR SELECT TO authenticated USING (TRUE);
CREATE POLICY "packs_public_read" ON public.question_packs
  FOR SELECT TO authenticated USING (is_published = TRUE);
CREATE POLICY "achievements_public_read" ON public.achievements
  FOR SELECT TO authenticated USING (TRUE);
CREATE POLICY "tryouts_public_read" ON public.tryout_templates
  FOR SELECT TO authenticated USING (is_published = TRUE);
CREATE POLICY "daily_challenges_public_read" ON public.daily_challenges
  FOR SELECT TO authenticated USING (TRUE);
