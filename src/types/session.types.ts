import type { ExamType, SessionType, SubjectType } from './exam.types';

export interface SectionScore {
  subject: SubjectType;
  score: number;
  correct: number;
  total: number;
  passed: boolean;
}

export interface PracticeSession {
  id: string;
  userId: string;
  sessionType: SessionType;
  examType?: ExamType;
  subject?: SubjectType;
  tryoutTemplateId?: string;
  totalQuestions: number;
  answeredCount: number;
  correctCount: number;
  totalScore: number;
  maxScore: number;
  durationSeconds?: number;
  sectionScores?: Record<SubjectType, SectionScore>;
  completed: boolean;
  startedAt: number; // unix timestamp
  completedAt?: number;
  isSynced: boolean;
}

export interface UserAnswer {
  id: string;
  userId: string;
  questionId: string;
  sessionId: string;
  selectedOption: string;
  isCorrect: boolean;
  scoreEarned: number;
  timeSpentMs?: number;
  answeredAt: number; // unix timestamp
  isSynced: boolean;
}

export interface ActiveQuestion {
  questionId: string;
  selectedOption?: string;
  isFlagged: boolean;
  timeSpentMs: number;
}
