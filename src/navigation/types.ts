import type { NativeStackScreenProps } from '@react-navigation/native-stack';
import type { BottomTabScreenProps } from '@react-navigation/bottom-tabs';
import type { CompositeScreenProps } from '@react-navigation/native';
import type { ExamType, SubjectType } from '../types/exam.types';

// Auth stack
export type AuthStackParams = {
  Welcome: undefined;
  Login: undefined;
  Register: undefined;
  Onboarding: undefined;
  LearningStyleQuiz: undefined;
  HasilAnalisis: { profile: import('../types/user.types').LearningStyleProfile };
};

// Main bottom tabs
export type MainTabParams = {
  Beranda: undefined;
  Latihan: undefined;
  Tryout: undefined;
  Progress: undefined;
  Profil: undefined;
};

// Latihan stack
export type LatihanStackParams = {
  LatihanHome: undefined;
  CategoryList: { examType: ExamType };
  SubtopicList: { examType: ExamType; subject: SubjectType; packId: string };
  PracticeSession: {
    examType: ExamType;
    subject: SubjectType;
    packId: string;
    subtopic?: string;
    questionCount?: number;
    practiceMode?: 'normal' | 'interleaved';
  };
  SessionResult: {
    sessionId: string;
    score: number;
    maxScore: number;
    correct: number;
    total: number;
    examType: ExamType;
    subject: SubjectType;
    xpEarned: number;
  };
};

// Tryout stack
export type TryoutSectionResult = {
  subject: SubjectType;
  score: number;
  maxScore: number;
  correct: number;
  answered: number;
  total: number;
  passingScore: number;
  passed: boolean;
};

export type TryoutStackParams = {
  TryoutList: undefined;
  TryoutDetail: { templateId: string };
  TryoutSession: { templateId: string };
  TryoutResult: {
    templateId: string;
    examType: ExamType;
    durationUsedSeconds: number;
    sections: TryoutSectionResult[];
  };
};

// Progress stack
export type ProgressStackParams = {
  ProgressDashboard: undefined;
  CategoryAnalysis: { subject: SubjectType };
  HistoryList: undefined;
  SessionDetail: { sessionId: string };
};

// Profil stack
export type ProfilStackParams = {
  Profile: undefined;
  Achievement: undefined;
  DownloadManager: undefined;
  Settings: undefined;
};

// Screen prop helpers
export type AuthScreenProps<T extends keyof AuthStackParams> = NativeStackScreenProps<AuthStackParams, T>;
export type LatihanScreenProps<T extends keyof LatihanStackParams> = NativeStackScreenProps<LatihanStackParams, T>;
export type TryoutScreenProps<T extends keyof TryoutStackParams> = NativeStackScreenProps<TryoutStackParams, T>;
export type ProgressScreenProps<T extends keyof ProgressStackParams> = NativeStackScreenProps<ProgressStackParams, T>;
export type ProfilScreenProps<T extends keyof ProfilStackParams> = NativeStackScreenProps<ProfilStackParams, T>;
