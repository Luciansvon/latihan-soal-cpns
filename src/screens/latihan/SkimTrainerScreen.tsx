// SkimTrainerScreen
// Latih membaca cepat (skim) ala TWK HOTS: tampilkan stem soal dengan
// countdown, lalu sembunyikan dan minta jawab opsi. Mensimulasikan tekanan
// waktu skenario ujian — sesuai strategi "skim-then-extract" dari
// TNI Efektif.md untuk lawan reading fatigue.

import React, { useCallback, useEffect, useMemo, useRef, useState } from 'react';
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
import type { LatihanScreenProps } from '../../navigation/types';
import type { Question, QuestionOption } from '../../types/question.types';
import { supabase } from '../../services/supabase';
import { QuestionRepository } from '../../db/repositories/QuestionRepository';
import { OptionButton, type OptionState } from '../../components/question/OptionButton';
import { useStore } from '../../store';

const TOTAL_QUESTIONS = 5;
const MIN_READ_SECONDS = 12;
const CHARS_PER_SECOND = 8; // baseline kecepatan skim 8 karakter/detik

type Phase = 'loading' | 'error' | 'reading' | 'answering' | 'done';

interface QResult {
  questionId: string;
  selectedOption?: string;
  isCorrect: boolean;
  readSeconds: number;
}

export function SkimTrainerScreen({ navigation }: LatihanScreenProps<'SkimTrainer'>) {
  const isOnline = useStore((s) => s.isOnline);

  const [phase, setPhase] = useState<Phase>('loading');
  const [error, setError] = useState<string | null>(null);
  const [questions, setQuestions] = useState<Question[]>([]);
  const [currentIdx, setCurrentIdx] = useState(0);
  const [secondsLeft, setSecondsLeft] = useState(0);
  const [results, setResults] = useState<QResult[]>([]);
  const [selected, setSelected] = useState<string | undefined>();

  const readStartRef = useRef<number>(Date.now());

  // -------------------- Load questions --------------------
  useEffect(() => {
    let cancelled = false;
    (async () => {
      try {
        const fetched = await fetchSkimQuestions(isOnline);
        if (cancelled) return;
        if (fetched.length === 0) {
          setError(
            isOnline
              ? 'Belum ada soal TWK panjang untuk skim trainer. Jalankan seed dulu.'
              : 'Mode offline: butuh paket TWK ter-download untuk skim trainer.'
          );
          setPhase('error');
          return;
        }
        setQuestions(fetched);
        startReadPhase(fetched[0]);
      } catch (e: any) {
        if (cancelled) return;
        setError(`Gagal memuat soal: ${e?.message ?? 'unknown error'}`);
        setPhase('error');
      }
    })();
    return () => {
      cancelled = true;
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // -------------------- Timer for reading phase --------------------
  useEffect(() => {
    if (phase !== 'reading') return;
    const interval = setInterval(() => {
      setSecondsLeft((s) => {
        if (s <= 1) {
          clearInterval(interval);
          beginAnswering();
          return 0;
        }
        return s - 1;
      });
    }, 1000);
    return () => clearInterval(interval);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [phase, currentIdx]);

  function startReadPhase(q: Question) {
    const readTime = Math.max(MIN_READ_SECONDS, Math.ceil(q.questionText.length / CHARS_PER_SECOND));
    readStartRef.current = Date.now();
    setSecondsLeft(readTime);
    setSelected(undefined);
    setPhase('reading');
  }

  function beginAnswering() {
    setPhase('answering');
  }

  function handleSelect(optionId: string) {
    setSelected(optionId);
  }

  function handleConfirm() {
    const current = questions[currentIdx];
    if (!current || !selected) return;
    const readSeconds = Math.round((Date.now() - readStartRef.current) / 1000);
    const result: QResult = {
      questionId: current.id,
      selectedOption: selected,
      isCorrect: selected === current.correctOption,
      readSeconds,
    };
    const nextResults = [...results, result];
    setResults(nextResults);

    if (currentIdx + 1 >= questions.length) {
      setPhase('done');
    } else {
      const nextIdx = currentIdx + 1;
      setCurrentIdx(nextIdx);
      startReadPhase(questions[nextIdx]);
    }
  }

  function handleSkipRead() {
    if (phase === 'reading') beginAnswering();
  }

  // -------------------- Render --------------------
  if (phase === 'loading') {
    return (
      <SafeAreaView style={styles.safe}>
        <View style={styles.centerBox}>
          <ActivityIndicator size="large" color={Colors.primary} />
          <Text style={styles.loadingText}>Menyiapkan soal skim…</Text>
        </View>
      </SafeAreaView>
    );
  }

  if (phase === 'error') {
    return (
      <SafeAreaView style={styles.safe}>
        <View style={styles.centerBox}>
          <Ionicons name="alert-circle-outline" size={56} color={Colors.error} />
          <Text style={styles.errorText}>{error}</Text>
          <TouchableOpacity style={styles.primaryBtn} onPress={() => navigation.goBack()}>
            <Text style={styles.primaryBtnText}>Kembali</Text>
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    );
  }

  if (phase === 'done') {
    const correct = results.filter((r) => r.isCorrect).length;
    const totalSec = results.reduce((s, r) => s + r.readSeconds, 0);
    const avgSec = results.length > 0 ? Math.round(totalSec / results.length) : 0;
    const accuracy = results.length > 0 ? Math.round((correct / results.length) * 100) : 0;
    return (
      <SafeAreaView style={styles.safe}>
        <ScrollView contentContainerStyle={styles.donePad}>
          <Ionicons name="speedometer-outline" size={56} color={Colors.primary} />
          <Text style={styles.doneTitle}>Sesi Skim Selesai</Text>
          <Text style={styles.doneDesc}>
            {correct}/{results.length} benar Â· akurasi {accuracy}% Â· rata-rata{' '}
            {avgSec}s baca per soal.
          </Text>
          <View style={styles.doneTipBox}>
            <Ionicons name="bulb-outline" size={16} color={Colors.info} />
            <Text style={styles.doneTipText}>
              Tip: fokus ke kalimat awal + akhir paragraf (premis &amp; konklusi). Skip
              detail tengah saat skim. Latih harian untuk kurangi reading fatigue.
            </Text>
          </View>
          <View style={styles.doneActions}>
            <TouchableOpacity
              style={styles.primaryBtn}
              onPress={() => navigation.replace('SkimTrainer')}
            >
              <Text style={styles.primaryBtnText}>Latih Lagi</Text>
            </TouchableOpacity>
            <TouchableOpacity
              style={styles.secondaryBtn}
              onPress={() => navigation.goBack()}
            >
              <Text style={styles.secondaryBtnText}>Selesai</Text>
            </TouchableOpacity>
          </View>
        </ScrollView>
      </SafeAreaView>
    );
  }

  const current = questions[currentIdx];
  const total = questions.length;
  const progressPct = ((currentIdx + (phase === 'answering' ? 0.5 : 0)) / total) * 100;

  return (
    <SafeAreaView style={styles.safe}>
      <View style={styles.header}>
        <TouchableOpacity style={styles.iconBtn} onPress={() => navigation.goBack()}>
          <Ionicons name="close" size={22} color={Colors.textPrimary} />
        </TouchableOpacity>
        <View style={styles.headerCenter}>
          <Text style={styles.headerTitle}>Latih Baca Cepat (Skim)</Text>
          <Text style={styles.headerSub}>
            Soal {currentIdx + 1} / {total} Â·{' '}
            {phase === 'reading' ? `Baca: ${secondsLeft}s` : 'Pilih jawaban'}
          </Text>
        </View>
        <View style={styles.iconBtn} />
      </View>

      <View style={styles.progressContainer}>
        <View style={styles.progressTrack}>
          <View
            style={[styles.progressFill, { width: `${progressPct}%`, backgroundColor: Colors.primary }]}
          />
        </View>
      </View>

      <ScrollView contentContainerStyle={styles.scroll}>
        {phase === 'reading' ? (
          <ReadingCard
            question={current}
            secondsLeft={secondsLeft}
            onSkip={handleSkipRead}
          />
        ) : (
          <AnsweringCard
            question={current}
            selected={selected}
            onSelect={handleSelect}
            onConfirm={handleConfirm}
          />
        )}
      </ScrollView>
    </SafeAreaView>
  );
}

// ============================================================
// Sub-components
// ============================================================

function ReadingCard({
  question,
  secondsLeft,
  onSkip,
}: {
  question: Question;
  secondsLeft: number;
  onSkip: () => void;
}) {
  const isUrgent = secondsLeft <= 5;
  return (
    <View style={styles.cardWrap}>
      <View style={styles.timerPill}>
        <Ionicons name="time-outline" size={16} color={isUrgent ? Colors.error : Colors.primary} />
        <Text
          style={[
            styles.timerPillText,
            { color: isUrgent ? Colors.error : Colors.primary },
          ]}
        >
          {secondsLeft}s tersisa
        </Text>
      </View>
      <View style={styles.questionStemCard}>
        <Text style={styles.questionStemText}>{question.questionText}</Text>
      </View>
      <Text style={styles.readingHint}>
        Skim: tangkap inti narasi, tidak perlu baca semua kalimat. Setelah timer habis,
        soal disembunyikan.
      </Text>
      <TouchableOpacity style={styles.secondaryBtn} onPress={onSkip}>
        <Ionicons name="checkmark-outline" size={16} color={Colors.primary} />
        <Text style={styles.secondaryBtnText}>Sudah Paham, Lanjut</Text>
      </TouchableOpacity>
    </View>
  );
}

function AnsweringCard({
  question,
  selected,
  onSelect,
  onConfirm,
}: {
  question: Question;
  selected?: string;
  onSelect: (id: string) => void;
  onConfirm: () => void;
}) {
  const optionState = useMemo(() => {
    return (opt: QuestionOption): OptionState => (selected === opt.id ? 'selected' : 'idle');
  }, [selected]);

  return (
    <View style={styles.cardWrap}>
      <View style={styles.hiddenStemBox}>
        <Ionicons name="eye-off-outline" size={24} color={Colors.textMuted} />
        <Text style={styles.hiddenStemText}>
          Stem soal disembunyikan. Jawab berdasarkan ingatanmu dari fase membaca.
        </Text>
      </View>
      {question.options.map((opt) => (
        <OptionButton
          key={opt.id}
          optionId={opt.id}
          text={opt.text}
          state={optionState(opt)}
          accentColor={Colors.primary}
          onPress={() => onSelect(opt.id)}
        />
      ))}
      <TouchableOpacity
        style={[styles.primaryBtn, !selected && styles.primaryBtnDisabled]}
        disabled={!selected}
        onPress={onConfirm}
      >
        <Text style={styles.primaryBtnText}>Kunci Jawaban</Text>
      </TouchableOpacity>
    </View>
  );
}

// ============================================================
// Fetching
// ============================================================
async function fetchSkimQuestions(isOnline: boolean): Promise<Question[]> {
  // Local first
  const local = await QuestionRepository.getQuestionsBySubject('CPNS', 'TWK', 30);
  const filteredLocal = local.filter((q) => q.questionText.length >= 120);
  if (filteredLocal.length >= TOTAL_QUESTIONS) {
    return shuffle(filteredLocal).slice(0, TOTAL_QUESTIONS);
  }
  if (!isOnline) return filteredLocal.slice(0, TOTAL_QUESTIONS);

  // Supabase fallback
  const { data, error } = await supabase
    .from('questions')
    .select('*')
    .eq('exam_type', 'CPNS')
    .eq('subject', 'TWK')
    .limit(50);
  if (error) throw new Error(error.message);
  const mapped = (data ?? []).map(mapRow);
  const filtered = mapped.filter((q) => q.questionText.length >= 120);
  return shuffle(filtered).slice(0, TOTAL_QUESTIONS);
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

function shuffle<T>(arr: T[]): T[] {
  const out = [...arr];
  for (let i = out.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [out[i], out[j]] = [out[j], out[i]];
  }
  return out;
}

// ============================================================
// Styles
// ============================================================
const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },

  centerBox: { flex: 1, justifyContent: 'center', alignItems: 'center', padding: 24, gap: 12 },
  loadingText: { fontSize: 13, color: Colors.textSecondary },
  errorText: { fontSize: 13, color: Colors.textSecondary, textAlign: 'center', lineHeight: 20 },

  header: {
    backgroundColor: Colors.white,
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 16,
    paddingVertical: 12,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
    gap: 12,
  },
  iconBtn: { width: 36, height: 36, justifyContent: 'center', alignItems: 'center' },
  headerCenter: { flex: 1 },
  headerTitle: { fontSize: 15, fontWeight: '800', color: Colors.textPrimary },
  headerSub: { fontSize: 11, color: Colors.textSecondary, marginTop: 2 },

  progressContainer: {
    backgroundColor: Colors.white,
    paddingHorizontal: 20,
    paddingBottom: 10,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },
  progressTrack: {
    height: 6,
    backgroundColor: Colors.gray200,
    borderRadius: 3,
    overflow: 'hidden',
  },
  progressFill: { height: '100%', borderRadius: 3 },

  scroll: { padding: 20, gap: 12 },
  cardWrap: { gap: 14 },

  timerPill: {
    alignSelf: 'flex-start',
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    backgroundColor: Colors.white,
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 18,
    borderWidth: 1.5,
    borderColor: Colors.primary + '40',
  },
  timerPillText: { fontSize: 13, fontWeight: '800', fontVariant: ['tabular-nums'] },

  questionStemCard: {
    backgroundColor: Colors.white,
    borderRadius: 14,
    padding: 18,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.06,
    shadowRadius: 4,
    elevation: 2,
  },
  questionStemText: { fontSize: 15, lineHeight: 23, color: Colors.textPrimary, fontWeight: '500' },
  readingHint: { fontSize: 12, color: Colors.textMuted, lineHeight: 18 },

  hiddenStemBox: {
    flexDirection: 'row',
    gap: 10,
    backgroundColor: Colors.gray50,
    padding: 14,
    borderRadius: 12,
    borderWidth: 1,
    borderColor: Colors.gray200,
    borderStyle: 'dashed',
    alignItems: 'center',
  },
  hiddenStemText: { flex: 1, fontSize: 12, color: Colors.textSecondary, lineHeight: 18 },

  primaryBtn: {
    backgroundColor: Colors.primary,
    paddingVertical: 14,
    borderRadius: 12,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 6,
  },
  primaryBtnDisabled: { opacity: 0.4 },
  primaryBtnText: { fontSize: 14, fontWeight: '700', color: Colors.white },
  secondaryBtn: {
    paddingVertical: 12,
    borderRadius: 12,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 6,
    borderWidth: 1.5,
    borderColor: Colors.primary,
    backgroundColor: Colors.white,
  },
  secondaryBtnText: { fontSize: 13, fontWeight: '700', color: Colors.primary },

  donePad: { padding: 32, alignItems: 'center', gap: 16 },
  doneTitle: { fontSize: 22, fontWeight: '900', color: Colors.textPrimary },
  doneDesc: { fontSize: 14, color: Colors.textSecondary, textAlign: 'center', lineHeight: 20 },
  doneTipBox: {
    flexDirection: 'row',
    gap: 10,
    backgroundColor: '#EFF6FF',
    borderRadius: 12,
    padding: 14,
    borderWidth: 1,
    borderColor: '#BFDBFE',
  },
  doneTipText: { flex: 1, fontSize: 13, color: Colors.textSecondary, lineHeight: 19 },
  doneActions: { width: '100%', gap: 10, marginTop: 12 },
});
