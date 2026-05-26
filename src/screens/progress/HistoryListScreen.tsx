import React, { useState, useCallback } from 'react';
import {
  View,
  Text,
  StyleSheet,
  SafeAreaView,
  ScrollView,
  TouchableOpacity,
  ActivityIndicator,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { useFocusEffect } from '@react-navigation/native';
import { Colors } from '../../constants/colors';
import { SUBJECT_LABELS } from '../../types/exam.types';
import { fetchUserSessions, type SessionRow } from '../../services/sessionQueries';
import { getScorePercentage } from '../../utils/ScoreCalculator';
import type { ProgressScreenProps } from '../../navigation/types';

type FilterType = 'ALL' | 'PRACTICE' | 'TRYOUT';

const EXAM_COLORS: Record<string, string> = {
  CPNS: Colors.cpns, TNI: Colors.tni, POLRI: Colors.polri,
};

function formatDate(iso?: string): string {
  if (!iso) return '-';
  const d = new Date(iso);
  return d.toLocaleDateString('id-ID', { day: 'numeric', month: 'short', year: 'numeric' });
}

function SessionCard({ session, onPress }: { session: SessionRow; onPress: () => void }) {
  const isTryout = session.sessionType === 'TRYOUT';
  const pct = getScorePercentage(session.totalScore, session.maxScore);
  const pctColor = pct >= 80 ? Colors.success : pct >= 60 ? Colors.warning : Colors.error;
  const accent = EXAM_COLORS[session.examType ?? ''] ?? Colors.primary;
  const title = isTryout
    ? `Tryout ${session.examType ?? ''}`
    : (session.subject ? SUBJECT_LABELS[session.subject] : 'Latihan');

  return (
    <TouchableOpacity style={styles.sessionCard} activeOpacity={0.85} onPress={onPress}>
      <View style={[styles.sessionIcon, { backgroundColor: accent + '15' }]}>
        <Ionicons name={isTryout ? 'timer-outline' : 'create-outline'} size={20} color={accent} />
      </View>
      <View style={styles.sessionBody}>
        <View style={styles.sessionTitleRow}>
          <Text style={styles.sessionTitle}>{title}</Text>
          <View style={[styles.typeBadge, { backgroundColor: accent + '15' }]}>
            <Text style={[styles.typeBadgeText, { color: accent }]}>{isTryout ? 'TRYOUT' : 'LATIHAN'}</Text>
          </View>
        </View>
        <Text style={styles.sessionMeta}>
          {session.correctCount}/{session.totalQuestions} benar · {formatDate(session.completedAt)}
        </Text>
      </View>
      <View style={styles.sessionScore}>
        <Text style={[styles.sessionPct, { color: pctColor }]}>{pct}%</Text>
        <Ionicons name="chevron-forward" size={14} color={Colors.gray400} />
      </View>
    </TouchableOpacity>
  );
}

export function HistoryListScreen({ navigation }: ProgressScreenProps<'HistoryList'>) {
  const [activeFilter, setActiveFilter] = useState<FilterType>('ALL');
  const [sessions, setSessions] = useState<SessionRow[]>([]);
  const [isLoading, setIsLoading] = useState(true);

  useFocusEffect(
    useCallback(() => {
      let active = true;
      (async () => {
        try {
          const data = await fetchUserSessions();
          if (active) setSessions(data);
        } catch {
          if (active) setSessions([]);
        } finally {
          if (active) setIsLoading(false);
        }
      })();
      return () => { active = false; };
    }, [])
  );

  const filters: Array<{ key: FilterType; label: string }> = [
    { key: 'ALL', label: 'Semua' },
    { key: 'PRACTICE', label: 'Latihan' },
    { key: 'TRYOUT', label: 'Tryout' },
  ];

  const filtered = sessions.filter((s) => activeFilter === 'ALL' || s.sessionType === activeFilter);
  const hasSessions = filtered.length > 0;

  return (
    <SafeAreaView style={styles.safe}>
      {/* Header */}
      <View style={styles.header}>
        <TouchableOpacity style={styles.backBtn} onPress={() => navigation.goBack()}>
          <Ionicons name="arrow-back" size={22} color={Colors.textPrimary} />
        </TouchableOpacity>
        <View style={styles.headerText}>
          <Text style={styles.headerTitle}>Riwayat Sesi</Text>
          <Text style={styles.headerSubtitle}>Semua aktivitas belajarmu</Text>
        </View>
      </View>

      {/* Filter Tabs */}
      <View style={styles.filterRow}>
        {filters.map((f) => (
          <TouchableOpacity
            key={f.key}
            style={[
              styles.filterTab,
              activeFilter === f.key && styles.filterTabActive,
            ]}
            onPress={() => setActiveFilter(f.key)}
            activeOpacity={0.8}
          >
            <Text style={[
              styles.filterTabText,
              activeFilter === f.key && styles.filterTabTextActive,
            ]}>
              {f.label}
            </Text>
          </TouchableOpacity>
        ))}
      </View>

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>
        {isLoading ? (
          <View style={styles.emptyState}>
            <ActivityIndicator size="large" color={Colors.primary} />
          </View>
        ) : hasSessions ? (
          <View style={styles.list}>
            {filtered.map((s) => (
              <SessionCard
                key={s.id}
                session={s}
                onPress={() => navigation.navigate('SessionDetail', { sessionId: s.id })}
              />
            ))}
          </View>
        ) : (
          <View style={styles.emptyState}>
            <View style={styles.emptyIconBox}>
              <Ionicons name="time-outline" size={40} color={Colors.gray300} />
            </View>
            <Text style={styles.emptyTitle}>Belum ada riwayat</Text>
            <Text style={styles.emptyDesc}>
              {activeFilter === 'TRYOUT'
                ? 'Kamu belum menyelesaikan tryout apapun.'
                : activeFilter === 'PRACTICE'
                ? 'Kamu belum menyelesaikan sesi latihan apapun.'
                : 'Selesaikan sesi latihan atau tryout untuk melihat riwayat di sini.'}
            </Text>
            <TouchableOpacity
              style={styles.emptyBtn}
              activeOpacity={0.85}
              onPress={() => navigation.goBack()}
            >
              <Ionicons name="arrow-back-outline" size={16} color={Colors.primary} />
              <Text style={styles.emptyBtnText}>Kembali ke Progress</Text>
            </TouchableOpacity>
          </View>
        )}
      </ScrollView>
    </SafeAreaView>
  );
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
  filterTabActive: {
    backgroundColor: Colors.primary,
    borderColor: Colors.primary,
  },
  filterTabText: {
    fontSize: 13,
    fontWeight: '600',
    color: Colors.textSecondary,
  },
  filterTabTextActive: {
    color: Colors.white,
  },

  scroll: { flexGrow: 1, padding: 20, paddingBottom: 40 },

  list: { gap: 10 },
  sessionCard: {
    backgroundColor: Colors.white,
    borderRadius: 14,
    padding: 14,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  sessionIcon: { width: 42, height: 42, borderRadius: 12, justifyContent: 'center', alignItems: 'center' },
  sessionBody: { flex: 1, gap: 4 },
  sessionTitleRow: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  sessionTitle: { fontSize: 14, fontWeight: '700', color: Colors.textPrimary, flexShrink: 1 },
  typeBadge: { paddingHorizontal: 6, paddingVertical: 2, borderRadius: 5 },
  typeBadgeText: { fontSize: 9, fontWeight: '800', letterSpacing: 0.5 },
  sessionMeta: { fontSize: 12, color: Colors.textSecondary },
  sessionScore: { alignItems: 'center', flexDirection: 'row', gap: 4 },
  sessionPct: { fontSize: 16, fontWeight: '800' },

  emptyState: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 60,
    gap: 14,
  },
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
  emptyBtn: {
    marginTop: 8,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    paddingHorizontal: 20,
    paddingVertical: 11,
    borderRadius: 10,
    borderWidth: 1.5,
    borderColor: Colors.primary,
  },
  emptyBtnText: { fontSize: 13, fontWeight: '700', color: Colors.primary },
});
