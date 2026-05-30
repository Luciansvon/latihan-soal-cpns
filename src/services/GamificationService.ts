// GamificationService
// Hitung XP per sesi, update streak, cek achievement, persist ke local state
// + Supabase (best-effort). Award per sesi diidempotent via AsyncStorage flag.

import AsyncStorage from '@react-native-async-storage/async-storage';
import { ACHIEVEMENTS } from '../constants/achievements';
import { XP_REWARDS, levelFromXP } from '../types/gamification.types';
import type { Achievement } from '../types/gamification.types';
import type { PracticeSession } from '../types/session.types';
import { UserStateRepository } from '../db/repositories/UserStateRepository';
import { SessionRepository, AnswerRepository } from '../db/repositories/SessionRepository';
import { supabase } from './supabase';

export interface AwardResult {
  sessionId: string;
  xpEarned: number;
  newXpTotal: number;
  newLevel: number;
  leveledUp: boolean;
  unlockedAchievements: Achievement[];
  streakCurrent: number;
  streakLongest: number;
}

const KEY_AWARDED = (sessionId: string) => `gam:awarded:${sessionId}`;
const KEY_UNLOCKED = (userId: string) => `gam:unlocked:${userId}`;

export const GamificationService = {
  /**
   * Hitung XP untuk sesi, tambahkan ke local user state, update streak,
   * cek achievement baru. Idempotent: kalau dipanggil 2x untuk sesi yang
   * sama, panggilan kedua return award yang sama (dari cache) tanpa double-award.
   */
  async awardForSession(session: PracticeSession): Promise<AwardResult> {
    // Idempotency check
    const cached = await AsyncStorage.getItem(KEY_AWARDED(session.id));
    if (cached) {
      try {
        return JSON.parse(cached) as AwardResult;
      } catch {
        // fall through and recompute
      }
    }

    // 1. Hitung XP base (correct answers + complete bonus)
    const baseXp = computeXp(session);
    const xpBeforeBase = (await UserStateRepository.get(session.userId))?.xpTotal ?? 0;

    // 2. Tambah base XP ke local state
    await UserStateRepository.addXP(session.userId, baseXp);

    // 3. Update streak
    const streak = await UserStateRepository.updateStreak(session.userId);

    // 4. Cek achievement — kalau ada unlock, function ini juga addXP(bonus)
    //    SECARA INTERNAL. Karena itu kita re-read state SETELAH ini supaya
    //    AwardResult merefleksikan total XP final (base + bonus achievement).
    const unlocked = await checkAchievements(session);
    const bonusXp = unlocked.reduce((sum, a) => sum + a.xpReward, 0);

    // 5. Re-read final state (after base + bonus)
    const finalState = await UserStateRepository.get(session.userId);
    const newXp = finalState?.xpTotal ?? xpBeforeBase + baseXp + bonusXp;
    const newLevel = finalState?.level ?? levelFromXP(newXp);
    const oldLevel = levelFromXP(xpBeforeBase);
    const leveledUp = newLevel > oldLevel;

    // 6. Push ke Supabase (best-effort)
    void pushToServer(session.userId, newXp, newLevel, streak, unlocked);

    const result: AwardResult = {
      sessionId: session.id,
      xpEarned: baseXp + bonusXp, // total earned including achievement bonuses
      newXpTotal: newXp,
      newLevel,
      leveledUp,
      unlockedAchievements: unlocked,
      streakCurrent: streak.streakCurrent,
      streakLongest: streak.streakLongest,
    };

    await AsyncStorage.setItem(KEY_AWARDED(session.id), JSON.stringify(result));
    return result;
  },

  async getCachedAward(sessionId: string): Promise<AwardResult | null> {
    const raw = await AsyncStorage.getItem(KEY_AWARDED(sessionId));
    if (!raw) return null;
    try {
      return JSON.parse(raw) as AwardResult;
    } catch {
      return null;
    }
  },

  async getUnlockedIds(userId: string): Promise<string[]> {
    const raw = await AsyncStorage.getItem(KEY_UNLOCKED(userId));
    if (!raw) return [];
    try {
      return JSON.parse(raw) as string[];
    } catch {
      return [];
    }
  },
};

// ============================================================
// XP computation
// ============================================================
function computeXp(session: PracticeSession): number {
  let xp = 0;
  xp += session.correctCount * XP_REWARDS.CORRECT_ANSWER;
  xp +=
    session.sessionType === 'TRYOUT'
      ? XP_REWARDS.COMPLETE_TRYOUT
      : XP_REWARDS.COMPLETE_SESSION;
  // Perfect bonus
  if (session.answeredCount > 0 && session.correctCount === session.totalQuestions) {
    xp += 25;
  }
  return xp;
}

// ============================================================
// Achievement check
// ============================================================
async function checkAchievements(session: PracticeSession): Promise<Achievement[]> {
  const userId = session.userId;
  const already = new Set(await GamificationService.getUnlockedIds(userId));

  // Aggregate stats yang dibutuhkan
  const stats = await SessionRepository.getSessionStats(userId);
  const allSessions = await SessionRepository.getSessionsByUser(userId, 9999);
  const userState = await UserStateRepository.get(userId);

  const tryoutCount = allSessions.filter((s) => s.sessionType === 'TRYOUT').length;
  const perfectCount = allSessions.filter(
    (s) => s.answeredCount > 0 && s.correctCount === s.totalQuestions
  ).length;

  // OFFLINE_SESSIONS — sessions yang ditandai is_synced=false on completion.
  // Approximation: sessions yang masih is_synced=false saat ini = pernah offline.
  const offlineSessions = allSessions.filter((s) => !s.isSynced).length;

  const candidates: Array<{ a: Achievement; ok: boolean }> = ACHIEVEMENTS.map((a) => {
    let ok = false;
    switch (a.conditionType) {
      case 'STREAK_DAYS':
        ok = (userState?.streakCurrent ?? 0) >= a.conditionValue;
        break;
      case 'SESSIONS_TOTAL':
        ok = stats.totalSessions >= a.conditionValue;
        break;
      case 'CORRECT_TOTAL':
        ok = stats.totalCorrect >= a.conditionValue;
        break;
      case 'TRYOUT_COMPLETED':
        ok = tryoutCount >= a.conditionValue;
        break;
      case 'PERFECT_SESSION':
        ok = perfectCount >= a.conditionValue;
        break;
      case 'OFFLINE_SESSIONS':
        ok = offlineSessions >= a.conditionValue;
        break;
    }
    return { a, ok };
  });

  const newlyUnlocked = candidates
    .filter(({ a, ok }) => ok && !already.has(a.id))
    .map(({ a }) => a);

  if (newlyUnlocked.length === 0) return [];

  // Persist new unlocks
  const updated = [...already, ...newlyUnlocked.map((a) => a.id)];
  await AsyncStorage.setItem(KEY_UNLOCKED(userId), JSON.stringify(updated));

  // Bonus XP dari achievement → tambah ke local state
  const bonusXp = newlyUnlocked.reduce((sum, a) => sum + a.xpReward, 0);
  if (bonusXp > 0) {
    await UserStateRepository.addXP(userId, bonusXp);
  }

  return newlyUnlocked;
}

// ============================================================
// Server push (best-effort, fire-and-forget)
// ============================================================
async function pushToServer(
  userId: string,
  xpTotal: number,
  level: number,
  streak: { streakCurrent: number; streakLongest: number; isNewDay: boolean },
  unlocked: Achievement[]
): Promise<void> {
  try {
    await supabase
      .from('profiles')
      .update({
        xp_total: xpTotal,
        level,
        streak_current: streak.streakCurrent,
        streak_longest: streak.streakLongest,
        streak_last_date: streak.isNewDay ? new Date().toISOString().split('T')[0] : undefined,
        updated_at: new Date().toISOString(),
      })
      .eq('id', userId);

    if (unlocked.length > 0) {
      await supabase.from('user_achievements').upsert(
        unlocked.map((a) => ({
          user_id: userId,
          achievement_id: a.id,
          earned_at: new Date().toISOString(),
        })),
        { onConflict: 'user_id,achievement_id' }
      );
    }
  } catch {
    // ignore; SyncManager akan pull/push lagi nanti
  }
}

// avoid unused import warning when AnswerRepository becomes unused
void AnswerRepository;
