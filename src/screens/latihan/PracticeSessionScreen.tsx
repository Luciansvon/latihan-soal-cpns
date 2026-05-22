import React, { useEffect, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  SafeAreaView,
  TouchableOpacity,
  ActivityIndicator,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import { EXAM_CONFIGS, SUBJECT_LABELS } from '../../types/exam.types';
import type { LatihanScreenProps } from '../../navigation/types';

const EXAM_COLORS: Record<string, string> = {
  CPNS: Colors.cpns,
  TNI: Colors.tni,
  POLRI: Colors.polri,
};

export function PracticeSessionScreen({ route, navigation }: LatihanScreenProps<'PracticeSession'>) {
  const { examType, subject, packId } = route.params;
  const [isLoading, setIsLoading] = useState(true);

  const accentColor = EXAM_COLORS[examType] ?? Colors.primary;
  const examConfig = EXAM_CONFIGS[examType];

  useEffect(() => {
    // Simulate loading questions
    const timer = setTimeout(() => setIsLoading(false), 1500);
    return () => clearTimeout(timer);
  }, []);

  if (isLoading) {
    return (
      <SafeAreaView style={styles.safe}>
        <View style={styles.loadingContainer}>
          <ActivityIndicator size="large" color={accentColor} />
          <Text style={styles.loadingText}>Memuat soal...</Text>
          <Text style={styles.loadingSubtext}>
            {SUBJECT_LABELS[subject]} · {examConfig.label}
          </Text>
        </View>
      </SafeAreaView>
    );
  }

  return (
    <SafeAreaView style={styles.safe}>
      {/* Header */}
      <View style={[styles.header, { borderBottomColor: accentColor + '40' }]}>
        <TouchableOpacity style={styles.backBtn} onPress={() => navigation.goBack()}>
          <Ionicons name="close" size={22} color={Colors.textPrimary} />
        </TouchableOpacity>
        <View style={styles.headerCenter}>
          <View style={[styles.examBadge, { backgroundColor: accentColor }]}>
            <Text style={styles.examBadgeText}>{examConfig.label}</Text>
          </View>
          <Text style={styles.headerSubject}>{SUBJECT_LABELS[subject]}</Text>
        </View>
        <TouchableOpacity style={styles.flagBtn}>
          <Ionicons name="flag-outline" size={22} color={Colors.textSecondary} />
        </TouchableOpacity>
      </View>

      {/* Progress Bar */}
      <View style={styles.progressContainer}>
        <View style={styles.progressTrack}>
          <View style={[styles.progressFill, { width: '10%', backgroundColor: accentColor }]} />
        </View>
        <Text style={styles.progressLabel}>1 / 10</Text>
      </View>

      {/* Placeholder Question Area */}
      <View style={styles.content}>
        <View style={styles.questionCard}>
          <View style={[styles.questionNumBadge, { backgroundColor: accentColor + '18' }]}>
            <Text style={[styles.questionNumText, { color: accentColor }]}>Soal 1</Text>
          </View>
          <View style={styles.questionPlaceholder}>
            <Ionicons name="document-text-outline" size={48} color={Colors.gray300} />
            <Text style={styles.placeholderTitle}>Sesi Latihan</Text>
            <Text style={styles.placeholderDesc}>
              Konten soal akan dimuat di sini.{'\n'}
              Paket: {packId}
            </Text>
          </View>
        </View>

        {/* Option Placeholders */}
        {['A', 'B', 'C', 'D', 'E'].map((opt) => (
          <TouchableOpacity
            key={opt}
            style={styles.optionCard}
            activeOpacity={0.8}
          >
            <View style={[styles.optionBullet, { borderColor: accentColor + '60' }]}>
              <Text style={[styles.optionBulletText, { color: accentColor }]}>{opt}</Text>
            </View>
            <View style={styles.optionTextPlaceholder} />
          </TouchableOpacity>
        ))}
      </View>

      {/* Bottom Navigation */}
      <View style={styles.bottomNav}>
        <TouchableOpacity style={styles.navBtn} activeOpacity={0.8}>
          <Ionicons name="chevron-back" size={20} color={Colors.textSecondary} />
          <Text style={styles.navBtnText}>Sebelumnya</Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={[styles.nextBtn, { backgroundColor: accentColor }]}
          activeOpacity={0.8}
          onPress={() => navigation.navigate('SessionResult', { sessionId: 'session-001' })}
        >
          <Text style={styles.nextBtnText}>Berikutnya</Text>
          <Ionicons name="chevron-forward" size={20} color={Colors.white} />
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },

  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    gap: 16,
  },
  loadingText: {
    fontSize: 18,
    fontWeight: '700',
    color: Colors.textPrimary,
    marginTop: 8,
  },
  loadingSubtext: {
    fontSize: 14,
    color: Colors.textSecondary,
  },

  header: {
    backgroundColor: Colors.white,
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 16,
    paddingVertical: 14,
    borderBottomWidth: 1,
    gap: 12,
  },
  backBtn: { width: 36, height: 36, justifyContent: 'center', alignItems: 'center' },
  headerCenter: { flex: 1, alignItems: 'center', gap: 4 },
  examBadge: {
    paddingHorizontal: 10,
    paddingVertical: 3,
    borderRadius: 6,
  },
  examBadgeText: { fontSize: 11, fontWeight: '800', color: Colors.white, letterSpacing: 0.5 },
  headerSubject: { fontSize: 13, fontWeight: '600', color: Colors.textPrimary },
  flagBtn: { width: 36, height: 36, justifyContent: 'center', alignItems: 'center' },

  progressContainer: {
    backgroundColor: Colors.white,
    paddingHorizontal: 20,
    paddingBottom: 12,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },
  progressTrack: {
    flex: 1,
    height: 6,
    backgroundColor: Colors.gray200,
    borderRadius: 3,
    overflow: 'hidden',
  },
  progressFill: {
    height: '100%',
    borderRadius: 3,
  },
  progressLabel: { fontSize: 12, fontWeight: '600', color: Colors.textSecondary, minWidth: 40 },

  content: { flex: 1, padding: 20, gap: 12 },

  questionCard: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 20,
    gap: 16,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.06,
    shadowRadius: 6,
    elevation: 2,
  },
  questionNumBadge: {
    alignSelf: 'flex-start',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 6,
  },
  questionNumText: { fontSize: 12, fontWeight: '700' },
  questionPlaceholder: {
    alignItems: 'center',
    paddingVertical: 24,
    gap: 8,
  },
  placeholderTitle: { fontSize: 16, fontWeight: '600', color: Colors.textSecondary },
  placeholderDesc: { fontSize: 13, color: Colors.textMuted, textAlign: 'center', lineHeight: 20 },

  optionCard: {
    backgroundColor: Colors.white,
    borderRadius: 12,
    padding: 14,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.04,
    shadowRadius: 3,
    elevation: 1,
  },
  optionBullet: {
    width: 34,
    height: 34,
    borderRadius: 17,
    borderWidth: 2,
    justifyContent: 'center',
    alignItems: 'center',
  },
  optionBulletText: { fontSize: 14, fontWeight: '700' },
  optionTextPlaceholder: {
    flex: 1,
    height: 14,
    backgroundColor: Colors.gray100,
    borderRadius: 7,
  },

  bottomNav: {
    backgroundColor: Colors.white,
    flexDirection: 'row',
    padding: 16,
    gap: 12,
    borderTopWidth: 1,
    borderTopColor: Colors.border,
  },
  navBtn: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 6,
    paddingVertical: 14,
    borderRadius: 12,
    borderWidth: 1.5,
    borderColor: Colors.border,
  },
  navBtnText: { fontSize: 14, fontWeight: '600', color: Colors.textSecondary },
  nextBtn: {
    flex: 2,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 6,
    paddingVertical: 14,
    borderRadius: 12,
  },
  nextBtnText: { fontSize: 14, fontWeight: '700', color: Colors.white },
});
