import React, { useEffect, useMemo, useState } from 'react';
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
import { Colors, Stitch, Fonts } from '../../constants/colors';
import {
  EXAM_CONFIGS,
  type SubjectType,
} from '../../types/exam.types';
import type { LatihanScreenProps } from '../../navigation/types';
import type { QuestionPack } from '../../types/question.types';
import { DownloadService } from '../../services/DownloadService';

const SUBJECT_COLORS: Partial<Record<SubjectType, string>> = {
  TWK: Colors.twk,
  TIU: Colors.tiu,
  TKP: Colors.tkp,
  MATEMATIKA: Colors.math,
  BAHASA_INDONESIA: Colors.indo,
  PENGETAHUAN_UMUM: Colors.umum,
  PSIKOTES: Colors.levelBadge,
  KEDINASAN: Colors.tni,
  PENGETAHUAN_HUKUM: Colors.hukum,
};

const SUBJECT_ICONS: Partial<Record<SubjectType, keyof typeof Ionicons.glyphMap>> = {
  TWK: 'flag-outline',
  TIU: 'bulb-outline',
  TKP: 'person-outline',
  MATEMATIKA: 'calculator-outline',
  BAHASA_INDONESIA: 'book-outline',
  PENGETAHUAN_UMUM: 'globe-outline',
  PSIKOTES: 'fitness-outline',
  KEDINASAN: 'shield-outline',
  PENGETAHUAN_HUKUM: 'document-text-outline',
};

type Filter = 'ALL' | SubjectType;

export function CategoryListScreen({ route, navigation }: LatihanScreenProps<'CategoryList'>) {
  const { examType } = route.params;
  const config = EXAM_CONFIGS[examType];

  const examColorMap: Record<string, string> = {
    CPNS: Colors.cpns,
    TNI: Colors.tni,
    POLRI: Colors.polri,
  };
  const accentColor = examColorMap[examType] ?? Colors.primary;

  const [packs, setPacks] = useState<QuestionPack[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [filter, setFilter] = useState<Filter>('ALL');

  useEffect(() => {
    let cancelled = false;
    setLoading(true);
    DownloadService.listAvailablePacks(examType)
      .then((data) => {
        if (cancelled) return;
        setPacks(data);
        setError(null);
      })
      .catch((e) => {
        if (cancelled) return;
        setError(e?.message ?? 'Gagal memuat paket soal');
      })
      .finally(() => {
        if (!cancelled) setLoading(false);
      });
    return () => {
      cancelled = true;
    };
  }, [examType]);

  const filteredPacks = useMemo(() => {
    if (filter === 'ALL') return packs;
    return packs.filter((p) => p.subject === filter);
  }, [packs, filter]);

  const totalSoal = useMemo(
    () => filteredPacks.reduce((sum, p) => sum + (p.questionCount || 0), 0),
    [filteredPacks],
  );

  return (
    <SafeAreaView style={styles.safe} edges={['top']}>
      <View style={styles.header}>
        <TouchableOpacity style={styles.backBtn} onPress={() => navigation.goBack()}>
          <Ionicons name="arrow-back" size={22} color={Colors.textPrimary} />
        </TouchableOpacity>
        <View style={styles.headerText}>
          <View style={[styles.examBadge, { backgroundColor: accentColor }]}>
            <Text style={styles.examBadgeText}>{config.label}</Text>
          </View>
          <Text style={styles.headerTitle}>Pilih Paket Soal</Text>
          <Text style={styles.headerSubtitle}>{config.description}</Text>
        </View>
      </View>

      <View style={styles.tabRowWrapper}>
        <ScrollView
          horizontal
          showsHorizontalScrollIndicator={false}
          contentContainerStyle={styles.tabRow}
        >
          <FilterTab
            label="Semua"
            active={filter === 'ALL'}
            accentColor={accentColor}
            onPress={() => setFilter('ALL')}
          />
          {config.subjects.map((subject) => {
            const color = SUBJECT_COLORS[subject] ?? accentColor;
            return (
              <FilterTab
                key={subject}
                label={subject}
                active={filter === subject}
                accentColor={color}
                onPress={() => setFilter(subject)}
              />
            );
          })}
        </ScrollView>
      </View>

      <View style={styles.listMeta}>
        <Text style={styles.metaText}>
          {filteredPacks.length} paket • {totalSoal} soal
        </Text>
      </View>

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>
        {loading ? (
          <View style={styles.center}>
            <ActivityIndicator color={accentColor} />
            <Text style={styles.centerText}>Memuat paket soal...</Text>
          </View>
        ) : error ? (
          <View style={styles.center}>
            <Ionicons name="alert-circle-outline" size={36} color={Colors.error} />
            <Text style={styles.centerText}>{error}</Text>
          </View>
        ) : filteredPacks.length === 0 ? (
          <View style={styles.emptyState}>
            <View style={styles.emptyIllustration}>
              <Ionicons name="bulb" size={72} color={Stitch.primary} />
            </View>
            <Text style={styles.emptyTitle}>Belum ada paket soal yang dibuka</Text>
            <Text style={styles.emptyDesc}>
              Ayo mulai langkah pertamamu! Pilih paket soal persiapan {config.label} yang
              tersedia dan ukur kemampuanmu sekarang.
            </Text>
            <TouchableOpacity
              style={styles.emptyCta}
              activeOpacity={0.85}
              onPress={() => (filter === 'ALL' ? navigation.goBack() : setFilter('ALL'))}
            >
              <Text style={styles.emptyCtaText}>
                {filter === 'ALL' ? 'Pilih Ujian Lain' : 'Lihat Semua Paket'}
              </Text>
              <Ionicons name="arrow-forward" size={20} color={Stitch.onPrimary} />
            </TouchableOpacity>
          </View>
        ) : (
          filteredPacks.map((pack) => {
            const color = SUBJECT_COLORS[pack.subject] ?? accentColor;
            const iconName = SUBJECT_ICONS[pack.subject] ?? 'document-text-outline';
            return (
              <TouchableOpacity
                key={pack.id}
                style={styles.packCard}
                activeOpacity={0.85}
                onPress={() =>
                  navigation.navigate('PracticeSession', {
                    examType,
                    subject: pack.subject,
                    packId: pack.id,
                    questionCount: Math.max(1, pack.questionCount || 10),
                  })
                }
              >
                <View style={[styles.iconBox, { backgroundColor: color + '18' }]}>
                  <Ionicons name={iconName} size={22} color={color} />
                </View>
                <View style={styles.packBody}>
                  <View style={styles.titleRow}>
                    <Text style={[styles.subjectChip, { backgroundColor: color + '20', color }]}>
                      {pack.subject}
                    </Text>
                  </View>
                  <Text style={styles.packTitle} numberOfLines={2}>
                    {pack.title}
                  </Text>
                  {pack.description ? (
                    <Text style={styles.packDesc} numberOfLines={2}>
                      {pack.description}
                    </Text>
                  ) : null}
                </View>
                <View style={styles.packRight}>
                  <Text style={[styles.packCount, { color }]}>{pack.questionCount || '-'}</Text>
                  <Text style={styles.packCountLabel}>soal</Text>
                  <Ionicons
                    name="chevron-forward"
                    size={16}
                    color={Colors.gray400}
                    style={{ marginTop: 4 }}
                  />
                </View>
              </TouchableOpacity>
            );
          })
        )}

        {!loading && filteredPacks.length > 0 ? (
          <View style={styles.infoBox}>
            <Ionicons name="information-circle-outline" size={16} color={Colors.info} />
            <Text style={styles.infoText}>
              Tap paket untuk mulai latihan. Kamu bisa mengulang paket yang sama berkali-kali.
            </Text>
          </View>
        ) : null}
      </ScrollView>
    </SafeAreaView>
  );
}

function FilterTab({
  label,
  active,
  accentColor,
  onPress,
}: {
  label: string;
  active: boolean;
  accentColor: string;
  onPress: () => void;
}) {
  return (
    <TouchableOpacity
      style={[
        styles.filterTab,
        active && { backgroundColor: accentColor, borderColor: accentColor },
      ]}
      onPress={onPress}
      activeOpacity={0.8}
    >
      <Text style={[styles.filterTabText, active && styles.filterTabTextActive]}>{label}</Text>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },

  header: {
    backgroundColor: Colors.white,
    paddingHorizontal: 20,
    paddingTop: 12,
    paddingBottom: 16,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
    gap: 8,
  },
  backBtn: { width: 36, height: 36, justifyContent: 'center' },
  headerText: { gap: 4 },
  examBadge: {
    alignSelf: 'flex-start',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 6,
    marginBottom: 4,
  },
  examBadgeText: { fontSize: 11, fontWeight: '800', color: Colors.white, letterSpacing: 1 },
  headerTitle: { fontSize: 20, fontWeight: '800', color: Colors.textPrimary, letterSpacing: -0.3 },
  headerSubtitle: { fontSize: 13, color: Colors.textSecondary },

  tabRowWrapper: {
    backgroundColor: Colors.white,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },
  tabRow: {
    paddingHorizontal: 16,
    paddingVertical: 10,
    alignItems: 'center',
  },
  filterTab: {
    minHeight: 36,
    paddingHorizontal: 16,
    paddingVertical: 6,
    marginRight: 8,
    borderRadius: 20,
    borderWidth: 1.5,
    borderColor: Colors.border,
    backgroundColor: Colors.white,
    alignItems: 'center',
    justifyContent: 'center',
  },
  filterTabText: {
    fontSize: 13,
    fontWeight: '700',
    color: Colors.textPrimary,
    textAlign: 'center',
    includeFontPadding: false,
  },
  filterTabTextActive: { color: '#FFFFFF' },

  listMeta: {
    paddingHorizontal: 20,
    paddingTop: 12,
    paddingBottom: 8,
  },
  metaText: { fontSize: 12, color: Colors.textMuted, fontWeight: '600' },

  scroll: { paddingHorizontal: 20, paddingBottom: 40, gap: 10 },

  center: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 40,
    gap: 10,
  },
  centerText: { fontSize: 13, color: Colors.textSecondary, textAlign: 'center', paddingHorizontal: 20 },

  emptyState: { alignItems: 'center', justifyContent: 'center', paddingVertical: 48, paddingHorizontal: 8 },
  emptyIllustration: {
    width: 180, height: 180, borderRadius: 90,
    backgroundColor: Stitch.surfaceContainerLowest,
    alignItems: 'center', justifyContent: 'center', marginBottom: 28,
    shadowColor: Stitch.shadow, shadowOffset: { width: 0, height: 12 },
    shadowOpacity: 0.06, shadowRadius: 40, elevation: 4,
  },
  emptyTitle: {
    fontFamily: Fonts.bold, fontSize: 20, lineHeight: 28,
    color: Stitch.onSurface, textAlign: 'center', marginBottom: 12,
  },
  emptyDesc: {
    fontFamily: Fonts.regular, fontSize: 14, lineHeight: 20,
    color: Stitch.secondary, textAlign: 'center', maxWidth: 320, marginBottom: 32,
  },
  emptyCta: {
    flexDirection: 'row', alignItems: 'center', justifyContent: 'center', gap: 8,
    backgroundColor: Stitch.primary, borderRadius: 8,
    paddingVertical: 16, paddingHorizontal: 32, alignSelf: 'stretch',
    shadowColor: Stitch.shadow, shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.08, shadowRadius: 6, elevation: 2,
  },
  emptyCtaText: { fontFamily: Fonts.semibold, fontSize: 14, color: Stitch.onPrimary, letterSpacing: 0.2 },

  packCard: {
    backgroundColor: Colors.white,
    borderRadius: 14,
    padding: 14,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  iconBox: {
    width: 42,
    height: 42,
    borderRadius: 12,
    justifyContent: 'center',
    alignItems: 'center',
  },
  packBody: { flex: 1, gap: 4 },
  titleRow: { flexDirection: 'row' },
  subjectChip: {
    alignSelf: 'flex-start',
    fontSize: 10,
    fontWeight: '700',
    paddingHorizontal: 6,
    paddingVertical: 2,
    borderRadius: 4,
    overflow: 'hidden',
  },
  packTitle: { fontSize: 14, fontWeight: '700', color: Colors.textPrimary, lineHeight: 18 },
  packDesc: { fontSize: 11, color: Colors.textSecondary, lineHeight: 15 },

  packRight: { alignItems: 'center', minWidth: 40 },
  packCount: { fontSize: 20, fontWeight: '800' },
  packCountLabel: { fontSize: 9, color: Colors.textMuted },

  infoBox: {
    flexDirection: 'row',
    gap: 8,
    backgroundColor: '#EFF6FF',
    borderRadius: 10,
    padding: 12,
    borderWidth: 1,
    borderColor: '#BFDBFE',
    marginTop: 6,
  },
  infoText: { flex: 1, fontSize: 12, color: Colors.info, lineHeight: 18 },
});
