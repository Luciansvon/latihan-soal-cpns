// Supabase database type stubs — extend as needed
export type Database = {
  public: {
    Tables: {
      profiles: {
        Row: {
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
        };
        Insert: Partial<Database['public']['Tables']['profiles']['Row']> & { id: string };
        Update: Partial<Database['public']['Tables']['profiles']['Row']>;
      };
      question_packs: {
        Row: {
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
        };
        Insert: Partial<Database['public']['Tables']['question_packs']['Row']>;
        Update: Partial<Database['public']['Tables']['question_packs']['Row']>;
      };
      practice_sessions: {
        Row: {
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
          section_scores: Record<string, any> | null;
          completed: boolean;
          started_at: string;
          completed_at: string | null;
        };
        Insert: Partial<Database['public']['Tables']['practice_sessions']['Row']>;
        Update: Partial<Database['public']['Tables']['practice_sessions']['Row']>;
      };
      user_answers: {
        Row: {
          id: string;
          user_id: string;
          question_id: string;
          session_id: string;
          selected_option: string;
          is_correct: boolean;
          score_earned: number;
          time_spent_ms: number | null;
          answered_at: string;
        };
        Insert: Partial<Database['public']['Tables']['user_answers']['Row']>;
        Update: Partial<Database['public']['Tables']['user_answers']['Row']>;
      };
    };
    Views: Record<string, unknown>;
    Functions: Record<string, unknown>;
  };
};
