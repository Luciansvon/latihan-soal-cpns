export type AchievementCategory = 'STREAK' | 'ACCURACY' | 'VOLUME' | 'TRYOUT' | 'MISC';
export type AchievementConditionType =
  | 'STREAK_DAYS'
  | 'CORRECT_TOTAL'
  | 'SESSIONS_TOTAL'
  | 'TRYOUT_COMPLETED'
  | 'PERFECT_SESSION'
  | 'OFFLINE_SESSIONS';

export interface Achievement {
  id: string;
  title: string;
  description: string;
  iconName: string;
  xpReward: number;
  category: AchievementCategory;
  conditionType: AchievementConditionType;
  conditionValue: number;
}

export interface UserAchievement {
  userId: string;
  achievementId: string;
  earnedAt: number;
}

export interface XPEvent {
  type: string;
  amount: number;
  description: string;
}

export const XP_REWARDS = {
  CORRECT_ANSWER: 2,
  COMPLETE_SESSION: 10,
  COMPLETE_TRYOUT: 50,
  DAILY_CHALLENGE: 50,
  DAILY_CHALLENGE_PERFECT_BONUS: 25,
  DAILY_LOGIN: 10,
  STREAK_7: 100,
  STREAK_30: 500,
  STREAK_100: 2000,
} as const;

export function xpForLevel(level: number): number {
  return Math.pow(level, 2) * 100;
}

export function levelFromXP(xp: number): number {
  return Math.floor(Math.sqrt(xp / 100));
}

export const LEVEL_TITLES: Record<number, string> = {
  1: 'Pejuang Pemula',
  5: 'Calon Abdi Negara',
  10: 'Pejuang Tangguh',
  20: 'Pahlawan Bangsa',
  50: 'Legenda CPNS',
};

export function getLevelTitle(level: number): string {
  const milestones = [50, 20, 10, 5, 1];
  for (const m of milestones) {
    if (level >= m) return LEVEL_TITLES[m];
  }
  return LEVEL_TITLES[1];
}
