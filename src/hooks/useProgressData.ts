// useProgressData
// Agregasi data progress untuk ProgressDashboard + HistoryList.
// Sumber: SessionRepository + AnswerRepository (SQLite, local-first).
// Tidak memanggil Supabase langsung — sync ke server dikelola SyncManager.

import { useCallback, useEffect, useRef, useState } from 'react';
import { SessionRepository, AnswerRepository } from '../db/repositories/SessionRepository';
import type { PracticeSession } from '../types/session.types';
import type { SubjectType, SessionType } from '../types/exam.types';

export interface SubjectAccuracy {
  subject: SubjectType;
  correct: number;
  total: number;
  pct: number;
}

export interface ProgressSnapshot {
  loading: boolean;
  totalSessions: number;
  totalAnswered: number;
  totalCorrect: number;
  totalScore: number;
  accuracyBySubject: SubjectAccuracy[];
  recentSessions: PracticeSession[];
  refresh: () => Promise<void>;
}

interface Options {
  userId: string | null;
  /** Limit untuk recentSessions list. Default 50. */
  recentLimit?: number;
  /** Filter recentSessions by type. */
  sessionType?: SessionType | 'ALL';
}

export function useProgressData(opts: Options): ProgressSnapshot {
  const { userId, recentLimit = 50, sessionType = 'ALL' } = opts;

  const [loading, setLoading] = useState(true);
  const [totalSessions, setTotalSessions] = useState(0);
  const [totalAnswered, setTotalAnswered] = useState(0);
  const [totalCorrect, setTotalCorrect] = useState(0);
  const [totalScore, setTotalScore] = useState(0);
  const [accuracyBySubject, setAccuracy] = useState<SubjectAccuracy[]>([]);
  const [recentSessions, setRecentSessions] = useState<PracticeSession[]>([]);

  const mountedRef = useRef(true);
  useEffect(() => {
    mountedRef.current = true;
    return () => {
      mountedRef.current = false;
    };
  }, []);

  const refresh = useCallback(async () => {
    if (!userId) {
      if (mountedRef.current) setLoading(false);
      return;
    }
    if (mountedRef.current) setLoading(true);
    try {
      const [stats, raw, sessions] = await Promise.all([
        SessionRepository.getSessionStats(userId),
        AnswerRepository.getAccuracyBySubject(userId),
        SessionRepository.getSessionsByUser(userId, recentLimit),
      ]);
      if (!mountedRef.current) return;

      setTotalSessions(stats.totalSessions);
      setTotalAnswered(stats.totalAnswered);
      setTotalCorrect(stats.totalCorrect);
      setTotalScore(stats.totalScore);

      const acc: SubjectAccuracy[] = Object.entries(raw).map(([subject, v]) => ({
        subject: subject as SubjectType,
        correct: v.correct,
        total: v.total,
        pct: v.total > 0 ? Math.round((v.correct / v.total) * 100) : 0,
      }));
      acc.sort((a, b) => b.pct - a.pct);
      setAccuracy(acc);

      const filteredSessions =
        sessionType === 'ALL'
          ? sessions
          : sessions.filter((s) => s.sessionType === sessionType);
      setRecentSessions(filteredSessions);
    } finally {
      if (mountedRef.current) setLoading(false);
    }
  }, [userId, recentLimit, sessionType]);

  useEffect(() => {
    void refresh();
  }, [refresh]);

  return {
    loading,
    totalSessions,
    totalAnswered,
    totalCorrect,
    totalScore,
    accuracyBySubject,
    recentSessions,
    refresh,
  };
}
