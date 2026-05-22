import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  SafeAreaView,
  ScrollView,
  TouchableOpacity,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import { useStore } from '../../store';
import type { ProgressScreenProps } from '../../navigation/types';

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
  const { xpTotal, level, streakCurrent, streakLongest } = useStore();
  const hasSessions = false; // Will be populated once sessions are tracked

  return (
    <SafeAreaView style={styles.safe}>
      {/* Header */}
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Progress Belajar</Text>
        <Text style={styles.headerSubtitle}>Pantau perkembanganmu dari waktu ke waktu</Text>
      </View>

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>

        {/* Gamification Stats */}
        <View style={styles.statsRow}>
          <StatCard label="Level" value={level} icon="ribbon-outline" color={Colors.levelBadge} />
          <StatCard label="Total XP" value={xpTotal.toLocaleString('id-ID')} icon="star-outline" color={Colors.xpGold} />
          <StatCard label="Streak" value={`${streakCurrent}🔥`} icon="flame-outline" color={Colors.streakFire} />
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

          {/* Streak Days Placeholder */}
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

        {/* Accuracy Section */}
        {hasSessions ? (
          <View style={styles.accuracyCard}>
            <Text style={styles.sectionTitle}>Akurasi per Mata Pelajaran</Text>
            {['TWK', 'TIU', 'TKP'].map((subject) => (
              <View key={subject} style={styles.accuracyRow}>
                <Text style={styles.accuracySubject}>{subject}</Text>
                <View style={styles.accuracyBar}>
                  <View style={[styles.accuracyFill, { width: '0%', backgroundColor: Colors.primary }]} />
                </View>
                <Text style={styles.accuracyPct}>0%</Text>
              </View>
            ))}
          </View>
        ) : (
          <View style={styles.emptyStateCard}>
            <Ionicons name="bar-chart-outline" size={52} color={Colors.gray300} />
            <Text style={styles.emptyTitle}>Belum ada data</Text>
            <Text style={styles.emptyDesc}>
              Selesaikan sesi latihan pertamamu untuk melihat statistik akurasi dan perkembangan belajarmu.
            </Text>
            <TouchableOpacity style={styles.emptyBtn} activeOpacity={0.85}>
              <Text style={styles.emptyBtnText}>Mulai Latihan</Text>
            </TouchableOpacity>
          </View>
        )}

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
              <Text style={styles.historyLinkDesc}>Lihat semua sesi latihan & tryout</Text>
            </View>
          </View>
          <Ionicons name="chevron-forward" size={18} color={Colors.textMuted} />
        </TouchableOpacity>

      </ScrollView>
    </SafeAreaView>
  );
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

  streakWeek: {
    flexDirection: 'row',
    justifyContent: 'space-around',
  },
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
  accuracyRow: { flexDirection: 'row', alignItems: 'center', gap: 12 },
  accuracySubject: { fontSize: 12, fontWeight: '700', color: Colors.textSecondary, width: 40 },
  accuracyBar: {
    flex: 1,
    height: 8,
    backgroundColor: Colors.gray100,
    borderRadius: 4,
    overflow: 'hidden',
  },
  accuracyFill: { height: '100%', borderRadius: 4 },
  accuracyPct: { fontSize: 12, fontWeight: '600', color: Colors.textSecondary, width: 34, textAlign: 'right' },

  emptyStateCard: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 32,
    alignItems: 'center',
    gap: 12,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  emptyTitle: { fontSize: 16, fontWeight: '700', color: Colors.textPrimary, marginTop: 4 },
  emptyDesc: {
    fontSize: 13,
    color: Colors.textSecondary,
    textAlign: 'center',
    lineHeight: 20,
  },
  emptyBtn: {
    marginTop: 8,
    backgroundColor: Colors.primary,
    paddingHorizontal: 24,
    paddingVertical: 12,
    borderRadius: 10,
  },
  emptyBtnText: { fontSize: 14, fontWeight: '700', color: Colors.white },

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
