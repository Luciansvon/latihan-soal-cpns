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
import { Colors, CognitiveCalm, Fonts } from '../../constants/colors';
import type { LatihanScreenProps } from '../../navigation/types';
import type { PracticeSession, UserAnswer } from '../../types/session.types';
import { SessionRepository, AnswerRepository } from '../../db/repositories/SessionRepository';
import { GamificationService, type AwardResult } from '../../services/GamificationService';
import { XPBar } from '../../components/gamification/XPBar';
import { AchievementUnlockModal } from '../../components/gamification/AchievementUnlockModal';
import { ShareService } from '../../services/ShareService';
import { getScorePercentage } from '../../utils/ScoreCalculator';
import { useProgressData } from '../../hooks/useProgressData';
import { recommendSubjects } from '../../utils/recommendation';
import {
  dominantVark,
  getStrategyTip,
  VARK_LABELS,
} from '../../constants/learningStrategyMap';
import { useStore } from '../../store';
import { SUBJECT_LABELS } from '../../types/exam.types';
import { AppHeader } from '../../components/common/AppHeader';

export function SessionResultScreen({ route, navigation }: LatihanScreenProps<'SessionResult'>) {
  const { sessionId } = route.params;
  const userId = useStore((s) => s.userId);
  const userProfile = useStore((s) => s.profile);

  const progress = useProgressData({ userId, recentLimit: 50 });

  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [session, setSession] = useState<PracticeSession | null>(null);
  const [answers, setAnswers] = useState<UserAnswer[]>([]);
  const [award, setAward] = useState<AwardResult | null>(null);
  const [achievementsOpen, setAchievementsOpen] = useState(false);

  useEffect(() => {
    let cancelled = false;
    (async () => {
      try {
        const [s, a, aw] = await Promise.all([
          SessionRepository.getSession(sessionId),
          AnswerRepository.getAnswersBySession(sessionId),
          GamificationService.getCachedAward(sessionId),
        ]);
        if (cancelled) return;
        if (!s) {
          setError('Sesi tidak ditemukan.');
        } else {
          setSession(s);
          setAnswers(a);
          setAward(aw);
          if (aw && aw.unlockedAchievements.length > 0) setAchievementsOpen(true);
        }
        setLoading(false);
      } catch (e: any) {
        if (cancelled) return;
        setError(`Gagal memuat hasil: ${e?.message ?? 'unknown error'}`);
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
        <AppHeader theme="warm" title="Hasil Latihan" showBack={false} showBell={false} />
        <View style={styles.centerBox}>
          <ActivityIndicator size="large" color={CognitiveCalm.primary} />
          <Text style={styles.loadingText}>Memuat hasil…</Text>
        </View>
      </SafeAreaView>
    );
  }

  if (error || !session) {
    return (
      <SafeAreaView style={styles.safe} edges={['top']}>
        <AppHeader theme="warm" title="Hasil Latihan" showBack={false} showBell={false} />
        <View style={styles.centerBox}>
          <Ionicons name="alert-circle-outline" size={56} color={CognitiveCalm.error} />
          <Text style={styles.errorText}>{error ?? 'Sesi tidak ditemukan.'}</Text>
          <TouchableOpacity
            style={styles.primaryBtn}
            onPress={() => navigation.navigate('LatihanHome')}
          >
            <Text style={styles.primaryBtnText}>Kembali ke Latihan</Text>
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    );
  }

  const correct = session.correctCount;
  const total = session.totalQuestions;
  const wrong = answers.length - correct;
  const unanswered = total - answers.length;
  const percentage = getScorePercentage(session.totalScore, session.maxScore);
  const durationMin = session.durationSeconds ? Math.floor(session.durationSeconds / 60) : 0;
  const durationSec = session.durationSeconds ? session.durationSeconds % 60 : 0;

  const scoreColor =
    percentage >= 80
      ? Colors.success
      : percentage >= 60
      ? Colors.warning
      : CognitiveCalm.error;

  return (
    <SafeAreaView style={styles.safe} edges={['top']}>
      <AppHeader theme="warm" title="Hasil Latihan" showBack={false} showBell={false} />

      <View style={styles.subHeader}>
        <Text style={styles.subHeaderText}>
          {session.examType} · {session.subject ?? '-'}
        </Text>
      </View>

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>
        {/* Score hero */}
        <View style={styles.scoreCard}>
          <View style={[styles.scoreCircle, { borderColor: scoreColor }]}>
            <Text style={[styles.scoreNumber, { color: scoreColor }]}>{session.totalScore}</Text>
            <Text style={styles.scoreLabel}>dari {session.maxScore}</Text>
          </View>
          <Text style={[styles.percentageText, { color: scoreColor }]}>{percentage}%</Text>

          <View style={styles.statsRow}>
            <Stat icon="checkmark-circle" color={Colors.success} value={correct} label="Benar" />
            <Divider />
            <Stat icon="close-circle" color={CognitiveCalm.error} value={wrong} label="Salah" />
            <Divider />
            <Stat
              icon="help-circle"
              color={CognitiveCalm.outline}
              value={unanswered}
              label="Lewati"
            />
          </View>

          {session.durationSeconds ? (
            <View style={styles.durationRow}>
              <Ionicons name="time-outline" size={14} color={CognitiveCalm.onSurfaceVariant} />
              <Text style={styles.durationText}>
                Durasi: {durationMin}m {durationSec}s
              </Text>
            </View>
          ) : null}
        </View>

        {/* XP awarded */}
        {award ? (
          <View style={styles.awardCard}>
            <View style={styles.awardHeader}>
              <Ionicons name="star" size={20} color={Colors.xpGold} />
              <Text style={styles.awardText}>
                +{award.xpEarned} XP{award.leveledUp ? ' · Naik level!' : ''}
              </Text>
            </View>
            <XPBar xpTotal={award.newXpTotal} level={award.newLevel} />
          </View>
        ) : null}

        {/* Performance message */}
        <View
          style={[
            styles.messageCard,
            { backgroundColor: scoreColor + '14', borderColor: scoreColor + '40' },
          ]}
        >
          <Ionicons
            name={
              percentage >= 80
                ? 'trophy-outline'
                : percentage >= 60
                ? 'thumbs-up-outline'
                : 'refresh-outline'
            }
            size={20}
            color={scoreColor}
          />
          <Text style={[styles.messageText, { color: scoreColor }]}>
            {percentage >= 80
              ? 'Luar biasa! Pertahankan performa ini.'
              : percentage >= 60
              ? 'Cukup baik. Masih ada ruang untuk berkembang.'
              : 'Jangan menyerah. Coba lagi untuk hasil yang lebih baik.'}
          </Text>
        </View>

        {/* Adaptive recommendations */}
        {(() => {
          if (progress.loading) return null;
          const recs = recommendSubjects(progress.accuracyBySubject, 3);
          if (recs.length === 0) return null;
          const vark = dominantVark(userProfile?.learningStyle);
          const top = recs[0];
          return (
            <View style={styles.recoCard}>
              <View style={styles.recoHeader}>
                <Ionicons name="bulb" size={18} color={CognitiveCalm.tertiary} />
                <Text style={styles.recoTitle}>Saran Belajar Berikutnya</Text>
              </View>
              <Text style={styles.recoBody}>
                Fokus ke{' '}
                <Text style={styles.recoEm}>
                  {SUBJECT_LABELS[top.subject] ?? top.subject}
                </Text>
                {' '}— {top.reason.toLowerCase()}.
              </Text>
              <View style={styles.recoTip}>
                <Ionicons
                  name="school-outline"
                  size={14}
                  color={CognitiveCalm.onSurfaceVariant}
                />
                <Text style={styles.recoTipText}>
                  Profil <Text style={styles.recoEm}>{VARK_LABELS[vark]}</Text>:{' '}
                  {getStrategyTip(top.subject, vark)}
                </Text>
              </View>
              {recs.length > 1 ? (
                <Text style={styles.recoMeta}>
                  Subject lain yang perlu perhatian:{' '}
                  {recs
                    .slice(1)
                    .map((r) => `${SUBJECT_LABELS[r.subject] ?? r.subject} (${r.pct}%)`)
                    .join(', ')}
                </Text>
              ) : null}
            </View>
          );
        })()}

        {/* Per-question dots */}
        <View style={styles.reviewSection}>
          <Text style={styles.reviewTitle}>Ringkasan Jawaban</Text>
          <View style={styles.reviewGrid}>
            {Array.from({ length: total }).map((_, i) => {
              const a = answers[i];
              const color = !a
                ? CognitiveCalm.outlineVariant
                : a.isCorrect
                ? Colors.success
                : CognitiveCalm.error;
              return (
                <View key={i} style={[styles.reviewDot, { backgroundColor: color }]}>
                  <Text style={styles.reviewDotText}>{i + 1}</Text>
                </View>
              );
            })}
          </View>
          <Text style={styles.reviewLegend}>
            Tip: kembali ke menu Latihan untuk mengulang atau pilih kategori lain.
          </Text>
        </View>

        {/* Actions */}
        <View style={styles.actions}>
          <TouchableOpacity
            style={styles.primaryBtnFull}
            activeOpacity={0.9}
            onPress={() => navigation.navigate('LatihanHome')}
          >
            <Ionicons name="refresh-outline" size={18} color={CognitiveCalm.onPrimary} />
            <Text style={styles.primaryBtnFullText}>Latihan Lagi</Text>
          </TouchableOpacity>
          <TouchableOpacity
            style={styles.secondaryBtnFull}
            activeOpacity={0.85}
            onPress={() =>
              ShareService.shareToWhatsApp(ShareService.buildSessionMessage(session))
            }
          >
            <Ionicons name="logo-whatsapp" size={18} color={CognitiveCalm.primary} />
            <Text style={styles.secondaryBtnText}>Bagikan ke WhatsApp</Text>
          </TouchableOpacity>
        </View>
      </ScrollView>

      {award ? (
        <AchievementUnlockModal
          achievements={achievementsOpen ? award.unlockedAchievements : []}
          onClose={() => setAchievementsOpen(false)}
        />
      ) : null}
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
    <View style={styles.statItem}>
      <Ionicons name={icon} size={20} color={color} />
      <Text style={styles.statValue}>{value}</Text>
      <Text style={styles.statLabel}>{label}</Text>
    </View>
  );
}

function Divider() {
  return <View style={styles.divider} />;
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: CognitiveCalm.surface },

  centerBox: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
    gap: 12,
  },
  loadingText: {
    fontFamily: Fonts.regular,
    fontSize: 14,
    color: CognitiveCalm.onSurfaceVariant,
    marginTop: 6,
  },
  errorText: {
    fontFamily: Fonts.regular,
    fontSize: 14,
    color: CognitiveCalm.onSurfaceVariant,
    textAlign: 'center',
    lineHeight: 20,
  },

  subHeader: {
    paddingHorizontal: 20,
    paddingBottom: 8,
    backgroundColor: CognitiveCalm.surface,
    alignItems: 'center',
  },
  subHeaderText: {
    fontFamily: Fonts.semibold,
    fontSize: 12,
    color: CognitiveCalm.onSurfaceVariant,
    letterSpacing: 0.5,
  },

  scroll: { padding: 20, gap: 16, paddingBottom: 40 },

  scoreCard: {
    backgroundColor: CognitiveCalm.surfaceContainerLowest,
    borderRadius: 24,
    padding: 24,
    alignItems: 'center',
    gap: 16,
    borderWidth: 1,
    borderColor: '#FFFFFF',
    shadowColor: CognitiveCalm.shadow,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.06,
    shadowRadius: 16,
    elevation: 3,
  },
  scoreCircle: {
    width: 124,
    height: 124,
    borderRadius: 62,
    borderWidth: 6,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: CognitiveCalm.surface,
  },
  scoreNumber: { fontFamily: Fonts.extrabold, fontSize: 38, letterSpacing: -1 },
  scoreLabel: {
    fontFamily: Fonts.regular,
    fontSize: 11,
    color: CognitiveCalm.onSurfaceVariant,
    marginTop: -2,
  },
  percentageText: { fontFamily: Fonts.extrabold, fontSize: 28 },

  statsRow: {
    width: '100%',
    flexDirection: 'row',
    justifyContent: 'space-around',
    alignItems: 'center',
  },
  statItem: { alignItems: 'center', gap: 4, minWidth: 60 },
  statValue: {
    fontFamily: Fonts.bold,
    fontSize: 22,
    color: CognitiveCalm.onSurface,
  },
  statLabel: {
    fontFamily: Fonts.regular,
    fontSize: 11,
    color: CognitiveCalm.onSurfaceVariant,
  },
  divider: { width: 1, height: 40, backgroundColor: CognitiveCalm.outlineVariant + '60' },

  durationRow: { flexDirection: 'row', alignItems: 'center', gap: 4 },
  durationText: {
    fontFamily: Fonts.regular,
    fontSize: 12,
    color: CognitiveCalm.onSurfaceVariant,
  },

  awardCard: {
    backgroundColor: '#FFFBEB',
    borderRadius: 16,
    padding: 14,
    gap: 10,
    borderWidth: 1,
    borderColor: '#FDE68A',
  },
  awardHeader: { flexDirection: 'row', alignItems: 'center', gap: 6 },
  awardText: { fontFamily: Fonts.extrabold, fontSize: 14, color: Colors.xpGold },

  recoCard: {
    backgroundColor: CognitiveCalm.tertiary + '12',
    borderRadius: 16,
    padding: 14,
    gap: 10,
    borderWidth: 1,
    borderColor: CognitiveCalm.tertiary + '30',
  },
  recoHeader: { flexDirection: 'row', alignItems: 'center', gap: 6 },
  recoTitle: {
    fontFamily: Fonts.bold,
    fontSize: 13,
    color: CognitiveCalm.tertiary,
  },
  recoBody: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    lineHeight: 19,
    color: CognitiveCalm.onSurface,
  },
  recoEm: { fontFamily: Fonts.bold },
  recoTip: {
    flexDirection: 'row',
    gap: 6,
    backgroundColor: CognitiveCalm.surfaceContainerLowest,
    padding: 10,
    borderRadius: 10,
    alignItems: 'flex-start',
  },
  recoTipText: {
    flex: 1,
    fontFamily: Fonts.regular,
    fontSize: 12,
    color: CognitiveCalm.onSurfaceVariant,
    lineHeight: 18,
  },
  recoMeta: {
    fontFamily: Fonts.regular,
    fontSize: 11,
    color: CognitiveCalm.outline,
    fontStyle: 'italic',
  },

  messageCard: {
    borderRadius: 14,
    padding: 14,
    flexDirection: 'row',
    gap: 10,
    alignItems: 'flex-start',
    borderWidth: 1,
  },
  messageText: {
    flex: 1,
    fontFamily: Fonts.medium,
    fontSize: 13,
    lineHeight: 20,
  },

  reviewSection: {
    backgroundColor: CognitiveCalm.surfaceContainerLowest,
    borderRadius: 18,
    padding: 18,
    gap: 12,
    borderWidth: 1,
    borderColor: '#FFFFFF',
    shadowColor: CognitiveCalm.shadow,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.04,
    shadowRadius: 8,
    elevation: 1,
  },
  reviewTitle: {
    fontFamily: Fonts.bold,
    fontSize: 14,
    color: CognitiveCalm.onSurface,
  },
  reviewGrid: { flexDirection: 'row', flexWrap: 'wrap', gap: 8 },
  reviewDot: {
    width: 32,
    height: 32,
    borderRadius: 16,
    justifyContent: 'center',
    alignItems: 'center',
  },
  reviewDotText: {
    fontFamily: Fonts.bold,
    fontSize: 11,
    color: CognitiveCalm.onPrimary,
  },
  reviewLegend: {
    fontFamily: Fonts.regular,
    fontSize: 11,
    color: CognitiveCalm.outline,
    lineHeight: 16,
  },

  actions: { gap: 12, marginTop: 4 },
  primaryBtn: {
    backgroundColor: CognitiveCalm.primary,
    paddingHorizontal: 20,
    paddingVertical: 12,
    borderRadius: 12,
  },
  primaryBtnText: {
    fontFamily: Fonts.semibold,
    fontSize: 14,
    color: CognitiveCalm.onPrimary,
  },
  primaryBtnFull: {
    backgroundColor: CognitiveCalm.primary,
    borderRadius: 16,
    paddingVertical: 16,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 8,
    shadowColor: CognitiveCalm.primary,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.25,
    shadowRadius: 10,
    elevation: 3,
  },
  primaryBtnFullText: {
    fontFamily: Fonts.bold,
    fontSize: 16,
    color: CognitiveCalm.onPrimary,
  },
  secondaryBtnFull: {
    borderRadius: 16,
    paddingVertical: 16,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 8,
    borderWidth: 1.5,
    borderColor: CognitiveCalm.primary,
    backgroundColor: CognitiveCalm.surfaceContainerLowest,
  },
  secondaryBtnText: {
    fontFamily: Fonts.bold,
    fontSize: 16,
    color: CognitiveCalm.primary,
  },
});
