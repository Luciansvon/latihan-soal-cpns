import React, { useCallback, useEffect, useRef, useState } from 'react';
import {
  View, Text, StyleSheet, SafeAreaView, ScrollView,
  TouchableOpacity, ActivityIndicator,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import { EXAM_CONFIGS, SUBJECT_LABELS } from '../../types/exam.types';
import { calculateAnswerScore, calculateMaxScore } from '../../utils/ScoreCalculator';
import { supabase } from '../../services/supabase';
import { QuestionCard } from '../../components/question/QuestionCard';
import { OptionButton } from '../../components/question/OptionButton';
import type { OptionState } from '../../components/question/OptionButton';
import type { Question } from '../../types/question.types';
import type { LatihanScreenProps } from '../../navigation/types';

const EXAM_COLORS: Record<string, string> = {
  CPNS: Colors.cpns, TNI: Colors.tni, POLRI: Colors.polri,
};

interface AnswerRecord {
  questionId: string;
  selectedOption: string;
  isCorrect: boolean;
  scoreEarned: number;
}

function mapRow(row: any): Question {
  return {
    id: row.id,
    packId: row.pack_id,
    examType: row.exam_type,
    subject: row.subject,
    subtopic: row.subtopic ?? undefined,
    questionType: row.question_type,
    difficulty: row.difficulty,
    difficultyRank: row.difficulty_rank ?? undefined,
    questionText: row.question_text,
    questionImageUrl: row.question_image_url ?? undefined,
    options: Array.isArray(row.options) ? row.options : JSON.parse(row.options ?? '[]'),
    correctOption: row.correct_option,
    tkpScores: row.tkp_scores ?? undefined,
    explanationText: row.explanation_text ?? undefined,
    tags: row.tags ?? undefined,
  };
}

export function PracticeSessionScreen({ route, navigation }: LatihanScreenProps<'PracticeSession'>) {
  const { examType, subject, packId, subtopic, questionCount = 20 } = route.params;

  const [questions, setQuestions] = useState<Question[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [selectedOption, setSelectedOption] = useState<string | null>(null);
  const [revealed, setRevealed] = useState(false);
  const [answers, setAnswers] = useState<AnswerRecord[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [isSaving, setIsSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const startTime = useRef(Date.now());

  const accentColor = EXAM_COLORS[examType] ?? Colors.primary;
  const currentQuestion = questions[currentIndex];
  const isLast = currentIndex === questions.length - 1;
  const progress = questions.length > 0 ? (currentIndex + (revealed ? 1 : 0)) / questions.length : 0;

  useEffect(() => {
    loadQuestions();
  }, []);

  async function loadQuestions() {
    try {
      let query = supabase
        .from('questions')
        .select('*')
        .eq('exam_type', examType)
        .eq('subject', subject);

      if (subtopic) query = (query as any).eq('subtopic', subtopic);

      const { data, error: err } = await (query as any).limit(questionCount * 2);
      if (err) throw err;
      if (!data?.length) {
        setError('Belum ada soal untuk kategori ini.\nSilakan tunggu konten diupdate.');
        return;
      }

      const shuffled = [...data].sort(() => Math.random() - 0.5).slice(0, questionCount);
      setQuestions(shuffled.map(mapRow));
    } catch {
      setError('Gagal memuat soal. Periksa koneksi internet.');
    } finally {
      setIsLoading(false);
    }
  }

  function handleSelectOption(opt: string) {
    if (revealed) return;
    setSelectedOption(opt);
    setRevealed(true);

    const result = calculateAnswerScore(currentQuestion, opt, examType);
    setAnswers(prev => [...prev, {
      questionId: currentQuestion.id,
      selectedOption: opt,
      isCorrect: result.isCorrect,
      scoreEarned: result.score,
    }]);
  }

  const handleNext = useCallback(async () => {
    if (!isLast) {
      setCurrentIndex(i => i + 1);
      setSelectedOption(null);
      setRevealed(false);
    } else {
      await finishSession();
    }
  }, [isLast, answers, questions]);

  async function finishSession() {
    setIsSaving(true);
    const totalScore = answers.reduce((s, a) => s + a.scoreEarned, 0);
    const maxScore = calculateMaxScore(questions.length, subject, examType);
    const correct = answers.filter(a => a.isCorrect).length;
    const duration = Math.round((Date.now() - startTime.current) / 1000);
    const xpEarned = correct * 2 + 10;

    try {
      const { data: { user } } = await supabase.auth.getUser();
      if (user) {
        const { data: session } = await supabase
          .from('practice_sessions')
          .insert({
            user_id: user.id,
            session_type: 'PRACTICE',
            exam_type: examType,
            subject,
            total_questions: questions.length,
            answered_count: answers.length,
            correct_count: correct,
            total_score: totalScore,
            max_score: maxScore,
            duration_seconds: duration,
            completed: true,
            started_at: new Date(startTime.current).toISOString(),
            completed_at: new Date().toISOString(),
          })
          .select('id')
          .single();

        if (session?.id && answers.length > 0) {
          await supabase.from('user_answers').insert(
            answers.map(a => ({
              user_id: user.id,
              question_id: a.questionId,
              session_id: session.id,
              selected_option: a.selectedOption,
              is_correct: a.isCorrect,
              score_earned: a.scoreEarned,
              answered_at: new Date().toISOString(),
            }))
          );
        }
      }
    } catch {
      // Session save failed — still navigate to result
    } finally {
      setIsSaving(false);
    }

    navigation.replace('SessionResult', {
      sessionId: Date.now().toString(),
      score: totalScore,
      maxScore,
      correct,
      total: questions.length,
      examType,
      subject,
      xpEarned,
    });
  }

  function optionState(optId: string): OptionState {
    if (!revealed || !selectedOption) return 'idle';
    if (currentQuestion.questionType === 'TKP_SCALE') {
      return optId === selectedOption ? 'selected' : 'idle';
    }
    if (optId === currentQuestion.correctOption) return 'correct';
    if (optId === selectedOption) return 'wrong';
    return 'idle';
  }

  if (isLoading) {
    return (
      <SafeAreaView style={styles.safe}>
        <View style={styles.center}>
          <ActivityIndicator size="large" color={accentColor} />
          <Text style={styles.loadingText}>Memuat soal...</Text>
          <Text style={styles.loadingSubtext}>{SUBJECT_LABELS[subject]}</Text>
        </View>
      </SafeAreaView>
    );
  }

  if (error) {
    return (
      <SafeAreaView style={styles.safe}>
        <View style={styles.center}>
          <Ionicons name="alert-circle-outline" size={48} color={Colors.error} />
          <Text style={styles.errorText}>{error}</Text>
          <TouchableOpacity style={[styles.retryBtn, { backgroundColor: accentColor }]} onPress={loadQuestions}>
            <Text style={styles.retryText}>Coba Lagi</Text>
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    );
  }

  return (
    <SafeAreaView style={styles.safe}>
      {/* Header */}
      <View style={[styles.header, { borderBottomColor: accentColor + '30' }]}>
        <TouchableOpacity style={styles.iconBtn} onPress={() => navigation.goBack()}>
          <Ionicons name="close" size={22} color={Colors.textPrimary} />
        </TouchableOpacity>
        <View style={styles.headerCenter}>
          <View style={[styles.examBadge, { backgroundColor: accentColor }]}>
            <Text style={styles.examBadgeText}>{EXAM_CONFIGS[examType].label}</Text>
          </View>
          <Text style={styles.headerSubject}>{SUBJECT_LABELS[subject]}</Text>
        </View>
        <View style={styles.iconBtn} />
      </View>

      {/* Progress */}
      <View style={styles.progressBar}>
        <View style={[styles.progressFill, { width: `${progress * 100}%`, backgroundColor: accentColor }]} />
      </View>
      <View style={styles.progressLabelRow}>
        <Text style={styles.progressLabel}>{currentIndex + 1} / {questions.length}</Text>
        <Text style={styles.progressLabel}>{Math.round(progress * 100)}%</Text>
      </View>

      {/* Scrollable content */}
      <ScrollView
        style={styles.scroll}
        contentContainerStyle={styles.scrollContent}
        showsVerticalScrollIndicator={false}
        keyboardShouldPersistTaps="handled"
      >
        {currentQuestion && (
          <>
            <QuestionCard
              question={currentQuestion}
              questionNumber={currentIndex + 1}
              accentColor={accentColor}
            />

            <View style={styles.optionsGap}>
              {currentQuestion.options.map(opt => (
                <OptionButton
                  key={opt.id}
                  option={opt}
                  state={optionState(opt.id)}
                  accentColor={accentColor}
                  onPress={() => handleSelectOption(opt.id)}
                  disabled={revealed}
                />
              ))}
            </View>

            {/* Explanation */}
            {revealed && currentQuestion.explanationText && (
              <View style={styles.explanationCard}>
                <View style={styles.explanationHeader}>
                  <Ionicons name="bulb-outline" size={16} color={Colors.warning} />
                  <Text style={styles.explanationTitle}>Pembahasan</Text>
                </View>
                <Text style={styles.explanationText}>{currentQuestion.explanationText}</Text>
              </View>
            )}
          </>
        )}
      </ScrollView>

      {/* Bottom action */}
      {revealed && (
        <View style={styles.bottomBar}>
          <TouchableOpacity
            style={[styles.nextBtn, { backgroundColor: accentColor }, isSaving && styles.nextBtnDisabled]}
            onPress={handleNext}
            disabled={isSaving}
            activeOpacity={0.85}
          >
            {isSaving ? (
              <ActivityIndicator size="small" color={Colors.white} />
            ) : (
              <>
                <Text style={styles.nextBtnText}>{isLast ? 'Lihat Hasil' : 'Soal Berikutnya'}</Text>
                <Ionicons name={isLast ? 'trophy-outline' : 'chevron-forward'} size={18} color={Colors.white} />
              </>
            )}
          </TouchableOpacity>
        </View>
      )}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },
  center: { flex: 1, justifyContent: 'center', alignItems: 'center', gap: 16, padding: 32 },
  loadingText: { fontSize: 17, fontWeight: '700', color: Colors.textPrimary },
  loadingSubtext: { fontSize: 14, color: Colors.textSecondary },
  errorText: { fontSize: 15, color: Colors.textSecondary, textAlign: 'center', lineHeight: 22 },
  retryBtn: { paddingHorizontal: 24, paddingVertical: 12, borderRadius: 10, marginTop: 8 },
  retryText: { color: Colors.white, fontWeight: '700', fontSize: 14 },

  header: {
    backgroundColor: Colors.white,
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 12,
    paddingVertical: 12,
    borderBottomWidth: 1,
  },
  iconBtn: { width: 40, height: 40, justifyContent: 'center', alignItems: 'center' },
  headerCenter: { flex: 1, alignItems: 'center', gap: 4 },
  examBadge: { paddingHorizontal: 10, paddingVertical: 3, borderRadius: 6 },
  examBadgeText: { fontSize: 11, fontWeight: '800', color: Colors.white, letterSpacing: 0.4 },
  headerSubject: { fontSize: 12, fontWeight: '600', color: Colors.textSecondary },

  progressBar: {
    height: 4,
    backgroundColor: Colors.gray200,
  },
  progressFill: { height: '100%' },
  progressLabelRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingHorizontal: 16,
    paddingVertical: 6,
    backgroundColor: Colors.white,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },
  progressLabel: { fontSize: 11, color: Colors.textMuted, fontWeight: '600' },

  scroll: { flex: 1 },
  scrollContent: { padding: 16, gap: 12, paddingBottom: 24 },

  optionsGap: { gap: 10 },

  explanationCard: {
    backgroundColor: Colors.warning + '0E',
    borderRadius: 12,
    borderWidth: 1,
    borderColor: Colors.warning + '40',
    padding: 16,
    gap: 10,
  },
  explanationHeader: { flexDirection: 'row', alignItems: 'center', gap: 6 },
  explanationTitle: { fontSize: 13, fontWeight: '700', color: Colors.warning },
  explanationText: { fontSize: 14, lineHeight: 22, color: Colors.textPrimary },

  bottomBar: {
    backgroundColor: Colors.white,
    paddingHorizontal: 16,
    paddingVertical: 12,
    borderTopWidth: 1,
    borderTopColor: Colors.border,
  },
  nextBtn: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 8,
    paddingVertical: 15,
    borderRadius: 13,
  },
  nextBtnDisabled: { opacity: 0.7 },
  nextBtnText: { color: Colors.white, fontWeight: '700', fontSize: 15 },
});
