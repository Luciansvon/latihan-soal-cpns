import type { SubjectType } from '../types/exam.types';

// CPNS SKD passing thresholds (nilai ambang batas 2024)
export const CPNS_PASSING_SCORES: Record<'TWK' | 'TIU' | 'TKP', number> = {
  TWK: 65,
  TIU: 80,
  TKP: 166,
};

export const CPNS_SKD_STRUCTURE = {
  totalQuestions: 100,
  durationMinutes: 90,
  sections: [
    { subject: 'TWK' as SubjectType, questionCount: 30, passingScore: 65 },
    { subject: 'TIU' as SubjectType, questionCount: 35, passingScore: 80 },
    { subject: 'TKP' as SubjectType, questionCount: 45, passingScore: 166 },
  ],
};

// TWK scoring: correct = +5, wrong = 0
// TIU scoring: correct = +5, wrong = 0
// TKP scoring: scale 1-5, no wrong answer
export const SCORING_RULES = {
  CPNS_TWK: { correct: 5, wrong: 0, unanswered: 0 },
  CPNS_TIU: { correct: 5, wrong: 0, unanswered: 0 },
  CPNS_TKP: { type: 'SCALE', min: 1, max: 5 },
  TNI: { correct: 4, wrong: -1, unanswered: 0 },
  POLRI: { correct: 5, wrong: 0, unanswered: 0 },
} as const;

export const SUBTOPICS: Partial<Record<SubjectType, string[]>> = {
  TWK: [
    'Pancasila',
    'UUD 1945',
    'NKRI',
    'Bhinneka Tunggal Ika',
    'Sejarah Indonesia',
    'Kebijakan Pemerintah',
  ],
  TIU: [
    'Verbal - Analogi',
    'Verbal - Silogisme',
    'Verbal - Analitis',
    'Numerik - Berhitung',
    'Numerik - Deret Angka',
    'Numerik - Perbandingan',
    'Figural - Analogi',
    'Figural - Ketidaksamaan',
    'Logika',
  ],
  TKP: [
    'Pelayanan Publik',
    'Jejaring Kerja',
    'Sosial Budaya',
    'Teknologi Informasi',
    'Profesionalisme',
    'Anti Radikalisme',
  ],
  MATEMATIKA: ['Aljabar', 'Geometri', 'Statistika', 'Aritmatika'],
  BAHASA_INDONESIA: ['Pemahaman Bacaan', 'Tata Bahasa', 'Ejaan', 'Kosakata'],
  PENGETAHUAN_UMUM: ['Geografi', 'Sejarah', 'Ilmu Pengetahuan', 'Olahraga', 'Seni Budaya'],
  PENGETAHUAN_HUKUM: ['Hukum Pidana', 'Hukum Perdata', 'Hukum Tata Negara', 'HAM'],
};
