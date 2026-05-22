import { getDatabase } from '../database';
import type { Question, QuestionOption, LocalQuestionPack } from '../../types/question.types';
import type { ExamType, SubjectType } from '../../types/exam.types';

export const QuestionRepository = {
  async getPacksByExam(examType: ExamType): Promise<LocalQuestionPack[]> {
    const db = await getDatabase();
    const rows = await db.getAllAsync<any>(
      'SELECT * FROM local_question_packs WHERE exam_type = ? ORDER BY subject ASC',
      examType
    );
    return rows.map(mapPack);
  },

  async getPackById(packId: string): Promise<LocalQuestionPack | null> {
    const db = await getDatabase();
    const row = await db.getFirstAsync<any>(
      'SELECT * FROM local_question_packs WHERE id = ?',
      packId
    );
    return row ? mapPack(row) : null;
  },

  async packExists(packId: string): Promise<boolean> {
    const db = await getDatabase();
    const row = await db.getFirstAsync<{ count: number }>(
      'SELECT COUNT(*) as count FROM local_question_packs WHERE id = ?',
      packId
    );
    return (row?.count ?? 0) > 0;
  },

  async getQuestions(
    packId: string,
    limit?: number,
    excludeIds?: string[]
  ): Promise<Question[]> {
    const db = await getDatabase();
    let query = 'SELECT * FROM local_questions WHERE pack_id = ?';
    const params: any[] = [packId];

    if (excludeIds && excludeIds.length > 0) {
      const placeholders = excludeIds.map(() => '?').join(',');
      query += ` AND id NOT IN (${placeholders})`;
      params.push(...excludeIds);
    }

    query += ' ORDER BY RANDOM()';

    if (limit) {
      query += ' LIMIT ?';
      params.push(limit);
    }

    const rows = await db.getAllAsync<any>(query, ...params);
    return rows.map(mapQuestion);
  },

  async getQuestionsBySubject(
    examType: ExamType,
    subject: SubjectType,
    limit = 30,
    excludeIds?: string[]
  ): Promise<Question[]> {
    const db = await getDatabase();
    let query = 'SELECT * FROM local_questions WHERE exam_type = ? AND subject = ?';
    const params: any[] = [examType, subject];

    if (excludeIds && excludeIds.length > 0) {
      const placeholders = excludeIds.map(() => '?').join(',');
      query += ` AND id NOT IN (${placeholders})`;
      params.push(...excludeIds);
    }

    query += ' ORDER BY RANDOM() LIMIT ?';
    params.push(limit);

    const rows = await db.getAllAsync<any>(query, ...params);
    return rows.map(mapQuestion);
  },

  async getQuestionById(id: string): Promise<Question | null> {
    const db = await getDatabase();
    const row = await db.getFirstAsync<any>(
      'SELECT * FROM local_questions WHERE id = ?',
      id
    );
    return row ? mapQuestion(row) : null;
  },

  async getQuestionsByIds(ids: string[]): Promise<Question[]> {
    if (ids.length === 0) return [];
    const db = await getDatabase();
    const placeholders = ids.map(() => '?').join(',');
    const rows = await db.getAllAsync<any>(
      `SELECT * FROM local_questions WHERE id IN (${placeholders})`,
      ...ids
    );
    return rows.map(mapQuestion);
  },

  async insertPack(pack: LocalQuestionPack): Promise<void> {
    const db = await getDatabase();
    await db.runAsync(
      `INSERT OR REPLACE INTO local_question_packs
        (id, exam_type, subject, title, description, version, question_count, storage_path, downloaded_at, is_synced)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      pack.id, pack.examType, pack.subject, pack.title,
      pack.description ?? null, pack.version, pack.questionCount,
      (pack as any).storagePath ?? null,
      pack.downloadedAt, pack.isSynced ? 1 : 0
    );
  },

  async insertQuestions(questions: Question[]): Promise<void> {
    const db = await getDatabase();
    await db.withTransactionAsync(async () => {
      for (const q of questions) {
        await db.runAsync(
          `INSERT OR REPLACE INTO local_questions
            (id, pack_id, exam_type, subject, subtopic, question_type, difficulty,
             question_text, question_image_url, options, correct_option, tkp_scores,
             explanation_text, explanation_image_url, tags)
           VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
          q.id, q.packId, q.examType, q.subject, q.subtopic ?? null,
          q.questionType, q.difficulty, q.questionText,
          q.questionImageUrl ?? null,
          JSON.stringify(q.options),
          q.correctOption,
          q.tkpScores ? JSON.stringify(q.tkpScores) : null,
          q.explanationText ?? null,
          q.explanationImageUrl ?? null,
          q.tags ? JSON.stringify(q.tags) : null
        );
      }
    });
  },

  async deletePack(packId: string): Promise<void> {
    const db = await getDatabase();
    await db.withTransactionAsync(async () => {
      await db.runAsync('DELETE FROM local_questions WHERE pack_id = ?', packId);
      await db.runAsync('DELETE FROM local_question_packs WHERE id = ?', packId);
    });
  },

  async countQuestionsInPack(packId: string): Promise<number> {
    const db = await getDatabase();
    const row = await db.getFirstAsync<{ count: number }>(
      'SELECT COUNT(*) as count FROM local_questions WHERE pack_id = ?',
      packId
    );
    return row?.count ?? 0;
  },
};

function mapPack(row: any): LocalQuestionPack {
  return {
    id: row.id,
    examType: row.exam_type,
    subject: row.subject,
    title: row.title,
    description: row.description,
    version: row.version,
    questionCount: row.question_count,
    fileSizeKb: row.file_size_kb,
    isFree: true,
    isPublished: true,
    createdAt: '',
    downloadedAt: row.downloaded_at,
    isSynced: row.is_synced === 1,
  };
}

function mapQuestion(row: any): Question {
  return {
    id: row.id,
    packId: row.pack_id,
    examType: row.exam_type,
    subject: row.subject,
    subtopic: row.subtopic,
    questionType: row.question_type,
    difficulty: row.difficulty,
    questionText: row.question_text,
    questionImageUrl: row.question_image_url,
    options: JSON.parse(row.options) as QuestionOption[],
    correctOption: row.correct_option,
    tkpScores: row.tkp_scores ? JSON.parse(row.tkp_scores) : undefined,
    explanationText: row.explanation_text,
    explanationImageUrl: row.explanation_image_url,
    tags: row.tags ? JSON.parse(row.tags) : undefined,
  };
}
