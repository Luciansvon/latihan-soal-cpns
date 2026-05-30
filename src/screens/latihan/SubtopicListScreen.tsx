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
import { Colors } from '../../constants/colors';
import { SUBJECT_LABELS, type SubjectType } from '../../types/exam.types';
import type { LatihanScreenProps } from '../../navigation/types';
import { supabase } from '../../services/supabase';
import { QuestionRepository } from '../../db/repositories/QuestionRepository';
import { useStore } from '../../store';

// ─── Types ───────────────────────────────────────────────────────────────────

interface SubtopicSummary {
  name: string;
  count: number;
  avgRank: number;    // 1-10
  hasSeringKeluar: boolean;
}

type DifficultyMode = 'random' | 'hardest-first' | 'easiest-first' | 'sering-keluar';

// ─── Constants ────────────────────────────────────────────────────────────────

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

const EXAM_COLORS: Record<string, string> = {
  CPNS: Colors.cpns,
  TNI: Colors.tni,
  POLRI: Colors.polri,
};

const DIFFICULTY_MODES: { mode: DifficultyMode; label: string; icon: keyof typeof Ionicons.glyphMap }[] = [
  { mode: 'random',       label: 'Acak',          icon: 'shuffle-outline' },
  { mode: 'hardest-first', label: 'Tersulit',      icon: 'trending-up-outline' },
  { mode: 'easiest-first', label: 'Termudah',      icon: 'trending-down-outline' },
  { mode: 'sering-keluar', label: 'Sering Keluar', icon: 'flame-outline' },
];

// ─── Helpers ─────────────────────────────────────────────────────────────────

function rankToStars(rank: number): number {
  return Math.ceil(rank / 2); // 1-2→1, 3-4→2, 5-6→3, 7-8→4, 9-10→5
}

function rankToColor(rank: number): string {
  if (rank <= 3) return Colors.success;
  if (rank <= 6) return Colors.warning;
  return Colors.error;
}

function rankToLabel(rank: number): string {
  if (rank <= 3) return 'Mudah';
  if (rank <= 6) return 'Sedang';
  return 'Sulit';
}

// ─── Component ────────────────────────────────────────────────────────────────

export function SubtopicListScreen({ route, navigation }: LatihanScreenProps<'SubtopicList'>) {
  const { examType, subject, packId } = route.params;
  const isOnline = useStore((s) => s.isOnline);

  const accentColor = SUBJECT_COLORS[subject] ?? EXAM_COLORS[examType] ?? Colors.primary;
  const subjectLabel = SUBJECT_LABELS[subject] ?? subject;

  const [subtopics, setSubtopics] = useState<SubtopicSummary[]>([]);
  const [totalCount, setTotalCount] = useState(0);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [mode, setMode] = useState<DifficultyMode>('random');

  // ── Fetch subtopic summary ──────────────────────────────────────────────────
  useEffect(() => {
    let cancelled = false;
    setLoading(true);

    (async () => {
      try {
        // Try SQLite first — fetch minimal fields
        const local = await QuestionRepository.getQuestions(packId, 9999);
        let rows: { subtopic?: string; difficultyRank?: number; tags?: string[] }[] = local.map((q) => ({
          subtopic: q.subtopic,
          difficultyRank: (q as any).difficultyRank ?? undefined,
          tags: q.tags,
        }));

        if (rows.length === 0 && isOnline) {
          // Fallback to Supabase
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

        // Aggregate by subtopic
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
          const avgRank = val.ranks.length > 0
            ? val.ranks.reduce((a, b) => a + b, 0) / val.ranks.length
            : 5;
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

    return () => { cancelled = true; };
  }, [packId, isOnline]);

  // ── Sort subtopics based on selected mode ────────────────────────────────
  const sortedSubtopics = useMemo(() => {
    const list = [...subtopics];
    if (mode === 'hardest-first') return list.sort((a, b) => b.avgRank - a.avgRank);
    if (mode === 'easiest-first') return list.sort((a, b) => a.avgRank - b.avgRank);
    if (mode === 'sering-keluar') return list.sort((a, b) => Number(b.hasSeringKeluar) - Number(a.hasSeringKeluar));
    return list; // 'random' — keep insertion order (already grouped nicely)
  }, [subtopics, mode]);

  const seringCount = useMemo(
    () => subtopics.filter((s) => s.hasSeringKeluar).length,
    [subtopics],
  );

  // ── Navigation helpers ───────────────────────────────────────────────────
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

  // ── Render ───────────────────────────────────────────────────────────────
  return (
    <SafeAreaView style={styles.safe} edges={['top']}>
      {/* Header */}
      <View style={styles.header}>
        <TouchableOpacity style={styles.backBtn} onPress={() => navigation.goBack()}>
          <Ionicons name="arrow-back" size={22} color={Colors.textPrimary} />
        </TouchableOpacity>
        <View style={styles.headerText}>
          <View style={[styles.subjectBadge, { backgroundColor: accentColor }]}>
            <Text style={styles.subjectBadgeText}>{subject}</Text>
          </View>
          <Text style={styles.headerTitle}>{subjectLabel}</Text>
          <Text style={styles.headerSubtitle}>
            {loading ? 'Memuat...' : `${totalCount} soal · ${subtopics.length} subtopik`}
          </Text>
        </View>
      </View>

      {/* Mode filter chips */}
      <View style={styles.filterWrapper}>
        <ScrollView
          horizontal
          showsHorizontalScrollIndicator={false}
          contentContainerStyle={styles.filterRow}
        >
          {DIFFICULTY_MODES.map(({ mode: m, label, icon }) => {
            const active = mode === m;
            return (
              <TouchableOpacity
                key={m}
                style={[
                  styles.filterChip,
                  active && { backgroundColor: accentColor, borderColor: accentColor },
                ]}
                onPress={() => setMode(m)}
                activeOpacity={0.8}
              >
                <Ionicons
                  name={icon}
                  size={13}
                  color={active ? Colors.white : Colors.textSecondary}
                />
                <Text style={[styles.filterChipText, active && styles.filterChipTextActive]}>
                  {label}
                </Text>
                {m === 'sering-keluar' && seringCount > 0 && (
                  <View style={[styles.filterBadge, active && styles.filterBadgeActive]}>
                    <Text style={[styles.filterBadgeText, active && styles.filterBadgeTextActive]}>
                      {seringCount}
                    </Text>
                  </View>
                )}
              </TouchableOpacity>
            );
          })}
        </ScrollView>
      </View>

      {/* Body */}
      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>
        {loading ? (
          <View style={styles.center}>
            <ActivityIndicator color={accentColor} />
            <Text style={styles.centerText}>Memuat subtopik...</Text>
          </View>
        ) : error ? (
          <View style={styles.center}>
            <Ionicons name="alert-circle-outline" size={36} color={Colors.error} />
            <Text style={styles.centerText}>{error}</Text>
          </View>
        ) : (
          <>
            {/* Mulai Semua CTA */}
            <TouchableOpacity
              style={[styles.startAllBtn, { backgroundColor: accentColor }]}
              activeOpacity={0.85}
              onPress={startAll}
            >
              <View style={styles.startAllLeft}>
                <Ionicons name="play-circle-outline" size={22} color={Colors.white} />
                <View>
                  <Text style={styles.startAllLabel}>Mulai Semua Subtopik</Text>
                  <Text style={styles.startAllSub}>
                    {mode === 'random'        && '20 soal · urutan acak'}
                    {mode === 'hardest-first' && '20 soal · dimulai dari tersulit'}
                    {mode === 'easiest-first' && '20 soal · dimulai dari termudah'}
                    {mode === 'sering-keluar' && '20 soal · prioritas sering keluar'}
                  </Text>
                </View>
              </View>
              <Ionicons name="chevron-forward" size={18} color={Colors.white} />
            </TouchableOpacity>

            {/* Subtopic list */}
            <Text style={styles.sectionTitle}>Pilih Subtopik</Text>

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
                    <Text style={[styles.subtopicName, dimmed && { color: Colors.textMuted }]}>
                      {st.name}
                    </Text>

                    {/* Difficulty stars + label */}
                    <View style={styles.subtopicMeta}>
                      <View style={styles.starsRow}>
                        {Array.from({ length: 5 }).map((_, i) => (
                          <Ionicons
                            key={i}
                            name={i < stars ? 'star' : 'star-outline'}
                            size={11}
                            color={i < stars ? rankColor : Colors.gray300}
                          />
                        ))}
                      </View>
                      <Text style={[styles.rankLabel, { color: rankColor }]}>{rankLabel}</Text>

                      {st.hasSeringKeluar && (
                        <View style={styles.seringBadge}>
                          <Ionicons name="flame" size={9} color="#D97706" />
                          <Text style={styles.seringText}>Sering Keluar</Text>
                        </View>
                      )}
                    </View>
                  </View>

                  <View style={styles.subtopicRight}>
                    <Text style={[styles.countNum, { color: accentColor }]}>{st.count}</Text>
                    <Text style={styles.countLabel}>soal</Text>
                  </View>
                </TouchableOpacity>
              );
            })}

            {subtopics.length === 0 && (
              <View style={styles.center}>
                <Ionicons name="help-circle-outline" size={40} color={Colors.gray300} />
                <Text style={styles.centerText}>Belum ada soal di kategori ini.</Text>
              </View>
            )}
          </>
        )}
      </ScrollView>
    </SafeAreaView>
  );
}

// ─── Styles ───────────────────────────────────────────────────────────────────

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
  subjectBadge: {
    alignSelf: 'flex-start',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 6,
    marginBottom: 2,
  },
  subjectBadgeText: { fontSize: 11, fontWeight: '800', color: Colors.white, letterSpacing: 1 },
  headerTitle: { fontSize: 20, fontWeight: '800', color: Colors.textPrimary, letterSpacing: -0.3 },
  headerSubtitle: { fontSize: 13, color: Colors.textSecondary },

  filterWrapper: {
    backgroundColor: Colors.white,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },
  filterRow: {
    paddingHorizontal: 16,
    paddingVertical: 10,
    gap: 8,
    alignItems: 'center',
  },
  filterChip: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 5,
    paddingHorizontal: 14,
    paddingVertical: 7,
    borderRadius: 20,
    borderWidth: 1.5,
    borderColor: Colors.border,
    backgroundColor: Colors.white,
  },
  filterChipText: { fontSize: 12, fontWeight: '700', color: Colors.textSecondary },
  filterChipTextActive: { color: Colors.white },
  filterBadge: {
    backgroundColor: Colors.warning + '25',
    borderRadius: 8,
    paddingHorizontal: 5,
    paddingVertical: 1,
  },
  filterBadgeActive: { backgroundColor: 'rgba(255,255,255,0.25)' },
  filterBadgeText: { fontSize: 10, fontWeight: '800', color: Colors.warning },
  filterBadgeTextActive: { color: Colors.white },

  scroll: { paddingHorizontal: 16, paddingTop: 16, paddingBottom: 40, gap: 10 },

  center: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 40,
    gap: 8,
  },
  centerText: { fontSize: 13, color: Colors.textSecondary, textAlign: 'center', paddingHorizontal: 20 },

  startAllBtn: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    padding: 16,
    borderRadius: 14,
    marginBottom: 4,
  },
  startAllLeft: { flexDirection: 'row', alignItems: 'center', gap: 12, flex: 1 },
  startAllLabel: { fontSize: 14, fontWeight: '800', color: Colors.white },
  startAllSub: { fontSize: 11, color: 'rgba(255,255,255,0.8)', marginTop: 2 },

  sectionTitle: {
    fontSize: 12,
    fontWeight: '700',
    color: Colors.textMuted,
    letterSpacing: 0.5,
    marginBottom: 2,
    paddingHorizontal: 2,
  },

  subtopicCard: {
    backgroundColor: Colors.white,
    borderRadius: 12,
    padding: 14,
    flexDirection: 'row',
    alignItems: 'center',
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.04,
    shadowRadius: 3,
    elevation: 1,
  },
  subtopicCardDimmed: { opacity: 0.45 },

  subtopicLeft: { flex: 1, gap: 6 },
  subtopicName: { fontSize: 14, fontWeight: '700', color: Colors.textPrimary, lineHeight: 18 },
  subtopicMeta: { flexDirection: 'row', alignItems: 'center', gap: 8, flexWrap: 'wrap' },
  starsRow: { flexDirection: 'row', gap: 2 },
  rankLabel: { fontSize: 10, fontWeight: '700' },

  seringBadge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 3,
    backgroundColor: '#FEF3C7',
    borderRadius: 6,
    paddingHorizontal: 6,
    paddingVertical: 2,
  },
  seringText: { fontSize: 9, fontWeight: '800', color: '#D97706' },

  subtopicRight: { alignItems: 'center', minWidth: 44, paddingLeft: 8 },
  countNum: { fontSize: 20, fontWeight: '800' },
  countLabel: { fontSize: 9, color: Colors.textMuted },
});
