export type ExamType = 'CPNS' | 'TNI' | 'POLRI';

export type SubjectType =
  // CPNS SKD
  | 'TWK'
  | 'TIU'
  | 'TKP'
  // TNI / shared
  | 'PSIKOTES'
  | 'MATEMATIKA'
  | 'BAHASA_INDONESIA'
  | 'PENGETAHUAN_UMUM'
  | 'KEDINASAN'
  // Polri specific
  | 'PENGETAHUAN_HUKUM';

export type QuestionType = 'MULTIPLE_CHOICE' | 'TKP_SCALE';
export type DifficultyLevel = 'MUDAH' | 'SEDANG' | 'SULIT';
export type SessionType = 'PRACTICE' | 'TRYOUT' | 'CHALLENGE';

export interface ExamConfig {
  type: ExamType;
  label: string;
  description: string;
  subjects: SubjectType[];
  color: string;
}

export interface TryoutSection {
  subject: SubjectType;
  questionCount: number;
  durationMinutes?: number;
  passingScore: number;
}

export const SUBJECT_LABELS: Record<SubjectType, string> = {
  TWK: 'Tes Wawasan Kebangsaan',
  TIU: 'Tes Intelegensia Umum',
  TKP: 'Tes Karakteristik Pribadi',
  PSIKOTES: 'Psikotes',
  MATEMATIKA: 'Matematika',
  BAHASA_INDONESIA: 'Bahasa Indonesia',
  PENGETAHUAN_UMUM: 'Pengetahuan Umum',
  KEDINASAN: 'Kedinasan',
  PENGETAHUAN_HUKUM: 'Pengetahuan Hukum',
};

export const EXAM_CONFIGS: Record<ExamType, ExamConfig> = {
  CPNS: {
    type: 'CPNS',
    label: 'CPNS',
    description: 'Calon Pegawai Negeri Sipil (SKD)',
    subjects: ['TWK', 'TIU', 'TKP'],
    color: '#CC0001',
  },
  TNI: {
    type: 'TNI',
    label: 'TNI',
    description: 'Tentara Nasional Indonesia',
    subjects: ['MATEMATIKA', 'BAHASA_INDONESIA', 'PENGETAHUAN_UMUM', 'PSIKOTES', 'KEDINASAN'],
    color: '#1B4332',
  },
  POLRI: {
    type: 'POLRI',
    label: 'Polri',
    description: 'Polisi Republik Indonesia',
    subjects: ['MATEMATIKA', 'BAHASA_INDONESIA', 'PENGETAHUAN_UMUM', 'PSIKOTES', 'PENGETAHUAN_HUKUM'],
    color: '#1A3A5C',
  },
};
