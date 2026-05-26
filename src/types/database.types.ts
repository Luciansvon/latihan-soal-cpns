// Supabase database type stubs — extend as needed.
// Row types are defined as standalone interfaces to avoid circular
// self-references (which make Insert/Update resolve to `never`).

export interface ProfileRow {
  id: string;
  username: string;
  full_name: string | null;
  avatar_url: string | null;
  target_exam: string;
  target_date: string | null;
  province: string | null;
  xp_total: number;
  level: number;
  streak_current: number;
  streak_longest: number;
  streak_last_date: string | null;
  learning_style: Record<string, number> | null;
  created_at: string;
  updated_at: string;
}

export interface QuestionPackRow {
  id: string;
  exam_type: string;
  subject: string;
  title: string;
  description: string | null;
  version: number;
  question_count: number;
  file_size_kb: number | null;
  storage_path: string | null;
  is_free: boolean;
  is_published: boolean;
  created_at: string;
  updated_at: string;
}

export interface PracticeSessionRow {
  id: string;
  user_id: string;
  session_type: string;
  exam_type: string | null;
  subject: string | null;
  tryout_template_id: string | null;
  total_questions: number;
  answered_count: number;
  correct_count: number;
  total_score: number;
  max_score: number;
  duration_seconds: number | null;
  section_scores: Record<string, unknown> | null;
  completed: boolean;
  started_at: string;
  completed_at: string | null;
}

export interface UserAnswerRow {
  id: string;
  user_id: string;
  question_id: string;
  session_id: string;
  selected_option: string;
  is_correct: boolean;
  score_earned: number;
  time_spent_ms: number | null;
  answered_at: string;
}

type TableShape<Row> = {
  Row: Row;
  Insert: Partial<Row>;
  Update: Partial<Row>;
  Relationships: [];
};

export type Database = {
  public: {
    Tables: {
      profiles: TableShape<ProfileRow>;
      question_packs: TableShape<QuestionPackRow>;
      practice_sessions: TableShape<PracticeSessionRow>;
      user_answers: TableShape<UserAnswerRow>;
    };
    Views: Record<string, never>;
    Functions: Record<string, never>;
    Enums: Record<string, never>;
    CompositeTypes: Record<string, never>;
  };
};
