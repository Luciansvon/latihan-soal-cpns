import { create } from 'zustand';
import type { UserProfile } from '../types/user.types';
import type { ExamType } from '../types/exam.types';
import type { Question } from '../types/question.types';
import type { ActiveQuestion, PracticeSession } from '../types/session.types';

// ============================================================
// Auth Slice
// ============================================================
interface AuthSlice {
  userId: string | null;
  isAuthenticated: boolean;
  isLoading: boolean;
  setAuth: (userId: string | null) => void;
  setLoading: (loading: boolean) => void;
}

// ============================================================
// User Slice
// ============================================================
interface UserSlice {
  profile: UserProfile | null;
  xpTotal: number;
  level: number;
  streakCurrent: number;
  streakLongest: number;
  pendingXP: number;
  setProfile: (profile: UserProfile) => void;
  addPendingXP: (amount: number) => void;
  clearPendingXP: () => void;
  updateStreak: (current: number, longest: number) => void;
  setXPAndLevel: (xp: number, level: number) => void;
}

// ============================================================
// Network Slice
// ============================================================
interface NetworkSlice {
  isOnline: boolean;
  setOnline: (online: boolean) => void;
}

// ============================================================
// Session Slice (active practice/tryout state)
// ============================================================
interface SessionSlice {
  activeSession: PracticeSession | null;
  questions: Question[];
  activeQuestionIndex: number;
  questionStates: Record<string, ActiveQuestion>;
  sessionStartTime: number;
  setActiveSession: (session: PracticeSession | null) => void;
  setQuestions: (questions: Question[]) => void;
  setQuestionIndex: (index: number) => void;
  recordAnswer: (questionId: string, selectedOption: string, timeMs: number) => void;
  toggleFlag: (questionId: string) => void;
  resetSession: () => void;
}

// ============================================================
// Download Slice
// ============================================================
interface DownloadItem {
  packId: string;
  status: 'PENDING' | 'DOWNLOADING' | 'DONE' | 'FAILED';
  progress: number;
  error?: string;
}

interface DownloadSlice {
  downloads: Record<string, DownloadItem>;
  setDownloadStatus: (packId: string, status: DownloadItem['status'], progress?: number, error?: string) => void;
  removeDownload: (packId: string) => void;
}

// ============================================================
// Combined Store
// ============================================================
interface AppStore extends AuthSlice, UserSlice, NetworkSlice, SessionSlice, DownloadSlice {}

export const useStore = create<AppStore>((set, get) => ({
  // Auth
  userId: null,
  isAuthenticated: false,
  isLoading: true,
  setAuth: (userId) => set({ userId, isAuthenticated: !!userId }),
  setLoading: (isLoading) => set({ isLoading }),

  // User
  profile: null,
  xpTotal: 0,
  level: 1,
  streakCurrent: 0,
  streakLongest: 0,
  pendingXP: 0,
  setProfile: (profile) =>
    set({
      profile,
      xpTotal: profile.xpTotal,
      level: profile.level,
      streakCurrent: profile.streakCurrent,
      streakLongest: profile.streakLongest,
    }),
  addPendingXP: (amount) => set((s) => ({ pendingXP: s.pendingXP + amount })),
  clearPendingXP: () => set({ pendingXP: 0 }),
  updateStreak: (current, longest) => set({ streakCurrent: current, streakLongest: longest }),
  setXPAndLevel: (xp, level) => set({ xpTotal: xp, level }),

  // Network
  isOnline: true,
  setOnline: (isOnline) => set({ isOnline }),

  // Session
  activeSession: null,
  questions: [],
  activeQuestionIndex: 0,
  questionStates: {},
  sessionStartTime: 0,
  setActiveSession: (session) =>
    set({
      activeSession: session,
      activeQuestionIndex: 0,
      questionStates: {},
      sessionStartTime: session ? Date.now() : 0,
    }),
  setQuestions: (questions) => {
    const states: Record<string, ActiveQuestion> = {};
    for (const q of questions) {
      states[q.id] = { questionId: q.id, isFlagged: false, timeSpentMs: 0 };
    }
    set({ questions, questionStates: states });
  },
  setQuestionIndex: (index) => set({ activeQuestionIndex: index }),
  recordAnswer: (questionId, selectedOption, timeMs) =>
    set((s) => ({
      questionStates: {
        ...s.questionStates,
        [questionId]: {
          ...(s.questionStates[questionId] ?? { questionId, isFlagged: false, timeSpentMs: 0 }),
          selectedOption,
          timeSpentMs: timeMs,
        },
      },
    })),
  toggleFlag: (questionId) =>
    set((s) => ({
      questionStates: {
        ...s.questionStates,
        [questionId]: {
          ...(s.questionStates[questionId] ?? { questionId, isFlagged: false, timeSpentMs: 0 }),
          isFlagged: !s.questionStates[questionId]?.isFlagged,
        },
      },
    })),
  resetSession: () =>
    set({
      activeSession: null,
      questions: [],
      activeQuestionIndex: 0,
      questionStates: {},
      sessionStartTime: 0,
    }),

  // Downloads
  downloads: {},
  setDownloadStatus: (packId, status, progress = 0, error) =>
    set((s) => ({
      downloads: {
        ...s.downloads,
        [packId]: { packId, status, progress, error },
      },
    })),
  removeDownload: (packId) =>
    set((s) => {
      const { [packId]: _, ...rest } = s.downloads;
      return { downloads: rest };
    }),
}));
