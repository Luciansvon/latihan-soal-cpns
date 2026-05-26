import type { Ionicons } from '@expo/vector-icons';
import { Colors } from './colors';
import type { ExamType, SubjectType } from '../types/exam.types';

export interface TryoutSection {
  subject: SubjectType;
  questionCount: number;
  passingScore: number; // CPNS: official ambang batas; TNI/POLRI: target skor seksi
}

export interface TryoutTemplate {
  id: string;
  examType: ExamType;
  title: string;
  subtitle: string;
  description: string;
  durationMinutes: number;
  color: string;
  icon: keyof typeof Ionicons.glyphMap;
  difficulty: string;
  sections: TryoutSection[];
}

// Jumlah soal per seksi TIDAK boleh melebihi stok seed:
//   CPNS  TWK 50 / TIU 50 / TKP 50
//   TNI   MAT 15 / BIN 12 / PU 12 / PSIKOTES 6 / KEDINASAN 5
//   POLRI MAT 10 / BIN 10 / PU 10 / PSIKOTES 5 / HUKUM 15
export const TRYOUT_TEMPLATES: TryoutTemplate[] = [
  {
    id: 'cpns-skd-001',
    examType: 'CPNS',
    title: 'CPNS SKD Paket 1',
    subtitle: 'Seleksi Kompetensi Dasar',
    description:
      'Simulasi SKD sesuai standar BKN: 110 soal dalam 100 menit dengan ambang batas TWK ≥65, TIU ≥80, dan TKP ≥166.',
    durationMinutes: 100,
    color: Colors.cpns,
    icon: 'business-outline',
    difficulty: 'Standar',
    sections: [
      { subject: 'TWK', questionCount: 30, passingScore: 65 },
      { subject: 'TIU', questionCount: 35, passingScore: 80 },
      { subject: 'TKP', questionCount: 45, passingScore: 166 },
    ],
  },
  {
    id: 'tni-001',
    examType: 'TNI',
    title: 'TNI Paket 1',
    subtitle: 'Tes Akademik & Psikotes',
    description:
      'Simulasi tes akademik TNI lintas materi. Penilaian akademik: benar +4, salah −1 (negative marking).',
    durationMinutes: 60,
    color: Colors.tni,
    icon: 'shield-half-outline',
    difficulty: 'Sedang',
    sections: [
      { subject: 'MATEMATIKA', questionCount: 15, passingScore: 36 },
      { subject: 'BAHASA_INDONESIA', questionCount: 12, passingScore: 29 },
      { subject: 'PENGETAHUAN_UMUM', questionCount: 12, passingScore: 29 },
      { subject: 'PSIKOTES', questionCount: 6, passingScore: 14 },
      { subject: 'KEDINASAN', questionCount: 5, passingScore: 12 },
    ],
  },
  {
    id: 'polri-001',
    examType: 'POLRI',
    title: 'Polri Paket 1',
    subtitle: 'Tes Akademik & Pengetahuan Hukum',
    description:
      'Simulasi tes Polri mencakup akademik, psikotes, dan pengetahuan hukum (KUHP, KUHPer, HTN, HAM).',
    durationMinutes: 60,
    color: Colors.polri,
    icon: 'shield-checkmark-outline',
    difficulty: 'Sedang',
    sections: [
      { subject: 'MATEMATIKA', questionCount: 10, passingScore: 30 },
      { subject: 'BAHASA_INDONESIA', questionCount: 10, passingScore: 30 },
      { subject: 'PENGETAHUAN_UMUM', questionCount: 10, passingScore: 30 },
      { subject: 'PENGETAHUAN_HUKUM', questionCount: 15, passingScore: 45 },
      { subject: 'PSIKOTES', questionCount: 5, passingScore: 15 },
    ],
  },
];

export function getTryoutTemplate(id: string): TryoutTemplate | undefined {
  return TRYOUT_TEMPLATES.find((t) => t.id === id);
}

export function getTryoutQuestionCount(t: TryoutTemplate): number {
  return t.sections.reduce((sum, s) => sum + s.questionCount, 0);
}
