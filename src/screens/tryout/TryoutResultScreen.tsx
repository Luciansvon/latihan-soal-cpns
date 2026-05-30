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
import type { TryoutScreenProps } from '../../navigation/types';
import type { PracticeSession, SectionScore } from '../../types/session.types';
import type { SubjectType, TryoutSection, TryoutTemplate } from '../../types/exam.types';
import { SUBJECT_LABELS } from '../../types/exam.types';
import { SessionRepository } from '../../db/repositories/SessionRepository';
import { supabase } from '../../services/supabase';
import { useStore } from '../../store';
import { getScorePercentage, isCPNSPassing } from '../../utils/ScoreCalculator';
import { GamificationService, type AwardResult } from '../../services/GamificationService';
import { XPBar } from '../../components/gamification/XPBar';
import { AchievementUnlockModal } from '../../components/gamification/AchievementUnlockModal';
import { ShareService } from '../../services/ShareService';
import { AppHeader } from '../../components/common/AppHeader';

export function TryoutResultScreen({ route, navigation }: TryoutScreenProps<'TryoutResult'>) {
  const { sessionId } = route.params;
  const isOnline = useStore((s) => s.isOnline);

  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [session, setSession] = useState<PracticeSession | null>(null);
  const [template, setTemplate] = useState<TryoutTemplate | null>(null);
  const [award, setAward] = useState<AwardResult | null>(null);
  const [achievementsOpen, setAchievementsOpen] = useState(false);

  useEffect(() => {
    let cancelled = false;
    (async () => {
      try {
        const [s, aw] = await Promise.all([
          SessionRepository.getSession(sessionId),
          GamificationService.getCachedAward(sessionId),
        ]);
        if (cancelled) return;
        if (!s) {
          setError('Hasil tryout tidak ditemukan.');
          setLoading(false);
          return;
        }
        setSession(s);
        setAward(aw);
        if (aw && aw.unlockedAchievements.length > 0) setAchievementsOpen(true);

        if (s.tryoutTemplateId && isOnline) {
          try {
            const { data } = await supabase
              .from('tryout_templates')
              .select('*')
              .eq('id', s.tryoutTemplateId)
              .maybeSingle();
            if (!cancelled && data) {
              setTemplate(mapTemplate(data));
            }
          } catch {
            // Template lookup is optional decoration; ignore failure.
          }
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
  }, [sessionId, isOnline]);

  if (loading) {
    return (
      <SafeAreaView style={styles.safe} edges={['top']}>
        <AppHeader theme="warm" title="Hasil Tryout" showBack={false} showBell={false} />
        <View style={styles.centerBox}>
          <ActivityIndicator size="large" color={CognitiveCalm.primary} />
          <Text style={styles.loadingText}>Memuat hasil tryout…</Text>
        </View>
      </SafeAreaView>
    );
  }

  if (error || !session) {
    return (
      <SafeAreaView style={styles.safe} edges={['top']}>
        <AppHeader theme="warm" title="Hasil Tryout" showBack={false} showBell={false} />
        <View style={styles.centerBox}>
          <Ionicons name="alert-circle-outline" size={56} color={CognitiveCalm.error} />
          <Text style={styles.errorText}>{error ?? 'Sesi tidak ditemukan.'}</Text>
          <TouchableOpacity
            style={styles.primaryBtn}
            onPress={() => navigation.navigate('TryoutList')}
          >
            <Text style={styles.primaryBtnText}>Daftar Tryout</Text>
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    );
  }

  const sectionScores = (session.sectionScores ?? {}) as Record<SubjectType, SectionScore>;
  const sectionEntries = Object.entries(sectionScores) as Array<[SubjectType, SectionScore]>;

  let overallPassed: boolean;
  if (session.examType === 'CPNS') {
    overallPassed = isCPNSPassing(sectionScores);
  } else {
    overallPassed = session.maxScore > 0 && session.totalScore / session.maxScore >= 0.6;
  }

  const totalCorrect = session.correctCount;
  const totalAnswered = session.answeredCount;
  const totalQuestions = session.totalQuestions;
  const totalWrong = totalAnswered - totalCorrect;
  const totalUnanswered = totalQuestions - totalAnswered;
  const percentage = getScorePercentage(session.totalScore, session.maxScore);
  const durationMin = session.durationSeconds ? Math.floor(session.durationSeconds / 60) : 0;
  const durationSec = session.durationSeconds ? session.durationSeconds % 60 : 0;

  const bannerColor = overallPassed ? Colors.success : CognitiveCalm.error;

  return (
    <SafeAreaView style={styles.safe} edges={['top']}>
      <AppHeader theme="warm" title="Hasil Tryout" showBack={false} showBell={false} />

      <View style={styles.subHeader}>
        <Text style={styles.subHeaderText} numberOfLines={1}>
          {template?.title ?? session.examType}
        </Text>
      </View>

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>
        {/* Pass/Fail banner */}
        <View
          style={[
            styles.resultBanner,
            { backgroundColor: bannerColor + '14', borderColor: bannerColor + '40' },
          ]}
        >
          <Ionicons
            name={overallPassed ? 'checkmark-circle' : 'close-circle'}
            size={32}
            color={bannerColor}
          />
          <View style={styles.resultBannerText}>
            <Text style={[styles.resultTitle, { color: bannerColor }]}>
              {overallPassed ? 'LULUS' : 'BELUM LULUS'}
            </Text>
            <Text style={styles.resultDesc}>
              Skor total: {session.totalScore} dari {session.maxScore} ({percentage}%)
            </Text>
          </View>
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

        {/* Ringkasan */}
        <View style={styles.card}>
          <Text style={styles.cardTitle}>Ringkasan</Text>
          <View style={styles.overallRow}>
            <Stat value={totalCorrect} label="Benar" color={Colors.success} icon="checkmark-circle" />
            <Divider />
            <Stat value={totalWrong} label="Salah" color={CognitiveCalm.error} icon="close-circle" />
            <Divider />
            <Stat
              value={totalUnanswered}
              label="Tidak dijawab"
              color={CognitiveCalm.outline}
              icon="help-circle"
            />
          </View>
          {session.durationSeconds ? (
            <View style={styles.durationRow}>
              <Ionicons
                name="time-outline"
                size={14}
                color={CognitiveCalm.onSurfaceVariant}
              />
              <Text style={styles.durationText}>
                Durasi: {durationMin}m {durationSec}s
              </Text>
            </View>
          ) : null}
        </View>

        {/* Per-section */}
        <View style={styles.card}>
          <Text style={styles.cardTitle}>Hasil per Bagian</Text>
          {sectionEntries.length === 0 ? (
            <Text style={styles.emptyText}>Belum ada data per bagian.</Text>
          ) : (
            sectionEntries.map(([subject, score]) => {
              const tplSection: TryoutSection | undefined = template?.sections.find(
                (s) => s.subject === subject,
              );
              const passing = tplSection?.passingScore;
              const isPass = score.passed;
              const sectionColor = isPass ? Colors.success : CognitiveCalm.error;
              const accentColor = isPass ? CognitiveCalm.tertiary : CognitiveCalm.error;
              const barMax = passing ? passing * 1.5 : Math.max(score.score, score.total * 5);
              const fillPct = Math.min(100, (score.score / barMax) * 100);
              return (
                <View key={subject} style={styles.sectionItem}>
                  <View style={styles.sectionHeader}>
                    <View style={[styles.sectionDot, { backgroundColor: accentColor }]} />
                    <Text style={styles.sectionName}>
                      {SUBJECT_LABELS[subject] ?? subject}
                    </Text>
                    {passing !== undefined ? (
                      <View
                        style={[
                          styles.statusPill,
                          { backgroundColor: sectionColor + '18' },
                        ]}
                      >
                        <Ionicons
                          name={isPass ? 'checkmark-circle' : 'close-circle'}
                          size={12}
                          color={sectionColor}
                        />
                        <Text style={[styles.statusText, { color: sectionColor }]}>
                          {isPass ? 'Lulus' : 'Tidak Lulus'}
                        </Text>
                      </View>
                    ) : null}
                  </View>

                  <View style={styles.sectionScoreRow}>
                    <Text style={styles.sectionScore}>{score.score}</Text>
                    {passing !== undefined ? (
                      <Text style={styles.sectionPassing}>/ {passing} passing</Text>
                    ) : (
                      <Text style={styles.sectionPassing}>
                        {score.correct}/{score.total} benar
                      </Text>
                    )}
                  </View>

                  <View style={styles.barTrack}>
                    <View
                      style={[
                        styles.barFill,
                        { width: `${fillPct}%`, backgroundColor: sectionColor },
                      ]}
                    />
                    {passing ? (
                      <View
                        style={[
                          styles.passingMark,
                          { left: `${Math.min(100, (passing / barMax) * 100)}%` },
                        ]}
                      />
                    ) : null}
                  </View>
                  {passing ? (
                    <Text style={styles.sectionMeta}>
                      {score.correct}/{score.total} soal benar
                    </Text>
                  ) : null}
                </View>
              );
            })
          )}
        </View>

        {/* Actions */}
        <View style={styles.actions}>
          <TouchableOpacity
            style={styles.primaryBtnFull}
            activeOpacity={0.9}
            onPress={() => navigation.navigate('TryoutList')}
          >
            <Ionicons name="list-outline" size={18} color={CognitiveCalm.onPrimary} />
            <Text style={styles.primaryBtnFullText}>Daftar Tryout</Text>
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
  value,
  label,
  color,
  icon,
}: {
  value: number;
  label: string;
  color: string;
  icon: keyof typeof Ionicons.glyphMap;
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

function mapTemplate(row: any): TryoutTemplate {
  return {
    id: row.id,
    examType: row.exam_type,
    title: row.title,
    description: row.description ?? undefined,
    durationMinutes: row.duration_minutes,
    passingScore: row.passing_score ?? undefined,
    sections: (row.sections ?? []).map((s: any) => ({
      subject: s.subject,
      questionCount: s.questionCount ?? s.question_count,
      durationMinutes: s.durationMinutes ?? s.duration_minutes,
      passingScore: s.passingScore ?? s.passing_score,
    })),
    isFree: row.is_free,
    isPublished: row.is_published,
    createdAt: row.created_at,
  };
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

  resultBanner: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 14,
    borderRadius: 18,
    padding: 18,
    borderWidth: 1,
  },
  resultBannerText: { flex: 1, gap: 4 },
  resultTitle: { fontFamily: Fonts.extrabold, fontSize: 22, letterSpacing: 1 },
  resultDesc: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    color: CognitiveCalm.onSurfaceVariant,
    lineHeight: 20,
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

  card: {
    backgroundColor: CognitiveCalm.surfaceContainerLowest,
    borderRadius: 18,
    padding: 18,
    gap: 14,
    borderWidth: 1,
    borderColor: '#FFFFFF',
    shadowColor: CognitiveCalm.shadow,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.04,
    shadowRadius: 8,
    elevation: 1,
  },
  cardTitle: {
    fontFamily: Fonts.bold,
    fontSize: 14,
    color: CognitiveCalm.onSurface,
  },

  overallRow: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    alignItems: 'center',
  },
  statItem: { alignItems: 'center', gap: 4, minWidth: 70 },
  statValue: { fontFamily: Fonts.bold, fontSize: 22, color: CognitiveCalm.onSurface },
  statLabel: {
    fontFamily: Fonts.regular,
    fontSize: 10,
    color: CognitiveCalm.onSurfaceVariant,
    textAlign: 'center',
  },
  divider: { width: 1, height: 40, backgroundColor: CognitiveCalm.outlineVariant + '60' },

  durationRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    justifyContent: 'center',
  },
  durationText: {
    fontFamily: Fonts.regular,
    fontSize: 12,
    color: CognitiveCalm.onSurfaceVariant,
  },

  emptyText: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    color: CognitiveCalm.outline,
    fontStyle: 'italic',
  },

  sectionItem: { gap: 6, paddingVertical: 4 },
  sectionHeader: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  sectionDot: { width: 8, height: 8, borderRadius: 4 },
  sectionName: {
    flex: 1,
    fontFamily: Fonts.bold,
    fontSize: 13,
    color: CognitiveCalm.onSurface,
  },
  statusPill: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    paddingHorizontal: 8,
    paddingVertical: 3,
    borderRadius: 8,
  },
  statusText: { fontFamily: Fonts.bold, fontSize: 11 },

  sectionScoreRow: { flexDirection: 'row', alignItems: 'baseline', gap: 4 },
  sectionScore: { fontFamily: Fonts.bold, fontSize: 22, color: CognitiveCalm.onSurface },
  sectionPassing: {
    fontFamily: Fonts.regular,
    fontSize: 12,
    color: CognitiveCalm.onSurfaceVariant,
  },
  barTrack: {
    height: 8,
    backgroundColor: CognitiveCalm.surfaceContainer,
    borderRadius: 4,
    overflow: 'visible',
    position: 'relative',
  },
  barFill: { height: '100%', borderRadius: 4 },
  passingMark: {
    position: 'absolute',
    top: -3,
    width: 2,
    height: 14,
    backgroundColor: CognitiveCalm.onSurfaceVariant,
    borderRadius: 1,
  },
  sectionMeta: { fontFamily: Fonts.regular, fontSize: 11, color: CognitiveCalm.outline },

  actions: { gap: 12, marginTop: 4 },
  primaryBtn: {
    backgroundColor: CognitiveCalm.primary,
    paddingHorizontal: 20,
    paddingVertical: 12,
    borderRadius: 12,
    alignItems: 'center',
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
