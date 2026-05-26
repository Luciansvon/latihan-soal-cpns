import React, { useState, useEffect } from 'react';
import {
  View, Text, StyleSheet, SafeAreaView, ScrollView, TouchableOpacity, ActivityIndicator,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import { SUBJECT_LABELS } from '../../types/exam.types';
import { fetchSessionById, type SessionRow } from '../../services/sessionQueries';
import { getScorePercentage } from '../../utils/ScoreCalculator';
import type { ProgressScreenProps } from '../../navigation/types';

function formatDate(iso?: string): string {
  if (!iso) return '-';
  return new Date(iso).toLocaleDateString('id-ID', { day: 'numeric', month: 'long', year: 'numeric' });
}

function formatDuration(seconds?: number): string {
  if (!seconds) return '-';
  const m = Math.floor(seconds / 60);
  const s = seconds % 60;
  return s > 0 ? `${m}m ${s}d` : `${m} menit`;
}

export function SessionDetailScreen({ route, navigation }: ProgressScreenProps<'SessionDetail'>) {
  const { sessionId } = route.params;
  const [session, setSession] = useState<SessionRow | null>(null);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    let active = true;
    (async () => {
      try {
        const data = await fetchSessionById(sessionId);
        if (active) setSession(data);
      } catch {
        if (active) setSession(null);
      } finally {
        if (active) setIsLoading(false);
      }
    })();
    return () => { active = false; };
  }, [sessionId]);

  const header = (
    <View style={styles.header}>
      <TouchableOpacity style={styles.backBtn} onPress={() => navigation.goBack()}>
        <Ionicons name="arrow-back" size={22} color={Colors.textPrimary} />
      </TouchableOpacity>
      <View style={styles.headerText}>
        <Text style={styles.headerTitle}>Detail Sesi</Text>
      </View>
    </View>
  );

  if (isLoading) {
    return (
      <SafeAreaView style={styles.safe}>
        {header}
        <View style={styles.center}><ActivityIndicator size="large" color={Colors.primary} /></View>
      </SafeAreaView>
    );
  }

  if (!session) {
    return (
      <SafeAreaView style={styles.safe}>
        {header}
        <View style={styles.center}>
          <Ionicons name="alert-circle-outline" size={48} color={Colors.gray300} />
          <Text style={styles.notFound}>Sesi tidak ditemukan.</Text>
          <TouchableOpacity style={styles.backToHistoryBtn} onPress={() => navigation.goBack()}>
            <Ionicons name="arrow-back-outline" size={16} color={Colors.primary} />
            <Text style={styles.backToHistoryText}>Kembali</Text>
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    );
  }

  const isTryout = session.sessionType === 'TRYOUT';
  const pct = getScorePercentage(session.totalScore, session.maxScore);
  const scoreColor = pct >= 80 ? Colors.success : pct >= 60 ? Colors.warning : Colors.error;
  const typeLabel = isTryout ? 'Tryout' : 'Latihan';
  const subjectLabel = isTryout
    ? (session.examType ?? '')
    : (session.subject ? SUBJECT_LABELS[session.subject] : '-');
  const wrong = session.answeredCount - session.correctCount;
  const sectionEntries = session.sectionScores ? Object.entries(session.sectionScores) : [];
  const practiceAccuracy = session.totalQuestions > 0
    ? Math.round((session.correctCount / session.totalQuestions) * 100)
    : 0;

  return (
    <SafeAreaView style={styles.safe}>
      {header}
      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>

        {/* Meta */}
        <View style={styles.metaCard}>
          <View style={styles.metaRow}>
            <View style={styles.metaItem}>
              <Ionicons name="calendar-outline" size={16} color={Colors.textSecondary} />
              <Text style={styles.metaText}>{formatDate(session.completedAt)}</Text>
            </View>
            <View style={styles.metaItem}>
              <Ionicons name="time-outline" size={16} color={Colors.textSecondary} />
              <Text style={styles.metaText}>{formatDuration(session.durationSeconds)}</Text>
            </View>
            <View style={[styles.metaBadge, { backgroundColor: Colors.primary + '15' }]}>
              <Text style={[styles.metaBadgeText, { color: Colors.primary }]}>{typeLabel}</Text>
            </View>
          </View>
          <View style={styles.subjectRow}>
            <Ionicons name="book-outline" size={14} color={Colors.textMuted} />
            <Text style={styles.subjectText}>{subjectLabel}</Text>
          </View>
        </View>

        {/* Score */}
        <View style={styles.scoreCard}>
          <View style={[styles.scoreCircle, { borderColor: scoreColor }]}>
            <Text style={[styles.scoreNumber, { color: scoreColor }]}>{session.totalScore}</Text>
            <Text style={styles.scoreLabel}>dari {session.maxScore}</Text>
          </View>
          <View style={styles.scoreStats}>
            <View style={styles.scoreStat}>
              <Ionicons name="checkmark-circle" size={18} color={Colors.success} />
              <Text style={styles.scoreStatLabel}>Benar</Text>
              <Text style={styles.scoreStatValue}>{session.correctCount}</Text>
            </View>
            <View style={styles.scoreStatDivider} />
            <View style={styles.scoreStat}>
              <Ionicons name="close-circle" size={18} color={Colors.error} />
              <Text style={styles.scoreStatLabel}>Salah</Text>
              <Text style={styles.scoreStatValue}>{wrong}</Text>
            </View>
            <View style={styles.scoreStatDivider} />
            <View style={styles.scoreStat}>
              <Ionicons name="documents-outline" size={18} color={Colors.textSecondary} />
              <Text style={styles.scoreStatLabel}>Total</Text>
              <Text style={styles.scoreStatValue}>{session.totalQuestions}</Text>
            </View>
          </View>
        </View>

        {/* Section breakdown (tryout) */}
        {isTryout && sectionEntries.length > 0 && (
          <View style={styles.reviewCard}>
            <Text style={styles.reviewTitle}>Hasil Per Bagian</Text>
            {sectionEntries.map(([subj, data]) => (
              <View key={subj} style={styles.sectionRow}>
                <Text style={styles.sectionName}>{SUBJECT_LABELS[subj as keyof typeof SUBJECT_LABELS] ?? subj}</Text>
                <Text style={styles.sectionScoreText}>{data.score}</Text>
                <View style={[styles.sectionStatus, { backgroundColor: data.passed ? Colors.success + '15' : Colors.error + '12' }]}>
                  <Text style={[styles.sectionStatusText, { color: data.passed ? Colors.success : Colors.error }]}>
                    {data.passed ? 'Lulus' : 'Tidak'}
                  </Text>
                </View>
                <Text style={styles.sectionDetail}>{data.correct}/{data.total}</Text>
              </View>
            ))}
          </View>
        )}

        {/* Accuracy summary (practice) */}
        {!isTryout && (
          <View style={styles.reviewCard}>
            <Text style={styles.reviewTitle}>Akurasi</Text>
            <View style={styles.accBarTrack}>
              <View style={[styles.accBarFill, { width: `${practiceAccuracy}%`, backgroundColor: scoreColor }]} />
            </View>
            <Text style={styles.reviewDesc}>
              {session.correctCount} dari {session.totalQuestions} soal dijawab benar ({practiceAccuracy}%).
            </Text>
          </View>
        )}

        <TouchableOpacity style={styles.backToHistoryBtn} activeOpacity={0.85} onPress={() => navigation.goBack()}>
          <Ionicons name="arrow-back-outline" size={16} color={Colors.primary} />
          <Text style={styles.backToHistoryText}>Kembali ke Riwayat</Text>
        </TouchableOpacity>

      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },
  center: { flex: 1, justifyContent: 'center', alignItems: 'center', gap: 14, padding: 32 },
  notFound: { fontSize: 15, color: Colors.textSecondary },

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
  metaBadge: { marginLeft: 'auto', paddingHorizontal: 10, paddingVertical: 4, borderRadius: 8 },
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
  scoreNumber: { fontSize: 26, fontWeight: '900' },
  scoreLabel: { fontSize: 10, color: Colors.textSecondary, marginTop: -2 },
  scoreStats: { flex: 1, flexDirection: 'row', justifyContent: 'space-around', alignItems: 'center' },
  scoreStat: { alignItems: 'center', gap: 4 },
  scoreStatLabel: { fontSize: 11, color: Colors.textSecondary },
  scoreStatValue: { fontSize: 20, fontWeight: '800', color: Colors.textPrimary },
  scoreStatDivider: { width: 1, height: 40, backgroundColor: Colors.border },

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
  reviewDesc: { fontSize: 12, color: Colors.textSecondary, lineHeight: 18 },

  sectionRow: { flexDirection: 'row', alignItems: 'center', gap: 10 },
  sectionName: { flex: 1, fontSize: 13, fontWeight: '600', color: Colors.textPrimary },
  sectionScoreText: { fontSize: 15, fontWeight: '800', color: Colors.textPrimary, width: 44, textAlign: 'right' },
  sectionStatus: { paddingHorizontal: 8, paddingVertical: 3, borderRadius: 6 },
  sectionStatusText: { fontSize: 11, fontWeight: '700' },
  sectionDetail: { fontSize: 12, color: Colors.textMuted, width: 44, textAlign: 'right' },

  accBarTrack: { height: 10, backgroundColor: Colors.gray100, borderRadius: 5, overflow: 'hidden' },
  accBarFill: { height: '100%', borderRadius: 5 },

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
