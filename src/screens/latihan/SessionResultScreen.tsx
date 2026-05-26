import React from 'react';
import {
  View, Text, StyleSheet, SafeAreaView, ScrollView, TouchableOpacity,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import { EXAM_CONFIGS, SUBJECT_LABELS } from '../../types/exam.types';
import { getScorePercentage } from '../../utils/ScoreCalculator';
import type { LatihanScreenProps } from '../../navigation/types';

const EXAM_COLORS: Record<string, string> = {
  CPNS: Colors.cpns, TNI: Colors.tni, POLRI: Colors.polri,
};

export function SessionResultScreen({ route, navigation }: LatihanScreenProps<'SessionResult'>) {
  const { score, maxScore, correct, total, examType, subject, xpEarned } = route.params;

  const percentage = getScorePercentage(score, maxScore);
  const accentColor = EXAM_COLORS[examType] ?? Colors.primary;

  const scoreColor =
    percentage >= 80 ? Colors.success
    : percentage >= 60 ? Colors.warning
    : Colors.error;

  const scoreLabel =
    percentage >= 80 ? 'Luar Biasa! 🎉'
    : percentage >= 60 ? 'Bagus! Terus berlatih 💪'
    : 'Jangan menyerah! Coba lagi 🔥';

  return (
    <SafeAreaView style={styles.safe}>
      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>

        {/* Hero card */}
        <View style={[styles.heroCard, { borderTopColor: accentColor }]}>
          <View style={[styles.examBadge, { backgroundColor: accentColor }]}>
            <Text style={styles.examBadgeText}>{EXAM_CONFIGS[examType].label} · {SUBJECT_LABELS[subject]}</Text>
          </View>

          <View style={[styles.scoreCircle, { borderColor: scoreColor }]}>
            <Text style={[styles.scoreNumber, { color: scoreColor }]}>{score}</Text>
            <Text style={styles.scoreMaxText}>dari {maxScore}</Text>
          </View>

          <Text style={styles.scoreLabel}>{scoreLabel}</Text>
          <Text style={[styles.percentageText, { color: scoreColor }]}>{percentage}%</Text>
        </View>

        {/* Stats row */}
        <View style={styles.statsRow}>
          <StatItem icon="checkmark-circle" color={Colors.success} value={correct} label="Benar" />
          <View style={styles.statDivider} />
          <StatItem icon="close-circle" color={Colors.error} value={total - correct} label="Salah" />
          <View style={styles.statDivider} />
          <StatItem icon="help-circle" color={Colors.gray400} value={total} label="Total" />
        </View>

        {/* XP earned */}
        <View style={styles.xpCard}>
          <Ionicons name="star" size={20} color={Colors.xpGold} />
          <Text style={styles.xpText}>+{xpEarned} XP diperoleh dari sesi ini</Text>
        </View>

        {/* Actions */}
        <View style={styles.actions}>
          <TouchableOpacity
            style={[styles.primaryBtn, { backgroundColor: accentColor }]}
            onPress={() => navigation.popToTop()}
            activeOpacity={0.85}
          >
            <Ionicons name="refresh" size={18} color={Colors.white} />
            <Text style={styles.primaryBtnText}>Latihan Lagi</Text>
          </TouchableOpacity>

          <TouchableOpacity
            style={styles.secondaryBtn}
            onPress={() => navigation.navigate('LatihanHome')}
            activeOpacity={0.8}
          >
            <Text style={styles.secondaryBtnText}>Pilih Kategori Lain</Text>
          </TouchableOpacity>
        </View>

      </ScrollView>
    </SafeAreaView>
  );
}

function StatItem({
  icon, color, value, label,
}: { icon: any; color: string; value: number; label: string }) {
  return (
    <View style={styles.statItem}>
      <Ionicons name={icon} size={22} color={color} />
      <Text style={styles.statValue}>{value}</Text>
      <Text style={styles.statLabel}>{label}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },
  scroll: { padding: 16, gap: 16, paddingBottom: 40 },

  heroCard: {
    backgroundColor: Colors.white,
    borderRadius: 20,
    padding: 28,
    alignItems: 'center',
    gap: 12,
    borderTopWidth: 4,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.07,
    shadowRadius: 10,
    elevation: 3,
  },
  examBadge: {
    paddingHorizontal: 12,
    paddingVertical: 4,
    borderRadius: 8,
  },
  examBadgeText: { fontSize: 11, fontWeight: '700', color: Colors.white },
  scoreCircle: {
    width: 120,
    height: 120,
    borderRadius: 60,
    borderWidth: 5,
    justifyContent: 'center',
    alignItems: 'center',
    marginVertical: 8,
  },
  scoreNumber: { fontSize: 36, fontWeight: '800' },
  scoreMaxText: { fontSize: 12, color: Colors.textMuted, fontWeight: '500' },
  scoreLabel: { fontSize: 18, fontWeight: '700', color: Colors.textPrimary },
  percentageText: { fontSize: 14, fontWeight: '600' },

  statsRow: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 20,
    flexDirection: 'row',
    alignItems: 'center',
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  statItem: { flex: 1, alignItems: 'center', gap: 4 },
  statDivider: { width: 1, height: 40, backgroundColor: Colors.border },
  statValue: { fontSize: 24, fontWeight: '800', color: Colors.textPrimary },
  statLabel: { fontSize: 12, color: Colors.textSecondary, fontWeight: '500' },

  xpCard: {
    backgroundColor: Colors.xpGold + '15',
    borderRadius: 12,
    borderWidth: 1,
    borderColor: Colors.xpGold + '50',
    padding: 14,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
  },
  xpText: { fontSize: 14, fontWeight: '600', color: Colors.gray800 },

  actions: { gap: 10 },
  primaryBtn: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 8,
    paddingVertical: 15,
    borderRadius: 13,
  },
  primaryBtnText: { color: Colors.white, fontWeight: '700', fontSize: 15 },
  secondaryBtn: {
    alignItems: 'center',
    paddingVertical: 14,
    borderRadius: 13,
    borderWidth: 1.5,
    borderColor: Colors.border,
    backgroundColor: Colors.white,
  },
  secondaryBtnText: { fontSize: 14, fontWeight: '600', color: Colors.textSecondary },
});
