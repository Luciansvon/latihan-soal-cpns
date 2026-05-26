import { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import type { Question, QuestionOption } from '../types/question.types';
import type {
  ExamType,
  SubjectType,
  TryoutSection,
  TryoutTemplate,
} from '../types/exam.types';
import type { PracticeSession, UserAnswer, SectionScore } from '../types/session.types';
import { supabase } from '../services/supabase';
import { SessionRepository, AnswerRepository } from '../db/repositories/SessionRepository';
import { GamificationService } from '../services/GamificationService';
import { useStore } from '../store';
import {
  calculateAnswerScore,
  calculateSectionScore,
  calculateMaxScore,
} from '../utils/ScoreCalculator';
import { uuidv4 } from '../utils/uuid';

type TryoutPhase = 'loading' | 'error' | 'active' | 'submitting' | 'done';

interface Args {
  templateId: string;
  userId: string | null;
  onComplete: (sessionId: string) => void;
}

interface Return {
  phase: TryoutPhase;
  error?: string;
  template: TryoutTemplate | null;
  questions: Question[];
  currentIndex: number;
  currentQuestion: Question | undefined;
  totalSeconds: number;
  secondsLeft: number;
  selectedAnswers: Record<string, string>;
  flaggedQuestions: Set<string>;
  answeredCount: number;
  selectOption: (optionId: string) => void;
  toggleFlag: () => void;
  goTo: (index: number) => void;
  next: () => void;
  prev: () => void;
  finalize: () => Promise<void>;
}

export function useTryoutSession({ templateId, userId, onComplete }: Args): Return {
  const setXPAndLevel = useStore((s) => s.setXPAndLevel);
  const updateStreakStore = useStore((s) => s.updateStreak);
  const [phase, setPhase] = useState<TryoutPhase>('loading');
  const [error, setError] = useState<string | undefined>();
  const [template, setTemplate] = useState<TryoutTemplate | null>(null);
  const [questions, setQuestions] = useState<Question[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [selectedAnswers, setSelectedAnswers] = useState<Record<string, string>>({});
  const [flaggedQuestions, setFlaggedQuestions] = useState<Set<string>>(new Set());
  const [secondsLeft, setSecondsLeft] = useState(0);

  const sessionIdRef = useRef<string>(uuidv4());
  const sessionStartRef = useRef<number>(Date.now());
  const totalSecondsRef = useRef<number>(0);
  const questionSectionMapRef = useRef<Record<string, SubjectType>>({});
  const finalizingRef = useRef(false);
  const questionEnterTimeRef = useRef<number>(Date.now());
  const timePerQuestionRef = useRef<Record<string, number>>({});

  // -------------------- Load template + questions --------------------
  useEffect(() => {
    let cancelled = false;
    (async () => {
      if (!userId) {
        setError('Sesi belum aktif. Silakan login ulang.');
        setPhase('error');
        return;
      }
      try {
        const tpl = await fetchTemplate(templateId);
        if (cancelled) return;
        if (!tpl) {
          setError('Template tryout tidak ditemukan atau belum dipublish.');
          setPhase('error');
          return;
        }

        const fetched = await fetchQuestionsForSections(tpl.examType, tpl.sections);
        if (cancelled) return;
        if (fetched.questions.length === 0) {
          setError('Belum ada soal untuk tryout ini. Hubungi admin.');
          setPhase('error');
          return;
        }

        questionSectionMapRef.current = fetched.sectionMap;
        totalSecondsRef.current = tpl.durationMinutes * 60;

        const draft: PracticeSession = {
          id: sessionIdRef.current,
          userId,
          sessionType: 'TRYOUT',
          examType: tpl.examType,
          tryoutTemplateId: tpl.id,
          totalQuestions: fetched.questions.length,
          answeredCount: 0,
          correctCount: 0,
          totalScore: 0,
          maxScore: computeMaxScoreFromSections(tpl, fetched.sectionMap, fetched.questions),
          completed: false,
          startedAt: sessionStartRef.current,
          isSynced: false,
        };
        await SessionRepository.createSession(draft);

        setTemplate(tpl);
        setQuestions(fetched.questions);
        setSecondsLeft(totalSecondsRef.current);
        setPhase('active');
        questionEnterTimeRef.current = Date.now();
      } catch (e: any) {
        if (cancelled) return;
        setError(`Gagal memuat tryout: ${e?.message ?? 'unknown error'}`);
        setPhase('error');
      }
    })();
    return () => {
      cancelled = true;
    };
    // Mount-only; templateId/userId stable across the screen.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // -------------------- Timer --------------------
  useEffect(() => {
    if (phase !== 'active') return;
    const interval = setInterval(() => {
      setSecondsLeft((prev) => {
        if (prev <= 1) {
          clearInterval(interval);
          // Auto-submit on time out
          void finalize();
          return 0;
        }
        return prev - 1;
      });
    }, 1000);
    return () => clearInterval(interval);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [phase]);

  // -------------------- Actions --------------------
  const captureTimeForCurrent = useCallback(() => {
    const current = questions[currentIndex];
    if (!current) return;
    const delta = Date.now() - questionEnterTimeRef.current;
    timePerQuestionRef.current[current.id] =
      (timePerQuestionRef.current[current.id] ?? 0) + delta;
    questionEnterTimeRef.current = Date.now();
  }, [questions, currentIndex]);

  const selectOption = useCallback(
    (optionId: string) => {
      const current = questions[currentIndex];
      if (!current) return;
      setSelectedAnswers((prev) => ({ ...prev, [current.id]: optionId }));
    },
    [questions, currentIndex]
  );

  const toggleFlag = useCallback(() => {
    const current = questions[currentIndex];
    if (!current) return;
    setFlaggedQuestions((prev) => {
      const next = new Set(prev);
      if (next.has(current.id)) next.delete(current.id);
      else next.add(current.id);
      return next;
    });
  }, [questions, currentIndex]);

  const goTo = useCallback(
    (index: number) => {
      if (index < 0 || index >= questions.length) return;
      captureTimeForCurrent();
      setCurrentIndex(index);
    },
    [questions.length, captureTimeForCurrent]
  );

  const next = useCallback(() => goTo(currentIndex + 1), [goTo, currentIndex]);
  const prev = useCallback(() => goTo(currentIndex - 1), [goTo, currentIndex]);

  // -------------------- Finalize --------------------
  const finalize = useCallback(async () => {
    if (finalizingRef.current || !userId || !template) return;
    finalizingRef.current = true;
    setPhase('submitting');
    captureTimeForCurrent();
    try {
      const completedAt = Date.now();

      const answers: UserAnswer[] = [];
      let correctCount = 0;

      for (const q of questions) {
        const sel = selectedAnswers[q.id];
        if (!sel) continue;
        const r = calculateAnswerScore(q, sel, template.examType);
        if (r.isCorrect) correctCount += 1;
        answers.push({
          id: uuidv4(),
          userId,
          questionId: q.id,
          sessionId: sessionIdRef.current,
          selectedOption: sel,
          isCorrect: r.isCorrect,
          scoreEarned: r.score,
          timeSpentMs: timePerQuestionRef.current[q.id] ?? 0,
          answeredAt: completedAt,
          isSynced: false,
        });
      }

      // Section scores
      const answersBySubject: Record<string, UserAnswer[]> = {};
      for (const a of answers) {
        const subj = questionSectionMapRef.current[a.questionId];
        if (!subj) continue;
        if (!answersBySubject[subj]) answersBySubject[subj] = [];
        answersBySubject[subj].push(a);
      }

      const sectionScores: Record<string, SectionScore> = {};
      let totalScore = 0;
      for (const section of template.sections) {
        const sectionAnswers = answersBySubject[section.subject] ?? [];
        const s = calculateSectionScore(sectionAnswers, section.subject, template.examType);
        sectionScores[section.subject] = s;
        totalScore += s.score;
      }

      await AnswerRepository.saveAnswers(answers);

      const final: PracticeSession = {
        id: sessionIdRef.current,
        userId,
        sessionType: 'TRYOUT',
        examType: template.examType,
        tryoutTemplateId: template.id,
        totalQuestions: questions.length,
        answeredCount: answers.length,
        correctCount,
        totalScore,
        maxScore: computeMaxScoreFromSections(template, questionSectionMapRef.current, questions),
        durationSeconds: Math.round((completedAt - sessionStartRef.current) / 1000),
        sectionScores: sectionScores as Record<SubjectType, SectionScore>,
        completed: true,
        startedAt: sessionStartRef.current,
        completedAt,
        isSynced: false,
      };
      await SessionRepository.updateSession(final);

      try {
        const award = await GamificationService.awardForSession(final);
        setXPAndLevel(award.newXpTotal, award.newLevel);
        updateStreakStore(award.streakCurrent, award.streakLongest);
      } catch {
        // gamification failure non-fatal
      }

      setPhase('done');
      onComplete(sessionIdRef.current);
    } catch (e: any) {
      setError(`Gagal menyimpan: ${e?.message ?? 'unknown error'}`);
      setPhase('error');
      finalizingRef.current = false;
    }
  }, [userId, template, questions, selectedAnswers, captureTimeForCurrent, onComplete]);

  // -------------------- Derived --------------------
  const currentQuestion = questions[currentIndex];
  const answeredCount = useMemo(() => Object.keys(selectedAnswers).length, [selectedAnswers]);

  return {
    phase,
    error,
    template,
    questions,
    currentIndex,
    currentQuestion,
    totalSeconds: totalSecondsRef.current,
    secondsLeft,
    selectedAnswers,
    flaggedQuestions,
    answeredCount,
    selectOption,
    toggleFlag,
    goTo,
    next,
    prev,
    finalize,
  };
}

// ============================================================================
// Helpers
// ============================================================================

async function fetchTemplate(templateId: string): Promise<TryoutTemplate | null> {
  const { data, error } = await supabase
    .from('tryout_templates')
    .select('*')
    .eq('id', templateId)
    .eq('is_published', true)
    .maybeSingle();
  if (error) throw new Error(error.message);
  if (!data) return null;
  return mapTemplate(data);
}

interface FetchedQuestions {
  questions: Question[];
  sectionMap: Record<string, SubjectType>;
}

async function fetchQuestionsForSections(
  examType: ExamType,
  sections: TryoutSection[]
): Promise<FetchedQuestions> {
  const sectionMap: Record<string, SubjectType> = {};
  const allQuestions: Question[] = [];

  const results = await Promise.all(
    sections.map((s) =>
      supabase
        .from('questions')
        .select('*')
        .eq('exam_type', examType)
        .eq('subject', s.subject)
        .limit(s.questionCount * 3) // over-fetch then shuffle
    )
  );

  for (let i = 0; i < sections.length; i++) {
    const section = sections[i];
    const res = results[i];
    if (res.error) throw new Error(res.error.message);
    const mapped = (res.data ?? []).map(mapSupabaseQuestion);
    shuffle(mapped);
    const slice = mapped.slice(0, section.questionCount);
    for (const q of slice) {
      sectionMap[q.id] = section.subject;
      allQuestions.push(q);
    }
  }

  return { questions: allQuestions, sectionMap };
}

function computeMaxScoreFromSections(
  template: TryoutTemplate,
  sectionMap: Record<string, SubjectType>,
  questions: Question[]
): number {
  let max = 0;
  for (const section of template.sections) {
    const count = questions.filter((q) => sectionMap[q.id] === section.subject).length;
    max += calculateMaxScore(count, section.subject, template.examType);
  }
  return max;
}

function mapTemplate(row: any): TryoutTemplate {
  return {
    id: row.id,
    examType: row.exam_type,
    title: row.title,
    description: row.description ?? undefined,
    durationMinutes: row.duration_minutes,
    passingScore: row.passing_score ?? undefined,
    sections: (row.sections ?? []).map((s: any) => ({
      subject: s.subject,
      questionCount: s.questionCount ?? s.question_count,
      durationMinutes: s.durationMinutes ?? s.duration_minutes,
      passingScore: s.passingScore ?? s.passing_score,
    })),
    isFree: row.is_free,
    isPublished: row.is_published,
    createdAt: row.created_at,
  };
}

function mapSupabaseQuestion(row: any): Question {
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
