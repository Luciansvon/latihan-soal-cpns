import React, { useMemo, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  ActivityIndicator,
  RefreshControl,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Ionicons } from '@expo/vector-icons';
import { Colors, CognitiveCalm, HyperMinimal, Fonts } from '../../constants/colors';
import type { ProgressScreenProps } from '../../navigation/types';
import type { PracticeSession } from '../../types/session.types';
import type { SessionType, ExamType } from '../../types/exam.types';
import { SUBJECT_LABELS } from '../../types/exam.types';
import { useStore } from '../../store';
import { useProgressData } from '../../hooks/useProgressData';
import { getScorePercentage } from '../../utils/ScoreCalculator';
import { AppHeader } from '../../components/common/AppHeader';

type FilterType = 'ALL' | 'PRACTICE' | 'TRYOUT';

const EXAM_COLORS: Record<ExamType, string> = {
  CPNS: CognitiveCalm.primary,
  TNI: Colors.tni,
  POLRI: Colors.polri,
};

export function HistoryListScreen({ navigation }: ProgressScreenProps<'HistoryList'>) {
  const userId = useStore((s) => s.userId);
  const [filter, setFilter] = useState<FilterType>('ALL');

  const progress = useProgressData({ userId, recentLimit: 200, sessionType: 'ALL' });

  const filtered = useMemo(() => {
    if (filter === 'ALL') return progress.recentSessions;
    return progress.recentSessions.filter((s) => s.sessionType === (filter as SessionType));
  }, [progress.recentSessions, filter]);

  return (
    <SafeAreaView style={styles.safe} edges={['top']}>
      <AppHeader theme="navy" showBack onBackPress={() => navigation.goBack()} />

      <ScrollView
        contentContainerStyle={styles.scroll}
        showsVerticalScrollIndicator={false}
        refreshControl={
          <RefreshControl
            refreshing={progress.loading}
            onRefresh={progress.refresh}
            tintColor={CognitiveCalm.primary}
          />
        }
      >
        <View style={styles.intro}>
          <Text style={styles.title}>Riwayat Sesi</Text>
          <Text style={styles.subtitle}>Semua aktivitas belajarmu</Text>
        </View>

        {/* Filter pills */}
        <View style={styles.filterRow}>
          {(['ALL', 'PRACTICE', 'TRYOUT'] as const).map((key) => (
            <TouchableOpacity
              key={key}
              style={[styles.filterPill, filter === key && styles.filterPillActive]}
              onPress={() => setFilter(key)}
              activeOpacity={0.85}
            >
              <Text
                style={[
                  styles.filterPillText,
                  filter === key && styles.filterPillTextActive,
                ]}
              >
                {key === 'ALL' ? 'Semua' : key === 'PRACTICE' ? 'Latihan' : 'Tryout'}
              </Text>
            </TouchableOpacity>
          ))}
        </View>

        {progress.loading ? (
          <View style={styles.centerBox}>
            <ActivityIndicator size="large" color={CognitiveCalm.primary} />
            <Text style={styles.loadingText}>Memuat riwayat…</Text>
          </View>
        ) : filtered.length === 0 ? (
          <View style={styles.emptyState}>
            <View style={styles.emptyIconBox}>
              <Ionicons name="time-outline" size={40} color={HyperMinimal.outlineVariant} />
            </View>
            <Text style={styles.emptyTitle}>Belum ada riwayat</Text>
            <Text style={styles.emptyDesc}>
              {filter === 'TRYOUT'
                ? 'Kamu belum menyelesaikan tryout apapun.'
                : filter === 'PRACTICE'
                ? 'Kamu belum menyelesaikan sesi latihan apapun.'
                : 'Selesaikan sesi latihan atau tryout untuk melihat riwayat di sini.'}
            </Text>
          </View>
        ) : (
          filtered.map((s) => <SessionRow key={s.id} session={s} navigation={navigation} />)
        )}
      </ScrollView>
    </SafeAreaView>
  );
}

function SessionRow({
  session,
  navigation,
}: {
  session: PracticeSession;
  navigation: ProgressScreenProps<'HistoryList'>['navigation'];
}) {
  const pct = getScorePercentage(session.totalScore, session.maxScore);
  const dateStr = formatDate(session.startedAt);
  const examColor = session.examType ? EXAM_COLORS[session.examType] : CognitiveCalm.primary;
  const isTryout = session.sessionType === 'TRYOUT';

  return (
    <TouchableOpacity
      style={[styles.sessionRow, { borderLeftColor: examColor }]}
      activeOpacity={0.85}
      onPress={() => navigation.navigate('SessionDetail', { sessionId: session.id })}
    >
      <View style={styles.sessionMain}>
        <View style={styles.sessionTopRow}>
          <View style={[styles.typeBadge, { backgroundColor: examColor + '18' }]}>
            <Text style={[styles.typeBadgeText, { color: examColor }]}>
              {isTryout ? 'TRYOUT' : 'LATIHAN'}
            </Text>
          </View>
          {session.subject ? (
            <Text style={styles.subjectText} numberOfLines={1}>
              {SUBJECT_LABELS[session.subject] ?? session.subject}
            </Text>
          ) : null}
        </View>
        <Text style={styles.sessionMeta}>
          {dateStr} · {session.correctCount}/{session.answeredCount} benar
          {session.durationSeconds ? ` · ${Math.round(session.durationSeconds / 60)}m` : ''}
        </Text>
      </View>

      <View style={styles.sessionRight}>
        <Text style={[styles.scoreText, { color: scoreColorFor(pct) }]}>{pct}%</Text>
        <Text style={styles.scoreMeta}>
          {session.totalScore}/{session.maxScore}
        </Text>
      </View>
      <Ionicons name="chevron-forward" size={16} color={HyperMinimal.outlineVariant} />
    </TouchableOpacity>
  );
}

function scoreColorFor(pct: number): string {
  if (pct >= 80) return Colors.success;
  if (pct >= 60) return Colors.warning;
  return CognitiveCalm.error;
}

function formatDate(ts: number): string {
  const d = new Date(ts);
  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];
  return `${d.getDate()} ${months[d.getMonth()]} ${d.getFullYear()}`;
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: HyperMinimal.background },

  scroll: { padding: 20, gap: 12, paddingBottom: 40 },

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

  filterRow: { flexDirection: 'row', gap: 8, marginBottom: 4 },
  filterPill: {
    paddingHorizontal: 16,
    paddingVertical: 8,
    borderRadius: 999,
    backgroundColor: HyperMinimal.surfaceContainer,
    borderWidth: 1,
    borderColor: HyperMinimal.borderSubtle,
  },
  filterPillActive: {
    backgroundColor: CognitiveCalm.primary,
    borderColor: CognitiveCalm.primary,
  },
  filterPillText: {
    fontFamily: Fonts.semibold,
    fontSize: 12,
    color: HyperMinimal.deepNavy,
  },
  filterPillTextActive: { color: CognitiveCalm.onPrimary },

  centerBox: { alignItems: 'center', gap: 8, paddingVertical: 48 },
  loadingText: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    color: HyperMinimal.onSurfaceVariant,
  },

  emptyState: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 60,
    gap: 14,
  },
  emptyIconBox: {
    width: 80,
    height: 80,
    borderRadius: 40,
    backgroundColor: HyperMinimal.surfaceContainer,
    justifyContent: 'center',
    alignItems: 'center',
  },
  emptyTitle: {
    fontFamily: Fonts.bold,
    fontSize: 16,
    color: HyperMinimal.deepNavy,
  },
  emptyDesc: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    color: HyperMinimal.onSurfaceVariant,
    textAlign: 'center',
    lineHeight: 20,
    paddingHorizontal: 20,
  },

  sessionRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
    backgroundColor: '#FFFFFFCC',
    borderRadius: 14,
    padding: 14,
    borderLeftWidth: 4,
    borderWidth: 1,
    borderColor: HyperMinimal.borderSubtle,
    shadowColor: HyperMinimal.deepNavy,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.03,
    shadowRadius: 6,
    elevation: 1,
  },
  sessionMain: { flex: 1, gap: 6 },
  sessionTopRow: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  typeBadge: { paddingHorizontal: 8, paddingVertical: 3, borderRadius: 6 },
  typeBadgeText: { fontFamily: Fonts.bold, fontSize: 10, letterSpacing: 0.5 },
  subjectText: {
    flex: 1,
    fontFamily: Fonts.semibold,
    fontSize: 13,
    color: HyperMinimal.deepNavy,
  },
  sessionMeta: {
    fontFamily: Fonts.regular,
    fontSize: 11,
    color: HyperMinimal.onSurfaceVariant,
  },

  sessionRight: { alignItems: 'flex-end', gap: 2, minWidth: 56 },
  scoreText: { fontFamily: Fonts.extrabold, fontSize: 18 },
  scoreMeta: {
    fontFamily: Fonts.regular,
    fontSize: 10,
    color: HyperMinimal.outline,
  },
});
