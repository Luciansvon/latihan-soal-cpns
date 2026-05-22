import type { ExamType } from './exam.types';

export interface LearningStyleProfile {
  visual: number;     // 0-100
  auditory: number;   // 0-100
  reading: number;    // 0-100
  kinesthetic: number; // 0-100
  // Honey & Mumford derived
  activist: number;
  reflector: number;
  theorist: number;
  pragmatist: number;
}

export interface UserProfile {
  id: string;
  username: string;
  fullName?: string;
  avatarUrl?: string;
  targetExam: ExamType;
  targetDate?: string;
  province?: string;
  xpTotal: number;
  level: number;
  streakCurrent: number;
  streakLongest: number;
  streakLastDate?: string;
  learningStyle?: LearningStyleProfile;
  createdAt: string;
}

export interface LocalUserState {
  userId: string;
  username?: string;
  xpTotal: number;
  level: number;
  streakCurrent: number;
  streakLongest: number;
  streakLastDate?: string;
  learningStyle?: LearningStyleProfile;
  lastSyncedAt?: number;
}
