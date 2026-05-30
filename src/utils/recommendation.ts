// Rekomendasi adaptive practice.
// Pilih subject yang akurasinya di bawah threshold dan prioritaskan
// berdasarkan jumlah jawaban (lebih banyak data = lebih reliable).

import type { SubjectAccuracy } from '../hooks/useProgressData';

const WEAK_THRESHOLD_PCT = 60;
const MIN_SAMPLE = 5;

export interface SubjectRecommendation {
  subject: SubjectAccuracy['subject'];
  pct: number;
  total: number;
  reason: string;
}

/**
 * Pilih subject prioritas latihan berikutnya. Algoritma:
 *  1. Hanya pertimbangkan subject dengan total >= MIN_SAMPLE (cukup data).
 *  2. Subject dengan pct < WEAK_THRESHOLD_PCT diprioritaskan urutan asc.
 *  3. Jika tidak ada yang weak, ambil subject dengan pct terendah secara
 *     keseluruhan supaya user tetap dapat saran.
 */
export function recommendSubjects(
  accuracy: SubjectAccuracy[],
  max = 3
): SubjectRecommendation[] {
  const eligible = accuracy.filter((a) => a.total >= MIN_SAMPLE);
  if (eligible.length === 0) return [];

  const weak = eligible
    .filter((a) => a.pct < WEAK_THRESHOLD_PCT)
    .sort((a, b) => a.pct - b.pct)
    .slice(0, max)
    .map((a) => ({
      subject: a.subject,
      pct: a.pct,
      total: a.total,
      reason: `Akurasi ${a.pct}% — masih di bawah ${WEAK_THRESHOLD_PCT}%`,
    }));

  if (weak.length > 0) return weak;

  // Fallback: subject paling lemah meski sudah >= threshold
  return eligible
    .sort((a, b) => a.pct - b.pct)
    .slice(0, max)
    .map((a) => ({
      subject: a.subject,
      pct: a.pct,
      total: a.total,
      reason: `Subject dengan akurasi terendah saat ini (${a.pct}%)`,
    }));
}
