import React, { useCallback, useEffect, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  ActivityIndicator,
  RefreshControl,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import type { TryoutScreenProps } from '../../navigation/types';
import type { TryoutTemplate, ExamType } from '../../types/exam.types';
import { supabase } from '../../services/supabase';
import { useStore } from '../../store';

const EXAM_COLORS: Record<ExamType, string> = {
  CPNS: Colors.cpns,
  TNI: Colors.tni,
  POLRI: Colors.polri,
};

const EXAM_ICONS: Record<ExamType, keyof typeof Ionicons.glyphMap> = {
  CPNS: 'business-outline',
  TNI: 'shield-half-outline',
  POLRI: 'shield-checkmark-outline',
};

export function TryoutListScreen({ navigation }: TryoutScreenProps<'TryoutList'>) {
  const isOnline = useStore((s) => s.isOnline);
  const [templates, setTemplates] = useState<TryoutTemplate[]>([]);
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const load = useCallback(async () => {
    setError(null);
    try {
      const { data, error } = await supabase
        .from('tryout_templates')
        .select('*')
        .eq('is_published', true)
        .order('created_at', { ascending: false });
      if (error) throw new Error(error.message);
      setTemplates((data ?? []).map(mapTemplate));
    } catch (e: any) {
      setError(`Gagal memuat daftar tryout: ${e?.message ?? 'unknown error'}`);
    }
  }, []);

  useEffect(() => {
    (async () => {
      setLoading(true);
      await load();
      setLoading(false);
    })();
  }, [load]);

  const onRefresh = useCallback(async () => {
    setRefreshing(true);
    await load();
    setRefreshing(false);
  }, [load]);

  return (
    <SafeAreaView style={styles.safe}>
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Tryout Resmi</Text>
        <Text style={styles.headerSubtitle}>Simulasi ujian lengkap dengan durasi & skor</Text>
      </View>

      <ScrollView
        contentContainerStyle={styles.scroll}
        showsVerticalScrollIndicator={false}
        refreshControl={<RefreshControl refreshing={refreshing} onRefresh={onRefresh} />}
      >
        {!isOnline ? (
          <View style={styles.offlineBanner}>
            <Ionicons name="cloud-offline-outline" size={18} color={Colors.warning} />
            <Text style={styles.offlineText}>
              Mode offline. Daftar tryout mungkin tidak terbaru.
            </Text>
          </View>
        ) : null}

        {loading ? (
          <View style={styles.centerBox}>
            <ActivityIndicator size="large" color={Colors.primary} />
            <Text style={styles.loadingText}>Memuat daftar tryoutâ€¦</Text>
          </View>
        ) : error ? (
          <View style={styles.errorBox}>
            <Ionicons name="alert-circle-outline" size={48} color={Colors.error} />
            <Text style={styles.errorText}>{error}</Text>
            <TouchableOpacity style={styles.retryBtn} onPress={onRefresh}>
              <Text style={styles.retryBtnText}>Coba lagi</Text>
            </TouchableOpacity>
          </View>
        ) : templates.length === 0 ? (
          <View style={styles.emptyBox}>
            <Ionicons name="hourglass-outline" size={48} color={Colors.textMuted} />
            <Text style={styles.emptyTitle}>Belum ada tryout tersedia</Text>
            <Text style={styles.emptyDesc}>
              Admin belum mempublish paket tryout. Coba kembali nanti atau pull-to-refresh.
            </Text>
          </View>
        ) : (
          <>
            <Text style={styles.sectionTitle}>{templates.length} paket tersedia</Text>
            {templates.map((tpl) => {
              const color = EXAM_COLORS[tpl.examType] ?? Colors.primary;
              const icon = EXAM_ICONS[tpl.examType] ?? 'document-text-outline';
              const totalQuestions = tpl.sections.reduce((s, sec) => s + sec.questionCount, 0);
              return (
                <TouchableOpacity
                  key={tpl.id}
                  style={[styles.card, { borderLeftColor: color }]}
                  activeOpacity={0.85}
                  onPress={() => navigation.navigate('TryoutDetail', { templateId: tpl.id })}
                >
                  <View style={styles.cardHeader}>
                    <View style={[styles.iconBox, { backgroundColor: color + '18' }]}>
                      <Ionicons name={icon} size={24} color={color} />
                    </View>
                    <View style={styles.cardTitleGroup}>
                      <Text style={styles.cardTitle}>{tpl.title}</Text>
                      {tpl.description ? (
                        <Text style={styles.cardSubtitle} numberOfLines={1}>
                          {tpl.description}
                        </Text>
                      ) : null}
                    </View>
                    <View style={[styles.examBadge, { backgroundColor: color + '18' }]}>
                      <Text style={[styles.examBadgeText, { color }]}>{tpl.examType}</Text>
                    </View>
                  </View>

                  <View style={styles.statsRow}>
                    <View style={styles.statItem}>
                      <Ionicons name="document-text-outline" size={13} color={Colors.textSecondary} />
                      <Text style={styles.statText}>{totalQuestions} soal</Text>
                    </View>
                    <View style={styles.statDot} />
                    <View style={styles.statItem}>
                      <Ionicons name="time-outline" size={13} color={Colors.textSecondary} />
                      <Text style={styles.statText}>{tpl.durationMinutes} menit</Text>
                    </View>
                    <View style={styles.statDot} />
                    <View style={styles.statItem}>
                      <Ionicons name="layers-outline" size={13} color={Colors.textSecondary} />
                      <Text style={styles.statText}>{tpl.sections.length} bagian</Text>
                    </View>
                  </View>

                  <View style={styles.cardFooter}>
                    <Text style={[styles.startText, { color }]}>Lihat Detail</Text>
                    <Ionicons name="chevron-forward" size={16} color={color} />
                  </View>
                </TouchableOpacity>
              );
            })}
          </>
        )}
      </ScrollView>
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

  scroll: { padding: 20, gap: 14, paddingBottom: 40 },
  sectionTitle: { fontSize: 13, fontWeight: '600', color: Colors.textSecondary },

  offlineBanner: {
    flexDirection: 'row',
    gap: 8,
    backgroundColor: '#FFFBEB',
    borderRadius: 10,
    padding: 12,
    borderWidth: 1,
    borderColor: '#FDE68A',
    alignItems: 'center',
  },
  offlineText: { flex: 1, fontSize: 12, color: Colors.warning, fontWeight: '500' },

  centerBox: { alignItems: 'center', gap: 12, paddingVertical: 48 },
  loadingText: { fontSize: 13, color: Colors.textSecondary },

  errorBox: { alignItems: 'center', gap: 12, paddingVertical: 32 },
  errorText: { fontSize: 13, color: Colors.textSecondary, textAlign: 'center', lineHeight: 20 },
  retryBtn: {
    backgroundColor: Colors.primary,
    paddingHorizontal: 20,
    paddingVertical: 10,
    borderRadius: 10,
  },
  retryBtnText: { fontSize: 13, fontWeight: '700', color: Colors.white },

  emptyBox: { alignItems: 'center', gap: 8, paddingVertical: 48 },
  emptyTitle: { fontSize: 15, fontWeight: '700', color: Colors.textPrimary, marginTop: 6 },
  emptyDesc: {
    fontSize: 13,
    color: Colors.textSecondary,
    textAlign: 'center',
    paddingHorizontal: 24,
    lineHeight: 20,
  },

  card: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 18,
    gap: 14,
    borderLeftWidth: 4,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.07,
    shadowRadius: 8,
    elevation: 2,
  },
  cardHeader: { flexDirection: 'row', alignItems: 'center', gap: 14 },
  iconBox: {
    width: 50,
    height: 50,
    borderRadius: 14,
    justifyContent: 'center',
    alignItems: 'center',
  },
  cardTitleGroup: { flex: 1 },
  cardTitle: { fontSize: 15, fontWeight: '800', color: Colors.textPrimary },
  cardSubtitle: { fontSize: 12, color: Colors.textSecondary, marginTop: 2 },
  examBadge: { paddingHorizontal: 10, paddingVertical: 4, borderRadius: 8 },
  examBadgeText: { fontSize: 11, fontWeight: '700' },

  statsRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    paddingTop: 6,
    borderTopWidth: 1,
    borderTopColor: Colors.gray100,
    flexWrap: 'wrap',
  },
  statItem: { flexDirection: 'row', alignItems: 'center', gap: 4 },
  statText: { fontSize: 12, color: Colors.textSecondary },
  statDot: { width: 3, height: 3, borderRadius: 1.5, backgroundColor: Colors.gray300 },

  cardFooter: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'flex-end',
    gap: 4,
  },
  startText: { fontSize: 13, fontWeight: '700' },
});
