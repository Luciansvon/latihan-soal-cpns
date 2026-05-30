import type { DifficultyLevel, ExamType, QuestionType, SubjectType } from './exam.types';

export interface QuestionOption {
  id: string; // 'A', 'B', 'C', 'D' or '1'-'5' for TKP
  text: string;
  imageUrl?: string;
}

export interface Question {
  id: string;
  packId: string;
  examType: ExamType;
  subject: SubjectType;
  subtopic?: string;
  questionType: QuestionType;
  difficulty: DifficultyLevel;
  difficultyRank?: number; // 1-10
  questionText: string;
  questionImageUrl?: string;
  options: QuestionOption[];
  correctOption: string;
  tkpScores?: Record<string, number>; // {A:5, B:4, C:3, D:2, E:1}
  explanationText?: string;
  explanationImageUrl?: string;
  tags?: string[];
}

export interface QuestionPack {
  id: string;
  examType: ExamType;
  subject: SubjectType;
  title: string;
  description?: string;
  version: number;
  questionCount: number;
  fileSizeKb?: number;
  isFree: boolean;
  isPublished: boolean;
  createdAt: string;
}

export interface LocalQuestionPack extends QuestionPack {
  downloadedAt: number; // unix timestamp
  isSynced: boolean;
}
