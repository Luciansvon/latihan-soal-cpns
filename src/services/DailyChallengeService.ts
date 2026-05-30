// DailyChallengeService
// Micro-dosing harian: 5 soal/hari fokus pada subject yang akurasinya
// paling rendah (lihat TNI Efektif.md — strategi anti information-overload).
// State disimpan lokal via AsyncStorage; satu sesi per hari.

import AsyncStorage from '@react-native-async-storage/async-storage';
import type { SubjectType, ExamType } from '../types/exam.types';
import type { SubjectAccuracy } from '../hooks/useProgressData';
import { recommendSubjects } from '../utils/recommendation';

export interface DailyChallengeState {
  done: boolean;
  doneAt?: number; // unix ts ketika done
  startedAt?: number;
  subject?: SubjectType;
  examType?: ExamType;
  reason?: string;
}

export const DAILY_CHALLENGE_SIZE = 5;

const KEY_STATE = (userId: string, dateKey: string) =>
  `daily:state:${userId}:${dateKey}`;

function todayKey(): string {
  const d = new Date();
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`;
}

export const DailyChallengeService = {
  /**
   * Cek state hari ini. Kalau belum ada, hitung subject prioritas dari
   * accuracy user. Default fallback ke TWK kalau belum ada data.
   */
  async getTodayState(
    userId: string,
    accuracy: SubjectAccuracy[],
    defaultExam: ExamType = 'CPNS'
  ): Promise<DailyChallengeState> {
    const raw = await AsyncStorage.getItem(KEY_STATE(userId, todayKey()));
    if (raw) {
      try {
        return JSON.parse(raw) as DailyChallengeState;
      } catch {
        // ignore parse error, recompute below
      }
    }

    // Belum ada — hitung subject prioritas
    const recs = recommendSubjects(accuracy, 1);
    if (recs.length > 0) {
      return {
        done: false,
        subject: recs[0].subject,
        examType: examOfSubject(recs[0].subject) ?? defaultExam,
        reason: recs[0].reason,
      };
    }

    // Belum cukup data — default ke TWK (paling sentral untuk CPNS)
    return {
      done: false,
      subject: 'TWK',
      examType: defaultExam,
      reason: 'Belum cukup data — mulai dengan TWK sebagai kategori inti CPNS',
    };
  },

  async markStarted(
    userId: string,
    state: DailyChallengeState
  ): Promise<void> {
    const next: DailyChallengeState = {
      ...state,
      startedAt: Date.now(),
    };
    await AsyncStorage.setItem(KEY_STATE(userId, todayKey()), JSON.stringify(next));
  },

  async markDone(userId: string): Promise<void> {
    const raw = await AsyncStorage.getItem(KEY_STATE(userId, todayKey()));
    let state: DailyChallengeState = raw
      ? (JSON.parse(raw) as DailyChallengeState)
      : { done: false };
    state = { ...state, done: true, doneAt: Date.now() };
    await AsyncStorage.setItem(KEY_STATE(userId, todayKey()), JSON.stringify(state));
  },
};

/**
 * Map subject ke ExamType utama-nya. Beberapa subject (MATEMATIKA, BAHASA,
 * PSIKOTES) bisa muncul di TNI dan POLRI; default ke TNI.
 */
function examOfSubject(subject: SubjectType): ExamType | undefined {
  switch (subject) {
    case 'TWK':
    case 'TIU':
    case 'TKP':
      return 'CPNS';
    case 'KEDINASAN':
      return 'TNI';
    case 'PENGETAHUAN_HUKUM':
      return 'POLRI';
    case 'MATEMATIKA':
    case 'BAHASA_INDONESIA':
    case 'PENGETAHUAN_UMUM':
    case 'PSIKOTES':
      return 'TNI';
    default:
      return undefined;
  }
}
