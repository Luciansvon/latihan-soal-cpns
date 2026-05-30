-- Migration 002: Add difficulty_rank to questions
-- difficulty_rank SMALLINT: 1 = easiest, 10 = hardest
-- Nullable so existing rows are unaffected without backfill.

ALTER TABLE public.questions
  ADD COLUMN IF NOT EXISTS difficulty_rank SMALLINT
    CHECK (difficulty_rank >= 1 AND difficulty_rank <= 10);

CREATE INDEX IF NOT EXISTS idx_questions_difficulty_rank
  ON public.questions(exam_type, subject, difficulty_rank DESC NULLS LAST);

COMMENT ON COLUMN public.questions.difficulty_rank IS
  '1=termudah, 10=tersulit. Ranking numerik dalam tier difficulty enum.';
