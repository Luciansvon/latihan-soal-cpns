import type { Question } from '../types/question.types';

export function mapQuestionRow(row: any): Question {
  return {
    id: row.id,
    packId: row.pack_id,
    examType: row.exam_type,
    subject: row.subject,
    subtopic: row.subtopic ?? undefined,
    questionType: row.question_type,
    difficulty: row.difficulty,
    difficultyRank: row.difficulty_rank ?? undefined,
    questionText: row.question_text,
    questionImageUrl: row.question_image_url ?? undefined,
    options: Array.isArray(row.options) ? row.options : JSON.parse(row.options ?? '[]'),
    correctOption: row.correct_option,
    tkpScores: row.tkp_scores ?? undefined,
    explanationText: row.explanation_text ?? undefined,
    tags: row.tags ?? undefined,
  };
}
