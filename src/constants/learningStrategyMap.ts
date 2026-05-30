// Static strategy hints per learning style + subject. Used as an OFFLINE
// fallback rendered next to questions when AI Tutor is not available
// (no network, daily limit reached). When AI Tutor is online, the Edge
// Function builds the prompt with the user's full profile.

import type { SubjectType } from '../types/exam.types';
import type { LearningStyleProfile } from '../types/user.types';

export type VarkStyle = 'visual' | 'auditory' | 'reading' | 'kinesthetic';
export type HoneyMumford = 'activist' | 'reflector' | 'theorist' | 'pragmatist';

export const VARK_LABELS: Record<VarkStyle, string> = {
  visual: 'Visual',
  auditory: 'Auditori',
  reading: 'Reading/Writing',
  kinesthetic: 'Kinestetik',
};

export const HM_LABELS: Record<HoneyMumford, string> = {
  activist: 'Activist',
  reflector: 'Reflector',
  theorist: 'Theorist',
  pragmatist: 'Pragmatist',
};

interface SubjectTips {
  visual: string;
  auditory: string;
  reading: string;
  kinesthetic: string;
}

/**
 * Tip generik per subject + style. Dipilih supaya bisa dirender sebagai
 * "Saran belajar untuk profil kamu" bahkan tanpa panggil OpenRouter.
 */
export const SUBJECT_STRATEGY: Partial<Record<SubjectType, SubjectTips>> = {
  TWK: {
    visual: 'Buat peta visual: pohon UUD 1945 dengan cabang bab, atau timeline sejarah.',
    auditory: 'Hafalkan dengan menyanyikan/membacakan pasal — rekam dan dengar ulang.',
    reading: 'Bikin ringkasan poin pasal & frasa kunci ("kedaulatan", "musyawarah", dst).',
    kinesthetic: 'Tulis ulang pasal yang sering keluar dengan tangan + simulasi kuis cepat.',
  },
  TIU: {
    visual: 'Untuk deret/silogisme, gambar diagram lingkaran atau venn.',
    auditory: 'Baca soal dengan suara — kadang pola terdengar lebih cepat dari yang terlihat.',
    reading: 'Catat rumus + 1 contoh kerja untuk setiap subtopik (analogi, deret, dll).',
    kinesthetic: 'Kerjakan 5 soal/topik per hari sambil corat-coret di kertas, bukan menghitung di kepala.',
  },
  TKP: {
    visual: 'Bayangkan skenario kerja nyata: "kalau saya di posisi itu, apa yang saya lihat?"',
    auditory: 'Diskusikan dengan teman — verbalkan kenapa opsi A lebih profesional dari B.',
    reading: 'Hafalkan 6 aspek TKP (Pelayanan Publik, Jejaring, dst) + ciri opsi skor tinggi.',
    kinesthetic: 'Roleplay singkat: praktikkan respons ideal di situasi sosial sehari-hari.',
  },
  MATEMATIKA: {
    visual: 'Geometri & statistik: selalu sketsa, jangan dihitung di kepala.',
    auditory: 'Ucapkan langkah ("kuadratkan dua sisi, lalu kurangi…") sambil mengerjakan.',
    reading: 'Tabel rumus per topik di flashcard digital.',
    kinesthetic: 'Kerjakan 3 soal serupa berturut sampai polanya melekat.',
  },
  BAHASA_INDONESIA: {
    visual: 'Tandai struktur paragraf (tesis, argumen, kesimpulan) dengan warna berbeda.',
    auditory: 'Baca teks lantang — kesalahan ejaan/kata baku terdengar lebih mudah.',
    reading: 'Pelajari PUEBI bagian umum + 20 kata baku/tidak baku terlazim.',
    kinesthetic: 'Latihan menyusun ulang paragraf acak dengan kertas potong.',
  },
  PENGETAHUAN_UMUM: {
    visual: 'Peta dunia + bendera, peta Indonesia + provinsi/ibukota.',
    auditory: 'Dengar podcast berita 10 menit/hari.',
    reading: 'Buat catatan tematik: tokoh, peristiwa, tahun.',
    kinesthetic: 'Kuis flashcard cepat 5 menit setiap pagi.',
  },
  PSIKOTES: {
    visual: 'Untuk deret figural, bayangkan rotasi 90° / cermin sebelum melihat opsi.',
    auditory: 'Untuk verbal, ucapkan analogi: "A ke B seperti C ke ___".',
    reading: 'Catat pola umum (sinonim, antonim, klasifikasi).',
    kinesthetic: 'Latih kecepatan: 20 soal aritmatika cepat per sesi.',
  },
  KEDINASAN: {
    visual: 'Buat hierarki organisasi (TNI/Polri) dengan diagram.',
    auditory: 'Cerita kasus sambil belajar pasal kedinasan.',
    reading: 'Ringkas peraturan kedinasan jadi poin singkat.',
    kinesthetic: 'Simulasi: tulis kembali pasal yang baru dibaca tanpa melihat.',
  },
  PENGETAHUAN_HUKUM: {
    visual: 'Diagram hierarki UU > PP > Perpres.',
    auditory: 'Diskusikan kasus hukum singkat dengan teman / asisten.',
    reading: 'Catat definisi istilah hukum + pasal pendukungnya.',
    kinesthetic: 'Analisis 2 kasus nyata per minggu, tulis pendapatmu.',
  },
};

/**
 * Pilih satu strategi per (subject, style) dengan jatuh tempo ke default
 * netral. Dipakai oleh AdaptiveExplanation saat AI tidak tersedia.
 */
export function getStrategyTip(subject: SubjectType, style: VarkStyle): string {
  const subj = SUBJECT_STRATEGY[subject];
  if (subj) return subj[style];
  // Fallback netral
  switch (style) {
    case 'visual': return 'Bayangkan konsep dalam diagram sebelum menjawab.';
    case 'auditory': return 'Baca soal dengan suara — bantu otak menangkap pola.';
    case 'reading': return 'Catat poin kunci dalam kalimat ringkas.';
    case 'kinesthetic': return 'Kerjakan beberapa soal sejenis berturut-turut.';
  }
}

/**
 * Pilih VARK style dominan dari profil. Tie-break: visual > reading > auditory > kinesthetic.
 */
export function dominantVark(profile: LearningStyleProfile | undefined): VarkStyle {
  if (!profile) return 'reading';
  const candidates: Array<[VarkStyle, number]> = [
    ['visual', profile.visual ?? 0],
    ['reading', profile.reading ?? 0],
    ['auditory', profile.auditory ?? 0],
    ['kinesthetic', profile.kinesthetic ?? 0],
  ];
  candidates.sort((a, b) => b[1] - a[1]);
  return candidates[0][0];
}

/**
 * Pilih Honey-Mumford dominan. Untuk strategi belajar level meta (kapan
 * mereview, urutan tahap, dll).
 */
export function dominantHoneyMumford(profile: LearningStyleProfile | undefined): HoneyMumford {
  if (!profile) return 'reflector';
  const candidates: Array<[HoneyMumford, number]> = [
    ['activist', profile.activist ?? 0],
    ['reflector', profile.reflector ?? 0],
    ['theorist', profile.theorist ?? 0],
    ['pragmatist', profile.pragmatist ?? 0],
  ];
  candidates.sort((a, b) => b[1] - a[1]);
  return candidates[0][0];
}
