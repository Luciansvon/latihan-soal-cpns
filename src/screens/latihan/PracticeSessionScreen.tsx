import React, { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  SafeAreaView,
  ScrollView,
  TouchableOpacity,
  ActivityIndicator,
  Alert,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import { EXAM_CONFIGS, SUBJECT_LABELS } from '../../types/exam.types';
import type { LatihanScreenProps } from '../../navigation/types';
import type { Question, QuestionOption } from '../../types/question.types';
import type { PracticeSession, UserAnswer } from '../../types/session.types';
import { QuestionRepository } from '../../db/repositories/QuestionRepository';
import { SessionRepository, AnswerRepository } from '../../db/repositories/SessionRepository';
import { calculateAnswerScore, calculateMaxScore } from '../../utils/ScoreCalculator';
import { uuidv4 } from '../../utils/uuid';
import { useStore } from '../../store';
import { supabase } from '../../services/supabase';
import { GamificationService } from '../../services/GamificationService';

const EXAM_COLORS: Record<string, string> = {
  CPNS: Colors.cpns,
  TNI: Colors.tni,
  POLRI: Colors.polri,
};

const DEFAULT_QUESTION_COUNT = 10;

export function PracticeSessionScreen({ route, navigation }: LatihanScreenProps<'PracticeSession'>) {
  const { examType, subject, packId, subtopic, questionCount } = route.params;
  const userId = useStore((s) => s.userId);
  const isOnline = useStore((s) => s.isOnline);
  const setXPAndLevel = useStore((s) => s.setXPAndLevel);
  const updateStreakStore = useStore((s) => s.updateStreak);

  const accentColor = EXAM_COLORS[examType] ?? Colors.primary;
  const examConfig = EXAM_CONFIGS[examType];

  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [questions, setQuestions] = useState<Question[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [selected, setSelected] = useState<Record<string, string>>({});
  const [revealed, setRevealed] = useState<Set<string>>(new Set());
  const [submitting, setSubmitting] = useState(false);

  const sessionIdRef = useRef<string>(uuidv4());
  const sessionStartRef = useRef<number>(Date.now());
  const questionEnterTimeRef = useRef<number>(Date.now());
  const timePerQuestionRef = useRef<Record<string, number>>({});

  const limit = questionCount ?? DEFAULT_QUESTION_COUNT;

  // -------------------- Load questions + create session row --------------------
  useEffect(() => {
    let cancelled = false;
    (async () => {
      if (!userId) {
        setError('Sesi belum aktif. Silakan login ulang.');
        setLoading(false);
        return;
      }
      try {
        const fetched = await fetchQuestions({
          packId,
          examType,
          subject,
          subtopic,
          limit,
          isOnline,
        });
        if (cancelled) return;

        if (fetched.length === 0) {
          setError(
            isOnline
              ? `Belum ada soal untuk ${SUBJECT_LABELS[subject]}. Coba kategori lain atau tunggu admin menambah konten.`
              : 'Mode offline: belum ada paket terdownload untuk kategori ini. Download dulu di menu Profil → Download Manager.'
          );
          setLoading(false);
          return;
        }

        const draftSession: PracticeSession = {
          id: sessionIdRef.current,
          userId,
          sessionType: 'PRACTICE',
          examType,
          subject,
          totalQuestions: fetched.length,
          answeredCount: 0,
          correctCount: 0,
          totalScore: 0,
          maxScore: calculateMaxScore(fetched.length, subject, examType),
          completed: false,
          startedAt: sessionStartRef.current,
          isSynced: false,
        };
        await SessionRepository.createSession(draftSession);

        setQuestions(fetched);
        setLoading(false);
        questionEnterTimeRef.current = Date.now();
      } catch (e: any) {
        if (cancelled) return;
        setError(`Gagal memuat soal: ${e?.message ?? 'unknown error'}`);
        setLoading(false);
      }
    })();
    return () => {
      cancelled = true;
    };
    // Mount-only: route params and userId are stable for the screen's lifetime.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // Record time spent each time the user navigates between questions
  const captureTimeForCurrent = useCallback(() => {
    const current = questions[currentIndex];
    if (!current) return;
    const delta = Date.now() - questionEnterTimeRef.current;
    timePerQuestionRef.current[current.id] =
      (timePerQuestionRef.current[current.id] ?? 0) + delta;
    questionEnterTimeRef.current = Date.now();
  }, [questions, currentIndex]);

  const goTo = useCallback(
    (next: number) => {
      captureTimeForCurrent();
      setCurrentIndex(next);
    },
    [captureTimeForCurrent]
  );

  // -------------------- Answer + reveal --------------------
  const currentQuestion = questions[currentIndex];

  const handleSelect = (optionId: string) => {
    if (!currentQuestion) return;
    setSelected((prev) => ({ ...prev, [currentQuestion.id]: optionId }));
    setRevealed((prev) => {
      if (prev.has(currentQuestion.id)) return prev;
      const next = new Set(prev);
      next.add(currentQuestion.id);
      return next;
    });
  };

  // -------------------- Finalize --------------------
  const finalize = useCallback(async () => {
    if (!userId || submitting) return;
    setSubmitting(true);
    captureTimeForCurrent();
    try {
      const completedAt = Date.now();

      const answers: UserAnswer[] = [];
      let totalScore = 0;
      let correctCount = 0;

      for (const q of questions) {
        const sel = selected[q.id];
        if (!sel) continue;
        const result = calculateAnswerScore(q, sel, examType);
        totalScore += result.score;
        if (result.isCorrect) correctCount += 1;
        answers.push({
          id: uuidv4(),
          userId,
          questionId: q.id,
          sessionId: sessionIdRef.current,
          selectedOption: sel,
          isCorrect: result.isCorrect,
          scoreEarned: result.score,
          timeSpentMs: timePerQuestionRef.current[q.id] ?? 0,
          answeredAt: completedAt,
          isSynced: false,
        });
      }

      await AnswerRepository.saveAnswers(answers);

      const finalSession: PracticeSession = {
        id: sessionIdRef.current,
        userId,
        sessionType: 'PRACTICE',
        examType,
        subject,
        totalQuestions: questions.length,
        answeredCount: answers.length,
        correctCount,
        totalScore,
        maxScore: calculateMaxScore(questions.length, subject, examType),
        durationSeconds: Math.round((completedAt - sessionStartRef.current) / 1000),
        completed: true,
        startedAt: sessionStartRef.current,
        completedAt,
        isSynced: false,
      };
      await SessionRepository.updateSession(finalSession);

      // Award XP, update streak, check achievements (idempotent per sessionId)
      try {
        const award = await GamificationService.awardForSession(finalSession);
        setXPAndLevel(award.newXpTotal, award.newLevel);
        updateStreakStore(award.streakCurrent, award.streakLongest);
      } catch {
        // gamification failure is non-fatal — session sudah tersimpan
      }

      navigation.replace('SessionResult', { sessionId: sessionIdRef.current });
    } catch (e: any) {
      Alert.alert('Gagal menyimpan', e?.message ?? 'Terjadi kesalahan tak terduga.');
      setSubmitting(false);
    }
  }, [userId, submitting, captureTimeForCurrent, questions, selected, examType, subject, navigation]);

  const confirmEarlyExit = () => {
    if (Object.keys(selected).length === 0) {
      navigation.goBack();
      return;
    }
    Alert.alert(
      'Keluar dari sesi?',
      'Jawaban yang belum diselesaikan akan hilang.',
      [
        { text: 'Batal', style: 'cancel' },
        { text: 'Keluar', style: 'destructive', onPress: () => navigation.goBack() },
      ]
    );
  };

  // -------------------- Render --------------------
  if (loading) {
    return (
      <SafeAreaView style={styles.safe}>
        <View style={styles.centerBox}>
          <ActivityIndicator size="large" color={accentColor} />
          <Text style={styles.loadingTitle}>Memuat soal…</Text>
          <Text style={styles.loadingDesc}>
            {SUBJECT_LABELS[subject]} · {examConfig.label}
          </Text>
        </View>
      </SafeAreaView>
    );
  }

  if (error) {
    return (
      <SafeAreaView style={styles.safe}>
        <View style={styles.centerBox}>
          <Ionicons name="alert-circle-outline" size={56} color={Colors.error} />
          <Text style={styles.errorTitle}>Tidak bisa memulai sesi</Text>
          <Text style={styles.errorDesc}>{error}</Text>
          <TouchableOpacity
            style={[styles.primaryBtn, { backgroundColor: accentColor }]}
            onPress={() => navigation.goBack()}
            activeOpacity={0.85}
          >
            <Text style={styles.primaryBtnText}>Kembali</Text>
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    );
  }

  const total = questions.length;
  const progress = ((currentIndex + 1) / total) * 100;
  const selectedHere = currentQuestion ? selected[currentQuestion.id] : undefined;
  const isRevealed = currentQuestion ? revealed.has(currentQuestion.id) : false;
  const isLast = currentIndex === total - 1;

  return (
    <SafeAreaView style={styles.safe}>
      {/* Header */}
      <View style={[styles.header, { borderBottomColor: accentColor + '40' }]}>
        <TouchableOpacity style={styles.iconBtn} onPress={confirmEarlyExit}>
          <Ionicons name="close" size={22} color={Colors.textPrimary} />
        </TouchableOpacity>
        <View style={styles.headerCenter}>
          <View style={[styles.examBadge, { backgroundColor: accentColor }]}>
            <Text style={styles.examBadgeText}>{examConfig.label}</Text>
          </View>
          <Text style={styles.headerSubject} numberOfLines={1}>
            {SUBJECT_LABELS[subject]}
          </Text>
        </View>
        <View style={styles.iconBtn} />
      </View>

      {/* Progress */}
      <View style={styles.progressContainer}>
        <View style={styles.progressTrack}>
          <View style={[styles.progressFill, { width: `${progress}%`, backgroundColor: accentColor }]} />
        </View>
        <Text style={styles.progressLabel}>
          {currentIndex + 1} / {total}
        </Text>
      </View>

      {/* Content */}
      <ScrollView
        contentContainerStyle={styles.scroll}
        showsVerticalScrollIndicator={false}
        keyboardShouldPersistTaps="handled"
      >
        {currentQuestion ? (
          <QuestionView
            question={currentQuestion}
            number={currentIndex + 1}
            total={total}
            accentColor={accentColor}
            selectedOption={selectedHere}
            revealed={isRevealed}
            onSelect={handleSelect}
          />
        ) : null}
      </ScrollView>

      {/* Bottom nav */}
      <View style={styles.bottomNav}>
        <TouchableOpacity
          style={[styles.navBtn, currentIndex === 0 && styles.navBtnDisabled]}
          activeOpacity={0.8}
          disabled={currentIndex === 0}
          onPress={() => goTo(currentIndex - 1)}
        >
          <Ionicons
            name="chevron-back"
            size={20}
            color={currentIndex === 0 ? Colors.gray300 : Colors.textSecondary}
          />
          <Text
            style={[
              styles.navBtnText,
              currentIndex === 0 && { color: Colors.gray300 },
            ]}
          >
            Sebelumnya
          </Text>
        </TouchableOpacity>

        {isLast ? (
          <TouchableOpacity
            style={[styles.primaryBtnRow, { backgroundColor: accentColor }]}
            activeOpacity={0.85}
            onPress={finalize}
            disabled={submitting}
          >
            {submitting ? (
              <ActivityIndicator color={Colors.white} />
            ) : (
              <>
                <Ionicons name="checkmark" size={20} color={Colors.white} />
                <Text style={styles.primaryBtnText}>Selesai</Text>
              </>
            )}
          </TouchableOpacity>
        ) : (
          <TouchableOpacity
            style={[styles.primaryBtnRow, { backgroundColor: accentColor }]}
            activeOpacity={0.85}
            onPress={() => goTo(currentIndex + 1)}
          >
            <Text style={styles.primaryBtnText}>Berikutnya</Text>
            <Ionicons name="chevron-forward" size={20} color={Colors.white} />
          </TouchableOpacity>
        )}
      </View>
    </SafeAreaView>
  );
}

// ============================================================================
// QuestionView — render satu soal + opsi + (jika revealed) pembahasan
// ============================================================================
import { QuestionCard } from '../../components/question/QuestionCard';
import { OptionButton, type OptionState } from '../../components/question/OptionButton';

interface QuestionViewProps {
  question: Question;
  number: number;
  total: number;
  accentColor: string;
  selectedOption?: string;
  revealed: boolean;
  onSelect: (optionId: string) => void;
}

function QuestionView({
  question,
  number,
  total,
  accentColor,
  selectedOption,
  revealed,
  onSelect,
}: QuestionViewProps) {
  const isTKP = question.questionType === 'TKP_SCALE';

  const optionState = useMemo(() => {
    return (opt: QuestionOption): OptionState => {
      const isSelected = selectedOption === opt.id;
      if (!revealed) return isSelected ? 'selected' : 'idle';
      // Revealed:
      if (isTKP) {
        // TKP has no wrong answer — highlight only the selected one.
        return isSelected ? 'selected' : 'disabled';
      }
      if (opt.id === question.correctOption) return 'correct';
      if (isSelected) return 'wrong';
      return 'disabled';
    };
  }, [selectedOption, revealed, isTKP, question.correctOption]);

  return (
    <View style={{ gap: 12 }}>
      <QuestionCard
        question={question}
        questionNumber={number}
        totalQuestions={total}
        accentColor={accentColor}
      />

      {question.options.map((opt) => (
        <OptionButton
          key={opt.id}
          optionId={opt.id}
          text={opt.text}
          imageUrl={opt.imageUrl}
          state={optionState(opt)}
          accentColor={accentColor}
          onPress={() => onSelect(opt.id)}
        />
      ))}

      {revealed ? <ExplanationBlock question={question} accentColor={accentColor} isTKP={isTKP} /> : null}
    </View>
  );
}

function ExplanationBlock({
  question,
  accentColor,
  isTKP,
}: {
  question: Question;
  accentColor: string;
  isTKP: boolean;
}) {
  const correctLabel = isTKP
    ? `Skala TKP: nilai tertinggi opsi ${getBestTkpOption(question)}`
    : `Jawaban benar: ${question.correctOption}`;

  return (
    <View style={[styles.explanation, { borderLeftColor: accentColor }]}>
      <View style={styles.explanationHeader}>
        <Ionicons name="bulb-outline" size={16} color={accentColor} />
        <Text style={[styles.explanationTitle, { color: accentColor }]}>Pembahasan</Text>
      </View>
      <Text style={styles.explanationCorrect}>{correctLabel}</Text>
      {question.explanationText ? (
        <Text style={styles.explanationBody}>{question.explanationText}</Text>
      ) : (
        <Text style={styles.explanationEmpty}>Belum ada pembahasan untuk soal ini.</Text>
      )}
    </View>
  );
}

function getBestTkpOption(question: Question): string {
  if (!question.tkpScores) return question.correctOption;
  let bestId = question.correctOption;
  let bestScore = -Infinity;
  for (const [id, score] of Object.entries(question.tkpScores)) {
    if (score > bestScore) {
      bestScore = score;
      bestId = id;
    }
  }
  return bestId;
}

// ============================================================================
// Question fetching — SQLite first, fallback Supabase when online + empty
// ============================================================================
interface FetchArgs {
  packId?: string;
  examType: import('../../types/exam.types').ExamType;
  subject: import('../../types/exam.types').SubjectType;
  subtopic?: string;
  limit: number;
  isOnline: boolean;
}

async function fetchQuestions(args: FetchArgs): Promise<Question[]> {
  const { packId, examType, subject, subtopic, limit, isOnline } = args;

  // Local SQLite first
  let local: Question[] = [];
  if (packId) {
    local = await QuestionRepository.getQuestions(packId, limit);
  } else {
    local = await QuestionRepository.getQuestionsBySubject(examType, subject, limit);
  }

  if (subtopic) {
    local = local.filter((q) => q.subtopic === subtopic);
  }

  if (local.length > 0) return local;
  if (!isOnline) return [];

  // Fallback Supabase
  let query = supabase
    .from('questions')
    .select('*')
    .eq('exam_type', examType)
    .eq('subject', subject)
    .limit(limit * 3); // over-fetch then shuffle/slice for variety
  if (subtopic) query = query.eq('subtopic', subtopic);
  if (packId) query = query.eq('pack_id', packId);

  const { data, error } = await query;
  if (error) throw new Error(error.message);
  const mapped = (data ?? []).map(mapSupabaseRow);
  shuffle(mapped);
  return mapped.slice(0, limit);
}

function mapSupabaseRow(row: any): Question {
  return {
    id: row.id,
    packId: row.pack_id,
    examType: row.exam_type,
    subject: row.subject,
    subtopic: row.subtopic ?? undefined,
    questionType: row.question_type,
    difficulty: row.difficulty,
    questionText: row.question_text,
    questionImageUrl: row.question_image_url ?? undefined,
    options: row.options as QuestionOption[],
    correctOption: row.correct_option,
    tkpScores: row.tkp_scores ?? undefined,
    explanationText: row.explanation_text ?? undefined,
    explanationImageUrl: row.explanation_image_url ?? undefined,
    tags: row.tags ?? undefined,
  };
}

function shuffle<T>(arr: T[]): void {
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
}

// ============================================================================
// Styles
// ============================================================================
const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },

  centerBox: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
    gap: 12,
  },
  loadingTitle: { fontSize: 16, fontWeight: '700', color: Colors.textPrimary, marginTop: 6 },
  loadingDesc: { fontSize: 13, color: Colors.textSecondary },
  errorTitle: { fontSize: 17, fontWeight: '700', color: Colors.textPrimary, marginTop: 6 },
  errorDesc: { fontSize: 13, color: Colors.textSecondary, textAlign: 'center', lineHeight: 20 },

  header: {
    backgroundColor: Colors.white,
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 16,
    paddingVertical: 14,
    borderBottomWidth: 1,
    gap: 12,
  },
  iconBtn: { width: 36, height: 36, justifyContent: 'center', alignItems: 'center' },
  headerCenter: { flex: 1, alignItems: 'center', gap: 4 },
  examBadge: {
    paddingHorizontal: 10,
    paddingVertical: 3,
    borderRadius: 6,
  },
  examBadgeText: { fontSize: 11, fontWeight: '800', color: Colors.white, letterSpacing: 0.5 },
  headerSubject: { fontSize: 13, fontWeight: '600', color: Colors.textPrimary },

  progressContainer: {
    backgroundColor: Colors.white,
    paddingHorizontal: 20,
    paddingBottom: 12,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },
  progressTrack: {
    flex: 1,
    height: 6,
    backgroundColor: Colors.gray200,
    borderRadius: 3,
    overflow: 'hidden',
  },
  progressFill: { height: '100%', borderRadius: 3 },
  progressLabel: { fontSize: 12, fontWeight: '600', color: Colors.textSecondary, minWidth: 40 },

  scroll: { padding: 20, paddingBottom: 32, gap: 12 },

  explanation: {
    backgroundColor: Colors.white,
    borderRadius: 12,
    padding: 14,
    gap: 8,
    borderLeftWidth: 4,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.04,
    shadowRadius: 3,
    elevation: 1,
  },
  explanationHeader: { flexDirection: 'row', alignItems: 'center', gap: 6 },
  explanationTitle: { fontSize: 13, fontWeight: '700' },
  explanationCorrect: { fontSize: 13, fontWeight: '700', color: Colors.textPrimary },
  explanationBody: { fontSize: 13, lineHeight: 20, color: Colors.textSecondary },
  explanationEmpty: { fontSize: 13, color: Colors.textMuted, fontStyle: 'italic' },

  bottomNav: {
    backgroundColor: Colors.white,
    flexDirection: 'row',
    padding: 16,
    gap: 12,
    borderTopWidth: 1,
    borderTopColor: Colors.border,
  },
  navBtn: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 6,
    paddingVertical: 14,
    borderRadius: 12,
    borderWidth: 1.5,
    borderColor: Colors.border,
  },
  navBtnDisabled: { borderColor: Colors.gray200, backgroundColor: Colors.gray50 },
  navBtnText: { fontSize: 14, fontWeight: '600', color: Colors.textSecondary },

  primaryBtnRow: {
    flex: 2,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 6,
    paddingVertical: 14,
    borderRadius: 12,
  },
  primaryBtn: {
    paddingHorizontal: 24,
    paddingVertical: 14,
    borderRadius: 12,
  },
  primaryBtnText: { fontSize: 14, fontWeight: '700', color: Colors.white },
});
