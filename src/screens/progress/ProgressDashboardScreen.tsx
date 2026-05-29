import React from 'react';
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
import { CognitiveCalm, HyperMinimal, Fonts } from '../../constants/colors';
import { useStore } from '../../store';
import type { ProgressScreenProps } from '../../navigation/types';
import { useProgressData } from '../../hooks/useProgressData';
import { SUBJECT_LABELS } from '../../types/exam.types';

const DAY_LABELS = ['S', 'S', 'R', 'K', 'J', 'S', 'M']; // Sen Sel Rab Kam Jum Sab Min

export function ProgressDashboardScreen({ navigation }: ProgressScreenProps<'ProgressDashboard'>) {
  const userId = useStore((s) => s.userId);
  const xpTotal = useStore((s) => s.xpTotal);
  const level = useStore((s) => s.level);
  const streakCurrent = useStore((s) => s.streakCurrent);
  const streakLongest = useStore((s) => s.streakLongest);

  const progress = useProgressData({ userId });

  const nextLevelTarget = Math.max(level, 1) * 1000;
  const xpToNext = Math.min(xpTotal, nextLevelTarget);
  const xpPct = Math.max(0, Math.min(1, xpToNext / nextLevelTarget));

  const totalAcc =
    progress.totalAnswered > 0
      ? Math.round((progress.totalCorrect / progress.totalAnswered) * 100)
      : 0;

  return (
    <SafeAreaView style={styles.safe} edges={['top']}>
      {/* TopAppBar */}
      <View style={styles.topbar}>
        <View style={styles.avatarPlaceholder}>
          <Ionicons name="person-outline" size={16} color={HyperMinimal.onSurfaceVariant} />
        </View>
        <Text style={styles.wordmark}>Wirago Academy</Text>
        <TouchableOpacity style={styles.iconBtn} activeOpacity={0.7}>
          <Ionicons name="notifications-outline" size={22} color={CognitiveCalm.error} />
        </TouchableOpacity>
      </View>

      <ScrollView
        contentContainerStyle={styles.scroll}
        showsVerticalScrollIndicator={false}
        refreshControl={
          <RefreshControl
            refreshing={progress.loading}
            onRefresh={progress.refresh}
            tintColor={CognitiveCalm.primary}
          />
        }
      >
        {/* Page intro */}
        <View style={styles.intro}>
          <Text style={styles.title}>Progress Kamu</Text>
          <Text style={styles.subtitle}>Pantau perkembangan belajarmu hari ini.</Text>
        </View>

        {/* Bento: Hero card */}
        <View style={[styles.bentoCard, styles.bentoHero]}>
          <View style={styles.heroTopRow}>
            <View style={styles.levelPill}>
              <Text style={styles.levelPillText}>Level {level}</Text>
            </View>
            <View style={styles.streakPill}>
              <Ionicons name="flame" size={16} color={CognitiveCalm.error} />
              <Text style={styles.streakPillText}>
                {streakCurrent} Hari Streak
              </Text>
            </View>
          </View>

          <Text style={styles.heroLevelTitle}>Pejuang Wirago</Text>

          <View>
            <Text style={styles.heroXpLabel}>TOTAL XP</Text>
            <View style={styles.heroXpRow}>
              <Text style={styles.heroXpValue}>{xpTotal.toLocaleString('id-ID')}</Text>
              <Text style={styles.heroXpUnit}>XP</Text>
            </View>
          </View>

          <View>
            <View style={styles.heroLevelBarMeta}>
              <Text style={styles.heroLevelBarLabel}>
                Menuju Level {level + 1}
              </Text>
              <Text style={styles.heroLevelBarLabel}>
                {xpTotal.toLocaleString('id-ID')} / {nextLevelTarget.toLocaleString('id-ID')} XP
              </Text>
            </View>
            <View style={styles.heroLevelTrack}>
              <View style={[styles.heroLevelFill, { width: `${xpPct * 100}%` }]} />
            </View>
          </View>
        </View>

        {/* Bento: Weekly activity */}
        <View style={styles.bentoCard}>
          <Text style={styles.bentoLabel}>AKTIVITAS MINGGU INI</Text>
          <View style={styles.weekRow}>
            {DAY_LABELS.map((day, i) => {
              const isActive = i < (streakCurrent % 7 || (streakCurrent > 0 ? 7 : 0));
              // Date.getDay(): 0=Sun..6=Sat. Shift so Mon=0..Sun=6.
              const today = i === ((new Date().getDay() + 6) % 7);
              const heightPct = isActive ? (i % 3 === 0 ? 60 : i % 3 === 1 ? 100 : 80) : 60;
              return (
                <View key={`${day}-${i}`} style={styles.dayItem}>
                  {today ? <Text style={styles.dayTodayBadge}>Hari Ini</Text> : null}
                  <View
                    style={[
                      styles.dayBarTrack,
                      today && styles.dayBarTrackToday,
                    ]}
                  >
                    {isActive ? (
                      <View
                        style={[styles.dayBarFill, { height: `${heightPct}%` }]}
                      />
                    ) : null}
                  </View>
                  <Text
                    style={[
                      styles.dayLabel,
                      today && styles.dayLabelToday,
                      !isActive && !today && styles.dayLabelDim,
                    ]}
                  >
                    {day}
                  </Text>
                </View>
              );
            })}
          </View>
        </View>

        {/* Bento: Ringkasan Sesi */}
        <View style={styles.bentoCard}>
          <View style={styles.bentoHeaderRow}>
            <Text style={styles.bentoLabel}>RINGKASAN SESI</Text>
            <Ionicons
              name="analytics-outline"
              size={18}
              color={HyperMinimal.outline}
            />
          </View>
          {progress.loading ? (
            <ActivityIndicator color={CognitiveCalm.primary} />
          ) : (
            <View style={styles.summaryGrid}>
              <View style={styles.summaryTile}>
                <Ionicons
                  name="book-outline"
                  size={20}
                  color={CognitiveCalm.error}
                />
                <Text style={styles.summaryValue}>{progress.totalSessions}</Text>
                <Text style={styles.summaryLabel}>Sesi Belajar</Text>
              </View>
              <View style={styles.summaryTile}>
                <Ionicons
                  name="help-circle-outline"
                  size={20}
                  color={CognitiveCalm.error}
                />
                <Text style={styles.summaryValue}>{progress.totalAnswered}</Text>
                <Text style={styles.summaryLabel}>Soal Dijawab</Text>
              </View>
              <View style={[styles.summaryTile, styles.summaryTileWide]}>
                <View style={{ flex: 1 }}>
                  <Text style={styles.summaryValue}>
                    {progress.totalAnswered > 0 ? `${totalAcc}%` : '—'}
                  </Text>
                  <Text style={styles.summaryLabel}>Akurasi Keseluruhan</Text>
                </View>
                <CircularPct pct={totalAcc / 100} />
              </View>
            </View>
          )}
        </View>

        {/* Bento: Akurasi per Mata Pelajaran */}
        <View style={styles.bentoCard}>
          <View style={styles.bentoHeaderRow}>
            <Text style={styles.bentoLabel}>AKURASI PER MATA PELAJARAN</Text>
            <Ionicons
              name="library-outline"
              size={18}
              color={HyperMinimal.outline}
            />
          </View>
          {progress.loading ? (
            <ActivityIndicator color={CognitiveCalm.primary} />
          ) : progress.accuracyBySubject.length === 0 ? (
            <Text style={styles.emptySubText}>
              Belum ada data akurasi — selesaikan satu sesi untuk mengisi grafik.
            </Text>
          ) : (
            <View style={styles.accuracyList}>
              {progress.accuracyBySubject.map((row) => (
                <View key={row.subject} style={styles.accuracyRow}>
                  <View style={styles.accuracyRowTop}>
                    <Text style={styles.accuracyLabel}>
                      {SUBJECT_LABELS[row.subject] ?? row.subject}
                    </Text>
                    <Text style={styles.accuracyPct}>{row.pct}%</Text>
                  </View>
                  <View style={styles.accuracyTrack}>
                    <View
                      style={[styles.accuracyFill, { width: `${row.pct}%` }]}
                    />
                  </View>
                </View>
              ))}
            </View>
          )}
        </View>

        {/* Streak summary mini */}
        <View style={styles.bentoCard}>
          <View style={styles.streakSummaryRow}>
            <View style={styles.streakSummaryItem}>
              <Text style={styles.streakSummaryValue}>{streakCurrent}</Text>
              <Text style={styles.streakSummaryLabel}>Streak Saat Ini</Text>
            </View>
            <View style={styles.streakSummaryDivider} />
            <View style={styles.streakSummaryItem}>
              <Text style={styles.streakSummaryValue}>{streakLongest}</Text>
              <Text style={styles.streakSummaryLabel}>Streak Terpanjang</Text>
            </View>
          </View>
        </View>

        {/* Empty state if nothing yet */}
        {!progress.loading && progress.totalSessions === 0 ? (
          <View style={[styles.bentoCard, styles.emptyCard]}>
            <Ionicons
              name="bar-chart-outline"
              size={48}
              color={HyperMinimal.outlineVariant}
            />
            <Text style={styles.emptyTitle}>Mulai sesi pertama</Text>
            <Text style={styles.emptyDesc}>
              Selesaikan satu sesi latihan untuk melihat statistik dan riwayat di sini.
            </Text>
          </View>
        ) : null}

        {/* History link */}
        <TouchableOpacity
          style={styles.historyLink}
          activeOpacity={0.85}
          onPress={() => navigation.navigate('HistoryList')}
        >
          <View style={styles.historyLinkLeft}>
            <View style={styles.historyIcon}>
              <Ionicons name="time-outline" size={20} color={CognitiveCalm.error} />
            </View>
            <View>
              <Text style={styles.historyLinkTitle}>Riwayat Sesi</Text>
              <Text style={styles.historyLinkDesc}>
                {progress.recentSessions.length > 0
                  ? `${progress.recentSessions.length} sesi tersimpan`
                  : 'Lihat semua sesi latihan & tryout'}
              </Text>
            </View>
          </View>
          <Ionicons
            name="chevron-forward"
            size={18}
            color={HyperMinimal.outlineVariant}
          />
        </TouchableOpacity>
      </ScrollView>
    </SafeAreaView>
  );
}

function CircularPct({ pct }: { pct: number }) {
  const clamped = Math.max(0, Math.min(1, pct));
  const size = 44;
  const stroke = 4;
  // Approximated with two half-rings; SVG would be cleaner but adds a dep.
  return (
    <View
      style={[
        styles.circularWrap,
        { width: size, height: size, borderRadius: size / 2 },
      ]}
    >
      <View
        style={[
          styles.circularRing,
          {
            width: size,
            height: size,
            borderRadius: size / 2,
            borderWidth: stroke,
          },
        ]}
      />
      <View
        style={[
          styles.circularFill,
          {
            width: size,
            height: size,
            borderRadius: size / 2,
            borderWidth: stroke,
            opacity: 0.85,
            transform: [{ rotateZ: `${clamped * 360 - 90}deg` }],
          },
        ]}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: HyperMinimal.background },

  topbar: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: 20,
    paddingVertical: 12,
    backgroundColor: HyperMinimal.glassSurface,
    borderBottomWidth: 1,
    borderBottomColor: HyperMinimal.borderSubtle,
  },
  avatarPlaceholder: {
    width: 36,
    height: 36,
    borderRadius: 18,
    backgroundColor: HyperMinimal.surfaceContainer,
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

  scroll: { padding: 20, gap: 16, paddingBottom: 40 },

  intro: { gap: 4, marginBottom: 4 },
  title: {
    fontFamily: Fonts.bold,
    fontSize: 28,
    lineHeight: 36,
    color: HyperMinimal.deepNavy,
  },
  subtitle: {
    fontFamily: Fonts.regular,
    fontSize: 14,
    lineHeight: 20,
    color: HyperMinimal.onSurfaceVariant,
  },

  bentoCard: {
    backgroundColor: '#FFFFFFCC',
    borderRadius: 24,
    padding: 18,
    borderWidth: 1,
    borderColor: HyperMinimal.borderSubtle,
    gap: 12,
    shadowColor: HyperMinimal.deepNavy,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.04,
    shadowRadius: 12,
    elevation: 2,
  },
  bentoLabel: {
    fontFamily: Fonts.semibold,
    fontSize: 11,
    color: HyperMinimal.onSurfaceVariant,
    letterSpacing: 1,
  },
  bentoHeaderRow: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },

  // Hero card
  bentoHero: { gap: 16 },
  heroTopRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  levelPill: {
    paddingHorizontal: 12,
    paddingVertical: 5,
    backgroundColor: CognitiveCalm.error + '18',
    borderRadius: 999,
  },
  levelPillText: {
    fontFamily: Fonts.semibold,
    fontSize: 12,
    color: CognitiveCalm.error,
  },
  streakPill: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    paddingHorizontal: 12,
    paddingVertical: 6,
    backgroundColor: HyperMinimal.surfaceContainer,
    borderRadius: 12,
  },
  streakPillText: {
    fontFamily: Fonts.semibold,
    fontSize: 12,
    color: HyperMinimal.deepNavy,
  },
  heroLevelTitle: {
    fontFamily: Fonts.bold,
    fontSize: 22,
    lineHeight: 28,
    color: HyperMinimal.deepNavy,
  },
  heroXpLabel: {
    fontFamily: Fonts.semibold,
    fontSize: 11,
    color: HyperMinimal.onSurfaceVariant,
    letterSpacing: 1,
    marginBottom: 4,
  },
  heroXpRow: { flexDirection: 'row', alignItems: 'baseline', gap: 6 },
  heroXpValue: {
    fontFamily: Fonts.extrabold,
    fontSize: 40,
    lineHeight: 48,
    color: CognitiveCalm.error,
  },
  heroXpUnit: {
    fontFamily: Fonts.regular,
    fontSize: 14,
    color: HyperMinimal.onSurfaceVariant,
  },
  heroLevelBarMeta: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 6,
  },
  heroLevelBarLabel: {
    fontFamily: Fonts.regular,
    fontSize: 11,
    color: HyperMinimal.onSurfaceVariant,
  },
  heroLevelTrack: {
    height: 8,
    backgroundColor: HyperMinimal.surfaceContainer,
    borderRadius: 999,
    overflow: 'hidden',
  },
  heroLevelFill: {
    height: '100%',
    backgroundColor: CognitiveCalm.error,
    borderRadius: 999,
  },

  // Weekly activity
  weekRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-end',
    height: 110,
  },
  dayItem: {
    alignItems: 'center',
    gap: 8,
    width: 36,
  },
  dayTodayBadge: {
    position: 'absolute',
    top: -18,
    fontFamily: Fonts.bold,
    fontSize: 10,
    color: CognitiveCalm.error,
  },
  dayBarTrack: {
    width: 24,
    height: 72,
    backgroundColor: CognitiveCalm.error + '18',
    borderRadius: 6,
    overflow: 'hidden',
    justifyContent: 'flex-end',
  },
  dayBarTrackToday: {
    borderWidth: 2,
    borderColor: CognitiveCalm.error,
  },
  dayBarFill: {
    width: '100%',
    backgroundColor: CognitiveCalm.error,
    borderRadius: 6,
  },
  dayLabel: {
    fontFamily: Fonts.semibold,
    fontSize: 12,
    color: HyperMinimal.onSurfaceVariant,
  },
  dayLabelToday: { color: CognitiveCalm.error, fontFamily: Fonts.bold },
  dayLabelDim: { color: HyperMinimal.outlineVariant },

  // Ringkasan
  summaryGrid: { flexDirection: 'row', flexWrap: 'wrap', gap: 10 },
  summaryTile: {
    flexBasis: '47%',
    flexGrow: 1,
    backgroundColor: HyperMinimal.surfaceContainerLowest,
    borderWidth: 1,
    borderColor: HyperMinimal.borderSubtle,
    borderRadius: 14,
    padding: 14,
    gap: 4,
  },
  summaryTileWide: {
    flexBasis: '100%',
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
  },
  summaryValue: {
    fontFamily: Fonts.bold,
    fontSize: 22,
    color: HyperMinimal.deepNavy,
  },
  summaryLabel: {
    fontFamily: Fonts.regular,
    fontSize: 11,
    color: HyperMinimal.onSurfaceVariant,
  },

  // Circular pct (approximation)
  circularWrap: {
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: HyperMinimal.surfaceContainer,
  },
  circularRing: {
    position: 'absolute',
    borderColor: HyperMinimal.surfaceContainer,
  },
  circularFill: {
    position: 'absolute',
    borderColor: CognitiveCalm.error,
    borderRightColor: 'transparent',
    borderBottomColor: 'transparent',
  },

  // Accuracy
  accuracyList: { gap: 14 },
  accuracyRow: { gap: 6 },
  accuracyRowTop: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  accuracyLabel: {
    fontFamily: Fonts.medium,
    fontSize: 12,
    color: HyperMinimal.deepNavy,
  },
  accuracyPct: {
    fontFamily: Fonts.bold,
    fontSize: 12,
    color: HyperMinimal.deepNavy,
  },
  accuracyTrack: {
    height: 6,
    backgroundColor: HyperMinimal.surfaceContainer,
    borderRadius: 999,
    overflow: 'hidden',
  },
  accuracyFill: {
    height: '100%',
    backgroundColor: CognitiveCalm.error,
    borderRadius: 999,
  },
  emptySubText: {
    fontFamily: Fonts.regular,
    fontSize: 12,
    color: HyperMinimal.onSurfaceVariant,
    lineHeight: 18,
  },

  // Streak summary mini
  streakSummaryRow: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-around',
  },
  streakSummaryItem: { alignItems: 'center', gap: 4 },
  streakSummaryValue: {
    fontFamily: Fonts.extrabold,
    fontSize: 28,
    color: CognitiveCalm.error,
  },
  streakSummaryLabel: {
    fontFamily: Fonts.regular,
    fontSize: 11,
    color: HyperMinimal.onSurfaceVariant,
  },
  streakSummaryDivider: {
    width: 1,
    height: 40,
    backgroundColor: HyperMinimal.borderSubtle,
  },

  // Empty state
  emptyCard: { alignItems: 'center', paddingVertical: 28, gap: 8 },
  emptyTitle: {
    fontFamily: Fonts.bold,
    fontSize: 16,
    color: HyperMinimal.deepNavy,
    marginTop: 4,
  },
  emptyDesc: {
    fontFamily: Fonts.regular,
    fontSize: 13,
    color: HyperMinimal.onSurfaceVariant,
    textAlign: 'center',
    lineHeight: 20,
    paddingHorizontal: 12,
  },

  // History link
  historyLink: {
    backgroundColor: HyperMinimal.surfaceContainerLowest,
    borderRadius: 16,
    padding: 16,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    borderWidth: 1,
    borderColor: HyperMinimal.borderSubtle,
  },
  historyLinkLeft: { flexDirection: 'row', alignItems: 'center', gap: 14 },
  historyIcon: {
    width: 42,
    height: 42,
    borderRadius: 12,
    backgroundColor: CognitiveCalm.error + '14',
    justifyContent: 'center',
    alignItems: 'center',
  },
  historyLinkTitle: {
    fontFamily: Fonts.bold,
    fontSize: 14,
    color: HyperMinimal.deepNavy,
  },
  historyLinkDesc: {
    fontFamily: Fonts.regular,
    fontSize: 12,
    color: HyperMinimal.onSurfaceVariant,
    marginTop: 2,
  },
});
