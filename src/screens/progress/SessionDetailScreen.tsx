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
import type { ProgressScreenProps } from '../../navigation/types';

export function SessionDetailScreen({ route, navigation }: ProgressScreenProps<'SessionDetail'>) {
  const { sessionId } = route.params;

  // Placeholder session data
  const placeholderData = {
    date: '22 Mei 2026',
    type: 'Latihan',
    subject: 'TWK',
    score: 75,
    correct: 8,
    total: 10,
    duration: '12 menit',
    xpEarned: 40,
  };

  const scoreColor =
    placeholderData.score >= 80
      ? Colors.success
      : placeholderData.score >= 60
      ? Colors.warning
      : Colors.error;

  return (
    <SafeAreaView style={styles.safe}>
      {/* Header */}
      <View style={styles.header}>
        <TouchableOpacity style={styles.backBtn} onPress={() => navigation.goBack()}>
          <Ionicons name="arrow-back" size={22} color={Colors.textPrimary} />
        </TouchableOpacity>
        <View style={styles.headerText}>
          <Text style={styles.headerTitle}>Detail Sesi</Text>
          <Text style={styles.sessionId}>ID: {sessionId}</Text>
        </View>
      </View>

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>

        {/* Session Meta */}
        <View style={styles.metaCard}>
          <View style={styles.metaRow}>
            <View style={styles.metaItem}>
              <Ionicons name="calendar-outline" size={16} color={Colors.textSecondary} />
              <Text style={styles.metaText}>{placeholderData.date}</Text>
            </View>
            <View style={styles.metaItem}>
              <Ionicons name="time-outline" size={16} color={Colors.textSecondary} />
              <Text style={styles.metaText}>{placeholderData.duration}</Text>
            </View>
            <View style={[styles.metaBadge, { backgroundColor: Colors.primary + '15' }]}>
              <Text style={[styles.metaBadgeText, { color: Colors.primary }]}>
                {placeholderData.type}
              </Text>
            </View>
          </View>
          <View style={styles.subjectRow}>
            <Ionicons name="book-outline" size={14} color={Colors.textMuted} />
            <Text style={styles.subjectText}>{placeholderData.subject}</Text>
          </View>
        </View>

        {/* Score Display */}
        <View style={styles.scoreCard}>
          <View style={[styles.scoreCircle, { borderColor: scoreColor }]}>
            <Text style={[styles.scoreNumber, { color: scoreColor }]}>{placeholderData.score}</Text>
            <Text style={styles.scoreLabel}>Skor</Text>
          </View>
          <View style={styles.scoreStats}>
            <View style={styles.scoreStat}>
              <Ionicons name="checkmark-circle" size={18} color={Colors.success} />
              <Text style={styles.scoreStatLabel}>Benar</Text>
              <Text style={styles.scoreStatValue}>{placeholderData.correct}</Text>
            </View>
            <View style={styles.scoreStatDivider} />
            <View style={styles.scoreStat}>
              <Ionicons name="close-circle" size={18} color={Colors.error} />
              <Text style={styles.scoreStatLabel}>Salah</Text>
              <Text style={styles.scoreStatValue}>{placeholderData.total - placeholderData.correct}</Text>
            </View>
            <View style={styles.scoreStatDivider} />
            <View style={styles.scoreStat}>
              <Ionicons name="documents-outline" size={18} color={Colors.textSecondary} />
              <Text style={styles.scoreStatLabel}>Total</Text>
              <Text style={styles.scoreStatValue}>{placeholderData.total}</Text>
            </View>
          </View>
        </View>

        {/* XP Earned */}
        <View style={styles.xpRow}>
          <Ionicons name="star" size={16} color={Colors.xpGold} />
          <Text style={styles.xpText}>+{placeholderData.xpEarned} XP dari sesi ini</Text>
        </View>

        {/* Question Review Placeholder */}
        <View style={styles.reviewCard}>
          <Text style={styles.reviewTitle}>Tinjauan Soal</Text>
          <Text style={styles.reviewDesc}>
            Tinjauan detail setiap soal akan tersedia di sini setelah implementasi penuh.
          </Text>

          <View style={styles.reviewGrid}>
            {Array.from({ length: placeholderData.total }).map((_, i) => {
              const isCorrect = i < placeholderData.correct;
              return (
                <View
                  key={i}
                  style={[
                    styles.reviewItem,
                    { backgroundColor: isCorrect ? Colors.success + '15' : Colors.error + '12' },
                  ]}
                >
                  <Text style={[
                    styles.reviewItemNum,
                    { color: isCorrect ? Colors.success : Colors.error },
                  ]}>
                    {i + 1}
                  </Text>
                  <Ionicons
                    name={isCorrect ? 'checkmark' : 'close'}
                    size={12}
                    color={isCorrect ? Colors.success : Colors.error}
                  />
                </View>
              );
            })}
          </View>
        </View>

        {/* Back Button */}
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
  sessionId: { fontSize: 11, color: Colors.textMuted },

  scroll: { padding: 20, gap: 16, paddingBottom: 40 },

  metaCard: {
    backgroundColor: Colors.white,
    borderRadius: 14,
    padding: 16,
    gap: 10,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  metaRow: { flexDirection: 'row', alignItems: 'center', gap: 12 },
  metaItem: { flexDirection: 'row', alignItems: 'center', gap: 4 },
  metaText: { fontSize: 13, color: Colors.textSecondary },
  metaBadge: {
    marginLeft: 'auto',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 8,
  },
  metaBadgeText: { fontSize: 12, fontWeight: '700' },
  subjectRow: { flexDirection: 'row', alignItems: 'center', gap: 6 },
  subjectText: { fontSize: 13, fontWeight: '600', color: Colors.textMuted },

  scoreCard: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 24,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 24,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.06,
    shadowRadius: 6,
    elevation: 2,
  },
  scoreCircle: {
    width: 90,
    height: 90,
    borderRadius: 45,
    borderWidth: 5,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: Colors.bgSecondary,
  },
  scoreNumber: { fontSize: 28, fontWeight: '900' },
  scoreLabel: { fontSize: 11, color: Colors.textSecondary, marginTop: -2 },
  scoreStats: { flex: 1, flexDirection: 'row', justifyContent: 'space-around', alignItems: 'center' },
  scoreStat: { alignItems: 'center', gap: 4 },
  scoreStatLabel: { fontSize: 11, color: Colors.textSecondary },
  scoreStatValue: { fontSize: 20, fontWeight: '800', color: Colors.textPrimary },
  scoreStatDivider: { width: 1, height: 40, backgroundColor: Colors.border },

  xpRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    backgroundColor: '#FFFBEB',
    borderRadius: 10,
    padding: 12,
    borderWidth: 1,
    borderColor: '#FDE68A',
  },
  xpText: { fontSize: 13, fontWeight: '600', color: Colors.gray700 },

  reviewCard: {
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
  reviewTitle: { fontSize: 14, fontWeight: '700', color: Colors.textPrimary },
  reviewDesc: { fontSize: 12, color: Colors.textSecondary },
  reviewGrid: { flexDirection: 'row', flexWrap: 'wrap', gap: 8 },
  reviewItem: {
    width: 44,
    height: 44,
    borderRadius: 10,
    justifyContent: 'center',
    alignItems: 'center',
    gap: 2,
  },
  reviewItemNum: { fontSize: 12, fontWeight: '700' },

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
});
