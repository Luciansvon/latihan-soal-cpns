import { supabase } from './supabase';
import { QuestionRepository } from '../db/repositories/QuestionRepository';
import type {
  Question,
  QuestionOption,
  QuestionPack,
  LocalQuestionPack,
} from '../types/question.types';
import type { ExamType } from '../types/exam.types';

const BATCH_SIZE = 100;

export type DownloadProgressFn = (info: {
  packId: string;
  status: 'PENDING' | 'DOWNLOADING' | 'DONE' | 'FAILED';
  progress: number; // 0..1
  error?: string;
}) => void;

export const DownloadService = {
  /**
   * Fetch the catalog of published packs from Supabase, optionally scoped to an exam.
   */
  async listAvailablePacks(examType?: ExamType): Promise<QuestionPack[]> {
    let q = supabase
      .from('question_packs')
      .select('*')
      .eq('is_published', true)
      .order('subject', { ascending: true });
    if (examType) q = q.eq('exam_type', examType);
    const { data, error } = await q;
    if (error) throw new Error(error.message);
    return (data ?? []).map(mapPack);
  },

  /**
   * Returns the set of pack IDs currently stored in local SQLite.
   */
  async listDownloadedPackIds(): Promise<Set<string>> {
    // QuestionRepository doesn't expose this directly; reuse getPacksByExam
    // by enumerating all exam types.
    const allExams: ExamType[] = ['CPNS', 'TNI', 'POLRI'];
    const ids = new Set<string>();
    for (const e of allExams) {
      const packs = await QuestionRepository.getPacksByExam(e);
      for (const p of packs) ids.add(p.id);
    }
    return ids;
  },

  /**
   * Download a pack's questions to local SQLite, reporting progress.
   * Also registers the user's download in Supabase (best-effort; ignored on failure).
   */
  async downloadPack(
    packId: string,
    userId: string,
    onProgress?: DownloadProgressFn
  ): Promise<void> {
    onProgress?.({ packId, status: 'PENDING', progress: 0 });

    try {
      // 1. Pack metadata
      const { data: packRow, error: packErr } = await supabase
        .from('question_packs')
        .select('*')
        .eq('id', packId)
        .eq('is_published', true)
        .maybeSingle();
      if (packErr) throw new Error(packErr.message);
      if (!packRow) throw new Error('Paket tidak ditemukan atau belum dipublish.');

      const pack = mapPack(packRow);
      const totalCount = pack.questionCount > 0 ? pack.questionCount : 1;

      onProgress?.({ packId, status: 'DOWNLOADING', progress: 0.05 });

      // 2. Fetch questions in batches (paged) and write to SQLite
      let offset = 0;
      let downloaded = 0;
      while (true) {
        const { data: rows, error: qErr } = await supabase
          .from('questions')
          .select('*')
          .eq('pack_id', packId)
          .range(offset, offset + BATCH_SIZE - 1);
        if (qErr) throw new Error(qErr.message);
        if (!rows || rows.length === 0) break;

        const batch = rows.map((r) => mapQuestion(r, packId, pack.examType));
        await QuestionRepository.insertQuestions(batch);

        downloaded += rows.length;
        offset += rows.length;

        // Progress: reserve last 5% for finalization
        const pct = Math.min(0.95, 0.05 + (downloaded / totalCount) * 0.9);
        onProgress?.({ packId, status: 'DOWNLOADING', progress: pct });

        if (rows.length < BATCH_SIZE) break;
      }

      // 3. Insert pack record locally (after questions, so navigation reads consistent state)
      const localPack: LocalQuestionPack = {
        ...pack,
        questionCount: downloaded || pack.questionCount,
        downloadedAt: Date.now(),
        isSynced: false, // user_downloads not yet registered
      };
      await QuestionRepository.insertPack(localPack);

      // 4. Register user_downloads on Supabase (best-effort)
      try {
        await supabase.from('user_downloads').upsert(
          {
            user_id: userId,
            pack_id: packId,
            pack_version: pack.version,
            downloaded_at: new Date().toISOString(),
          },
          { onConflict: 'user_id,pack_id' }
        );
      } catch {
        // Non-fatal: local data is the source of truth.
      }

      onProgress?.({ packId, status: 'DONE', progress: 1 });
    } catch (e: any) {
      onProgress?.({
        packId,
        status: 'FAILED',
        progress: 0,
        error: e?.message ?? 'unknown error',
      });
      throw e;
    }
  },

  /**
   * Delete a pack locally and remove the user_downloads registration.
   */
  async deletePack(packId: string, userId: string): Promise<void> {
    await QuestionRepository.deletePack(packId);
    try {
      await supabase
        .from('user_downloads')
        .delete()
        .eq('user_id', userId)
        .eq('pack_id', packId);
    } catch {
      // Non-fatal
    }
  },
};

function mapPack(row: any): QuestionPack {
  return {
    id: row.id,
    examType: row.exam_type,
    subject: row.subject,
    title: row.title,
    description: row.description ?? undefined,
    version: row.version,
    questionCount: row.question_count,
    fileSizeKb: row.file_size_kb ?? undefined,
    isFree: row.is_free,
    isPublished: row.is_published,
    createdAt: row.created_at,
  };
}

function mapQuestion(row: any, packId: string, examType: ExamType): Question {
  return {
    id: row.id,
    packId,
    examType: row.exam_type ?? examType,
    subject: row.subject,
    subtopic: row.subtopic ?? undefined,
    questionType: row.question_type,
    difficulty: row.difficulty,
    questionText: row.question_text,
    questionImageUrl: row.question_image_url ?? undefined,
    options: row.options as QuestionOption[],
    correctOption: row.correct_option,
    tkpScores: row.tkp_scores ?? undefined,
    explanationText: row.explanation_text ?? undefined,
    explanationImageUrl: row.explanation_image_url ?? undefined,
    tags: row.tags ?? undefined,
  };
}
