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
import { Colors, CognitiveCalm, Fonts } from '../../constants/colors';
import type { TryoutScreenProps } from '../../navigation/types';
import type { TryoutTemplate, ExamType } from '../../types/exam.types';
import { supabase } from '../../services/supabase';
import { useStore } from '../../store';

const EXAM_COLORS: Record<ExamType, string> = {
  CPNS: CognitiveCalm.primary,
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
  const [filterExam, setFilterExam] = useState<ExamType | 'ALL'>('ALL');

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

  const filtered =
    filterExam === 'ALL'
      ? templates
      : templates.filter((t) => t.examType === filterExam);

  return (
    <SafeAreaView style={styles.safe} edges={['top']}>
      {/* TopAppBar */}
      <View style={styles.topbar}>
        <View style={styles.avatarPlaceholder}>
          <Ionicons name="person-outline" size={16} color={CognitiveCalm.onSurfaceVariant} />
        </View>
        <Text style={styles.wordmark}>Wirago Academy</Text>
        <TouchableOpacity style={styles.iconBtn} activeOpacity={0.7}>
          <Ionicons name="notifications-outline" size={22} color={CognitiveCalm.error} />
        </TouchableOpacity>
      </View>

      <ScrollView
        contentContainerStyle={styles.scroll}
        showsVerticalScrollIndicator={false}
        refreshControl={<RefreshControl refreshing={refreshing} onRefresh={onRefresh} />}
      >
        {/* Page intro */}
        <View style={styles.intro}>
          <Text style={styles.title}>Tryout Resmi</Text>
          <Text style={styles.subtitle}>
            Simulasi ujian lengkap dengan durasi & skor untuk mematangkan persiapanmu.
          </Text>
        </View>

        {/* Count + filter row */}
        <View style={styles.metaRow}>
          <Text style={styles.metaCount}>
            {loading ? '…' : `${filtered.length} paket tersedia`}
          </Text>
          <FilterChip
            label="Filter"
            active={filterExam !== 'ALL'}
            onPress={() => cycleFilter(filterExam, setFilterExam)}
          />
        </View>

        {!isOnline ? (
          <View style={styles.offlineBanner}>
            <Ionicons name="cloud-offline-outline" size={18} color={CognitiveCalm.error} />
            <Text style={styles.offlineText}>
              Mode offline. Daftar tryout mungkin tidak terbaru.
            </Text>
          </View>
        ) : null}

        {loading ? (
          <View style={styles.centerBox}>
            <ActivityIndicator size="large" color={CognitiveCalm.primary} />
            <Text style={styles.loadingText}>Memuat daftar tryout…</Text>
          </View>
        ) : error ? (
          <View style={styles.errorBox}>
            <Ionicons name="alert-circle-outline" size={48} color={CognitiveCalm.error} />
            <Text style={styles.errorText}>{error}</Text>
            <TouchableOpacity style={styles.retryBtn} onPress={onRefresh}>
              <Text style={styles.retryBtnText}>Coba lagi</Text>
            </TouchableOpacity>
          </View>
        ) : filtered.length === 0 ? (
          <View style={styles.emptyBox}>
            <Ionicons name="hourglass-outline" size={48} color={CognitiveCalm.outline} />
            <Text style={styles.emptyTitle}>Belum ada tryout tersedia</Text>
            <Text style={styles.emptyDesc}>
              Admin belum mempublish paket tryout untuk filter ini. Pull to refresh.
            </Text>
          </View>
        ) : (
          filtered.map((tpl, idx) => (
            <TryoutCard
              key={tpl.id}
              tpl={tpl}
              featured={idx === 0 && filtered.length > 1}
              onPress={() => navigation.navigate('TryoutDetail', { templateId: tpl.id })}
            />
          ))
        )}
      </ScrollView>
    </SafeAreaView>
  );
}

function FilterChip({
  label,
  active,
  onPress,
}: {
  label: string;
  active: boolean;
  onPress: () => void;
}) {
  return (
    <TouchableOpacity
      onPress={onPress}
      style={[styles.filterChip, active && styles.filterChipActive]}
      activeOpacity={0.8}
    >
      <Ionicons
        name="filter-outline"
        size={14}
        color={active ? CognitiveCalm.onPrimary : CognitiveCalm.primary}
      />
      <Text style={[styles.filterChipText, active && styles.filterChipTextActive]}>
        {label}
      </Text>
    </TouchableOpacity>
  );
}

// Cycle filter: ALL → CPNS → TNI → POLRI → ALL
function cycleFilter(
  current: ExamType | 'ALL',
  set: React.Dispatch<React.SetStateAction<ExamType | 'ALL'>>,
) {
  const order: (ExamType | 'ALL')[] = ['ALL', 'CPNS', 'TNI', 'POLRI'];
  const next = order[(order.indexOf(current) + 1) % order.length];
  set(next);
}

function TryoutCard({
  tpl,
  featured,
  onPress,
}: {
  tpl: TryoutTemplate;
  featured: boolean;
  onPress: () => void;
}) {
  const color = EXAM_COLORS[tpl.examType] ?? CognitiveCalm.primary;
  const icon = EXAM_ICONS[tpl.examType] ?? 'document-text-outline';
  const totalQuestions = tpl.sections.reduce((s, sec) => s + sec.questionCount, 0);

  if (featured) {
    return (
      <TouchableOpacity style={styles.cardFeatured} activeOpacity={0.9} onPress={onPress}>
        <View style={[styles.featuredTopAccent, { backgroundColor: color }]} />
        <View style={styles.cardBody}>
          <View style={styles.cardHeader}>
            <View style={[styles.cardIconBox, { backgroundColor: color + '18' }]}>
              <Ionicons name={icon} size={26} color={color} />
            </View>
            <View style={styles.cardTitleGroup}>
              <Text style={styles.cardTitle}>{tpl.title}</Text>
              {tpl.description ? (
                <Text style={styles.cardSubtitle} numberOfLines={2}>
                  {tpl.description}
                </Text>
              ) : null}
            </View>
            <View style={styles.featuredBadges}>
              <View style={styles.popularBadge}>
                <Text style={styles.popularBadgeText}>POPULER</Text>
              </View>
              <View style={[styles.examChip, { backgroundColor: color + '18' }]}>
                <Text style={[styles.examChipText, { color }]}>{tpl.examType}</Text>
              </View>
            </View>
          </View>

          <View style={styles.statsBox}>
            <StatItem icon="document-text-outline" value={`${totalQuestions} Soal`} color={color} />
            <View style={styles.statsDivider} />
            <StatItem icon="time-outline" value={`${tpl.durationMinutes} Menit`} color={color} />
            <View style={styles.statsDivider} />
            <StatItem icon="layers-outline" value={`${tpl.sections.length} Bagian`} color={color} />
          </View>

          <View style={styles.featuredCtaRow}>
            <View style={styles.pesertaStack}>
              <View style={[styles.pesertaDot, { backgroundColor: color + '40', zIndex: 3 }]} />
              <View style={[styles.pesertaDot, styles.pesertaDotMid, { zIndex: 2 }]} />
              <View style={[styles.pesertaDot, styles.pesertaDotEnd, { zIndex: 1 }]} />
              <Text style={styles.pesertaText}>Banyak peserta</Text>
            </View>
            <TouchableOpacity
              style={[styles.featuredCta, { backgroundColor: color }]}
              activeOpacity={0.9}
              onPress={onPress}
            >
              <Text style={styles.featuredCtaText}>Lihat Detail</Text>
              <Ionicons name="arrow-forward" size={16} color={CognitiveCalm.onPrimary} />
            </TouchableOpacity>
          </View>
        </View>
      </TouchableOpacity>
    );
  }

  return (
    <TouchableOpacity
      style={[styles.cardRegular, { borderLeftColor: color }]}
      activeOpacity={0.9}
      onPress={onPress}
    >
      <View style={styles.cardHeader}>
        <View style={[styles.cardIconBox, { backgroundColor: color + '14' }]}>
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
        <View style={[styles.examChip, { backgroundColor: color + '14' }]}>
          <Text style={[styles.examChipText, { color }]}>{tpl.examType}</Text>
        </View>
      </View>

      <View style={styles.statsRow}>
        <StatItem
          icon="document-text-outline"
          value={`${totalQuestions} soal`}
          color={CognitiveCalm.onSurfaceVariant}
          mini
        />
        <View style={styles.statDot} />
        <StatItem
          icon="time-outline"
          value={`${tpl.durationMinutes} menit`}
          color={CognitiveCalm.onSurfaceVariant}
          mini
        />
        <View style={styles.statDot} />
        <StatItem
          icon="layers-outline"
          value={`${tpl.sections.length} bagian`}
          color={CognitiveCalm.onSurfaceVariant}
          mini
        />
      </View>

      <View style={styles.cardFooter}>
        <Text style={[styles.detailLink, { color }]}>Lihat Detail</Text>
        <Ionicons name="chevron-forward" size={14} color={color} />
      </View>
    </TouchableOpacity>
  );
}

function StatItem({
  icon,
  value,
  color,
  mini,
}: {
  icon: keyof typeof Ionicons.glyphMap;
  value: string;
  color: string;
  mini?: boolean;
}) {
  return (
    <View style={mini ? styles.statItemMini : styles.statItem}>
      <Ionicons name={icon} size={mini ? 13 : 18} color={color} />
      <Text style={[mini ? styles.statTextMini : styles.statText, { color }]}>{value}</Text>
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

  topbar: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: 20,
    paddingVertical: 12,
    backgroundColor: CognitiveCalm.surface,
    borderBottomWidth: 1,
    borderBottomColor: CognitiveCalm.surfaceContainerHigh,
  },
  avatarPlaceholder: {
    width: 36,
    height: 36,
    borderRadius: 18,
    backgroundColor: CognitiveCalm.surfaceContainer,
    alignItems: 'center',
    justifyContent: 'center',
  },
  wordmark: {
    fontFamily: Fonts.bold,
    fontSize: 20,
    color: CognitiveCalm.primary,
    letterSpacing: -0.4,
  },
  iconBtn: {
    width: 40,
    height: 40,
    borderRadius: 20,
    alignItems: 'center',
    justifyContent: 'center',
  },

  scroll: { paddingBottom: 40, gap: 16 },

  intro: { paddingHorizontal: 20, paddingTop: 20, gap: 4 },
  title: {
    fontFamily: Fonts.bold,
    fontSize: 24,
    lineHeight: 32,
    color: CognitiveCalm.onSurface,
  },
  subtitle: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    lineHeight: 20,
    color: CognitiveCalm.onSurfaceVariant,
  },

  metaRow: {
    paddingHorizontal: 20,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  metaCount: {
    fontFamily: Fonts.medium,
    fontSize: 13,
    color: CognitiveCalm.onSurfaceVariant,
  },

  filterChip: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    paddingHorizontal: 10,
    paddingVertical: 6,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: CognitiveCalm.primary,
    backgroundColor: 'transparent',
  },
  filterChipActive: {
    backgroundColor: CognitiveCalm.primary,
  },
  filterChipText: {
    fontFamily: Fonts.semibold,
    fontSize: 12,
    color: CognitiveCalm.primary,
  },
  filterChipTextActive: { color: CognitiveCalm.onPrimary },

  offlineBanner: {
    marginHorizontal: 20,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    backgroundColor: CognitiveCalm.errorContainer,
    borderRadius: 12,
    padding: 12,
    borderWidth: 1,
    borderColor: CognitiveCalm.error + '30',
  },
  offlineText: {
    flex: 1,
    fontFamily: Fonts.medium,
    fontSize: 12,
    color: CognitiveCalm.error,
  },

  centerBox: { alignItems: 'center', gap: 12, paddingVertical: 48 },
  loadingText: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    color: CognitiveCalm.onSurfaceVariant,
  },

  errorBox: { alignItems: 'center', gap: 12, paddingVertical: 32 },
  errorText: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    color: CognitiveCalm.onSurfaceVariant,
    textAlign: 'center',
    lineHeight: 20,
    paddingHorizontal: 24,
  },
  retryBtn: {
    backgroundColor: CognitiveCalm.primary,
    paddingHorizontal: 20,
    paddingVertical: 10,
    borderRadius: 10,
  },
  retryBtnText: {
    fontFamily: Fonts.semibold,
    fontSize: 13,
    color: CognitiveCalm.onPrimary,
  },

  emptyBox: { alignItems: 'center', gap: 8, paddingVertical: 48 },
  emptyTitle: {
    fontFamily: Fonts.bold,
    fontSize: 15,
    color: CognitiveCalm.onSurface,
    marginTop: 6,
  },
  emptyDesc: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    color: CognitiveCalm.onSurfaceVariant,
    textAlign: 'center',
    paddingHorizontal: 32,
    lineHeight: 20,
  },

  // Featured card (first item, popular)
  cardFeatured: {
    marginHorizontal: 20,
    borderRadius: 20,
    backgroundColor: CognitiveCalm.surfaceContainerLowest,
    overflow: 'hidden',
    shadowColor: CognitiveCalm.shadow,
    shadowOffset: { width: 0, height: 6 },
    shadowOpacity: 0.08,
    shadowRadius: 16,
    elevation: 3,
  },
  featuredTopAccent: { height: 6, width: '100%' },
  cardBody: { padding: 18, gap: 16 },

  cardHeader: { flexDirection: 'row', alignItems: 'flex-start', gap: 12 },
  cardIconBox: {
    width: 48,
    height: 48,
    borderRadius: 14,
    alignItems: 'center',
    justifyContent: 'center',
  },
  cardTitleGroup: { flex: 1, gap: 2 },
  cardTitle: {
    fontFamily: Fonts.bold,
    fontSize: 15,
    lineHeight: 20,
    color: CognitiveCalm.onSurface,
  },
  cardSubtitle: {
    fontFamily: Fonts.regular,
    fontSize: 12,
    lineHeight: 17,
    color: CognitiveCalm.onSurfaceVariant,
  },

  featuredBadges: { alignItems: 'flex-end', gap: 6 },
  popularBadge: {
    backgroundColor: '#0F0A08',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 999,
  },
  popularBadgeText: {
    fontFamily: Fonts.bold,
    fontSize: 9,
    color: '#FFFFFF',
    letterSpacing: 0.5,
  },
  examChip: {
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 8,
  },
  examChipText: { fontFamily: Fonts.bold, fontSize: 10, letterSpacing: 0.3 },

  statsBox: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    backgroundColor: CognitiveCalm.surfaceContainer,
    borderRadius: 14,
    paddingVertical: 12,
    paddingHorizontal: 8,
  },
  statItem: {
    flex: 1,
    flexDirection: 'column',
    alignItems: 'center',
    gap: 4,
  },
  statText: {
    fontFamily: Fonts.semibold,
    fontSize: 13,
  },
  statsDivider: {
    width: 1,
    height: 24,
    backgroundColor: CognitiveCalm.outlineVariant + '50',
  },

  featuredCtaRow: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    gap: 12,
  },
  pesertaStack: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
  },
  pesertaDot: {
    width: 22,
    height: 22,
    borderRadius: 11,
    borderWidth: 2,
    borderColor: CognitiveCalm.surfaceContainerLowest,
    marginRight: -8,
  },
  pesertaDotMid: { backgroundColor: '#A7C7E720' },
  pesertaDotEnd: { backgroundColor: '#FFDAD420' },
  pesertaText: {
    fontFamily: Fonts.medium,
    fontSize: 11,
    color: CognitiveCalm.onSurfaceVariant,
    marginLeft: 8,
  },
  featuredCta: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    paddingHorizontal: 18,
    paddingVertical: 12,
    borderRadius: 12,
  },
  featuredCtaText: {
    fontFamily: Fonts.bold,
    fontSize: 14,
    color: CognitiveCalm.onPrimary,
    letterSpacing: 0.2,
  },

  // Regular card
  cardRegular: {
    marginHorizontal: 20,
    backgroundColor: CognitiveCalm.surfaceContainerLowest,
    borderRadius: 16,
    padding: 18,
    gap: 12,
    borderLeftWidth: 4,
    shadowColor: CognitiveCalm.shadow,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.05,
    shadowRadius: 8,
    elevation: 2,
  },

  statsRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    paddingTop: 8,
    borderTopWidth: 1,
    borderTopColor: CognitiveCalm.outlineVariant + '30',
    flexWrap: 'wrap',
  },
  statItemMini: { flexDirection: 'row', alignItems: 'center', gap: 4 },
  statTextMini: { fontFamily: Fonts.regular, fontSize: 12 },
  statDot: {
    width: 3,
    height: 3,
    borderRadius: 1.5,
    backgroundColor: CognitiveCalm.outlineVariant,
  },

  cardFooter: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'flex-end',
    gap: 4,
  },
  detailLink: { fontFamily: Fonts.bold, fontSize: 13 },
});
