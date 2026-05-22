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
import type { TryoutScreenProps } from '../../navigation/types';

interface SectionResult {
  name: string;
  score: number;
  passing: number;
  correct: number;
  total: number;
  color: string;
}

const PLACEHOLDER_SECTIONS: SectionResult[] = [
  { name: 'TWK', score: 80, passing: 65, correct: 24, total: 30, color: Colors.twk },
  { name: 'TIU', score: 60, passing: 80, correct: 21, total: 35, color: Colors.tiu },
  { name: 'TKP', score: 154, passing: 166, correct: 38, total: 45, color: Colors.tkp },
];

export function TryoutResultScreen({ route, navigation }: TryoutScreenProps<'TryoutResult'>) {
  const { sessionId } = route.params;

  const totalCorrect = PLACEHOLDER_SECTIONS.reduce((sum, s) => sum + s.correct, 0);
  const totalQuestions = PLACEHOLDER_SECTIONS.reduce((sum, s) => sum + s.total, 0);
  const passedSections = PLACEHOLDER_SECTIONS.filter((s) => s.score >= s.passing).length;
  const isLulus = passedSections === PLACEHOLDER_SECTIONS.length;

  return (
    <SafeAreaView style={styles.safe}>
      {/* Header */}
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Hasil Tryout</Text>
        <Text style={styles.sessionId}>ID: {sessionId}</Text>
      </View>

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>

        {/* Pass/Fail Banner */}
        <View style={[
          styles.resultBanner,
          { backgroundColor: isLulus ? Colors.success + '15' : Colors.error + '12' },
          { borderColor: isLulus ? Colors.success + '40' : Colors.error + '30' },
        ]}>
          <Ionicons
            name={isLulus ? 'checkmark-circle' : 'close-circle'}
            size={32}
            color={isLulus ? Colors.success : Colors.error}
          />
          <View style={styles.resultBannerText}>
            <Text style={[styles.resultTitle, { color: isLulus ? Colors.success : Colors.error }]}>
              {isLulus ? 'LULUS' : 'BELUM LULUS'}
            </Text>
            <Text style={styles.resultDesc}>
              {isLulus
                ? 'Selamat! Kamu melewati semua ambang batas kelulusan.'
                : `${passedSections} dari ${PLACEHOLDER_SECTIONS.length} bagian memenuhi nilai passing.`}
            </Text>
          </View>
        </View>

        {/* Overall Stats */}
        <View style={styles.overallCard}>
          <Text style={styles.cardTitle}>Ringkasan Keseluruhan</Text>
          <View style={styles.overallRow}>
            <View style={styles.overallItem}>
              <Text style={styles.overallValue}>{totalCorrect}</Text>
              <Text style={styles.overallLabel}>Benar</Text>
            </View>
            <View style={styles.overallDivider} />
            <View style={styles.overallItem}>
              <Text style={styles.overallValue}>{totalQuestions - totalCorrect}</Text>
              <Text style={styles.overallLabel}>Salah</Text>
            </View>
            <View style={styles.overallDivider} />
            <View style={styles.overallItem}>
              <Text style={styles.overallValue}>{totalQuestions}</Text>
              <Text style={styles.overallLabel}>Total Soal</Text>
            </View>
          </View>
        </View>

        {/* Section Results */}
        <View style={styles.sectionsCard}>
          <Text style={styles.cardTitle}>Hasil Per Bagian</Text>
          {PLACEHOLDER_SECTIONS.map((section, index) => {
            const isPassing = section.score >= section.passing;
            return (
              <View key={index} style={styles.sectionItem}>
                <View style={styles.sectionHeader}>
                  <View style={[styles.sectionDot, { backgroundColor: section.color }]} />
                  <Text style={styles.sectionName}>{section.name}</Text>
                  <View style={[
                    styles.sectionStatus,
                    { backgroundColor: isPassing ? Colors.success + '15' : Colors.error + '12' },
                  ]}>
                    <Ionicons
                      name={isPassing ? 'checkmark-circle' : 'close-circle'}
                      size={12}
                      color={isPassing ? Colors.success : Colors.error}
                    />
                    <Text style={[
                      styles.sectionStatusText,
                      { color: isPassing ? Colors.success : Colors.error },
                    ]}>
                      {isPassing ? 'Lulus' : 'Tidak Lulus'}
                    </Text>
                  </View>
                </View>

                <View style={styles.sectionScoreRow}>
                  <Text style={styles.sectionScore}>{section.score}</Text>
                  <Text style={styles.sectionPassing}>/ {section.passing} passing</Text>
                </View>

                {/* Score Bar */}
                <View style={styles.sectionBarTrack}>
                  <View
                    style={[
                      styles.sectionBarFill,
                      {
                        width: `${Math.min((section.score / (section.passing * 1.5)) * 100, 100)}%`,
                        backgroundColor: isPassing ? section.color : Colors.error,
                      },
                    ]}
                  />
                  {/* Passing line marker */}
                  <View style={[styles.passingMark, { left: `${(section.passing / (section.passing * 1.5)) * 100}%` }]} />
                </View>

                <Text style={styles.sectionDetail}>
                  {section.correct} / {section.total} soal benar
                </Text>
              </View>
            );
          })}
        </View>

        {/* XP Earned */}
        <View style={styles.xpCard}>
          <Ionicons name="star" size={22} color={Colors.xpGold} />
          <View style={styles.xpInfo}>
            <Text style={styles.xpTitle}>XP dari Tryout</Text>
            <Text style={styles.xpDesc}>XP dihitung berdasarkan persentase benar</Text>
          </View>
          <Text style={styles.xpValue}>+{Math.round((totalCorrect / totalQuestions) * 200)}</Text>
        </View>

        {/* Actions */}
        <View style={styles.actions}>
          <TouchableOpacity
            style={styles.primaryBtn}
            activeOpacity={0.85}
            onPress={() => navigation.navigate('TryoutList')}
          >
            <Ionicons name="refresh-outline" size={18} color={Colors.white} />
            <Text style={styles.primaryBtnText}>Tryout Lagi</Text>
          </TouchableOpacity>

          <TouchableOpacity
            style={styles.secondaryBtn}
            activeOpacity={0.85}
            onPress={() => navigation.navigate('TryoutList')}
          >
            <Ionicons name="list-outline" size={18} color={Colors.primary} />
            <Text style={styles.secondaryBtnText}>Daftar Tryout</Text>
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

  resultBanner: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 14,
    borderRadius: 16,
    padding: 18,
    borderWidth: 1,
  },
  resultBannerText: { flex: 1, gap: 4 },
  resultTitle: { fontSize: 22, fontWeight: '900', letterSpacing: 1 },
  resultDesc: { fontSize: 13, color: Colors.textSecondary, lineHeight: 20 },

  overallCard: {
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
  cardTitle: { fontSize: 14, fontWeight: '700', color: Colors.textPrimary },
  overallRow: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    alignItems: 'center',
  },
  overallItem: { alignItems: 'center', gap: 4 },
  overallValue: { fontSize: 28, fontWeight: '900', color: Colors.textPrimary },
  overallLabel: { fontSize: 12, color: Colors.textSecondary },
  overallDivider: { width: 1, height: 50, backgroundColor: Colors.border },

  sectionsCard: {
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
  sectionItem: { gap: 8 },
  sectionHeader: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  sectionDot: { width: 8, height: 8, borderRadius: 4 },
  sectionName: { flex: 1, fontSize: 14, fontWeight: '700', color: Colors.textPrimary },
  sectionStatus: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    paddingHorizontal: 8,
    paddingVertical: 3,
    borderRadius: 8,
  },
  sectionStatusText: { fontSize: 11, fontWeight: '700' },
  sectionScoreRow: { flexDirection: 'row', alignItems: 'baseline', gap: 4 },
  sectionScore: { fontSize: 22, fontWeight: '800', color: Colors.textPrimary },
  sectionPassing: { fontSize: 12, color: Colors.textSecondary },
  sectionBarTrack: {
    height: 8,
    backgroundColor: Colors.gray100,
    borderRadius: 4,
    overflow: 'visible',
    position: 'relative',
  },
  sectionBarFill: {
    height: '100%',
    borderRadius: 4,
  },
  passingMark: {
    position: 'absolute',
    top: -3,
    width: 2,
    height: 14,
    backgroundColor: Colors.gray500,
    borderRadius: 1,
  },
  sectionDetail: { fontSize: 11, color: Colors.textMuted },

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

  actions: { gap: 12 },
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
