import React, { useEffect, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  ActivityIndicator,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import type { ProgressScreenProps } from '../../navigation/types';
import type { PracticeSession, UserAnswer, SectionScore } from '../../types/session.types';
import type { SubjectType } from '../../types/exam.types';
import { SUBJECT_LABELS } from '../../types/exam.types';
import { SessionRepository, AnswerRepository } from '../../db/repositories/SessionRepository';
import { getScorePercentage } from '../../utils/ScoreCalculator';

export function SessionDetailScreen({ route, navigation }: ProgressScreenProps<'SessionDetail'>) {
  const { sessionId } = route.params;

  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [session, setSession] = useState<PracticeSession | null>(null);
  const [answers, setAnswers] = useState<UserAnswer[]>([]);

  useEffect(() => {
    let cancelled = false;
    (async () => {
      try {
        const [s, a] = await Promise.all([
          SessionRepository.getSession(sessionId),
          AnswerRepository.getAnswersBySession(sessionId),
        ]);
        if (cancelled) return;
        if (!s) {
          setError('Sesi tidak ditemukan.');
        } else {
          setSession(s);
          setAnswers(a);
        }
        setLoading(false);
      } catch (e: any) {
        if (cancelled) return;
        setError(`Gagal memuat detail: ${e?.message ?? 'unknown error'}`);
        setLoading(false);
      }
    })();
    return () => {
      cancelled = true;
    };
  }, [sessionId]);

  if (loading) {
    return (
      <SafeAreaView style={styles.safe}>
        <View style={styles.centerBox}>
          <ActivityIndicator size="large" color={Colors.primary} />
          <Text style={styles.loadingText}>Memuat detail sesiâ€¦</Text>
        </View>
      </SafeAreaView>
    );
  }

  if (error || !session) {
    return (
      <SafeAreaView style={styles.safe}>
        <View style={styles.centerBox}>
          <Ionicons name="alert-circle-outline" size={56} color={Colors.error} />
          <Text style={styles.errorText}>{error ?? 'Sesi tidak ditemukan.'}</Text>
          <TouchableOpacity style={styles.primaryBtn} onPress={() => navigation.goBack()}>
            <Text style={styles.primaryBtnText}>Kembali</Text>
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    );
  }

  const pct = getScorePercentage(session.totalScore, session.maxScore);
  const correct = session.correctCount;
  const wrong = answers.length - correct;
  const unanswered = session.totalQuestions - answers.length;
  const durationMin = session.durationSeconds ? Math.floor(session.durationSeconds / 60) : 0;
  const durationSec = session.durationSeconds ? session.durationSeconds % 60 : 0;
  const scoreColor =
    pct >= 80 ? Colors.success : pct >= 60 ? Colors.warning : Colors.error;
  const sectionScores = (session.sectionScores ?? null) as Record<SubjectType, SectionScore> | null;

  return (
    <SafeAreaView style={styles.safe}>
      <View style={styles.header}>
        <TouchableOpacity style={styles.backBtn} onPress={() => navigation.goBack()}>
          <Ionicons name="arrow-back" size={22} color={Colors.textPrimary} />
        </TouchableOpacity>
        <View style={styles.headerText}>
          <Text style={styles.headerTitle}>Detail Sesi</Text>
          <Text style={styles.sessionDate}>{formatDateTime(session.startedAt)}</Text>
        </View>
      </View>

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>
        {/* Meta */}
        <View style={styles.metaCard}>
          <View style={styles.metaRow}>
            <View style={[styles.badge, { backgroundColor: Colors.primary + '15' }]}>
              <Text style={[styles.badgeText, { color: Colors.primary }]}>
                {session.sessionType === 'TRYOUT' ? 'TRYOUT' : 'LATIHAN'}
              </Text>
            </View>
            {session.examType ? (
              <View style={[styles.badge, { backgroundColor: Colors.gray100 }]}>
                <Text style={styles.badgeTextDark}>{session.examType}</Text>
              </View>
            ) : null}
            {session.subject ? (
              <Text style={styles.subjectText} numberOfLines={1}>
                {SUBJECT_LABELS[session.subject] ?? session.subject}
              </Text>
            ) : null}
          </View>
          {session.durationSeconds ? (
            <View style={styles.metaRow}>
              <Ionicons name="time-outline" size={14} color={Colors.textSecondary} />
              <Text style={styles.metaText}>
                Durasi {durationMin}m {durationSec}s
              </Text>
            </View>
          ) : null}
        </View>

        {/* Score */}
        <View style={styles.scoreCard}>
          <View style={[styles.scoreCircle, { borderColor: scoreColor }]}>
            <Text style={[styles.scoreNumber, { color: scoreColor }]}>{session.totalScore}</Text>
            <Text style={styles.scoreLabel}>/ {session.maxScore}</Text>
          </View>
          <View style={styles.scoreStats}>
            <Stat icon="checkmark-circle" color={Colors.success} value={correct} label="Benar" />
            <Divider />
            <Stat icon="close-circle" color={Colors.error} value={wrong} label="Salah" />
            <Divider />
            <Stat icon="help-circle" color={Colors.textMuted} value={unanswered} label="Lewati" />
          </View>
          <Text style={[styles.pctBig, { color: scoreColor }]}>{pct}%</Text>
        </View>

        {/* Per-section (kalau tryout) */}
        {sectionScores && Object.keys(sectionScores).length > 0 ? (
          <View style={styles.reviewCard}>
            <Text style={styles.reviewTitle}>Skor per Bagian</Text>
            {(Object.entries(sectionScores) as Array<[SubjectType, SectionScore]>).map(
              ([subject, score]) => (
                <View key={subject} style={styles.sectionRow}>
                  <Text style={styles.sectionName}>
                    {SUBJECT_LABELS[subject] ?? subject}
                  </Text>
                  <Text style={styles.sectionStat}>
                    {score.correct}/{score.total} Â· skor {score.score}
                  </Text>
                </View>
              )
            )}
          </View>
        ) : null}

        {/* Per-question dots */}
        <View style={styles.reviewCard}>
          <Text style={styles.reviewTitle}>Tinjauan Soal</Text>
          <Text style={styles.reviewDesc}>
            Hijau = benar, merah = salah, abu-abu = tidak dijawab.
          </Text>
          <View style={styles.reviewGrid}>
            {Array.from({ length: session.totalQuestions }).map((_, i) => {
              const a = answers[i];
              const color = !a ? Colors.gray300 : a.isCorrect ? Colors.success : Colors.error;
              return (
                <View key={i} style={[styles.reviewItem, { backgroundColor: color + '18' }]}>
                  <Text style={[styles.reviewItemNum, { color }]}>{i + 1}</Text>
                </View>
              );
            })}
          </View>
        </View>

        {/* Sync status */}
        {!session.isSynced ? (
          <View style={styles.syncBanner}>
            <Ionicons name="cloud-upload-outline" size={16} color={Colors.warning} />
            <Text style={styles.syncText}>
              Sesi ini belum tersinkron ke server. Akan ter-upload otomatis saat online.
            </Text>
          </View>
        ) : null}

        <TouchableOpacity
          style={styles.backToHistoryBtn}
          activeOpacity={0.85}
          onPress={() => navigation.goBack()}
        >
          <Ionicons name="arrow-back-outline" size={16} color={Colors.primary} />
          <Text style={styles.backToHistoryText}>Kembali ke Riwayat</Text>
        </TouchableOpacity>
      </ScrollView>
    </SafeAreaView>
  );
}

function Stat({
  icon,
  color,
  value,
  label,
}: {
  icon: keyof typeof Ionicons.glyphMap;
  color: string;
  value: number;
  label: string;
}) {
  return (
    <View style={styles.scoreStat}>
      <Ionicons name={icon} size={18} color={color} />
      <Text style={styles.scoreStatValue}>{value}</Text>
      <Text style={styles.scoreStatLabel}>{label}</Text>
    </View>
  );
}

function Divider() {
  return <View style={styles.scoreStatDivider} />;
}

function formatDateTime(ts: number): string {
  const d = new Date(ts);
  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];
  const hh = String(d.getHours()).padStart(2, '0');
  const mm = String(d.getMinutes()).padStart(2, '0');
  return `${d.getDate()} ${months[d.getMonth()]} ${d.getFullYear()} Â· ${hh}:${mm}`;
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },

  centerBox: { flex: 1, justifyContent: 'center', alignItems: 'center', padding: 24, gap: 12 },
  loadingText: { fontSize: 13, color: Colors.textSecondary },
  errorText: { fontSize: 14, color: Colors.textSecondary, textAlign: 'center', lineHeight: 20 },

  header: {
    backgroundColor: Colors.white,
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 20,
    paddingTop: 12,
    paddingBottom: 16,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
    gap: 14,
  },
  backBtn: { width: 36, height: 36, justifyContent: 'center' },
  headerText: { gap: 2 },
  headerTitle: { fontSize: 20, fontWeight: '800', color: Colors.textPrimary, letterSpacing: -0.3 },
  sessionDate: { fontSize: 12, color: Colors.textSecondary },

  scroll: { padding: 20, gap: 16, paddingBottom: 40 },

  metaCard: {
    backgroundColor: Colors.white,
    borderRadius: 14,
    padding: 14,
    gap: 10,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  metaRow: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  metaText: { fontSize: 12, color: Colors.textSecondary },
  badge: { paddingHorizontal: 10, paddingVertical: 3, borderRadius: 8 },
  badgeText: { fontSize: 11, fontWeight: '800', letterSpacing: 0.5 },
  badgeTextDark: { fontSize: 11, fontWeight: '700', color: Colors.textPrimary },
  subjectText: { flex: 1, fontSize: 12, fontWeight: '600', color: Colors.textSecondary },

  scoreCard: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 20,
    alignItems: 'center',
    gap: 14,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.06,
    shadowRadius: 6,
    elevation: 2,
  },
  scoreCircle: {
    width: 100,
    height: 100,
    borderRadius: 50,
    borderWidth: 5,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: Colors.bgSecondary,
  },
  scoreNumber: { fontSize: 28, fontWeight: '900' },
  scoreLabel: { fontSize: 11, color: Colors.textSecondary, marginTop: -2 },
  pctBig: { fontSize: 22, fontWeight: '800' },
  scoreStats: {
    width: '100%',
    flexDirection: 'row',
    justifyContent: 'space-around',
    alignItems: 'center',
  },
  scoreStat: { alignItems: 'center', gap: 4, minWidth: 60 },
  scoreStatLabel: { fontSize: 11, color: Colors.textSecondary },
  scoreStatValue: { fontSize: 20, fontWeight: '800', color: Colors.textPrimary },
  scoreStatDivider: { width: 1, height: 36, backgroundColor: Colors.border },

  reviewCard: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 18,
    gap: 12,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  reviewTitle: { fontSize: 14, fontWeight: '700', color: Colors.textPrimary },
  reviewDesc: { fontSize: 12, color: Colors.textSecondary },
  reviewGrid: { flexDirection: 'row', flexWrap: 'wrap', gap: 8 },
  reviewItem: { width: 40, height: 40, borderRadius: 10, justifyContent: 'center', alignItems: 'center' },
  reviewItemNum: { fontSize: 12, fontWeight: '800' },

  sectionRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingVertical: 6,
    borderBottomWidth: 1,
    borderBottomColor: Colors.gray100,
  },
  sectionName: { flex: 1, fontSize: 13, fontWeight: '600', color: Colors.textPrimary },
  sectionStat: { fontSize: 12, color: Colors.textSecondary, fontWeight: '500' },

  syncBanner: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    backgroundColor: '#FFFBEB',
    borderRadius: 10,
    padding: 12,
    borderWidth: 1,
    borderColor: '#FDE68A',
  },
  syncText: { flex: 1, fontSize: 12, color: Colors.warning, lineHeight: 18 },

  backToHistoryBtn: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
    paddingVertical: 14,
    borderRadius: 12,
    borderWidth: 1.5,
    borderColor: Colors.primary,
    backgroundColor: Colors.white,
  },
  backToHistoryText: { fontSize: 14, fontWeight: '700', color: Colors.primary },

  primaryBtn: {
    backgroundColor: Colors.primary,
    paddingHorizontal: 24,
    paddingVertical: 12,
    borderRadius: 12,
  },
  primaryBtnText: { fontSize: 14, fontWeight: '700', color: Colors.white },
});
