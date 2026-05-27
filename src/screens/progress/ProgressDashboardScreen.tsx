import React from 'react';
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
import { useStore } from '../../store';
import type { ProgressScreenProps } from '../../navigation/types';
import { useProgressData } from '../../hooks/useProgressData';
import { AccuracyChart } from '../../components/charts/AccuracyChart';

interface StatCardProps {
  label: string;
  value: string | number;
  icon: keyof typeof Ionicons.glyphMap;
  color: string;
}

function StatCard({ label, value, icon, color }: StatCardProps) {
  return (
    <View style={[statStyles.card, { borderTopColor: color }]}>
      <Ionicons name={icon} size={20} color={color} />
      <Text style={statStyles.value}>{value}</Text>
      <Text style={statStyles.label}>{label}</Text>
    </View>
  );
}

const statStyles = StyleSheet.create({
  card: {
    flex: 1,
    backgroundColor: Colors.white,
    borderRadius: 14,
    padding: 14,
    alignItems: 'center',
    gap: 6,
    borderTopWidth: 3,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  value: { fontSize: 22, fontWeight: '900', color: Colors.textPrimary },
  label: { fontSize: 11, color: Colors.textSecondary, textAlign: 'center' },
});

export function ProgressDashboardScreen({ navigation }: ProgressScreenProps<'ProgressDashboard'>) {
  const userId = useStore((s) => s.userId);
  const xpTotal = useStore((s) => s.xpTotal);
  const level = useStore((s) => s.level);
  const streakCurrent = useStore((s) => s.streakCurrent);
  const streakLongest = useStore((s) => s.streakLongest);

  const progress = useProgressData({ userId });

  return (
    <SafeAreaView style={styles.safe}>
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Progress Belajar</Text>
        <Text style={styles.headerSubtitle}>Pantau perkembanganmu dari waktu ke waktu</Text>
      </View>

      <ScrollView
        contentContainerStyle={styles.scroll}
        showsVerticalScrollIndicator={false}
        refreshControl={
          <RefreshControl refreshing={progress.loading} onRefresh={progress.refresh} />
        }
      >
        {/* Gamification Stats */}
        <View style={styles.statsRow}>
          <StatCard label="Level" value={level} icon="ribbon-outline" color={Colors.levelBadge} />
          <StatCard label="Total XP" value={xpTotal.toLocaleString('id-ID')} icon="star-outline" color={Colors.xpGold} />
          <StatCard label="Streak" value={`${streakCurrent}ðŸ”¥`} icon="flame-outline" color={Colors.streakFire} />
        </View>

        {/* Streak Detail */}
        <View style={styles.streakCard}>
          <View style={styles.streakRow}>
            <View style={styles.streakItem}>
              <Text style={styles.streakValue}>{streakCurrent}</Text>
              <Text style={styles.streakLabel}>Streak Saat Ini</Text>
            </View>
            <View style={styles.streakDivider} />
            <View style={styles.streakItem}>
              <Text style={styles.streakValue}>{streakLongest}</Text>
              <Text style={styles.streakLabel}>Streak Terpanjang</Text>
            </View>
          </View>
          <View style={styles.streakWeek}>
            {['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'].map((day, i) => {
              const isActive = i < (streakCurrent % 7);
              return (
                <View key={day} style={styles.streakDayItem}>
                  <View style={[styles.streakDayDot, isActive && styles.streakDayDotActive]} />
                  <Text style={styles.streakDayLabel}>{day}</Text>
                </View>
              );
            })}
          </View>
        </View>

        {/* Session summary */}
        <View style={styles.summaryCard}>
          <Text style={styles.sectionTitle}>Ringkasan Sesi</Text>
          {progress.loading ? (
            <ActivityIndicator color={Colors.primary} />
          ) : (
            <View style={styles.summaryRow}>
              <SummaryStat label="Sesi" value={progress.totalSessions} />
              <SummaryDivider />
              <SummaryStat label="Soal Dijawab" value={progress.totalAnswered} />
              <SummaryDivider />
              <SummaryStat
                label="Akurasi"
                value={
                  progress.totalAnswered > 0
                    ? `${Math.round((progress.totalCorrect / progress.totalAnswered) * 100)}%`
                    : 'â€”'
                }
              />
            </View>
          )}
        </View>

        {/* Accuracy chart */}
        <View style={styles.accuracyCard}>
          <Text style={styles.sectionTitle}>Akurasi per Mata Pelajaran</Text>
          {progress.loading ? (
            <ActivityIndicator color={Colors.primary} />
          ) : (
            <AccuracyChart data={progress.accuracyBySubject} />
          )}
        </View>

        {/* Empty CTA when truly nothing */}
        {!progress.loading && progress.totalSessions === 0 ? (
          <View style={styles.emptyStateCard}>
            <Ionicons name="bar-chart-outline" size={48} color={Colors.gray300} />
            <Text style={styles.emptyTitle}>Mulai sesi pertama</Text>
            <Text style={styles.emptyDesc}>
              Selesaikan satu sesi latihan untuk melihat statistik dan riwayat di sini.
            </Text>
          </View>
        ) : null}

        {/* History Quick Link */}
        <TouchableOpacity
          style={styles.historyLink}
          activeOpacity={0.85}
          onPress={() => navigation.navigate('HistoryList')}
        >
          <View style={styles.historyLinkLeft}>
            <View style={styles.historyIcon}>
              <Ionicons name="time-outline" size={20} color={Colors.primary} />
            </View>
            <View>
              <Text style={styles.historyLinkTitle}>Riwayat Sesi</Text>
              <Text style={styles.historyLinkDesc}>
                {progress.recentSessions.length > 0
                  ? `${progress.recentSessions.length} sesi tersimpan`
                  : 'Lihat semua sesi latihan & tryout'}
              </Text>
            </View>
          </View>
          <Ionicons name="chevron-forward" size={18} color={Colors.textMuted} />
        </TouchableOpacity>
      </ScrollView>
    </SafeAreaView>
  );
}

function SummaryStat({ label, value }: { label: string; value: string | number }) {
  return (
    <View style={styles.summaryItem}>
      <Text style={styles.summaryValue}>{value}</Text>
      <Text style={styles.summaryLabel}>{label}</Text>
    </View>
  );
}

function SummaryDivider() {
  return <View style={styles.summaryDivider} />;
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },

  header: {
    backgroundColor: Colors.white,
    paddingHorizontal: 20,
    paddingTop: 16,
    paddingBottom: 16,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },
  headerTitle: { fontSize: 22, fontWeight: '800', color: Colors.textPrimary, letterSpacing: -0.3 },
  headerSubtitle: { fontSize: 13, color: Colors.textSecondary, marginTop: 2 },

  scroll: { padding: 20, gap: 16, paddingBottom: 40 },

  statsRow: { flexDirection: 'row', gap: 10 },

  streakCard: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 18,
    gap: 16,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  streakRow: { flexDirection: 'row', justifyContent: 'space-around', alignItems: 'center' },
  streakItem: { alignItems: 'center', gap: 4 },
  streakValue: { fontSize: 32, fontWeight: '900', color: Colors.streakFire },
  streakLabel: { fontSize: 12, color: Colors.textSecondary },
  streakDivider: { width: 1, height: 50, backgroundColor: Colors.border },

  streakWeek: { flexDirection: 'row', justifyContent: 'space-around' },
  streakDayItem: { alignItems: 'center', gap: 6 },
  streakDayDot: {
    width: 24,
    height: 24,
    borderRadius: 12,
    backgroundColor: Colors.gray100,
    borderWidth: 1,
    borderColor: Colors.border,
  },
  streakDayDotActive: {
    backgroundColor: Colors.streakFire,
    borderColor: Colors.streakFire,
  },
  streakDayLabel: { fontSize: 10, color: Colors.textSecondary },

  summaryCard: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 18,
    gap: 14,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  summaryRow: { flexDirection: 'row', justifyContent: 'space-around', alignItems: 'center' },
  summaryItem: { alignItems: 'center', gap: 4 },
  summaryValue: { fontSize: 22, fontWeight: '800', color: Colors.textPrimary },
  summaryLabel: { fontSize: 11, color: Colors.textSecondary },
  summaryDivider: { width: 1, height: 36, backgroundColor: Colors.border },

  accuracyCard: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 18,
    gap: 14,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  sectionTitle: { fontSize: 14, fontWeight: '700', color: Colors.textPrimary },

  emptyStateCard: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 32,
    alignItems: 'center',
    gap: 10,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  emptyTitle: { fontSize: 16, fontWeight: '700', color: Colors.textPrimary, marginTop: 4 },
  emptyDesc: { fontSize: 13, color: Colors.textSecondary, textAlign: 'center', lineHeight: 20 },

  historyLink: {
    backgroundColor: Colors.white,
    borderRadius: 14,
    padding: 16,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  historyLinkLeft: { flexDirection: 'row', alignItems: 'center', gap: 14 },
  historyIcon: {
    width: 42,
    height: 42,
    borderRadius: 12,
    backgroundColor: Colors.primary + '12',
    justifyContent: 'center',
    alignItems: 'center',
  },
  historyLinkTitle: { fontSize: 14, fontWeight: '700', color: Colors.textPrimary },
  historyLinkDesc: { fontSize: 12, color: Colors.textSecondary, marginTop: 2 },
});
