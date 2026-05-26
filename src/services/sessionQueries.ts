import { supabase } from './supabase';
import type { ExamType, SessionType, SubjectType } from '../types/exam.types';

export interface SectionScoreData {
  score: number;
  correct: number;
  total: number;
  passed: boolean;
}

export interface SessionRow {
  id: string;
  sessionType: SessionType;
  examType?: ExamType;
  subject?: SubjectType;
  totalQuestions: number;
  answeredCount: number;
  correctCount: number;
  totalScore: number;
  maxScore: number;
  durationSeconds?: number;
  sectionScores?: Record<string, SectionScoreData>;
  startedAt?: string;
  completedAt?: string;
}

function mapSession(row: any): SessionRow {
  return {
    id: row.id,
    sessionType: row.session_type,
    examType: row.exam_type ?? undefined,
    subject: row.subject ?? undefined,
    totalQuestions: row.total_questions ?? 0,
    answeredCount: row.answered_count ?? 0,
    correctCount: row.correct_count ?? 0,
    totalScore: row.total_score ?? 0,
    maxScore: row.max_score ?? 0,
    durationSeconds: row.duration_seconds ?? undefined,
    sectionScores: row.section_scores ?? undefined,
    startedAt: row.started_at ?? undefined,
    completedAt: row.completed_at ?? undefined,
  };
}

export async function fetchUserSessions(): Promise<SessionRow[]> {
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return [];
  const { data, error } = await supabase
    .from('practice_sessions')
    .select('*')
    .eq('user_id', user.id)
    .eq('completed', true)
    .order('completed_at', { ascending: false });
  if (error) throw error;
  return (data ?? []).map(mapSession);
}

export async function fetchSessionById(id: string): Promise<SessionRow | null> {
  const { data, error } = await supabase
    .from('practice_sessions')
    .select('*')
    .eq('id', id)
    .maybeSingle();
  if (error) throw error;
  return data ? mapSession(data) : null;
}

export interface SubjectAccuracy {
  subject: SubjectType;
  correct: number;
  total: number;
  accuracy: number; // 0-100
}

// Aggregate accuracy per subject across PRACTICE sessions (which carry a subject).
export function aggregateSubjectAccuracy(sessions: SessionRow[]): SubjectAccuracy[] {
  const acc: Record<string, { correct: number; total: number }> = {};
  for (const s of sessions) {
    if (s.subject) {
      acc[s.subject] = acc[s.subject] ?? { correct: 0, total: 0 };
      acc[s.subject].correct += s.correctCount;
      acc[s.subject].total += s.totalQuestions;
    }
    // Tryout sessions store per-section breakdown
    if (s.sectionScores) {
      for (const [subj, data] of Object.entries(s.sectionScores)) {
        acc[subj] = acc[subj] ?? { correct: 0, total: 0 };
        acc[subj].correct += data.correct;
        acc[subj].total += data.total;
      }
    }
  }
  return Object.entries(acc)
    .map(([subject, v]) => ({
      subject: subject as SubjectType,
      correct: v.correct,
      total: v.total,
      accuracy: v.total > 0 ? Math.round((v.correct / v.total) * 100) : 0,
    }))
    .sort((a, b) => b.total - a.total);
}
