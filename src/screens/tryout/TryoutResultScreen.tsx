import React from 'react';
import {
  View, Text, StyleSheet, SafeAreaView, ScrollView, TouchableOpacity,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import { SUBJECT_LABELS } from '../../types/exam.types';
import { getTryoutTemplate } from '../../constants/tryoutTemplates';
import type { TryoutScreenProps } from '../../navigation/types';

const SUBJECT_COLORS: Record<string, string> = {
  TWK: Colors.twk, TIU: Colors.tiu, TKP: Colors.tkp,
  MATEMATIKA: Colors.math, BAHASA_INDONESIA: Colors.indo,
  PENGETAHUAN_UMUM: Colors.umum, PENGETAHUAN_HUKUM: Colors.hukum,
  PSIKOTES: Colors.levelBadge, KEDINASAN: Colors.tni,
};

function formatDuration(seconds: number): string {
  const m = Math.floor(seconds / 60);
  const s = seconds % 60;
  return s > 0 ? `${m} menit ${s} detik` : `${m} menit`;
}

export function TryoutResultScreen({ route, navigation }: TryoutScreenProps<'TryoutResult'>) {
  const { templateId, examType, durationUsedSeconds, sections } = route.params;
  const template = getTryoutTemplate(templateId);
  const accentColor = template?.color ?? Colors.primary;

  const totalCorrect = sections.reduce((s, x) => s + x.correct, 0);
  const totalQuestions = sections.reduce((s, x) => s + x.total, 0);
  const totalAnswered = sections.reduce((s, x) => s + x.answered, 0);
  const passedSections = sections.filter((s) => s.passed).length;
  const isLulus = passedSections === sections.length;
  const xpEarned = totalQuestions > 0 ? Math.round((totalCorrect / totalQuestions) * 200) : 0;

  return (
    <SafeAreaView style={styles.safe}>
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Hasil Tryout</Text>
        <Text style={styles.sessionId}>{template?.title ?? examType}</Text>
      </View>

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>

        {/* Pass/Fail Banner */}
        <View style={[
          styles.resultBanner,
          { backgroundColor: isLulus ? Colors.success + '15' : Colors.error + '12' },
          { borderColor: isLulus ? Colors.success + '40' : Colors.error + '30' },
        ]}>
          <Ionicons name={isLulus ? 'checkmark-circle' : 'close-circle'} size={32} color={isLulus ? Colors.success : Colors.error} />
          <View style={styles.resultBannerText}>
            <Text style={[styles.resultTitle, { color: isLulus ? Colors.success : Colors.error }]}>
              {isLulus ? 'LULUS' : 'BELUM LULUS'}
            </Text>
            <Text style={styles.resultDesc}>
              {isLulus
                ? 'Selamat! Kamu melewati semua ambang batas kelulusan.'
                : `${passedSections} dari ${sections.length} bagian memenuhi nilai passing.`}
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
              <Text style={styles.overallValue}>{totalAnswered - totalCorrect}</Text>
              <Text style={styles.overallLabel}>Salah</Text>
            </View>
            <View style={styles.overallDivider} />
            <View style={styles.overallItem}>
              <Text style={styles.overallValue}>{totalQuestions - totalAnswered}</Text>
              <Text style={styles.overallLabel}>Kosong</Text>
            </View>
          </View>
          <Text style={styles.durationText}>Waktu pengerjaan: {formatDuration(durationUsedSeconds)}</Text>
        </View>

        {/* Section Results */}
        <View style={styles.sectionsCard}>
          <Text style={styles.cardTitle}>Hasil Per Bagian</Text>
          {sections.map((section) => {
            const color = SUBJECT_COLORS[section.subject] ?? accentColor;
            const denom = Math.max(section.passingScore * 1.5, section.maxScore, 1);
            return (
              <View key={section.subject} style={styles.sectionItem}>
                <View style={styles.sectionHeader}>
                  <View style={[styles.sectionDot, { backgroundColor: color }]} />
                  <Text style={styles.sectionName}>{SUBJECT_LABELS[section.subject]}</Text>
                  <View style={[styles.sectionStatus, { backgroundColor: section.passed ? Colors.success + '15' : Colors.error + '12' }]}>
                    <Ionicons name={section.passed ? 'checkmark-circle' : 'close-circle'} size={12} color={section.passed ? Colors.success : Colors.error} />
                    <Text style={[styles.sectionStatusText, { color: section.passed ? Colors.success : Colors.error }]}>
                      {section.passed ? 'Lulus' : 'Tidak Lulus'}
                    </Text>
                  </View>
                </View>

                <View style={styles.sectionScoreRow}>
                  <Text style={styles.sectionScore}>{section.score}</Text>
                  <Text style={styles.sectionPassing}>/ {section.passingScore} passing · maks {section.maxScore}</Text>
                </View>

                <View style={styles.sectionBarTrack}>
                  <View style={[styles.sectionBarFill, {
                    width: `${Math.min((section.score / denom) * 100, 100)}%`,
                    backgroundColor: section.passed ? color : Colors.error,
                  }]} />
                  <View style={[styles.passingMark, { left: `${Math.min((section.passingScore / denom) * 100, 100)}%` }]} />
                </View>

                <Text style={styles.sectionDetail}>
                  {section.correct} / {section.total} soal benar · {section.answered} dijawab
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
            <Text style={styles.xpDesc}>Dihitung dari persentase jawaban benar</Text>
          </View>
          <Text style={styles.xpValue}>+{xpEarned}</Text>
        </View>

        {/* Actions */}
        <View style={styles.actions}>
          <TouchableOpacity
            style={[styles.primaryBtn, { backgroundColor: accentColor }]}
            activeOpacity={0.85}
            onPress={() => navigation.replace('TryoutDetail', { templateId })}
          >
            <Ionicons name="refresh-outline" size={18} color={Colors.white} />
            <Text style={styles.primaryBtnText}>Ulangi Tryout</Text>
          </TouchableOpacity>

          <TouchableOpacity
            style={[styles.secondaryBtn, { borderColor: accentColor }]}
            activeOpacity={0.85}
            onPress={() => navigation.popToTop()}
          >
            <Ionicons name="list-outline" size={18} color={accentColor} />
            <Text style={[styles.secondaryBtnText, { color: accentColor }]}>Daftar Tryout</Text>
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
  durationText: { fontSize: 12, color: Colors.textMuted, textAlign: 'center' },

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
  },
  secondaryBtnText: { fontSize: 16, fontWeight: '700' },
});
