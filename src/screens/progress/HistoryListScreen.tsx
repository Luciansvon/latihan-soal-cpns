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
import { Colors } from '../../constants/colors';
import type { ProgressScreenProps } from '../../navigation/types';
import type { PracticeSession } from '../../types/session.types';
import type { SessionType, ExamType } from '../../types/exam.types';
import { SUBJECT_LABELS } from '../../types/exam.types';
import { useStore } from '../../store';
import { useProgressData } from '../../hooks/useProgressData';
import { getScorePercentage } from '../../utils/ScoreCalculator';

type FilterType = 'ALL' | 'PRACTICE' | 'TRYOUT';

const EXAM_COLORS: Record<ExamType, string> = {
  CPNS: Colors.cpns,
  TNI: Colors.tni,
  POLRI: Colors.polri,
};

export function HistoryListScreen({ navigation }: ProgressScreenProps<'HistoryList'>) {
  const userId = useStore((s) => s.userId);
  const [filter, setFilter] = useState<FilterType>('ALL');

  // Fetch unfiltered (we filter client-side for snappy tab switching).
  const progress = useProgressData({ userId, recentLimit: 200, sessionType: 'ALL' });

  const filtered = useMemo(() => {
    if (filter === 'ALL') return progress.recentSessions;
    return progress.recentSessions.filter((s) => s.sessionType === (filter as SessionType));
  }, [progress.recentSessions, filter]);

  return (
    <SafeAreaView style={styles.safe}>
      <View style={styles.header}>
        <TouchableOpacity style={styles.backBtn} onPress={() => navigation.goBack()}>
          <Ionicons name="arrow-back" size={22} color={Colors.textPrimary} />
        </TouchableOpacity>
        <View style={styles.headerText}>
          <Text style={styles.headerTitle}>Riwayat Sesi</Text>
          <Text style={styles.headerSubtitle}>Semua aktivitas belajarmu</Text>
        </View>
      </View>

      <View style={styles.filterRow}>
        {(['ALL', 'PRACTICE', 'TRYOUT'] as const).map((key) => (
          <TouchableOpacity
            key={key}
            style={[styles.filterTab, filter === key && styles.filterTabActive]}
            onPress={() => setFilter(key)}
            activeOpacity={0.8}
          >
            <Text
              style={[
                styles.filterTabText,
                filter === key && styles.filterTabTextActive,
              ]}
            >
              {key === 'ALL' ? 'Semua' : key === 'PRACTICE' ? 'Latihan' : 'Tryout'}
            </Text>
          </TouchableOpacity>
        ))}
      </View>

      <ScrollView
        contentContainerStyle={styles.scroll}
        showsVerticalScrollIndicator={false}
        refreshControl={
          <RefreshControl refreshing={progress.loading} onRefresh={progress.refresh} />
        }
      >
        {progress.loading ? (
          <View style={styles.centerBox}>
            <ActivityIndicator size="large" color={Colors.primary} />
            <Text style={styles.loadingText}>Memuat riwayatâ€¦</Text>
          </View>
        ) : filtered.length === 0 ? (
          <View style={styles.emptyState}>
            <View style={styles.emptyIconBox}>
              <Ionicons name="time-outline" size={40} color={Colors.gray300} />
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
  const examColor = session.examType ? EXAM_COLORS[session.examType] : Colors.primary;
  const isTryout = session.sessionType === 'TRYOUT';

  return (
    <TouchableOpacity
      style={[styles.sessionRow, { borderLeftColor: examColor }]}
      activeOpacity={0.85}
      onPress={() => navigation.navigate('SessionDetail', { sessionId: session.id })}
    >
      <View style={styles.sessionMain}>
        <View style={styles.sessionTopRow}>
          <View style={[styles.typeBadge, { backgroundColor: examColor + '15' }]}>
            <Text style={[styles.typeBadgeText, { color: examColor }]}>
              {isTryout ? 'TRYOUT' : 'LATIHAN'}
            </Text>
          </View>
          {session.subject ? (
            <Text style={styles.subjectText}>
              {SUBJECT_LABELS[session.subject] ?? session.subject}
            </Text>
          ) : null}
        </View>
        <Text style={styles.sessionMeta}>
          {dateStr} Â· {session.correctCount}/{session.answeredCount} benar
          {session.durationSeconds ? ` Â· ${Math.round(session.durationSeconds / 60)}m` : ''}
        </Text>
      </View>

      <View style={styles.sessionRight}>
        <Text style={[styles.scoreText, { color: scoreColorFor(pct) }]}>{pct}%</Text>
        <Text style={styles.scoreMeta}>
          {session.totalScore}/{session.maxScore}
        </Text>
        <Ionicons name="chevron-forward" size={16} color={Colors.gray300} />
      </View>
    </TouchableOpacity>
  );
}

function scoreColorFor(pct: number): string {
  if (pct >= 80) return Colors.success;
  if (pct >= 60) return Colors.warning;
  return Colors.error;
}

function formatDate(ts: number): string {
  const d = new Date(ts);
  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];
  return `${d.getDate()} ${months[d.getMonth()]} ${d.getFullYear()}`;
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },

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
  headerSubtitle: { fontSize: 13, color: Colors.textSecondary },

  filterRow: {
    flexDirection: 'row',
    backgroundColor: Colors.white,
    paddingHorizontal: 20,
    paddingBottom: 14,
    gap: 8,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },
  filterTab: {
    paddingHorizontal: 16,
    paddingVertical: 8,
    borderRadius: 20,
    borderWidth: 1.5,
    borderColor: Colors.border,
    backgroundColor: Colors.white,
  },
  filterTabActive: { backgroundColor: Colors.primary, borderColor: Colors.primary },
  filterTabText: { fontSize: 13, fontWeight: '600', color: Colors.textSecondary },
  filterTabTextActive: { color: Colors.white },

  scroll: { flexGrow: 1, padding: 20, gap: 10, paddingBottom: 40 },

  centerBox: { alignItems: 'center', gap: 8, paddingVertical: 48 },
  loadingText: { fontSize: 13, color: Colors.textSecondary },

  emptyState: { flex: 1, alignItems: 'center', justifyContent: 'center', paddingVertical: 60, gap: 14 },
  emptyIconBox: {
    width: 80,
    height: 80,
    borderRadius: 40,
    backgroundColor: Colors.gray100,
    justifyContent: 'center',
    alignItems: 'center',
  },
  emptyTitle: { fontSize: 16, fontWeight: '700', color: Colors.textPrimary },
  emptyDesc: {
    fontSize: 13,
    color: Colors.textSecondary,
    textAlign: 'center',
    lineHeight: 20,
    paddingHorizontal: 20,
  },

  sessionRow: {
    backgroundColor: Colors.white,
    borderRadius: 12,
    padding: 14,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    borderLeftWidth: 4,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.04,
    shadowRadius: 3,
    elevation: 1,
  },
  sessionMain: { flex: 1, gap: 6 },
  sessionTopRow: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  typeBadge: { paddingHorizontal: 8, paddingVertical: 3, borderRadius: 6 },
  typeBadgeText: { fontSize: 10, fontWeight: '800', letterSpacing: 0.5 },
  subjectText: { fontSize: 13, fontWeight: '600', color: Colors.textPrimary, flexShrink: 1 },
  sessionMeta: { fontSize: 11, color: Colors.textMuted },

  sessionRight: { alignItems: 'flex-end', gap: 2 },
  scoreText: { fontSize: 18, fontWeight: '900' },
  scoreMeta: { fontSize: 10, color: Colors.textMuted },
});
