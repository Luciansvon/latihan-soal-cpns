-- ============================================================
-- AI Tutor — rate limit log
-- ============================================================
-- One row per AI request. The Edge Function `ai-tutor` counts rows
-- per user per day to enforce a daily limit (default 10 / day).

CREATE TABLE public.ai_request_log (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id       UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  mode          TEXT NOT NULL, -- 'explanation' | 'hint' | 'chat'
  question_id   UUID REFERENCES questions(id),
  model         TEXT,
  tokens_in     INTEGER,
  tokens_out    INTEGER,
  hint_level    SMALLINT,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_ai_log_user_day ON public.ai_request_log (user_id, created_at);

ALTER TABLE public.ai_request_log ENABLE ROW LEVEL SECURITY;

-- Users can read their own log (for "X dari 10" UI). Inserts happen via
-- Edge Function with service-role and bypass RLS, so no insert policy.
CREATE POLICY "ai_log_own_read" ON public.ai_request_log
  FOR SELECT TO authenticated USING (auth.uid() = user_id);

-- ============================================================
-- AI explanation cache on questions
-- ============================================================
-- Already declared on questions.ai_explanation_cache in 001_initial_schema.sql:
--   ai_explanation_cache JSONB
-- Edge Function may write to this column when generating an explanation that
-- is independent of the user's learning style, to amortize cost across users.
-- Writes require service-role; we do not add a separate policy here.
