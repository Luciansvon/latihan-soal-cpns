import React, { useCallback, useEffect, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useFocusEffect } from '@react-navigation/native';
import { Ionicons } from '@expo/vector-icons';
import { CognitiveCalm, Fonts } from '../../constants/colors';
import {
  EXAM_CONFIGS,
  SUBJECT_LABELS,
  type ExamType,
  type SubjectType,
} from '../../types/exam.types';
import type { LatihanScreenProps } from '../../navigation/types';
import { useStore } from '../../store';
import { useProgressData } from '../../hooks/useProgressData';
import {
  DailyChallengeService,
  DAILY_CHALLENGE_SIZE,
  type DailyChallengeState,
} from '../../services/DailyChallengeService';
import { AppHeader } from '../../components/common/AppHeader';

const EXAM_TABS: ExamType[] = ['CPNS', 'TNI', 'POLRI'];

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

export function LatihanHomeScreen({ navigation }: LatihanScreenProps<'LatihanHome'>) {
  const [activeExam, setActiveExam] = useState<ExamType>('CPNS');
  const userId = useStore((s) => s.userId);
  const profile = useStore((s) => s.profile);

  const progress = useProgressData({ userId });
  const [dailyState, setDailyState] = useState<DailyChallengeState | null>(null);

  useEffect(() => {
    if (!userId || progress.loading) return;
    let cancelled = false;
    DailyChallengeService.getTodayState(
      userId,
      progress.accuracyBySubject,
      profile?.targetExam ?? 'CPNS',
    )
      .then((s) => {
        if (!cancelled) setDailyState(s);
      })
      .catch(() => {
        if (!cancelled) setDailyState(null);
      });
    return () => {
      cancelled = true;
    };
  }, [userId, profile?.targetExam, progress.loading, progress.accuracyBySubject]);

  // Refresh progress + daily state on focus — otherwise the "done" badge
  // stays stale after user finishes the daily challenge and back-navigates.
  useFocusEffect(
    useCallback(() => {
      void progress.refresh();
    }, [progress.refresh]),
  );

  const config = EXAM_CONFIGS[activeExam];

  const handleStartDaily = async () => {
    if (!dailyState || !dailyState.subject || !dailyState.examType || !userId) return;
    await DailyChallengeService.markStarted(userId, dailyState);
    navigation.navigate('PracticeSession', {
      examType: dailyState.examType,
      subject: dailyState.subject,
      questionCount: DAILY_CHALLENGE_SIZE,
      isDailyChallenge: true,
    });
  };

  return (
    <SafeAreaView style={styles.safe} edges={['top']}>
      <AppHeader theme="warm" />

      <ScrollView
        contentContainerStyle={styles.scroll}
        showsVerticalScrollIndicator={false}
      >
        {/* Intro */}
        <View style={styles.intro}>
          <Text style={styles.title}>Latihan Soal</Text>
          <Text style={styles.subtitle}>
            Pilih kategori ujian dan mulai berlatih hari ini.
          </Text>
        </View>

        {/* Exam tabs */}
        <ScrollView
          horizontal
          showsHorizontalScrollIndicator={false}
          contentContainerStyle={styles.tabRow}
        >
          {EXAM_TABS.map((exam) => {
            const isActive = activeExam === exam;
            return (
              <TouchableOpacity
                key={exam}
                style={[styles.tab, isActive && styles.tabActive]}
                onPress={() => setActiveExam(exam)}
                activeOpacity={0.85}
              >
                <Text style={[styles.tabText, isActive && styles.tabTextActive]}>
                  {EXAM_CONFIGS[exam].label}
                </Text>
              </TouchableOpacity>
            );
          })}
        </ScrollView>

        {/* Description banner */}
        <View style={styles.descBanner}>
          <Ionicons
            name="information-circle-outline"
            size={18}
            color={CognitiveCalm.tertiary}
          />
          <Text style={styles.descText}>{config.description}</Text>
        </View>

        {/* Subject list */}
        <Text style={styles.sectionLabel}>PILIH MATA PELAJARAN</Text>
        {config.subjects.map((subject) => {
          const iconName = SUBJECT_ICONS[subject] ?? 'document-text-outline';
          return (
            <TouchableOpacity
              key={subject}
              style={styles.subjectCard}
              activeOpacity={0.85}
              onPress={() =>
                navigation.navigate('CategoryList', { examType: activeExam })
              }
            >
              <View style={styles.subjectIconBox}>
                <Ionicons
                  name={iconName}
                  size={22}
                  color={CognitiveCalm.primary}
                />
              </View>
              <View style={styles.subjectInfo}>
                <Text style={styles.subjectCode}>{subject}</Text>
                <Text style={styles.subjectName}>{SUBJECT_LABELS[subject]}</Text>
              </View>
              <Ionicons
                name="chevron-forward"
                size={18}
                color={CognitiveCalm.outline}
              />
            </TouchableOpacity>
          );
        })}

        {/* See all */}
        <TouchableOpacity
          style={styles.allBtn}
          activeOpacity={0.85}
          onPress={() =>
            navigation.navigate('CategoryList', { examType: activeExam })
          }
        >
          <Ionicons
            name="flash-outline"
            size={18}
            color={CognitiveCalm.primary}
          />
          <Text style={styles.allBtnText}>
            Lihat Semua Paket {config.label}
          </Text>
        </TouchableOpacity>

        {/* Daily challenge */}
        {dailyState ? (
          <TouchableOpacity
            style={[
              styles.dailyCard,
              dailyState.done && styles.dailyCardDone,
            ]}
            activeOpacity={dailyState.done ? 1 : 0.85}
            disabled={dailyState.done}
            onPress={handleStartDaily}
          >
            <View
              style={[
                styles.dailyIconBox,
                dailyState.done && styles.dailyIconBoxDone,
              ]}
            >
              <Ionicons
                name={dailyState.done ? 'checkmark-circle' : 'flash'}
                size={22}
                color={dailyState.done ? '#16A34A' : '#D97706'}
              />
            </View>
            <View style={styles.dailyBody}>
              <View style={styles.dailyTitleRow}>
                <Text style={styles.dailyTitle}>Tantangan Harian</Text>
                {dailyState.done ? (
                  <Text style={styles.dailyDoneTag}>SELESAI</Text>
                ) : null}
              </View>
              <Text style={styles.dailyDesc}>
                {dailyState.done
                  ? 'Sudah selesai hari ini. Sampai jumpa besok!'
                  : `${DAILY_CHALLENGE_SIZE} soal ${SUBJECT_LABELS[dailyState.subject!] ?? dailyState.subject} — ${dailyState.reason}`}
              </Text>
            </View>
            {!dailyState.done ? (
              <Ionicons
                name="chevron-forward"
                size={18}
                color={CognitiveCalm.outline}
              />
            ) : null}
          </TouchableOpacity>
        ) : null}

        {/* Skim trainer */}
        <TouchableOpacity
          style={styles.skimCard}
          activeOpacity={0.85}
          onPress={() => navigation.navigate('SkimTrainer')}
        >
          <View style={styles.skimIconBox}>
            <Ionicons
              name="speedometer-outline"
              size={22}
              color={CognitiveCalm.tertiary}
            />
          </View>
          <View style={styles.skimBody}>
            <Text style={styles.skimTitle}>Latih Baca Cepat (Skim)</Text>
            <Text style={styles.skimDesc}>
              Drill membaca soal di bawah tekanan waktu — lawan reading fatigue HOTS.
            </Text>
          </View>
          <Ionicons
            name="chevron-forward"
            size={18}
            color={CognitiveCalm.outline}
          />
        </TouchableOpacity>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: CognitiveCalm.surface },

  scroll: { paddingHorizontal: 20, paddingTop: 20, paddingBottom: 40, gap: 12 },

  intro: { gap: 4 },
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

  tabRow: { gap: 10, paddingVertical: 4 },
  tab: {
    paddingHorizontal: 22,
    paddingVertical: 10,
    borderRadius: 999,
    backgroundColor: CognitiveCalm.surfaceContainer,
    borderWidth: 1,
    borderColor: CognitiveCalm.outlineVariant + '60',
  },
  tabActive: {
    backgroundColor: CognitiveCalm.primary,
    borderColor: CognitiveCalm.primary,
    shadowColor: CognitiveCalm.primary,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 8,
    elevation: 2,
  },
  tabText: {
    fontFamily: Fonts.semibold,
    fontSize: 13,
    color: CognitiveCalm.onSurface,
  },
  tabTextActive: { color: CognitiveCalm.onPrimary },

  descBanner: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
    backgroundColor: CognitiveCalm.surfaceContainerLow,
    padding: 14,
    borderRadius: 14,
    borderWidth: 1,
    borderColor: CognitiveCalm.tertiary + '20',
  },
  descText: {
    flex: 1,
    fontFamily: Fonts.medium,
    fontSize: 13,
    color: CognitiveCalm.onSurfaceVariant,
  },

  sectionLabel: {
    fontFamily: Fonts.semibold,
    fontSize: 11,
    color: CognitiveCalm.onSurfaceVariant,
    letterSpacing: 1,
    marginTop: 8,
  },

  subjectCard: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 14,
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
  subjectIconBox: {
    width: 48,
    height: 48,
    borderRadius: 14,
    backgroundColor: CognitiveCalm.surfaceContainer,
    alignItems: 'center',
    justifyContent: 'center',
  },
  subjectInfo: { flex: 1, gap: 2 },
  subjectCode: {
    fontFamily: Fonts.semibold,
    fontSize: 11,
    color: CognitiveCalm.onSurfaceVariant,
    letterSpacing: 0.5,
  },
  subjectName: {
    fontFamily: Fonts.semibold,
    fontSize: 14,
    color: CognitiveCalm.onSurface,
  },

  allBtn: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
    marginTop: 4,
    paddingVertical: 14,
    borderRadius: 14,
    borderWidth: 1.5,
    borderColor: CognitiveCalm.primary,
    backgroundColor: CognitiveCalm.surfaceContainerLowest,
  },
  allBtnText: {
    fontFamily: Fonts.bold,
    fontSize: 14,
    color: CognitiveCalm.primary,
  },

  dailyCard: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    backgroundColor: CognitiveCalm.surfaceContainerLowest,
    borderRadius: 16,
    padding: 14,
    marginTop: 10,
    borderLeftWidth: 4,
    borderLeftColor: '#D97706',
    shadowColor: CognitiveCalm.shadow,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.03,
    shadowRadius: 8,
    elevation: 1,
  },
  dailyCardDone: {
    borderLeftColor: '#16A34A',
    backgroundColor: '#16A34A0A',
  },
  dailyIconBox: {
    width: 42,
    height: 42,
    borderRadius: 12,
    backgroundColor: '#D9770618',
    alignItems: 'center',
    justifyContent: 'center',
  },
  dailyIconBoxDone: { backgroundColor: '#16A34A18' },
  dailyBody: { flex: 1, gap: 2 },
  dailyTitleRow: { flexDirection: 'row', alignItems: 'center', gap: 6 },
  dailyTitle: {
    fontFamily: Fonts.bold,
    fontSize: 14,
    color: CognitiveCalm.onSurface,
  },
  dailyDoneTag: {
    fontFamily: Fonts.bold,
    fontSize: 9,
    color: '#16A34A',
    letterSpacing: 0.5,
    backgroundColor: '#16A34A18',
    paddingHorizontal: 6,
    paddingVertical: 2,
    borderRadius: 4,
    overflow: 'hidden',
  },
  dailyDesc: {
    fontFamily: Fonts.regular,
    fontSize: 11,
    color: CognitiveCalm.onSurfaceVariant,
    lineHeight: 16,
  },

  skimCard: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    backgroundColor: CognitiveCalm.surfaceContainerLowest,
    borderRadius: 16,
    padding: 14,
    marginTop: 0,
    borderLeftWidth: 4,
    borderLeftColor: CognitiveCalm.tertiary,
    shadowColor: CognitiveCalm.shadow,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.03,
    shadowRadius: 8,
    elevation: 1,
  },
  skimIconBox: {
    width: 42,
    height: 42,
    borderRadius: 12,
    backgroundColor: CognitiveCalm.tertiary + '15',
    alignItems: 'center',
    justifyContent: 'center',
  },
  skimBody: { flex: 1, gap: 2 },
  skimTitle: {
    fontFamily: Fonts.bold,
    fontSize: 14,
    color: CognitiveCalm.onSurface,
  },
  skimDesc: {
    fontFamily: Fonts.regular,
    fontSize: 11,
    color: CognitiveCalm.onSurfaceVariant,
    lineHeight: 16,
  },
});
