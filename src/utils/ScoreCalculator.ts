import type { ExamType, SubjectType } from '../types/exam.types';
import type { Question } from '../types/question.types';
import type { UserAnswer, SectionScore } from '../types/session.types';
import { CPNS_PASSING_SCORES } from '../constants/examConfig';

export interface ScoreResult {
  score: number;
  maxScore: number;
  isCorrect: boolean;
}

export function calculateAnswerScore(
  question: Question,
  selectedOption: string,
  examType: ExamType
): ScoreResult {
  if (question.questionType === 'TKP_SCALE' && question.tkpScores) {
    const score = question.tkpScores[selectedOption] ?? 1;
    return { score, maxScore: 5, isCorrect: true }; // TKP has no wrong answer
  }

  const isCorrect = selectedOption === question.correctOption;

  if (examType === 'TNI') {
    return {
      score: isCorrect ? 4 : -1,
      maxScore: 4,
      isCorrect,
    };
  }

  // CPNS TWK/TIU and POLRI
  return {
    score: isCorrect ? 5 : 0,
    maxScore: 5,
    isCorrect,
  };
}

export function calculateMaxScore(
  questionCount: number,
  subject: SubjectType,
  examType: ExamType
): number {
  if (subject === 'TKP') return questionCount * 5;
  if (examType === 'TNI') return questionCount * 4;
  return questionCount * 5;
}

export function calculateSectionScore(
  answers: UserAnswer[],
  subject: SubjectType,
  examType: ExamType
): SectionScore {
  const total = answers.length;
  const correct = answers.filter((a) => a.isCorrect).length;
  const score = answers.reduce((sum, a) => sum + a.scoreEarned, 0);

  let passed = false;
  if (examType === 'CPNS') {
    const threshold = CPNS_PASSING_SCORES[subject as keyof typeof CPNS_PASSING_SCORES];
    if (threshold !== undefined) {
      passed = score >= threshold;
    }
  }

  return { subject, score, correct, total, passed };
}

export function isCPNSPassing(sectionScores: Record<string, SectionScore>): boolean {
  const required = ['TWK', 'TIU', 'TKP'] as const;
  for (const subject of required) {
    const section = sectionScores[subject];
    if (!section) return false;
    const threshold = CPNS_PASSING_SCORES[subject];
    if (section.score < threshold) return false;
  }
  return true;
}

export function getScorePercentage(score: number, maxScore: number): number {
  if (maxScore === 0) return 0;
  return Math.round((score / maxScore) * 100);
}

export function getScoreLabel(percentage: number): 'excellent' | 'good' | 'average' | 'poor' {
  if (percentage >= 80) return 'excellent';
  if (percentage >= 60) return 'good';
  if (percentage >= 40) return 'average';
  return 'poor';
}
