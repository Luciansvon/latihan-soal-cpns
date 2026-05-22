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
import type { LatihanScreenProps } from '../../navigation/types';

export function SessionResultScreen({ route, navigation }: LatihanScreenProps<'SessionResult'>) {
  const { sessionId } = route.params;

  // Placeholder stats
  const score = 75;
  const correct = 8;
  const total = 10;
  const xpEarned = 40;

  const scoreColor =
    score >= 80 ? Colors.success : score >= 60 ? Colors.warning : Colors.error;

  return (
    <SafeAreaView style={styles.safe}>
      {/* Header */}
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Hasil Latihan</Text>
        <Text style={styles.sessionId}>ID: {sessionId}</Text>
      </View>

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>

        {/* Score Circle */}
        <View style={styles.scoreCard}>
          <View style={[styles.scoreCircle, { borderColor: scoreColor }]}>
            <Text style={[styles.scoreNumber, { color: scoreColor }]}>{score}</Text>
            <Text style={styles.scoreLabel}>Skor</Text>
          </View>

          <View style={styles.scoreDetails}>
            <View style={styles.scoreRow}>
              <View style={styles.scoreItem}>
                <Ionicons name="checkmark-circle" size={20} color={Colors.success} />
                <Text style={styles.scoreItemValue}>{correct}</Text>
                <Text style={styles.scoreItemLabel}>Benar</Text>
              </View>
              <View style={styles.scoreDivider} />
              <View style={styles.scoreItem}>
                <Ionicons name="close-circle" size={20} color={Colors.error} />
                <Text style={styles.scoreItemValue}>{total - correct}</Text>
                <Text style={styles.scoreItemLabel}>Salah</Text>
              </View>
              <View style={styles.scoreDivider} />
              <View style={styles.scoreItem}>
                <Ionicons name="help-circle" size={20} color={Colors.textMuted} />
                <Text style={styles.scoreItemValue}>0</Text>
                <Text style={styles.scoreItemLabel}>Lewati</Text>
              </View>
            </View>
          </View>
        </View>

        {/* XP Earned */}
        <View style={styles.xpCard}>
          <Ionicons name="star" size={22} color={Colors.xpGold} />
          <View style={styles.xpInfo}>
            <Text style={styles.xpTitle}>XP Diperoleh</Text>
            <Text style={styles.xpDesc}>Terus berlatih untuk mendapatkan lebih banyak XP!</Text>
          </View>
          <Text style={styles.xpValue}>+{xpEarned}</Text>
        </View>

        {/* Performance Message */}
        <View style={[styles.messageCard, { backgroundColor: scoreColor + '12', borderColor: scoreColor + '30' }]}>
          <Ionicons
            name={score >= 80 ? 'trophy-outline' : score >= 60 ? 'thumbs-up-outline' : 'refresh-outline'}
            size={20}
            color={scoreColor}
          />
          <Text style={[styles.messageText, { color: scoreColor }]}>
            {score >= 80
              ? 'Luar biasa! Pertahankan performa ini.'
              : score >= 60
              ? 'Cukup baik! Masih ada ruang untuk berkembang.'
              : 'Jangan menyerah! Coba lagi untuk hasil yang lebih baik.'}
          </Text>
        </View>

        {/* Question Review Placeholder */}
        <View style={styles.reviewSection}>
          <Text style={styles.reviewTitle}>Ringkasan Jawaban</Text>
          <View style={styles.reviewGrid}>
            {Array.from({ length: total }).map((_, i) => {
              const isCorrect = i < correct;
              return (
                <View
                  key={i}
                  style={[
                    styles.reviewDot,
                    { backgroundColor: isCorrect ? Colors.success : Colors.error },
                  ]}
                >
                  <Text style={styles.reviewDotText}>{i + 1}</Text>
                </View>
              );
            })}
          </View>
        </View>

        {/* Actions */}
        <View style={styles.actions}>
          <TouchableOpacity
            style={styles.primaryBtn}
            activeOpacity={0.85}
            onPress={() => navigation.navigate('LatihanHome')}
          >
            <Ionicons name="refresh-outline" size={18} color={Colors.white} />
            <Text style={styles.primaryBtnText}>Latihan Lagi</Text>
          </TouchableOpacity>

          <TouchableOpacity
            style={styles.secondaryBtn}
            activeOpacity={0.85}
            onPress={() => navigation.navigate('LatihanHome')}
          >
            <Ionicons name="home-outline" size={18} color={Colors.primary} />
            <Text style={styles.secondaryBtnText}>Kembali ke Latihan</Text>
          </TouchableOpacity>
        </View>

      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },

  header: {
    backgroundColor: Colors.white,
    paddingHorizontal: 20,
    paddingVertical: 16,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
    alignItems: 'center',
  },
  headerTitle: { fontSize: 20, fontWeight: '800', color: Colors.textPrimary },
  sessionId: { fontSize: 11, color: Colors.textMuted, marginTop: 2 },

  scroll: { padding: 20, gap: 16, paddingBottom: 40 },

  scoreCard: {
    backgroundColor: Colors.white,
    borderRadius: 20,
    padding: 24,
    alignItems: 'center',
    gap: 20,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.08,
    shadowRadius: 10,
    elevation: 3,
  },
  scoreCircle: {
    width: 120,
    height: 120,
    borderRadius: 60,
    borderWidth: 6,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: Colors.bgSecondary,
  },
  scoreNumber: { fontSize: 40, fontWeight: '900', letterSpacing: -1 },
  scoreLabel: { fontSize: 12, color: Colors.textSecondary, marginTop: -4 },

  scoreDetails: { width: '100%' },
  scoreRow: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    alignItems: 'center',
  },
  scoreItem: { alignItems: 'center', gap: 4 },
  scoreItemValue: { fontSize: 22, fontWeight: '800', color: Colors.textPrimary },
  scoreItemLabel: { fontSize: 11, color: Colors.textSecondary },
  scoreDivider: { width: 1, height: 40, backgroundColor: Colors.border },

  xpCard: {
    backgroundColor: '#FFFBEB',
    borderRadius: 14,
    padding: 16,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    borderWidth: 1,
    borderColor: '#FDE68A',
  },
  xpInfo: { flex: 1 },
  xpTitle: { fontSize: 14, fontWeight: '700', color: Colors.textPrimary },
  xpDesc: { fontSize: 12, color: Colors.textSecondary, marginTop: 2 },
  xpValue: { fontSize: 24, fontWeight: '900', color: Colors.xpGold },

  messageCard: {
    borderRadius: 12,
    padding: 14,
    flexDirection: 'row',
    gap: 10,
    alignItems: 'flex-start',
    borderWidth: 1,
  },
  messageText: { flex: 1, fontSize: 13, fontWeight: '500', lineHeight: 20 },

  reviewSection: {
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
  reviewGrid: { flexDirection: 'row', flexWrap: 'wrap', gap: 8 },
  reviewDot: {
    width: 36,
    height: 36,
    borderRadius: 18,
    justifyContent: 'center',
    alignItems: 'center',
  },
  reviewDotText: { fontSize: 12, fontWeight: '700', color: Colors.white },

  actions: { gap: 12, marginTop: 4 },
  primaryBtn: {
    backgroundColor: Colors.primary,
    borderRadius: 14,
    paddingVertical: 16,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 8,
  },
  primaryBtnText: { fontSize: 16, fontWeight: '700', color: Colors.white },
  secondaryBtn: {
    backgroundColor: Colors.white,
    borderRadius: 14,
    paddingVertical: 16,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 8,
    borderWidth: 1.5,
    borderColor: Colors.primary,
  },
  secondaryBtnText: { fontSize: 16, fontWeight: '700', color: Colors.primary },
});
