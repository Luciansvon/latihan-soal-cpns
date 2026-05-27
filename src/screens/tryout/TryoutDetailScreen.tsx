import React, { useEffect, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  ActivityIndicator,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import type { TryoutScreenProps } from '../../navigation/types';
import type { ExamType, TryoutTemplate } from '../../types/exam.types';
import { SUBJECT_LABELS } from '../../types/exam.types';
import { supabase } from '../../services/supabase';

const EXAM_COLORS: Record<ExamType, string> = {
  CPNS: Colors.cpns,
  TNI: Colors.tni,
  POLRI: Colors.polri,
};

const RULES = [
  'Tryout tidak dapat dijeda setelah dimulai',
  'Waktu berjalan terus menerus sampai habis',
  'Soal otomatis dikumpulkan saat waktu habis',
  'Pastikan koneksi internet stabil saat memulai',
];

export function TryoutDetailScreen({ route, navigation }: TryoutScreenProps<'TryoutDetail'>) {
  const { templateId } = route.params;
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [template, setTemplate] = useState<TryoutTemplate | null>(null);

  useEffect(() => {
    let cancelled = false;
    (async () => {
      try {
        const { data, error } = await supabase
          .from('tryout_templates')
          .select('*')
          .eq('id', templateId)
          .eq('is_published', true)
          .maybeSingle();
        if (cancelled) return;
        if (error) {
          setError(`Gagal memuat detail: ${error.message}`);
        } else if (!data) {
          setError('Template tryout tidak ditemukan atau sudah ditarik.');
        } else {
          setTemplate(mapTemplate(data));
        }
        setLoading(false);
      } catch (e: any) {
        if (cancelled) return;
        setError(`Gagal memuat detail: ${e?.message ?? 'unknown error'}`);
        setLoading(false);
      }
    })();
    return () => {
      cancelled = true;
    };
  }, [templateId]);

  if (loading) {
    return (
      <SafeAreaView style={styles.safe}>
        <View style={styles.centerBox}>
          <ActivityIndicator size="large" color={Colors.primary} />
          <Text style={styles.loadingText}>Memuat detail tryout…</Text>
        </View>
      </SafeAreaView>
    );
  }

  if (error || !template) {
    return (
      <SafeAreaView style={styles.safe}>
        <View style={styles.centerBox}>
          <Ionicons name="alert-circle-outline" size={56} color={Colors.error} />
          <Text style={styles.errorText}>{error ?? 'Template tidak ditemukan.'}</Text>
          <TouchableOpacity style={styles.primaryBtn} onPress={() => navigation.goBack()}>
            <Text style={styles.primaryBtnText}>Kembali</Text>
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    );
  }

  const accent = EXAM_COLORS[template.examType] ?? Colors.primary;
  const totalQuestions = template.sections.reduce((sum, s) => sum + s.questionCount, 0);

  return (
    <SafeAreaView style={styles.safe}>
      <View style={[styles.header, { borderBottomColor: accent + '30' }]}>
        <TouchableOpacity style={styles.backBtn} onPress={() => navigation.goBack()}>
          <Ionicons name="arrow-back" size={22} color={Colors.textPrimary} />
        </TouchableOpacity>
        <View style={styles.headerCenter}>
          <View style={[styles.badge, { backgroundColor: accent }]}>
            <Text style={styles.badgeText}>{template.examType}</Text>
          </View>
          <Text style={styles.headerTitle}>{template.title}</Text>
        </View>
      </View>

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>
        <View style={styles.statsRow}>
          <View style={[styles.statCard, { borderTopColor: accent }]}>
            <Ionicons name="document-text-outline" size={22} color={accent} />
            <Text style={styles.statValue}>{totalQuestions}</Text>
            <Text style={styles.statLabel}>Total Soal</Text>
          </View>
          <View style={[styles.statCard, { borderTopColor: accent }]}>
            <Ionicons name="time-outline" size={22} color={accent} />
            <Text style={styles.statValue}>{template.durationMinutes}</Text>
            <Text style={styles.statLabel}>Menit</Text>
          </View>
          <View style={[styles.statCard, { borderTopColor: accent }]}>
            <Ionicons name="layers-outline" size={22} color={accent} />
            <Text style={styles.statValue}>{template.sections.length}</Text>
            <Text style={styles.statLabel}>Bagian</Text>
          </View>
        </View>

        {template.description ? (
          <View style={styles.card}>
            <Text style={styles.cardTitle}>Tentang Tryout Ini</Text>
            <Text style={styles.descText}>{template.description}</Text>
          </View>
        ) : null}

        <View style={styles.card}>
          <Text style={styles.cardTitle}>Distribusi Soal</Text>
          {template.sections.map((section, i) => (
            <View key={i} style={styles.sectionRow}>
              <View style={[styles.sectionDot, { backgroundColor: accent }]} />
              <View style={styles.sectionInfo}>
                <Text style={styles.sectionName}>
                  {SUBJECT_LABELS[section.subject] ?? section.subject}
                </Text>
                <Text style={styles.sectionMeta}>
                  {section.questionCount} soal
                  {section.passingScore ? ` Â· Passing: ${section.passingScore}` : ''}
                </Text>
              </View>
            </View>
          ))}
        </View>

        <View style={styles.rulesCard}>
          <View style={styles.rulesHeader}>
            <Ionicons name="alert-circle-outline" size={18} color={Colors.warning} />
            <Text style={styles.rulesTitle}>Perhatian</Text>
          </View>
          <View style={styles.rulesList}>
            {RULES.map((rule, i) => (
              <View key={i} style={styles.ruleItem}>
                <Text style={styles.ruleBullet}>•</Text>
                <Text style={styles.ruleText}>{rule}</Text>
              </View>
            ))}
          </View>
        </View>
      </ScrollView>

      <View style={styles.footer}>
        <TouchableOpacity
          style={[styles.startBtn, { backgroundColor: accent }]}
          activeOpacity={0.85}
          onPress={() => navigation.navigate('TryoutSession', { templateId })}
        >
          <Ionicons name="play-circle-outline" size={20} color={Colors.white} />
          <Text style={styles.startBtnText}>Mulai Tryout</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

function mapTemplate(row: any): TryoutTemplate {
  return {
    id: row.id,
    examType: row.exam_type,
    title: row.title,
    description: row.description ?? undefined,
    durationMinutes: row.duration_minutes,
    passingScore: row.passing_score ?? undefined,
    sections: (row.sections ?? []).map((s: any) => ({
      subject: s.subject,
      questionCount: s.questionCount ?? s.question_count,
      durationMinutes: s.durationMinutes ?? s.duration_minutes,
      passingScore: s.passingScore ?? s.passing_score,
    })),
    isFree: row.is_free,
    isPublished: row.is_published,
    createdAt: row.created_at,
  };
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },

  centerBox: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
    gap: 12,
  },
  loadingText: { fontSize: 14, color: Colors.textSecondary },
  errorText: { fontSize: 14, color: Colors.textSecondary, textAlign: 'center', lineHeight: 20 },

  header: {
    backgroundColor: Colors.white,
    paddingHorizontal: 20,
    paddingTop: 12,
    paddingBottom: 16,
    borderBottomWidth: 1,
    gap: 10,
  },
  backBtn: { width: 36, height: 36, justifyContent: 'center' },
  headerCenter: { gap: 6 },
  badge: {
    alignSelf: 'flex-start',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 6,
  },
  badgeText: { fontSize: 10, fontWeight: '800', color: Colors.white, letterSpacing: 1 },
  headerTitle: { fontSize: 20, fontWeight: '800', color: Colors.textPrimary, letterSpacing: -0.3 },

  scroll: { padding: 20, gap: 16, paddingBottom: 32 },

  statsRow: { flexDirection: 'row', gap: 12 },
  statCard: {
    flex: 1,
    backgroundColor: Colors.white,
    borderRadius: 14,
    padding: 16,
    alignItems: 'center',
    gap: 6,
    borderTopWidth: 3,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  statValue: { fontSize: 22, fontWeight: '900', color: Colors.textPrimary },
  statLabel: { fontSize: 11, color: Colors.textSecondary, textAlign: 'center' },

  card: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 18,
    gap: 12,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  cardTitle: { fontSize: 14, fontWeight: '700', color: Colors.textPrimary },
  descText: { fontSize: 13, color: Colors.textSecondary, lineHeight: 22 },

  sectionRow: { flexDirection: 'row', alignItems: 'flex-start', gap: 12 },
  sectionDot: { width: 8, height: 8, borderRadius: 4, marginTop: 5 },
  sectionInfo: { flex: 1 },
  sectionName: { fontSize: 13, fontWeight: '600', color: Colors.textPrimary },
  sectionMeta: { fontSize: 12, color: Colors.textSecondary, marginTop: 2 },

  rulesCard: {
    backgroundColor: '#FFFBEB',
    borderRadius: 14,
    padding: 16,
    gap: 12,
    borderWidth: 1,
    borderColor: '#FDE68A',
  },
  rulesHeader: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  rulesTitle: { fontSize: 14, fontWeight: '700', color: Colors.warning },
  rulesList: { gap: 8 },
  ruleItem: { flexDirection: 'row', gap: 8 },
  ruleBullet: { fontSize: 14, color: Colors.warning, lineHeight: 20 },
  ruleText: { flex: 1, fontSize: 13, color: Colors.gray700, lineHeight: 20 },

  footer: {
    backgroundColor: Colors.white,
    padding: 20,
    borderTopWidth: 1,
    borderTopColor: Colors.border,
  },
  startBtn: {
    borderRadius: 14,
    paddingVertical: 16,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 8,
  },
  startBtnText: { fontSize: 16, fontWeight: '800', color: Colors.white },

  primaryBtn: {
    backgroundColor: Colors.primary,
    paddingHorizontal: 24,
    paddingVertical: 12,
    borderRadius: 12,
  },
  primaryBtnText: { fontSize: 14, fontWeight: '700', color: Colors.white },
});
