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
import { Colors, CognitiveCalm, Fonts } from '../../constants/colors';
import type { TryoutScreenProps } from '../../navigation/types';
import type { ExamType, TryoutTemplate } from '../../types/exam.types';
import { SUBJECT_LABELS } from '../../types/exam.types';
import { supabase } from '../../services/supabase';
import { AppHeader } from '../../components/common/AppHeader';

const EXAM_COLORS: Record<ExamType, string> = {
  CPNS: CognitiveCalm.primary,
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
      <SafeAreaView style={styles.safe} edges={['top']}>
        <AppHeader theme="warm" showBack onBackPress={() => navigation.goBack()} />
        <View style={styles.centerBox}>
          <ActivityIndicator size="large" color={CognitiveCalm.primary} />
          <Text style={styles.loadingText}>Memuat detail tryout…</Text>
        </View>
      </SafeAreaView>
    );
  }

  if (error || !template) {
    return (
      <SafeAreaView style={styles.safe} edges={['top']}>
        <AppHeader theme="warm" showBack onBackPress={() => navigation.goBack()} />
        <View style={styles.centerBox}>
          <Ionicons name="alert-circle-outline" size={56} color={CognitiveCalm.error} />
          <Text style={styles.errorText}>{error ?? 'Template tidak ditemukan.'}</Text>
          <TouchableOpacity style={styles.primaryBtn} onPress={() => navigation.goBack()}>
            <Text style={styles.primaryBtnText}>Kembali</Text>
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    );
  }

  const accent = EXAM_COLORS[template.examType] ?? CognitiveCalm.primary;
  const totalQuestions = template.sections.reduce((sum, s) => sum + s.questionCount, 0);

  return (
    <SafeAreaView style={styles.safe} edges={['top']}>
      <AppHeader theme="warm" showBack onBackPress={() => navigation.goBack()} />

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>
        {/* Hero */}
        <View style={styles.hero}>
          <View style={[styles.heroBadge, { backgroundColor: accent + '18' }]}>
            <Text style={[styles.heroBadgeText, { color: accent }]}>{template.examType}</Text>
          </View>
          <Text style={styles.heroTitle}>{template.title}</Text>
          {template.description ? (
            <Text style={styles.heroDesc}>{template.description}</Text>
          ) : null}
        </View>

        {/* Stat tiles */}
        <View style={styles.statsRow}>
          <StatTile icon="document-text-outline" value={totalQuestions} label="Total Soal" color={accent} />
          <StatTile icon="time-outline" value={template.durationMinutes} label="Menit" color={accent} />
          <StatTile icon="layers-outline" value={template.sections.length} label="Bagian" color={accent} />
        </View>

        {/* Distribusi */}
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
                  {section.passingScore ? ` · Passing: ${section.passingScore}` : ''}
                </Text>
              </View>
            </View>
          ))}
        </View>

        {/* Rules */}
        <View style={styles.rulesCard}>
          <View style={styles.rulesHeader}>
            <Ionicons name="alert-circle-outline" size={18} color="#D97706" />
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
          activeOpacity={0.9}
          onPress={() => navigation.navigate('TryoutSession', { templateId })}
        >
          <Ionicons name="play" size={18} color={CognitiveCalm.onPrimary} />
          <Text style={styles.startBtnText}>Mulai Tryout</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

function StatTile({
  icon,
  value,
  label,
  color,
}: {
  icon: keyof typeof Ionicons.glyphMap;
  value: string | number;
  label: string;
  color: string;
}) {
  return (
    <View style={styles.statCard}>
      <Ionicons name={icon} size={20} color={color} />
      <Text style={styles.statValue}>{value}</Text>
      <Text style={styles.statLabel}>{label}</Text>
    </View>
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
  safe: { flex: 1, backgroundColor: CognitiveCalm.surface },

  centerBox: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
    gap: 12,
  },
  loadingText: { fontFamily: Fonts.regular, fontSize: 14, color: CognitiveCalm.onSurfaceVariant },
  errorText: {
    fontFamily: Fonts.regular,
    fontSize: 14,
    color: CognitiveCalm.onSurfaceVariant,
    textAlign: 'center',
    lineHeight: 20,
  },

  scroll: { padding: 20, gap: 16, paddingBottom: 32 },

  hero: { gap: 8 },
  heroBadge: {
    alignSelf: 'flex-start',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 8,
  },
  heroBadgeText: {
    fontFamily: Fonts.bold,
    fontSize: 10,
    letterSpacing: 1,
  },
  heroTitle: {
    fontFamily: Fonts.bold,
    fontSize: 22,
    lineHeight: 28,
    color: CognitiveCalm.onSurface,
  },
  heroDesc: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    color: CognitiveCalm.onSurfaceVariant,
    lineHeight: 20,
  },

  statsRow: { flexDirection: 'row', gap: 10 },
  statCard: {
    flex: 1,
    backgroundColor: CognitiveCalm.surfaceContainerLowest,
    borderRadius: 16,
    paddingVertical: 16,
    paddingHorizontal: 8,
    alignItems: 'center',
    gap: 6,
    borderWidth: 1,
    borderColor: '#FFFFFF',
    shadowColor: CognitiveCalm.shadow,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.04,
    shadowRadius: 8,
    elevation: 1,
  },
  statValue: { fontFamily: Fonts.extrabold, fontSize: 22, color: CognitiveCalm.onSurface },
  statLabel: {
    fontFamily: Fonts.regular,
    fontSize: 11,
    color: CognitiveCalm.onSurfaceVariant,
    textAlign: 'center',
  },

  card: {
    backgroundColor: CognitiveCalm.surfaceContainerLowest,
    borderRadius: 18,
    padding: 18,
    gap: 12,
    borderWidth: 1,
    borderColor: '#FFFFFF',
    shadowColor: CognitiveCalm.shadow,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.04,
    shadowRadius: 8,
    elevation: 1,
  },
  cardTitle: {
    fontFamily: Fonts.bold,
    fontSize: 14,
    color: CognitiveCalm.onSurface,
  },

  sectionRow: { flexDirection: 'row', alignItems: 'flex-start', gap: 12 },
  sectionDot: { width: 8, height: 8, borderRadius: 4, marginTop: 6 },
  sectionInfo: { flex: 1 },
  sectionName: {
    fontFamily: Fonts.semibold,
    fontSize: 13,
    color: CognitiveCalm.onSurface,
  },
  sectionMeta: {
    fontFamily: Fonts.regular,
    fontSize: 12,
    color: CognitiveCalm.onSurfaceVariant,
    marginTop: 2,
  },

  rulesCard: {
    backgroundColor: '#FFFBEB',
    borderRadius: 16,
    padding: 16,
    gap: 12,
    borderWidth: 1,
    borderColor: '#FDE68A',
  },
  rulesHeader: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  rulesTitle: { fontFamily: Fonts.bold, fontSize: 14, color: '#D97706' },
  rulesList: { gap: 8 },
  ruleItem: { flexDirection: 'row', gap: 8 },
  ruleBullet: { fontSize: 14, color: '#D97706', lineHeight: 20 },
  ruleText: {
    flex: 1,
    fontFamily: Fonts.regular,
    fontSize: 13,
    color: '#92400E',
    lineHeight: 20,
  },

  footer: {
    backgroundColor: CognitiveCalm.surface,
    padding: 20,
    borderTopWidth: 1,
    borderTopColor: CognitiveCalm.surfaceContainerHigh,
  },
  startBtn: {
    borderRadius: 16,
    paddingVertical: 16,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 8,
    shadowColor: CognitiveCalm.primary,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.25,
    shadowRadius: 10,
    elevation: 3,
  },
  startBtnText: {
    fontFamily: Fonts.bold,
    fontSize: 16,
    color: CognitiveCalm.onPrimary,
    letterSpacing: 0.2,
  },

  primaryBtn: {
    backgroundColor: CognitiveCalm.primary,
    paddingHorizontal: 24,
    paddingVertical: 12,
    borderRadius: 12,
  },
  primaryBtnText: {
    fontFamily: Fonts.semibold,
    fontSize: 14,
    color: CognitiveCalm.onPrimary,
  },
});
