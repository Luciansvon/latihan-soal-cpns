import { getDatabase } from '../database';
import type { LocalUserState } from '../../types/user.types';

export const UserStateRepository = {
  async get(userId: string): Promise<LocalUserState | null> {
    const db = await getDatabase();
    const row = await db.getFirstAsync<any>(
      'SELECT * FROM local_user_state WHERE user_id = ?',
      userId
    );
    if (!row) return null;
    return {
      userId: row.user_id,
      username: row.username,
      xpTotal: row.xp_total,
      level: row.level,
      streakCurrent: row.streak_current,
      streakLongest: row.streak_longest,
      streakLastDate: row.streak_last_date,
      learningStyle: row.learning_style ? JSON.parse(row.learning_style) : undefined,
      lastSyncedAt: row.last_synced_at,
    };
  },

  async upsert(state: LocalUserState): Promise<void> {
    const db = await getDatabase();
    await db.runAsync(
      `INSERT OR REPLACE INTO local_user_state
        (user_id, username, xp_total, level, streak_current, streak_longest,
         streak_last_date, learning_style, last_synced_at)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      state.userId, state.username ?? null,
      state.xpTotal, state.level,
      state.streakCurrent, state.streakLongest,
      state.streakLastDate ?? null,
      state.learningStyle ? JSON.stringify(state.learningStyle) : null,
      state.lastSyncedAt ?? null
    );
  },

  async addXP(userId: string, amount: number): Promise<{ newXp: number; newLevel: number }> {
    const db = await getDatabase();
    const current = await this.get(userId);
    const newXp = (current?.xpTotal ?? 0) + amount;
    const newLevel = Math.max(1, Math.floor(Math.sqrt(newXp / 100)));
    await db.runAsync(
      'UPDATE local_user_state SET xp_total = ?, level = ? WHERE user_id = ?',
      newXp, newLevel, userId
    );
    return { newXp, newLevel };
  },

  async updateStreak(userId: string): Promise<{ streakCurrent: number; streakLongest: number; isNewDay: boolean }> {
    const db = await getDatabase();
    const current = await this.get(userId);
    if (!current) return { streakCurrent: 0, streakLongest: 0, isNewDay: false };

    const today = new Date().toISOString().split('T')[0];
    const lastDate = current.streakLastDate;

    if (lastDate === today) {
      return {
        streakCurrent: current.streakCurrent,
        streakLongest: current.streakLongest,
        isNewDay: false,
      };
    }

    const yesterday = new Date();
    yesterday.setDate(yesterday.getDate() - 1);
    const yesterdayStr = yesterday.toISOString().split('T')[0];

    const newStreak = lastDate === yesterdayStr ? current.streakCurrent + 1 : 1;
    const newLongest = Math.max(newStreak, current.streakLongest);

    await db.runAsync(
      'UPDATE local_user_state SET streak_current = ?, streak_longest = ?, streak_last_date = ? WHERE user_id = ?',
      newStreak, newLongest, today, userId
    );

    return { streakCurrent: newStreak, streakLongest: newLongest, isNewDay: true };
  },

  async updateLearningStyle(userId: string, learningStyle: any): Promise<void> {
    const db = await getDatabase();
    await db.runAsync(
      'UPDATE local_user_state SET learning_style = ? WHERE user_id = ?',
      JSON.stringify(learningStyle), userId
    );
  },
};
