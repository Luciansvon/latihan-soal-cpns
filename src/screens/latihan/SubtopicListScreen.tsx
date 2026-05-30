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
import { SUBJECT_LABELS, type SubjectType } from '../../types/exam.types';
import type { LatihanScreenProps } from '../../navigation/types';
import { supabase } from '../../services/supabase';
import { QuestionRepository } from '../../db/repositories/QuestionRepository';
import { useStore } from '../../store';
import { AppHeader } from '../../components/common/AppHeader';

interface SubtopicSummary {
  name: string;
  count: number;
  avgRank: number;
  hasSeringKeluar: boolean;
}

type DifficultyMode = 'random' | 'hardest-first' | 'easiest-first' | 'sering-keluar';

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

const DIFFICULTY_MODES: {
  mode: DifficultyMode;
  label: string;
  icon: keyof typeof Ionicons.glyphMap;
}[] = [
  { mode: 'random', label: 'Acak', icon: 'shuffle-outline' },
  { mode: 'hardest-first', label: 'Tersulit', icon: 'trending-up-outline' },
  { mode: 'easiest-first', label: 'Termudah', icon: 'trending-down-outline' },
  { mode: 'sering-keluar', label: 'Sering Keluar', icon: 'flame-outline' },
];

function rankToStars(rank: number): number {
  return Math.ceil(rank / 2);
}

// Difficulty stars stay semantic (green/amber/red) regardless of brand
// palette — students need fast at-a-glance read on relative hardness.
function rankToColor(rank: number): string {
  if (rank <= 3) return '#16A34A';
  if (rank <= 6) return '#D97706';
  return CognitiveCalm.error;
}

function rankToLabel(rank: number): string {
  if (rank <= 3) return 'Mudah';
  if (rank <= 6) return 'Sedang';
  return 'Sulit';
}

export function SubtopicListScreen({ route, navigation }: LatihanScreenProps<'SubtopicList'>) {
  const { examType, subject, packId } = route.params;
  const isOnline = useStore((s) => s.isOnline);

  const subjectLabel = SUBJECT_LABELS[subject] ?? subject;
  const subjectIcon = SUBJECT_ICONS[subject] ?? 'document-text-outline';

  const [subtopics, setSubtopics] = useState<SubtopicSummary[]>([]);
  const [totalCount, setTotalCount] = useState(0);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [mode, setMode] = useState<DifficultyMode>('random');

  useEffect(() => {
    let cancelled = false;
    setLoading(true);

    (async () => {
      try {
        const local = await QuestionRepository.getQuestions(packId, 9999);
        let rows: { subtopic?: string; difficultyRank?: number; tags?: string[] }[] = local.map(
          (q) => ({
            subtopic: q.subtopic,
            difficultyRank: (q as any).difficultyRank ?? undefined,
            tags: q.tags,
          }),
        );

        if (rows.length === 0 && isOnline) {
          const { data, error: sbErr } = await supabase
            .from('questions')
            .select('subtopic, difficulty_rank, tags')
            .eq('pack_id', packId)
            .limit(9999);
          if (sbErr) throw new Error(sbErr.message);
          rows = (data ?? []).map((r: any) => ({
            subtopic: r.subtopic ?? undefined,
            difficultyRank: r.difficulty_rank ?? undefined,
            tags: r.tags ?? undefined,
          }));
        }

        if (cancelled) return;

        const map = new Map<string, { ranks: number[]; seringCount: number }>();
        for (const row of rows) {
          const key = row.subtopic ?? '(Umum)';
          if (!map.has(key)) map.set(key, { ranks: [], seringCount: 0 });
          const entry = map.get(key)!;
          if (row.difficultyRank != null) entry.ranks.push(row.difficultyRank);
          if (row.tags?.includes('sering-keluar')) entry.seringCount++;
        }

        const summaries: SubtopicSummary[] = [];
        map.forEach((val, name) => {
          const avgRank =
            val.ranks.length > 0 ? val.ranks.reduce((a, b) => a + b, 0) / val.ranks.length : 5;
          summaries.push({
            name,
            count: rows.filter((r) => (r.subtopic ?? '(Umum)') === name).length,
            avgRank,
            hasSeringKeluar: val.seringCount > 0,
          });
        });

        setSubtopics(summaries);
        setTotalCount(rows.length);
        setError(null);
      } catch (e: any) {
        if (!cancelled) setError(e?.message ?? 'Gagal memuat subtopik');
      } finally {
        if (!cancelled) setLoading(false);
      }
    })();

    return () => {
      cancelled = true;
    };
  }, [packId, isOnline]);

  const sortedSubtopics = useMemo(() => {
    const list = [...subtopics];
    if (mode === 'hardest-first') return list.sort((a, b) => b.avgRank - a.avgRank);
    if (mode === 'easiest-first') return list.sort((a, b) => a.avgRank - b.avgRank);
    if (mode === 'sering-keluar')
      return list.sort((a, b) => Number(b.hasSeringKeluar) - Number(a.hasSeringKeluar));
    return list;
  }, [subtopics, mode]);

  const seringCount = useMemo(
    () => subtopics.filter((s) => s.hasSeringKeluar).length,
    [subtopics],
  );

  const startAll = () => {
    navigation.navigate('PracticeSession', {
      examType,
      subject,
      packId,
      questionCount: 20,
      difficultyMode: mode,
    });
  };

  const startSubtopic = (subtopic: SubtopicSummary) => {
    navigation.navigate('PracticeSession', {
      examType,
      subject,
      packId,
      subtopic: subtopic.name,
      questionCount: Math.min(subtopic.count, 15),
    });
  };

  return (
    <SafeAreaView style={styles.safe} edges={['top']}>
      <AppHeader
        theme="warm"
        showBack
        onBackPress={() => navigation.goBack()}
      />

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>
        {/* Subject hero */}
        <View style={styles.subjectHero}>
          <View style={styles.subjectIconBox}>
            <Ionicons name={subjectIcon} size={28} color={CognitiveCalm.primary} />
          </View>
          <View style={styles.subjectHeroText}>
            <Text style={styles.subjectChip}>{subject}</Text>
            <Text style={styles.subjectTitle}>{subjectLabel}</Text>
            <Text style={styles.subjectMeta}>
              {loading ? 'Memuat…' : `${totalCount} soal · ${subtopics.length} subtopik`}
            </Text>
          </View>
        </View>

        {/* Difficulty mode chips */}
        <ScrollView
          horizontal
          showsHorizontalScrollIndicator={false}
          contentContainerStyle={styles.modeRow}
        >
          {DIFFICULTY_MODES.map(({ mode: m, label, icon }) => {
            const active = mode === m;
            return (
              <TouchableOpacity
                key={m}
                style={[styles.modeChip, active && styles.modeChipActive]}
                onPress={() => setMode(m)}
                activeOpacity={0.8}
              >
                <Ionicons
                  name={icon}
                  size={14}
                  color={active ? CognitiveCalm.onPrimary : CognitiveCalm.onSurfaceVariant}
                />
                <Text style={[styles.modeChipText, active && styles.modeChipTextActive]}>
                  {label}
                </Text>
                {m === 'sering-keluar' && seringCount > 0 ? (
                  <View style={[styles.modeBadge, active && styles.modeBadgeActive]}>
                    <Text style={[styles.modeBadgeText, active && styles.modeBadgeTextActive]}>
                      {seringCount}
                    </Text>
                  </View>
                ) : null}
              </TouchableOpacity>
            );
          })}
        </ScrollView>

        {loading ? (
          <View style={styles.center}>
            <ActivityIndicator color={CognitiveCalm.primary} />
            <Text style={styles.centerText}>Memuat subtopik…</Text>
          </View>
        ) : error ? (
          <View style={styles.center}>
            <Ionicons name="alert-circle-outline" size={36} color={CognitiveCalm.error} />
            <Text style={styles.centerText}>{error}</Text>
          </View>
        ) : (
          <>
            {/* Mulai Semua CTA — featured filled card */}
            <TouchableOpacity
              style={styles.startAllCard}
              activeOpacity={0.9}
              onPress={startAll}
            >
              <View style={styles.startAllIcon}>
                <Ionicons name="play" size={20} color={CognitiveCalm.onPrimary} />
              </View>
              <View style={styles.startAllText}>
                <Text style={styles.startAllTitle}>Mulai Semua Subtopik</Text>
                <Text style={styles.startAllSub}>
                  {mode === 'random' && '20 soal · urutan acak'}
                  {mode === 'hardest-first' && '20 soal · dimulai dari tersulit'}
                  {mode === 'easiest-first' && '20 soal · dimulai dari termudah'}
                  {mode === 'sering-keluar' && '20 soal · prioritas sering keluar'}
                </Text>
              </View>
              <Ionicons
                name="arrow-forward"
                size={18}
                color={CognitiveCalm.onPrimary}
              />
            </TouchableOpacity>

            <Text style={styles.sectionTitle}>PILIH SUBTOPIK</Text>

            {sortedSubtopics.map((st) => {
              const stars = rankToStars(Math.round(st.avgRank));
              const rankColor = rankToColor(Math.round(st.avgRank));
              const rankLabel = rankToLabel(Math.round(st.avgRank));
              const dimmed = mode === 'sering-keluar' && !st.hasSeringKeluar;

              return (
                <TouchableOpacity
                  key={st.name}
                  style={[styles.subtopicCard, dimmed && styles.subtopicCardDimmed]}
                  activeOpacity={0.85}
                  onPress={() => startSubtopic(st)}
                >
                  <View style={styles.subtopicLeft}>
                    <Text
                      style={[styles.subtopicName, dimmed && { color: CognitiveCalm.outline }]}
                    >
                      {st.name}
                    </Text>
                    <View style={styles.subtopicMeta}>
                      <View style={styles.starsRow}>
                        {Array.from({ length: 5 }).map((_, i) => (
                          <Ionicons
                            key={i}
                            name={i < stars ? 'star' : 'star-outline'}
                            size={11}
                            color={i < stars ? rankColor : CognitiveCalm.outlineVariant}
                          />
                        ))}
                      </View>
                      <Text style={[styles.rankLabel, { color: rankColor }]}>{rankLabel}</Text>
                      {st.hasSeringKeluar ? (
                        <View style={styles.seringBadge}>
                          <Ionicons name="flame" size={9} color="#D97706" />
                          <Text style={styles.seringText}>Sering Keluar</Text>
                        </View>
                      ) : null}
                    </View>
                  </View>

                  <View style={styles.subtopicRight}>
                    <Text style={styles.countNum}>{st.count}</Text>
                    <Text style={styles.countLabel}>soal</Text>
                  </View>
                  <Ionicons
                    name="chevron-forward"
                    size={16}
                    color={CognitiveCalm.outline}
                  />
                </TouchableOpacity>
              );
            })}

            {subtopics.length === 0 ? (
              <View style={styles.center}>
                <Ionicons
                  name="help-circle-outline"
                  size={40}
                  color={CognitiveCalm.outlineVariant}
                />
                <Text style={styles.centerText}>Belum ada soal di kategori ini.</Text>
              </View>
            ) : null}
          </>
        )}
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: CognitiveCalm.surface },

  scroll: { paddingHorizontal: 20, paddingTop: 16, paddingBottom: 40, gap: 16 },

  subjectHero: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 14,
    backgroundColor: CognitiveCalm.surfaceContainerLowest,
    borderRadius: 20,
    padding: 18,
    borderWidth: 1,
    borderColor: '#FFFFFF',
    shadowColor: CognitiveCalm.shadow,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.04,
    shadowRadius: 12,
    elevation: 2,
  },
  subjectIconBox: {
    width: 56,
    height: 56,
    borderRadius: 18,
    backgroundColor: CognitiveCalm.surfaceContainer,
    alignItems: 'center',
    justifyContent: 'center',
  },
  subjectHeroText: { flex: 1, gap: 2 },
  subjectChip: {
    alignSelf: 'flex-start',
    fontFamily: Fonts.semibold,
    fontSize: 11,
    color: CognitiveCalm.onSurfaceVariant,
    backgroundColor: CognitiveCalm.surfaceContainerHigh,
    paddingHorizontal: 8,
    paddingVertical: 2,
    borderRadius: 6,
    overflow: 'hidden',
    letterSpacing: 0.3,
    marginBottom: 2,
  },
  subjectTitle: {
    fontFamily: Fonts.bold,
    fontSize: 18,
    lineHeight: 24,
    color: CognitiveCalm.onSurface,
  },
  subjectMeta: {
    fontFamily: Fonts.regular,
    fontSize: 12,
    color: CognitiveCalm.onSurfaceVariant,
  },

  modeRow: {
    gap: 10,
    paddingVertical: 2,
  },
  modeChip: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    paddingHorizontal: 14,
    paddingVertical: 8,
    borderRadius: 999,
    backgroundColor: CognitiveCalm.surfaceContainer,
    borderWidth: 1,
    borderColor: CognitiveCalm.outlineVariant + '60',
  },
  modeChipActive: {
    backgroundColor: CognitiveCalm.primary,
    borderColor: CognitiveCalm.primary,
  },
  modeChipText: {
    fontFamily: Fonts.semibold,
    fontSize: 12,
    color: CognitiveCalm.onSurface,
  },
  modeChipTextActive: { color: CognitiveCalm.onPrimary },
  modeBadge: {
    backgroundColor: '#D9770624',
    borderRadius: 6,
    paddingHorizontal: 5,
    paddingVertical: 1,
  },
  modeBadgeActive: { backgroundColor: 'rgba(255,255,255,0.22)' },
  modeBadgeText: { fontFamily: Fonts.bold, fontSize: 10, color: '#D97706' },
  modeBadgeTextActive: { color: CognitiveCalm.onPrimary },

  startAllCard: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    padding: 16,
    borderRadius: 18,
    backgroundColor: CognitiveCalm.primary,
    shadowColor: CognitiveCalm.primary,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.25,
    shadowRadius: 12,
    elevation: 3,
  },
  startAllIcon: {
    width: 40,
    height: 40,
    borderRadius: 12,
    backgroundColor: 'rgba(255,255,255,0.18)',
    alignItems: 'center',
    justifyContent: 'center',
  },
  startAllText: { flex: 1, gap: 2 },
  startAllTitle: {
    fontFamily: Fonts.bold,
    fontSize: 15,
    color: CognitiveCalm.onPrimary,
  },
  startAllSub: {
    fontFamily: Fonts.regular,
    fontSize: 12,
    color: 'rgba(255,255,255,0.85)',
  },

  sectionTitle: {
    fontFamily: Fonts.semibold,
    fontSize: 11,
    color: CognitiveCalm.onSurfaceVariant,
    letterSpacing: 1,
    marginTop: 4,
  },

  subtopicCard: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    backgroundColor: CognitiveCalm.surfaceContainerLowest,
    borderRadius: 16,
    padding: 16,
    borderWidth: 1,
    borderColor: '#FFFFFF',
    shadowColor: CognitiveCalm.shadow,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.03,
    shadowRadius: 8,
    elevation: 1,
  },
  subtopicCardDimmed: { opacity: 0.5 },

  subtopicLeft: { flex: 1, gap: 6 },
  subtopicName: {
    fontFamily: Fonts.semibold,
    fontSize: 14,
    color: CognitiveCalm.onSurface,
    lineHeight: 18,
  },
  subtopicMeta: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    flexWrap: 'wrap',
  },
  starsRow: { flexDirection: 'row', gap: 2 },
  rankLabel: { fontFamily: Fonts.bold, fontSize: 10 },

  seringBadge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 3,
    backgroundColor: '#FEF3C7',
    borderRadius: 6,
    paddingHorizontal: 6,
    paddingVertical: 2,
  },
  seringText: { fontFamily: Fonts.bold, fontSize: 9, color: '#D97706' },

  subtopicRight: { alignItems: 'center', minWidth: 36 },
  countNum: {
    fontFamily: Fonts.bold,
    fontSize: 18,
    color: CognitiveCalm.tertiary,
  },
  countLabel: {
    fontFamily: Fonts.regular,
    fontSize: 9,
    color: CognitiveCalm.outline,
  },

  center: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 40,
    gap: 8,
  },
  centerText: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    color: CognitiveCalm.onSurfaceVariant,
    textAlign: 'center',
    paddingHorizontal: 20,
  },
});
