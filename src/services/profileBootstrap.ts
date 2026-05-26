import { supabase } from './supabase';
import { UserStateRepository } from '../db/repositories/UserStateRepository';
import { useStore } from '../store';
import type { UserProfile, LearningStyleProfile } from '../types/user.types';
import type { ProfileRow } from '../types/database.types';
import type { ExamType } from '../types/exam.types';

function mapProfileRow(row: ProfileRow): UserProfile {
  return {
    id: row.id,
    username: row.username,
    fullName: row.full_name ?? undefined,
    avatarUrl: row.avatar_url ?? undefined,
    targetExam: row.target_exam as ExamType,
    targetDate: row.target_date ?? undefined,
    province: row.province ?? undefined,
    xpTotal: row.xp_total,
    level: row.level,
    streakCurrent: row.streak_current,
    streakLongest: row.streak_longest,
    streakLastDate: row.streak_last_date ?? undefined,
    learningStyle: (row.learning_style as LearningStyleProfile | null) ?? undefined,
    createdAt: row.created_at,
  };
}

/**
 * Pull profile dari Supabase, mirror ke local_user_state, set di Zustand store.
 * Dipanggil setelah auth state change (login / signup) dan setelah onboarding selesai.
 *
 * Offline-friendly: kalau Supabase tidak bisa di-reach, fallback ke
 * local_user_state cache. Returning user yang offline tetap bisa lanjut ke
 * MainApp tanpa di-routing balik ke onboarding.
 */
export async function bootstrapProfile(userId: string): Promise<UserProfile | null> {
  const { data, error } = await supabase
    .from('profiles')
    .select('*')
    .eq('id', userId)
    .maybeSingle();

  if (!error && data) {
    const row = data as ProfileRow;
    const profile = mapProfileRow(row);

    await UserStateRepository.upsert({
      userId: row.id,
      username: row.username,
      xpTotal: row.xp_total,
      level: row.level,
      streakCurrent: row.streak_current,
      streakLongest: row.streak_longest,
      streakLastDate: row.streak_last_date ?? undefined,
      learningStyle: profile.learningStyle,
      lastSyncedAt: Date.now(),
    });

    useStore.getState().setProfile(profile);
    return profile;
  }

  // Fallback: pakai cache lokal. Field target_exam/province/dll tidak ada di
  // local_user_state — pakai default; kalau learning_style sudah ada, gate di
  // RootNavigator akan tetap lolos ke MainApp.
  const local = await UserStateRepository.get(userId);
  if (!local) return null;

  const profile: UserProfile = {
    id: local.userId,
    username: local.username ?? '',
    targetExam: 'CPNS',
    xpTotal: local.xpTotal,
    level: local.level,
    streakCurrent: local.streakCurrent,
    streakLongest: local.streakLongest,
    streakLastDate: local.streakLastDate,
    learningStyle: local.learningStyle,
    createdAt: new Date(0).toISOString(),
  };
  useStore.getState().setProfile(profile);
  return profile;
}
