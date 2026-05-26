import React, { useState, useEffect, useRef, useCallback } from 'react';
import {
  View, Text, StyleSheet, SafeAreaView, ScrollView,
  TouchableOpacity, Alert, ActivityIndicator, Modal,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import { SUBJECT_LABELS } from '../../types/exam.types';
import { getTryoutTemplate } from '../../constants/tryoutTemplates';
import { calculateAnswerScore, calculateMaxScore } from '../../utils/ScoreCalculator';
import { mapQuestionRow } from '../../utils/mapQuestionRow';
import { supabase } from '../../services/supabase';
import { QuestionCard } from '../../components/question/QuestionCard';
import { OptionButton } from '../../components/question/OptionButton';
import type { Question } from '../../types/question.types';
import type { SubjectType } from '../../types/exam.types';
import type { TryoutScreenProps, TryoutSectionResult } from '../../navigation/types';

function formatTime(seconds: number): string {
  const h = Math.floor(seconds / 3600);
  const m = Math.floor((seconds % 3600) / 60);
  const s = seconds % 60;
  const pad = (n: number) => String(n).padStart(2, '0');
  return h > 0 ? `${pad(h)}:${pad(m)}:${pad(s)}` : `${pad(m)}:${pad(s)}`;
}

interface LoadedQuestion {
  question: Question;
  sectionSubject: SubjectType;
  passingScore: number;
}

export function TryoutSessionScreen({ route, navigation }: TryoutScreenProps<'TryoutSession'>) {
  const { templateId } = route.params;
  const template = getTryoutTemplate(templateId);

  const [items, setItems] = useState<LoadedQuestion[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [answers, setAnswers] = useState<Record<string, string>>({});
  const [flagged, setFlagged] = useState<Record<string, boolean>>({});
  const [timeLeft, setTimeLeft] = useState((template?.durationMinutes ?? 90) * 60);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [showGrid, setShowGrid] = useState(false);
  const [isSubmitting, setIsSubmitting] = useState(false);

  const startTime = useRef(Date.now());
  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const submittedRef = useRef(false);

  const accentColor = template?.color ?? Colors.primary;
  const current = items[currentIndex];
  const timerColor = timeLeft < 300 ? Colors.error : timeLeft < 900 ? Colors.warning : Colors.success;

  useEffect(() => {
    loadAllSections();
  }, []);

  // Countdown
  useEffect(() => {
    if (isLoading || error) return;
    intervalRef.current = setInterval(() => {
      setTimeLeft((prev) => {
        if (prev <= 1) {
          clearInterval(intervalRef.current!);
          handleSubmit(true);
          return 0;
        }
        return prev - 1;
      });
    }, 1000);
    return () => {
      if (intervalRef.current) clearInterval(intervalRef.current);
    };
  }, [isLoading, error]);

  async function loadAllSections() {
    if (!template) {
      setError('Template tryout tidak ditemukan.');
      setIsLoading(false);
      return;
    }
    try {
      const results = await Promise.all(
        template.sections.map(async (sec) => {
          const { data, error: err } = await supabase
            .from('questions')
            .select('*')
            .eq('exam_type', template.examType)
            .eq('subject', sec.subject)
            .limit(sec.questionCount * 2);
          if (err) throw err;
          const shuffled = [...(data ?? [])].sort(() => Math.random() - 0.5).slice(0, sec.questionCount);
          return shuffled.map((row) => ({
            question: mapQuestionRow(row),
            sectionSubject: sec.subject,
            passingScore: sec.passingScore,
          }));
        })
      );
      const flat = results.flat();
      if (flat.length === 0) {
        setError('Belum ada soal untuk tryout ini.\nSilakan tunggu konten diupdate.');
        return;
      }
      setItems(flat);
    } catch {
      setError('Gagal memuat soal. Periksa koneksi internet.');
    } finally {
      setIsLoading(false);
    }
  }

  function selectOption(optId: string) {
    if (!current) return;
    setAnswers((prev) => ({ ...prev, [current.question.id]: optId }));
  }

  function toggleFlag() {
    if (!current) return;
    setFlagged((prev) => ({ ...prev, [current.question.id]: !prev[current.question.id] }));
  }

  const handleSubmit = useCallback(
    async (auto = false) => {
      if (submittedRef.current || !template) return;
      submittedRef.current = true;
      if (intervalRef.current) clearInterval(intervalRef.current);
      setIsSubmitting(true);

      const durationUsed = Math.round((Date.now() - startTime.current) / 1000);

      const sections: TryoutSectionResult[] = template.sections.map((sec) => {
        const secItems = items.filter((it) => it.sectionSubject === sec.subject);
        let score = 0;
        let correct = 0;
        let answered = 0;
        for (const it of secItems) {
          const sel = answers[it.question.id];
          if (sel == null) continue;
          answered++;
          const res = calculateAnswerScore(it.question, sel, template.examType);
          score += res.score;
          if (res.isCorrect) correct++;
        }
        const maxScore = calculateMaxScore(secItems.length, sec.subject, template.examType);
        return {
          subject: sec.subject,
          score,
          maxScore,
          correct,
          answered,
          total: secItems.length,
          passingScore: sec.passingScore,
          passed: score >= sec.passingScore,
        };
      });

      // Persist (best-effort, do not block navigation)
      try {
        const { data: { user } } = await supabase.auth.getUser();
        if (user) {
          const totalScore = sections.reduce((s, x) => s + x.score, 0);
          const maxScore = sections.reduce((s, x) => s + x.maxScore, 0);
          const totalQ = sections.reduce((s, x) => s + x.total, 0);
          const correctCount = sections.reduce((s, x) => s + x.correct, 0);
          const answeredCount = sections.reduce((s, x) => s + x.answered, 0);
          const sectionScores: Record<string, any> = {};
          for (const s of sections) {
            sectionScores[s.subject] = {
              score: s.score, correct: s.correct, total: s.total, passed: s.passed,
            };
          }
          await supabase.from('practice_sessions').insert({
            user_id: user.id,
            session_type: 'TRYOUT',
            exam_type: template.examType,
            total_questions: totalQ,
            answered_count: answeredCount,
            correct_count: correctCount,
            total_score: totalScore,
            max_score: maxScore,
            duration_seconds: durationUsed,
            section_scores: sectionScores,
            completed: true,
            started_at: new Date(startTime.current).toISOString(),
            completed_at: new Date().toISOString(),
          });
        }
      } catch {
        // ignore persistence failure
      }

      navigation.replace('TryoutResult', {
        templateId,
        examType: template.examType,
        durationUsedSeconds: durationUsed,
        sections,
      });
    },
    [template, items, answers, templateId, navigation]
  );

  function confirmSubmit() {
    const total = items.length;
    const answeredCount = Object.keys(answers).length;
    const unanswered = total - answeredCount;
    Alert.alert(
      'Selesaikan Tryout?',
      unanswered > 0
        ? `Masih ada ${unanswered} soal yang belum dijawab. Yakin ingin mengakhiri tryout?`
        : 'Semua soal sudah dijawab. Akhiri tryout sekarang?',
      [
        { text: 'Batal', style: 'cancel' },
        { text: 'Selesai', style: 'destructive', onPress: () => handleSubmit(false) },
      ]
    );
  }

  function confirmExit() {
    Alert.alert(
      'Keluar dari Tryout?',
      'Progress tryout akan hilang jika kamu keluar sekarang.',
      [
        { text: 'Batal', style: 'cancel' },
        { text: 'Keluar', style: 'destructive', onPress: () => navigation.goBack() },
      ]
    );
  }

  if (isLoading) {
    return (
      <SafeAreaView style={styles.safe}>
        <View style={styles.center}>
          <ActivityIndicator size="large" color={accentColor} />
          <Text style={styles.loadingText}>Menyiapkan tryout...</Text>
          <Text style={styles.loadingSub}>{template?.title}</Text>
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
          <TouchableOpacity style={[styles.retryBtn, { backgroundColor: accentColor }]} onPress={() => navigation.goBack()}>
            <Text style={styles.retryText}>Kembali</Text>
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    );
  }

  const selected = current ? answers[current.question.id] : undefined;
  const isFlagged = current ? !!flagged[current.question.id] : false;
  const isLast = currentIndex === items.length - 1;
  const progress = (currentIndex + 1) / items.length;

  return (
    <SafeAreaView style={styles.safe}>
      {/* Header */}
      <View style={styles.header}>
        <TouchableOpacity style={styles.headerBtn} onPress={confirmExit}>
          <Ionicons name="close-outline" size={24} color={Colors.textSecondary} />
        </TouchableOpacity>
        <View style={styles.timerContainer}>
          <View style={[styles.timerBadge, { borderColor: timerColor + '40', backgroundColor: timerColor + '10' }]}>
            <Ionicons name="time-outline" size={16} color={timerColor} />
            <Text style={[styles.timerText, { color: timerColor }]}>{formatTime(timeLeft)}</Text>
          </View>
          {timeLeft < 300 && <Text style={styles.timerWarning}>Waktu hampir habis!</Text>}
        </View>
        <TouchableOpacity style={styles.headerBtn} onPress={toggleFlag}>
          <Ionicons name={isFlagged ? 'flag' : 'flag-outline'} size={20} color={isFlagged ? Colors.warning : Colors.textSecondary} />
        </TouchableOpacity>
      </View>

      {/* Progress */}
      <View style={styles.progressBar}>
        <View style={[styles.progressFill, { width: `${progress * 100}%`, backgroundColor: accentColor }]} />
      </View>
      <View style={styles.counterRow}>
        <Text style={styles.counterText}>Soal {currentIndex + 1} dari {items.length}</Text>
        <Text style={[styles.sectionTag, { color: accentColor }]}>{current && SUBJECT_LABELS[current.sectionSubject]}</Text>
      </View>

      {/* Question */}
      <ScrollView style={styles.scroll} contentContainerStyle={styles.scrollContent} showsVerticalScrollIndicator={false}>
        {current && (
          <>
            <QuestionCard question={current.question} questionNumber={currentIndex + 1} accentColor={accentColor} />
            <View style={styles.optionsGap}>
              {current.question.options.map((opt) => (
                <OptionButton
                  key={opt.id}
                  option={opt}
                  state={selected === opt.id ? 'selected' : 'idle'}
                  accentColor={accentColor}
                  onPress={() => selectOption(opt.id)}
                />
              ))}
            </View>
          </>
        )}
      </ScrollView>

      {/* Bottom nav */}
      <View style={styles.bottomNav}>
        <TouchableOpacity
          style={[styles.navBtn, currentIndex === 0 && styles.navBtnDisabled]}
          disabled={currentIndex === 0}
          onPress={() => setCurrentIndex((i) => Math.max(0, i - 1))}
          activeOpacity={0.8}
        >
          <Ionicons name="chevron-back" size={20} color={Colors.textSecondary} />
        </TouchableOpacity>

        <TouchableOpacity style={styles.gridBtn} onPress={() => setShowGrid(true)} activeOpacity={0.8}>
          <Ionicons name="grid-outline" size={18} color={accentColor} />
          <Text style={[styles.gridBtnText, { color: accentColor }]}>{Object.keys(answers).length}/{items.length}</Text>
        </TouchableOpacity>

        {isLast ? (
          <TouchableOpacity style={[styles.submitBtn, { backgroundColor: accentColor }]} onPress={confirmSubmit} disabled={isSubmitting} activeOpacity={0.85}>
            {isSubmitting ? <ActivityIndicator size="small" color={Colors.white} /> : (
              <>
                <Text style={styles.submitBtnText}>Selesai</Text>
                <Ionicons name="checkmark-circle-outline" size={20} color={Colors.white} />
              </>
            )}
          </TouchableOpacity>
        ) : (
          <TouchableOpacity style={[styles.nextBtn, { backgroundColor: accentColor }]} onPress={() => setCurrentIndex((i) => Math.min(items.length - 1, i + 1))} activeOpacity={0.85}>
            <Text style={styles.nextBtnText}>Berikutnya</Text>
            <Ionicons name="chevron-forward" size={20} color={Colors.white} />
          </TouchableOpacity>
        )}
      </View>

      {/* Question grid modal */}
      <Modal visible={showGrid} transparent animationType="slide" onRequestClose={() => setShowGrid(false)}>
        <View style={styles.modalOverlay}>
          <View style={styles.modalSheet}>
            <View style={styles.modalHeader}>
              <Text style={styles.modalTitle}>Navigasi Soal</Text>
              <TouchableOpacity onPress={() => setShowGrid(false)}>
                <Ionicons name="close" size={24} color={Colors.textSecondary} />
              </TouchableOpacity>
            </View>
            <View style={styles.legendRow}>
              <View style={styles.legendItem}><View style={[styles.legendDot, { backgroundColor: accentColor }]} /><Text style={styles.legendText}>Dijawab</Text></View>
              <View style={styles.legendItem}><View style={[styles.legendDot, { backgroundColor: Colors.warning }]} /><Text style={styles.legendText}>Ditandai</Text></View>
              <View style={styles.legendItem}><View style={[styles.legendDot, { backgroundColor: Colors.gray200 }]} /><Text style={styles.legendText}>Kosong</Text></View>
            </View>
            <ScrollView contentContainerStyle={styles.gridWrap}>
              {items.map((it, idx) => {
                const ans = answers[it.question.id] != null;
                const flag = flagged[it.question.id];
                const bg = flag ? Colors.warning : ans ? accentColor : Colors.gray200;
                const fg = flag || ans ? Colors.white : Colors.textSecondary;
                return (
                  <TouchableOpacity
                    key={it.question.id}
                    style={[styles.gridCell, { backgroundColor: bg }, idx === currentIndex && styles.gridCellActive]}
                    onPress={() => { setCurrentIndex(idx); setShowGrid(false); }}
                  >
                    <Text style={[styles.gridCellText, { color: fg }]}>{idx + 1}</Text>
                  </TouchableOpacity>
                );
              })}
            </ScrollView>
            <TouchableOpacity style={[styles.modalSubmitBtn, { backgroundColor: accentColor }]} onPress={() => { setShowGrid(false); confirmSubmit(); }}>
              <Text style={styles.submitBtnText}>Selesaikan Tryout</Text>
            </TouchableOpacity>
          </View>
        </View>
      </Modal>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },
  center: { flex: 1, justifyContent: 'center', alignItems: 'center', gap: 14, padding: 32 },
  loadingText: { fontSize: 17, fontWeight: '700', color: Colors.textPrimary },
  loadingSub: { fontSize: 14, color: Colors.textSecondary },
  errorText: { fontSize: 15, color: Colors.textSecondary, textAlign: 'center', lineHeight: 22 },
  retryBtn: { paddingHorizontal: 24, paddingVertical: 12, borderRadius: 10, marginTop: 8 },
  retryText: { color: Colors.white, fontWeight: '700', fontSize: 14 },

  header: {
    backgroundColor: Colors.white,
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 16,
    paddingVertical: 12,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
    justifyContent: 'space-between',
  },
  headerBtn: { width: 40, height: 40, justifyContent: 'center', alignItems: 'center', borderRadius: 20, backgroundColor: Colors.gray100 },
  timerContainer: { alignItems: 'center', gap: 2 },
  timerBadge: { flexDirection: 'row', alignItems: 'center', gap: 6, paddingHorizontal: 16, paddingVertical: 8, borderRadius: 20, borderWidth: 1.5 },
  timerText: { fontSize: 20, fontWeight: '800', letterSpacing: 1, fontVariant: ['tabular-nums'] },
  timerWarning: { fontSize: 11, color: Colors.error, fontWeight: '600' },

  progressBar: { height: 3, backgroundColor: Colors.gray100 },
  progressFill: { height: '100%' },
  counterRow: {
    flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center',
    backgroundColor: Colors.white, paddingHorizontal: 20, paddingVertical: 8,
    borderBottomWidth: 1, borderBottomColor: Colors.border,
  },
  counterText: { fontSize: 13, fontWeight: '600', color: Colors.textSecondary },
  sectionTag: { fontSize: 12, fontWeight: '800', letterSpacing: 0.3 },

  scroll: { flex: 1 },
  scrollContent: { padding: 16, gap: 12, paddingBottom: 24 },
  optionsGap: { gap: 10 },

  bottomNav: {
    backgroundColor: Colors.white, flexDirection: 'row', padding: 14, gap: 10,
    borderTopWidth: 1, borderTopColor: Colors.border, alignItems: 'center',
  },
  navBtn: { width: 48, height: 48, borderRadius: 12, borderWidth: 1.5, borderColor: Colors.border, justifyContent: 'center', alignItems: 'center' },
  navBtnDisabled: { opacity: 0.4 },
  gridBtn: { flexDirection: 'row', alignItems: 'center', gap: 6, paddingHorizontal: 14, height: 48, borderRadius: 12, borderWidth: 1.5, borderColor: Colors.border },
  gridBtnText: { fontSize: 13, fontWeight: '700' },
  nextBtn: { flex: 1, height: 48, flexDirection: 'row', alignItems: 'center', justifyContent: 'center', gap: 4, borderRadius: 12 },
  nextBtnText: { fontSize: 14, fontWeight: '700', color: Colors.white },
  submitBtn: { flex: 1, height: 48, flexDirection: 'row', alignItems: 'center', justifyContent: 'center', gap: 6, borderRadius: 12 },
  submitBtnText: { fontSize: 14, fontWeight: '700', color: Colors.white },

  modalOverlay: { flex: 1, backgroundColor: 'rgba(0,0,0,0.4)', justifyContent: 'flex-end' },
  modalSheet: { backgroundColor: Colors.white, borderTopLeftRadius: 20, borderTopRightRadius: 20, padding: 20, maxHeight: '70%', gap: 14 },
  modalHeader: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center' },
  modalTitle: { fontSize: 17, fontWeight: '800', color: Colors.textPrimary },
  legendRow: { flexDirection: 'row', gap: 16 },
  legendItem: { flexDirection: 'row', alignItems: 'center', gap: 6 },
  legendDot: { width: 12, height: 12, borderRadius: 6 },
  legendText: { fontSize: 12, color: Colors.textSecondary },
  gridWrap: { flexDirection: 'row', flexWrap: 'wrap', gap: 8, paddingVertical: 8 },
  gridCell: { width: 40, height: 40, borderRadius: 8, justifyContent: 'center', alignItems: 'center' },
  gridCellActive: { borderWidth: 2, borderColor: Colors.textPrimary },
  gridCellText: { fontSize: 13, fontWeight: '700' },
  modalSubmitBtn: { borderRadius: 12, paddingVertical: 14, alignItems: 'center' },
});
