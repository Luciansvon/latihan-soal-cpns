import { supabase } from './supabase';
import { SessionRepository, AnswerRepository } from '../db/repositories/SessionRepository';
import { UserStateRepository } from '../db/repositories/UserStateRepository';
import type { PracticeSession, UserAnswer } from '../types/session.types';
import type { ProfileRow } from '../types/database.types';
import type { LocalUserState } from '../types/user.types';

export interface SyncReport {
  ok: boolean;
  pushedSessions: number;
  pushedAnswers: number;
  pulledProfile: boolean;
  errors: string[];
  durationMs: number;
}

let inFlight: Promise<SyncReport> | null = null;
let lastReport: SyncReport | null = null;

export const SyncManager = {
  /**
   * Push local unsynced sessions/answers to Supabase, then pull the
   * authoritative user profile back into local state. Server wins on profile.
   *
   * Coalesces concurrent calls — a second call while one is in-flight returns
   * the same promise.
   */
  async syncAll(userId: string): Promise<SyncReport> {
    if (inFlight) return inFlight;
    inFlight = run(userId);
    try {
      lastReport = await inFlight;
      return lastReport;
    } finally {
      inFlight = null;
    }
  },

  getLastReport(): SyncReport | null {
    return lastReport;
  },
};

async function run(userId: string): Promise<SyncReport> {
  const start = Date.now();
  const errors: string[] = [];
  let pushedSessions = 0;
  let pushedAnswers = 0;
  let pulledProfile = false;

  // 1. Push sessions
  try {
    const sessions = await SessionRepository.getUnsyncedSessions(userId);
    if (sessions.length > 0) {
      const rows = sessions.map(toSessionRow);
      const { error } = await supabase
        .from('practice_sessions')
        .upsert(rows, { onConflict: 'id' });
      if (error) throw new Error(error.message);
      for (const s of sessions) {
        await SessionRepository.markSessionSynced(s.id);
        pushedSessions += 1;
      }
    }
  } catch (e: any) {
    errors.push(`push sessions: ${e?.message ?? 'unknown'}`);
  }

  // 2. Push answers
  try {
    const answers = await AnswerRepository.getUnsyncedAnswers(userId);
    if (answers.length > 0) {
      // Batch upsert in chunks to avoid payload size issues
      const CHUNK = 200;
      const sessionIdsTouched = new Set<string>();
      for (let i = 0; i < answers.length; i += CHUNK) {
        const slice = answers.slice(i, i + CHUNK);
        const rows = slice.map(toAnswerRow);
        const { error } = await supabase
          .from('user_answers')
          .upsert(rows, { onConflict: 'id' });
        if (error) throw new Error(error.message);
        for (const a of slice) sessionIdsTouched.add(a.sessionId);
        pushedAnswers += slice.length;
      }
      // Mark all touched session answers as synced
      for (const sessionId of sessionIdsTouched) {
        await AnswerRepository.markAnswersSynced(sessionId);
      }
    }
  } catch (e: any) {
    errors.push(`push answers: ${e?.message ?? 'unknown'}`);
  }

  // 3. Pull profile (server wins for XP/level/streak)
  try {
    const { data, error } = await supabase
      .from('profiles')
      .select('*')
      .eq('id', userId)
      .maybeSingle();
    if (error) throw new Error(error.message);
    if (data) {
      const row = data as ProfileRow;
      const local: LocalUserState = {
        userId: row.id,
        username: row.username,
        xpTotal: row.xp_total,
        level: row.level,
        streakCurrent: row.streak_current,
        streakLongest: row.streak_longest,
        streakLastDate: row.streak_last_date ?? undefined,
        learningStyle: (row.learning_style ?? undefined) as LocalUserState['learningStyle'],
        lastSyncedAt: Date.now(),
      };
      await UserStateRepository.upsert(local);
      pulledProfile = true;
    }
  } catch (e: any) {
    errors.push(`pull profile: ${e?.message ?? 'unknown'}`);
  }

  return {
    ok: errors.length === 0,
    pushedSessions,
    pushedAnswers,
    pulledProfile,
    errors,
    durationMs: Date.now() - start,
  };
}

function toSessionRow(s: PracticeSession): Record<string, unknown> {
  return {
    id: s.id,
    user_id: s.userId,
    session_type: s.sessionType,
    exam_type: s.examType ?? null,
    subject: s.subject ?? null,
    tryout_template_id: s.tryoutTemplateId ?? null,
    total_questions: s.totalQuestions,
    answered_count: s.answeredCount,
    correct_count: s.correctCount,
    total_score: s.totalScore,
    max_score: s.maxScore,
    duration_seconds: s.durationSeconds ?? null,
    section_scores: s.sectionScores ?? null,
    completed: s.completed,
    started_at: new Date(s.startedAt).toISOString(),
    completed_at: s.completedAt ? new Date(s.completedAt).toISOString() : null,
  };
}

function toAnswerRow(a: UserAnswer): Record<string, unknown> {
  return {
    id: a.id,
    user_id: a.userId,
    question_id: a.questionId,
    session_id: a.sessionId,
    selected_option: a.selectedOption,
    is_correct: a.isCorrect,
    score_earned: a.scoreEarned,
    time_spent_ms: a.timeSpentMs ?? null,
    answered_at: new Date(a.answeredAt).toISOString(),
  };
}
