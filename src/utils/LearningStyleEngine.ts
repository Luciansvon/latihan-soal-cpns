// Scoring engine for VARK + Honey & Mumford assessment
// Based on: Fleming & Mills (1992) and Honey & Mumford (1982)

import type { LearningStyleProfile } from '../types/user.types';
import { LEARNING_STYLE_QUESTIONS } from '../constants/learningStyleQuestions';

export type AnswerMap = Record<number, 'A' | 'B' | 'C' | 'D'>;

export function calculateLearningStyle(answers: AnswerMap): LearningStyleProfile {
  const raw = {
    visual: 0, auditory: 0, reading: 0, kinesthetic: 0,
    activist: 0, reflector: 0, theorist: 0, pragmatist: 0,
  };
  const max = {
    visual: 0, auditory: 0, reading: 0, kinesthetic: 0,
    activist: 0, reflector: 0, theorist: 0, pragmatist: 0,
  };

  for (const question of LEARNING_STYLE_QUESTIONS) {
    const selectedId = answers[question.id];
    if (!selectedId) continue;

    const option = question.options.find((o) => o.id === selectedId);
    if (!option) continue;

    raw.visual += option.visual;
    raw.auditory += option.auditory;
    raw.reading += option.reading;
    raw.kinesthetic += option.kinesthetic;
    raw.activist += option.activist;
    raw.reflector += option.reflector;
    raw.theorist += option.theorist;
    raw.pragmatist += option.pragmatist;

    // Track max possible per dimension
    const allWeights = question.options.reduce(
      (acc, o) => ({
        visual: Math.max(acc.visual, o.visual),
        auditory: Math.max(acc.auditory, o.auditory),
        reading: Math.max(acc.reading, o.reading),
        kinesthetic: Math.max(acc.kinesthetic, o.kinesthetic),
        activist: Math.max(acc.activist, o.activist),
        reflector: Math.max(acc.reflector, o.reflector),
        theorist: Math.max(acc.theorist, o.theorist),
        pragmatist: Math.max(acc.pragmatist, o.pragmatist),
      }),
      { visual: 0, auditory: 0, reading: 0, kinesthetic: 0, activist: 0, reflector: 0, theorist: 0, pragmatist: 0 }
    );

    max.visual += allWeights.visual;
    max.auditory += allWeights.auditory;
    max.reading += allWeights.reading;
    max.kinesthetic += allWeights.kinesthetic;
    max.activist += allWeights.activist;
    max.reflector += allWeights.reflector;
    max.theorist += allWeights.theorist;
    max.pragmatist += allWeights.pragmatist;
  }

  // Normalize to 0-100 scale
  const normalize = (val: number, maxVal: number) =>
    maxVal > 0 ? Math.round((val / maxVal) * 100) : 0;

  return {
    visual: normalize(raw.visual, max.visual),
    auditory: normalize(raw.auditory, max.auditory),
    reading: normalize(raw.reading, max.reading),
    kinesthetic: normalize(raw.kinesthetic, max.kinesthetic),
    activist: normalize(raw.activist, max.activist),
    reflector: normalize(raw.reflector, max.reflector),
    theorist: normalize(raw.theorist, max.theorist),
    pragmatist: normalize(raw.pragmatist, max.pragmatist),
  };
}

export interface LearningStyleSummary {
  primaryStyle: string;
  primaryStyleId: keyof LearningStyleProfile;
  secondaryStyle?: string;
  description: string;
  studyTips: string[];
  examStrategies: string[];
}

const STYLE_LABELS: Record<keyof LearningStyleProfile, string> = {
  visual: 'Visual',
  auditory: 'Auditori',
  reading: 'Membaca/Menulis',
  kinesthetic: 'Kinestetik',
  activist: 'Aktivis (Doer)',
  reflector: 'Reflektor',
  theorist: 'Teoris',
  pragmatist: 'Pragmatis',
};

export function summarizeLearningStyle(profile: LearningStyleProfile): LearningStyleSummary {
  const entries = Object.entries(profile) as [keyof LearningStyleProfile, number][];
  const sorted = entries.sort((a, b) => b[1] - a[1]);
  const [primaryKey, primaryScore] = sorted[0];
  const [secondaryKey, secondaryScore] = sorted[1];

  const primaryLabel = STYLE_LABELS[primaryKey];
  const secondaryLabel = secondaryScore >= 60 ? STYLE_LABELS[secondaryKey] : undefined;

  const tips = getStudyTips(primaryKey, secondaryKey);

  return {
    primaryStyle: primaryLabel,
    primaryStyleId: primaryKey,
    secondaryStyle: secondaryLabel,
    description: getStyleDescription(primaryKey),
    studyTips: tips.studyTips,
    examStrategies: tips.examStrategies,
  };
}

function getStyleDescription(key: keyof LearningStyleProfile): string {
  const descriptions: Record<keyof LearningStyleProfile, string> = {
    visual: 'Kamu belajar paling efektif dengan melihat — diagram, bagan, mind map, dan representasi visual membantu otakmu memproses informasi lebih baik.',
    auditory: 'Kamu menyerap informasi terbaik melalui pendengaran — mendengarkan penjelasan, berdiskusi, dan "bercerita" kepada diri sendiri sangat efektif untukmu.',
    reading: 'Kekuatanmu ada di membaca dan menulis — teks, referensi tertulis, dan catatan rapi adalah cara terbaik otakmu memproses dan mengingat informasi.',
    kinesthetic: 'Kamu belajar dengan melakukan — latihan langsung, pengalaman nyata, dan trial & error jauh lebih efektif daripada membaca atau mendengarkan pasif.',
    activist: 'Kamu senang terjun langsung — tryout, latihan intensif, dan langsung mencoba adalah caramu belajar. Kamu mudah bosan dengan teori panjang.',
    reflector: 'Kamu suka mengamati dan merefleksikan — menganalisis hasil, membaca pembahasan mendalam, dan memikirkan "kenapa" sebelum melangkah maju.',
    theorist: 'Kamu menyukai logika dan sistem — memahami framework, kisi-kisi, dan pola soal secara menyeluruh sebelum latihan adalah caramu belajar.',
    pragmatist: 'Kamu fokus pada hal yang praktis — kamu paling semangat belajar ketika tahu persis "ini akan keluar di ujian" dan ada manfaat langsung yang terlihat.',
  };
  return descriptions[key];
}

function getStudyTips(
  primary: keyof LearningStyleProfile,
  secondary: keyof LearningStyleProfile
): { studyTips: string[]; examStrategies: string[] } {
  const allTips: Record<keyof LearningStyleProfile, { studyTips: string[]; examStrategies: string[] }> = {
    visual: {
      studyTips: [
        'Buat mind map untuk setiap topik TWK (Pancasila, UUD 1945, NKRI)',
        'Gunakan warna berbeda untuk setiap kategori soal di catatan',
        'Cari infografis atau bagan struktur pemerintahan Indonesia',
        'Buat timeline visual untuk sejarah Indonesia',
      ],
      examStrategies: [
        'Saat membaca soal, bayangkan diagram atau hubungan antar konsep',
        'Gunakan simbol dan panah saat mengerjakan soal logika TIU',
        'Progress chart di app ini akan sangat memotivasi kamu!',
      ],
    },
    auditory: {
      studyTips: [
        'Temukan video penjelasan di YouTube untuk setiap topik sulit',
        'Bacakan soal dengan keras dan "diskusikan" pilihan jawaban sendiri',
        'Bergabung dengan grup belajar online untuk diskusi aktif',
        'Rekam ringkasan materi dengan suaramu sendiri lalu dengarkan kembali',
      ],
      examStrategies: [
        'Sebelum menjawab soal sulit, ucapkan pertanyaan dalam hati pelan-pelan',
        'Gunakan AI Tutor di app ini untuk "berdiskusi" tentang soal yang bingung',
        'Gunakan fitur pembahasan adaptif untuk mendapat penjelasan lisan-style',
      ],
    },
    reading: {
      studyTips: [
        'Baca teks asli UUD 1945 dan Pancasila, bukan hanya ringkasan',
        'Buat catatan rapi dan ringkasan tertulis setelah setiap topik',
        'Cari referensi dari buku teks resmi atau modul BKN',
        'Catat definisi-definisi penting dalam buku kosakata pribadi',
      ],
      examStrategies: [
        'Baca soal dengan sangat cermat — kamu unggul dalam menemukan detail tersembunyi',
        'Manfaatkan fitur pembahasan teks panjang di app ini',
        'Review pembahasan setiap soal salah dengan membaca sampai tuntas',
      ],
    },
    kinesthetic: {
      studyTips: [
        'Prioritaskan latihan soal daripada membaca teori — langsung kerjakan!',
        'Atur target harian: minimum 50 soal per hari',
        'Gunakan timer saat latihan untuk simulasi kondisi ujian nyata',
        'Belajar dari kesalahan: tandai soal yang salah dan ulangi besok',
      ],
      examStrategies: [
        'Ikut sebanyak mungkin simulasi tryout — kamu belajar dari pengalaman',
        'Gunakan mode Adaptive Practice untuk soal yang sering kamu salah',
        'Daily Challenge setiap hari adalah rutinmu yang paling efektif!',
      ],
    },
    activist: {
      studyTips: [
        'Ikut tryout intensif — semakin banyak semakin baik',
        'Tantang diri sendiri dengan target waktu yang lebih ketat',
        'Bergabung dengan kelompok belajar untuk kompetisi sehat',
        'Variasikan tipe soal agar tidak bosan',
      ],
      examStrategies: [
        'Daily Challenge setiap hari wajib untuk kamu!',
        'Coba pecahkan rekor skor pribadi di setiap tryout',
        'Gunakan mode Timer Ketat saat latihan biasa',
      ],
    },
    reflector: {
      studyTips: [
        'Luangkan waktu membaca pembahasan lengkap setiap soal yang salah',
        'Catat pola kesalahan yang berulang dan cari penyebabnya',
        'Review riwayat latihan mingguan sebelum memulai sesi baru',
        'Jangan terburu-buru — kualitas pemahaman lebih penting dari kuantitas soal',
      ],
      examStrategies: [
        'Manfaatkan fitur Statistik & Progress di app ini secara rutin',
        'Gunakan AI Tutor untuk analisis mendalam soal yang membingungkan',
        'Lihat Rekomendasi Studi Mingguan dari AI setiap awal minggu',
      ],
    },
    theorist: {
      studyTips: [
        'Pelajari kisi-kisi resmi BKN dan struktur SKD sebelum mulai latihan',
        'Pahami pola dan logika di balik soal TIU — jangan hafal, pahami',
        'Baca regulasi dan peraturan asli yang sering muncul di soal TWK',
        'Buat framework/peta konsep untuk setiap kategori ujian',
      ],
      examStrategies: [
        'Pelajari pola soal dari tryout-tryout sebelumnya',
        'Gunakan fitur Analisis Kategori untuk memahami di mana kamu lemah secara sistematis',
        'Sesi Latihan Mendalam per subtopik lebih cocok untukmu daripada acak',
      ],
    },
    pragmatist: {
      studyTips: [
        'Fokus pada tipe soal yang paling sering muncul di ujian nyata',
        'Tanya ke forum/komunitas: "soal apa yang paling sering keluar?"',
        'Gunakan pembahasan soal untuk langsung tahu cara menjawab soal serupa',
        'Prioritaskan materi dengan bobot nilai terbesar',
      ],
      examStrategies: [
        'Lihat statistik soal mana yang paling sering muncul',
        'Fokus tryout pada format yang paling mirip ujian asli',
        'Gunakan fitur Pembahasan AI untuk tips praktis menjawab soal',
      ],
    },
  };

  const primaryTips = allTips[primary];

  // Merge secondary tips if score is high enough
  const secondaryTips = allTips[secondary];
  const merged = {
    studyTips: [...primaryTips.studyTips, secondaryTips.studyTips[0]].slice(0, 5),
    examStrategies: [...primaryTips.examStrategies, secondaryTips.examStrategies[0]].slice(0, 4),
  };

  return merged;
}
