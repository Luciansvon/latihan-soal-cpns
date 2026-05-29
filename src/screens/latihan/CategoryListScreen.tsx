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
import { CognitiveCalm, Fonts } from '../../constants/colors';
import {
  EXAM_CONFIGS,
  SUBJECT_LABELS,
  type ExamType,
  type SubjectType,
} from '../../types/exam.types';
import type { LatihanScreenProps } from '../../navigation/types';
import type { QuestionPack } from '../../types/question.types';
import { DownloadService } from '../../services/DownloadService';

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

const EXAM_TABS: ExamType[] = ['CPNS', 'TNI', 'POLRI'];

export function CategoryListScreen({ route, navigation }: LatihanScreenProps<'CategoryList'>) {
  const { examType } = route.params;
  const config = EXAM_CONFIGS[examType];

  const [packs, setPacks] = useState<QuestionPack[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

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

  const handleRandomStart = () => {
    if (packs.length === 0) return;
    const pick = packs[Math.floor(Math.random() * packs.length)];
    navigation.navigate('PracticeSession', {
      examType,
      subject: pick.subject,
      packId: pick.id,
      questionCount: Math.max(1, pick.questionCount || 10),
    });
  };

  return (
    <SafeAreaView style={styles.safe} edges={['top']}>
      {/* TopAppBar — glass surface with back + wordmark + bell */}
      <View style={styles.topbar}>
        <TouchableOpacity
          style={styles.iconBtn}
          onPress={() => navigation.goBack()}
          activeOpacity={0.7}
        >
          <Ionicons name="arrow-back" size={22} color={CognitiveCalm.onSurface} />
        </TouchableOpacity>
        <Text style={styles.wordmark}>Wirago Academy</Text>
        <TouchableOpacity style={styles.iconBtn} activeOpacity={0.7}>
          <Ionicons name="notifications-outline" size={22} color={CognitiveCalm.error} />
        </TouchableOpacity>
      </View>

      <ScrollView
        contentContainerStyle={styles.scroll}
        showsVerticalScrollIndicator={false}
      >
        {/* Page intro */}
        <View style={styles.intro}>
          <Text style={styles.title}>Latihan Soal</Text>
          <Text style={styles.subtitle}>Pilih materi yang ingin kamu kuasai hari ini.</Text>
        </View>

        {/* ExamType pill tabs */}
        <ScrollView
          horizontal
          showsHorizontalScrollIndicator={false}
          contentContainerStyle={styles.tabRow}
        >
          {EXAM_TABS.map((t) => {
            const active = t === examType;
            return (
              <TouchableOpacity
                key={t}
                onPress={() => navigation.setParams({ examType: t })}
                style={[styles.tabPill, active && styles.tabPillActive]}
                activeOpacity={0.85}
              >
                <Text style={[styles.tabPillText, active && styles.tabPillTextActive]}>
                  {EXAM_CONFIGS[t].label}
                </Text>
              </TouchableOpacity>
            );
          })}
        </ScrollView>

        {/* Info banner */}
        <View style={styles.banner}>
          <Text style={styles.bannerTitle}>Tingkatkan Akurasi!</Text>
          <Text style={styles.bannerBody}>
            Latihan soal reguler terbukti meningkatkan kecepatan menjawab hingga 30%.
            Mulai sesi fokusmu sekarang.
          </Text>
          <TouchableOpacity
            style={[styles.bannerCta, packs.length === 0 && styles.bannerCtaDisabled]}
            onPress={handleRandomStart}
            disabled={packs.length === 0}
            activeOpacity={0.85}
          >
            <Text style={styles.bannerCtaText}>Mulai Acak</Text>
            <Ionicons name="shuffle" size={16} color={CognitiveCalm.onTertiary} />
          </TouchableOpacity>
        </View>

        {/* Subject / pack cards */}
        {loading ? (
          <View style={styles.center}>
            <ActivityIndicator color={CognitiveCalm.primary} />
            <Text style={styles.centerText}>Memuat paket soal…</Text>
          </View>
        ) : error ? (
          <View style={styles.center}>
            <Ionicons name="alert-circle-outline" size={36} color={CognitiveCalm.error} />
            <Text style={styles.centerText}>{error}</Text>
          </View>
        ) : packs.length === 0 ? (
          <View style={styles.emptyState}>
            <View style={styles.emptyIllustration}>
              <Ionicons name="bulb" size={72} color={CognitiveCalm.primary} />
            </View>
            <Text style={styles.emptyTitle}>Belum ada paket soal yang dibuka</Text>
            <Text style={styles.emptyDesc}>
              Ayo mulai langkah pertamamu! Pilih paket soal persiapan {config.label} yang tersedia.
            </Text>
          </View>
        ) : (
          <PackList packs={packs} examType={examType} navigation={navigation} />
        )}
      </ScrollView>
    </SafeAreaView>
  );
}

function PackList({
  packs,
  examType,
  navigation,
}: {
  packs: QuestionPack[];
  examType: ExamType;
  navigation: LatihanScreenProps<'CategoryList'>['navigation'];
}) {
  // Group packs by subject so the layout reads as one section per subject —
  // mirip mockup "Tes Wawasan Kebangsaan / Intelegensia / Karakteristik Pribadi".
  const grouped = useMemo(() => {
    const map = new Map<SubjectType, QuestionPack[]>();
    for (const p of packs) {
      const arr = map.get(p.subject) ?? [];
      arr.push(p);
      map.set(p.subject, arr);
    }
    return Array.from(map.entries());
  }, [packs]);

  return (
    <View style={styles.packList}>
      {grouped.map(([subject, subjectPacks]) => {
        const totalSoal = subjectPacks.reduce((s, p) => s + (p.questionCount || 0), 0);
        const iconName = SUBJECT_ICONS[subject] ?? 'document-text-outline';
        const fullLabel = SUBJECT_LABELS[subject] ?? subject;
        return (
          <View key={subject} style={styles.subjectGroup}>
            <View style={styles.packCard}>
              <View style={styles.packTopRow}>
                <View style={styles.subjectIconBox}>
                  <Ionicons name={iconName} size={22} color={CognitiveCalm.primary} />
                </View>
                <Ionicons
                  name="arrow-forward"
                  size={20}
                  color={CognitiveCalm.outlineVariant}
                />
              </View>
              <Text style={styles.subjectTitle}>{fullLabel}</Text>
              <View style={styles.subjectMetaRow}>
                <Text style={styles.subjectChip}>{subject}</Text>
                <Text style={styles.subjectMetaDot}>•</Text>
                <Text style={styles.subjectMeta}>
                  {totalSoal} soal • {subjectPacks.length} paket
                </Text>
              </View>
              <View style={styles.packListInner}>
                {subjectPacks.map((pack) => (
                  <TouchableOpacity
                    key={pack.id}
                    style={styles.packRow}
                    activeOpacity={0.8}
                    onPress={() =>
                      navigation.navigate('PracticeSession', {
                        examType,
                        subject: pack.subject,
                        packId: pack.id,
                        questionCount: Math.max(1, pack.questionCount || 10),
                      })
                    }
                  >
                    <View style={styles.packRowLeft}>
                      <Text style={styles.packRowTitle} numberOfLines={1}>
                        {pack.title}
                      </Text>
                      {pack.description ? (
                        <Text style={styles.packRowDesc} numberOfLines={1}>
                          {pack.description}
                        </Text>
                      ) : null}
                    </View>
                    <View style={styles.packRowRight}>
                      <Text style={styles.packRowCount}>{pack.questionCount || '-'}</Text>
                      <Text style={styles.packRowCountLabel}>soal</Text>
                    </View>
                    <Ionicons name="chevron-forward" size={16} color={CognitiveCalm.outline} />
                  </TouchableOpacity>
                ))}
              </View>
            </View>
          </View>
        );
      })}
    </View>
  );
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
  iconBtn: {
    width: 40,
    height: 40,
    borderRadius: 20,
    alignItems: 'center',
    justifyContent: 'center',
  },
  wordmark: {
    fontFamily: Fonts.bold,
    fontSize: 22,
    color: CognitiveCalm.primary,
    letterSpacing: -0.4,
  },

  scroll: { paddingBottom: 32 },

  intro: { paddingHorizontal: 20, paddingTop: 20, gap: 4 },
  title: {
    fontFamily: Fonts.bold,
    fontSize: 24,
    lineHeight: 32,
    color: CognitiveCalm.onSurface,
  },
  subtitle: {
    fontFamily: Fonts.regular,
    fontSize: 14,
    color: CognitiveCalm.onSurfaceVariant,
  },

  tabRow: {
    paddingHorizontal: 20,
    paddingTop: 16,
    paddingBottom: 4,
    gap: 12,
  },
  tabPill: {
    paddingHorizontal: 22,
    paddingVertical: 10,
    borderRadius: 999,
    backgroundColor: CognitiveCalm.surfaceContainer,
    borderWidth: 1,
    borderColor: CognitiveCalm.outlineVariant + '60',
  },
  tabPillActive: {
    backgroundColor: CognitiveCalm.primary,
    borderColor: CognitiveCalm.primary,
    shadowColor: CognitiveCalm.primary,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 8,
    elevation: 2,
  },
  tabPillText: {
    fontFamily: Fonts.semibold,
    fontSize: 13,
    color: CognitiveCalm.onSurface,
    letterSpacing: 0.2,
  },
  tabPillTextActive: { color: CognitiveCalm.onPrimary },

  banner: {
    marginHorizontal: 20,
    marginTop: 16,
    padding: 20,
    borderRadius: 24,
    backgroundColor: CognitiveCalm.surfaceContainer,
    borderWidth: 1,
    borderColor: CognitiveCalm.tertiary + '20',
    gap: 12,
    overflow: 'hidden',
  },
  bannerTitle: {
    fontFamily: Fonts.semibold,
    fontSize: 18,
    color: CognitiveCalm.onSurface,
  },
  bannerBody: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    lineHeight: 19,
    color: CognitiveCalm.onSurfaceVariant,
  },
  bannerCta: {
    alignSelf: 'flex-start',
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    paddingHorizontal: 18,
    paddingVertical: 10,
    backgroundColor: CognitiveCalm.tertiary,
    borderRadius: 10,
  },
  bannerCtaDisabled: { backgroundColor: CognitiveCalm.outline + '60' },
  bannerCtaText: {
    fontFamily: Fonts.semibold,
    fontSize: 14,
    color: CognitiveCalm.onTertiary,
    letterSpacing: 0.2,
  },

  center: {
    paddingVertical: 48,
    alignItems: 'center',
    gap: 10,
  },
  centerText: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    color: CognitiveCalm.onSurfaceVariant,
    textAlign: 'center',
    paddingHorizontal: 24,
  },

  emptyState: {
    alignItems: 'center',
    paddingVertical: 48,
    paddingHorizontal: 24,
  },
  emptyIllustration: {
    width: 160,
    height: 160,
    borderRadius: 80,
    backgroundColor: CognitiveCalm.surfaceContainerLowest,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: 24,
    shadowColor: CognitiveCalm.shadow,
    shadowOffset: { width: 0, height: 8 },
    shadowOpacity: 0.05,
    shadowRadius: 24,
    elevation: 2,
  },
  emptyTitle: {
    fontFamily: Fonts.bold,
    fontSize: 18,
    lineHeight: 24,
    color: CognitiveCalm.onSurface,
    textAlign: 'center',
    marginBottom: 8,
  },
  emptyDesc: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    lineHeight: 20,
    color: CognitiveCalm.onSurfaceVariant,
    textAlign: 'center',
  },

  packList: { paddingHorizontal: 20, paddingTop: 16, gap: 16 },
  subjectGroup: {},

  packCard: {
    backgroundColor: CognitiveCalm.surfaceContainerLowest,
    borderRadius: 24,
    padding: 20,
    borderWidth: 1,
    borderColor: '#FFFFFF',
    shadowColor: CognitiveCalm.shadow,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.04,
    shadowRadius: 16,
    elevation: 2,
    gap: 12,
  },
  packTopRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  subjectIconBox: {
    width: 48,
    height: 48,
    borderRadius: 16,
    backgroundColor: CognitiveCalm.surfaceContainer,
    alignItems: 'center',
    justifyContent: 'center',
  },
  subjectTitle: {
    fontFamily: Fonts.semibold,
    fontSize: 18,
    lineHeight: 24,
    color: CognitiveCalm.onSurface,
  },
  subjectMetaRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
  },
  subjectChip: {
    fontFamily: Fonts.semibold,
    fontSize: 11,
    color: CognitiveCalm.onSurfaceVariant,
    backgroundColor: CognitiveCalm.surfaceContainerHigh,
    paddingHorizontal: 8,
    paddingVertical: 2,
    borderRadius: 6,
    overflow: 'hidden',
  },
  subjectMetaDot: { fontSize: 12, color: CognitiveCalm.outlineVariant },
  subjectMeta: {
    fontFamily: Fonts.regular,
    fontSize: 12,
    color: CognitiveCalm.onSurfaceVariant,
  },

  packListInner: {
    marginTop: 4,
    borderTopWidth: 1,
    borderTopColor: CognitiveCalm.outlineVariant + '40',
    paddingTop: 12,
    gap: 4,
  },
  packRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    paddingVertical: 10,
    paddingHorizontal: 4,
  },
  packRowLeft: { flex: 1, gap: 2 },
  packRowTitle: {
    fontFamily: Fonts.semibold,
    fontSize: 13,
    color: CognitiveCalm.onSurface,
  },
  packRowDesc: {
    fontFamily: Fonts.regular,
    fontSize: 11,
    color: CognitiveCalm.onSurfaceVariant,
  },
  packRowRight: { alignItems: 'flex-end', minWidth: 40 },
  packRowCount: {
    fontFamily: Fonts.bold,
    fontSize: 16,
    color: CognitiveCalm.tertiary,
  },
  packRowCountLabel: {
    fontFamily: Fonts.regular,
    fontSize: 9,
    color: CognitiveCalm.outline,
  },
});
