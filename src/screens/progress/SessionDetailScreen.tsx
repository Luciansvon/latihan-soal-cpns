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
import { Colors, CognitiveCalm, HyperMinimal, Fonts } from '../../constants/colors';
import type { ProgressScreenProps } from '../../navigation/types';
import type { PracticeSession, UserAnswer, SectionScore } from '../../types/session.types';
import type { SubjectType } from '../../types/exam.types';
import { SUBJECT_LABELS } from '../../types/exam.types';
import { SessionRepository, AnswerRepository } from '../../db/repositories/SessionRepository';
import { getScorePercentage } from '../../utils/ScoreCalculator';
import { AppHeader } from '../../components/common/AppHeader';

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
      <SafeAreaView style={styles.safe} edges={['top']}>
        <AppHeader theme="navy" showBack onBackPress={() => navigation.goBack()} />
        <View style={styles.centerBox}>
          <ActivityIndicator size="large" color={CognitiveCalm.primary} />
          <Text style={styles.loadingText}>Memuat detail sesi…</Text>
        </View>
      </SafeAreaView>
    );
  }

  if (error || !session) {
    return (
      <SafeAreaView style={styles.safe} edges={['top']}>
        <AppHeader theme="navy" showBack onBackPress={() => navigation.goBack()} />
        <View style={styles.centerBox}>
          <Ionicons name="alert-circle-outline" size={56} color={CognitiveCalm.error} />
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
    pct >= 80 ? Colors.success : pct >= 60 ? Colors.warning : CognitiveCalm.error;
  const sectionScores = (session.sectionScores ?? null) as Record<
    SubjectType,
    SectionScore
  > | null;

  return (
    <SafeAreaView style={styles.safe} edges={['top']}>
      <AppHeader theme="navy" showBack onBackPress={() => navigation.goBack()} />

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>
        <View style={styles.intro}>
          <Text style={styles.title}>Detail Sesi</Text>
          <Text style={styles.subtitle}>{formatDateTime(session.startedAt)}</Text>
        </View>

        {/* Meta */}
        <View style={styles.bentoCard}>
          <View style={styles.metaRow}>
            <View
              style={[
                styles.badge,
                { backgroundColor: CognitiveCalm.primary + '15' },
              ]}
            >
              <Text style={[styles.badgeText, { color: CognitiveCalm.primary }]}>
                {session.sessionType === 'TRYOUT' ? 'TRYOUT' : 'LATIHAN'}
              </Text>
            </View>
            {session.examType ? (
              <View
                style={[
                  styles.badge,
                  { backgroundColor: HyperMinimal.surfaceContainer },
                ]}
              >
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
              <Ionicons
                name="time-outline"
                size={14}
                color={HyperMinimal.onSurfaceVariant}
              />
              <Text style={styles.metaText}>
                Durasi {durationMin}m {durationSec}s
              </Text>
            </View>
          ) : null}
        </View>

        {/* Score hero */}
        <View style={[styles.bentoCard, styles.scoreCard]}>
          <View style={[styles.scoreCircle, { borderColor: scoreColor }]}>
            <Text style={[styles.scoreNumber, { color: scoreColor }]}>
              {session.totalScore}
            </Text>
            <Text style={styles.scoreLabel}>/ {session.maxScore}</Text>
          </View>
          <View style={styles.scoreStats}>
            <Stat icon="checkmark-circle" color={Colors.success} value={correct} label="Benar" />
            <Divider />
            <Stat icon="close-circle" color={CognitiveCalm.error} value={wrong} label="Salah" />
            <Divider />
            <Stat
              icon="help-circle"
              color={HyperMinimal.outline}
              value={unanswered}
              label="Lewati"
            />
          </View>
          <Text style={[styles.pctBig, { color: scoreColor }]}>{pct}%</Text>
        </View>

        {/* Per-section if tryout */}
        {sectionScores && Object.keys(sectionScores).length > 0 ? (
          <View style={styles.bentoCard}>
            <Text style={styles.cardTitle}>Skor per Bagian</Text>
            {(Object.entries(sectionScores) as Array<[SubjectType, SectionScore]>).map(
              ([subject, score]) => (
                <View key={subject} style={styles.sectionRow}>
                  <Text style={styles.sectionName}>
                    {SUBJECT_LABELS[subject] ?? subject}
                  </Text>
                  <Text style={styles.sectionStat}>
                    {score.correct}/{score.total} · skor {score.score}
                  </Text>
                </View>
              ),
            )}
          </View>
        ) : null}

        {/* Per-question */}
        <View style={styles.bentoCard}>
          <Text style={styles.cardTitle}>Tinjauan Soal</Text>
          <Text style={styles.reviewDesc}>
            Hijau = benar, merah = salah, abu-abu = tidak dijawab.
          </Text>
          <View style={styles.reviewGrid}>
            {Array.from({ length: session.totalQuestions }).map((_, i) => {
              const a = answers[i];
              const color = !a
                ? HyperMinimal.outlineVariant
                : a.isCorrect
                ? Colors.success
                : CognitiveCalm.error;
              return (
                <View key={i} style={[styles.reviewItem, { backgroundColor: color + '20' }]}>
                  <Text style={[styles.reviewItemNum, { color }]}>{i + 1}</Text>
                </View>
              );
            })}
          </View>
        </View>

        {/* Sync banner */}
        {!session.isSynced ? (
          <View style={styles.syncBanner}>
            <Ionicons name="cloud-upload-outline" size={16} color="#D97706" />
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
          <Ionicons name="arrow-back-outline" size={16} color={CognitiveCalm.primary} />
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
  return `${d.getDate()} ${months[d.getMonth()]} ${d.getFullYear()} · ${hh}:${mm}`;
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: HyperMinimal.background },

  centerBox: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
    gap: 12,
  },
  loadingText: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    color: HyperMinimal.onSurfaceVariant,
  },
  errorText: {
    fontFamily: Fonts.regular,
    fontSize: 14,
    color: HyperMinimal.onSurfaceVariant,
    textAlign: 'center',
    lineHeight: 20,
  },

  scroll: { padding: 20, gap: 16, paddingBottom: 40 },

  intro: { gap: 4, marginBottom: 4 },
  title: {
    fontFamily: Fonts.bold,
    fontSize: 24,
    lineHeight: 32,
    color: HyperMinimal.deepNavy,
  },
  subtitle: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    color: HyperMinimal.onSurfaceVariant,
  },

  bentoCard: {
    backgroundColor: '#FFFFFFCC',
    borderRadius: 18,
    padding: 16,
    gap: 12,
    borderWidth: 1,
    borderColor: HyperMinimal.borderSubtle,
    shadowColor: HyperMinimal.deepNavy,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.03,
    shadowRadius: 8,
    elevation: 1,
  },
  cardTitle: {
    fontFamily: Fonts.bold,
    fontSize: 14,
    color: HyperMinimal.deepNavy,
  },

  metaRow: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  metaText: {
    fontFamily: Fonts.regular,
    fontSize: 12,
    color: HyperMinimal.onSurfaceVariant,
  },
  badge: { paddingHorizontal: 10, paddingVertical: 3, borderRadius: 8 },
  badgeText: {
    fontFamily: Fonts.bold,
    fontSize: 11,
    letterSpacing: 0.5,
  },
  badgeTextDark: {
    fontFamily: Fonts.bold,
    fontSize: 11,
    color: HyperMinimal.deepNavy,
  },
  subjectText: {
    flex: 1,
    fontFamily: Fonts.semibold,
    fontSize: 12,
    color: HyperMinimal.onSurfaceVariant,
  },

  scoreCard: {
    alignItems: 'center',
    gap: 14,
    paddingVertical: 22,
  },
  scoreCircle: {
    width: 104,
    height: 104,
    borderRadius: 52,
    borderWidth: 5,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: HyperMinimal.surfaceContainerLowest,
  },
  scoreNumber: { fontFamily: Fonts.extrabold, fontSize: 28 },
  scoreLabel: {
    fontFamily: Fonts.regular,
    fontSize: 11,
    color: HyperMinimal.onSurfaceVariant,
    marginTop: -2,
  },
  pctBig: { fontFamily: Fonts.extrabold, fontSize: 22 },
  scoreStats: {
    width: '100%',
    flexDirection: 'row',
    justifyContent: 'space-around',
    alignItems: 'center',
  },
  scoreStat: { alignItems: 'center', gap: 4, minWidth: 60 },
  scoreStatLabel: {
    fontFamily: Fonts.regular,
    fontSize: 11,
    color: HyperMinimal.onSurfaceVariant,
  },
  scoreStatValue: {
    fontFamily: Fonts.bold,
    fontSize: 20,
    color: HyperMinimal.deepNavy,
  },
  scoreStatDivider: { width: 1, height: 36, backgroundColor: HyperMinimal.borderSubtle },

  reviewDesc: {
    fontFamily: Fonts.regular,
    fontSize: 12,
    color: HyperMinimal.onSurfaceVariant,
  },
  reviewGrid: { flexDirection: 'row', flexWrap: 'wrap', gap: 8 },
  reviewItem: {
    width: 40,
    height: 40,
    borderRadius: 10,
    justifyContent: 'center',
    alignItems: 'center',
  },
  reviewItemNum: { fontFamily: Fonts.bold, fontSize: 12 },

  sectionRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingVertical: 8,
    borderBottomWidth: 1,
    borderBottomColor: HyperMinimal.borderSubtle,
  },
  sectionName: {
    flex: 1,
    fontFamily: Fonts.semibold,
    fontSize: 13,
    color: HyperMinimal.deepNavy,
  },
  sectionStat: {
    fontFamily: Fonts.medium,
    fontSize: 12,
    color: HyperMinimal.onSurfaceVariant,
  },

  syncBanner: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    backgroundColor: '#FFFBEB',
    borderRadius: 12,
    padding: 12,
    borderWidth: 1,
    borderColor: '#FDE68A',
  },
  syncText: {
    flex: 1,
    fontFamily: Fonts.regular,
    fontSize: 12,
    color: '#92400E',
    lineHeight: 18,
  },

  backToHistoryBtn: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
    paddingVertical: 14,
    borderRadius: 14,
    borderWidth: 1.5,
    borderColor: CognitiveCalm.primary,
    backgroundColor: HyperMinimal.surfaceContainerLowest,
  },
  backToHistoryText: {
    fontFamily: Fonts.bold,
    fontSize: 14,
    color: CognitiveCalm.primary,
  },

  primaryBtn: {
    backgroundColor: CognitiveCalm.primary,
    paddingHorizontal: 24,
    paddingVertical: 12,
    borderRadius: 12,
  },
  primaryBtnText: {
    fontFamily: Fonts.semibold,
    fontSize: 14,
    color: CognitiveCalm.onPrimary,
  },
});
