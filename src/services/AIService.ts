// AIService — wrapper untuk Edge Function `ai-tutor`.
// Edge Function memegang OpenRouter key + rate limit. Client cuma format payload.

import { supabase } from './supabase';
import type { Question } from '../types/question.types';
import type { ExamType } from '../types/exam.types';

export type AIMode = 'explanation' | 'hint' | 'chat';

export interface AIChatMessage {
  role: 'user' | 'assistant' | 'system';
  content: string;
}

interface BaseArgs {
  examType?: ExamType;
}

interface ExplanationArgs extends BaseArgs {
  question: Question;
}

interface HintArgs extends BaseArgs {
  question: Question;
  level: 1 | 2 | 3;
}

interface ChatArgs extends BaseArgs {
  messages: AIChatMessage[];
}

export interface AIResponse {
  content: string;
  mode: AIMode;
  model: string;
  usedToday: number;
  dailyLimit: number;
}

export interface AIRateLimitError {
  type: 'rate_limited';
  message: string;
  usedToday: number;
  dailyLimit: number;
}

export class AIError extends Error {
  constructor(message: string, public status?: number, public rateLimited?: AIRateLimitError) {
    super(message);
    this.name = 'AIError';
  }
}

export const AIService = {
  async requestExplanation(args: ExplanationArgs): Promise<AIResponse> {
    return invoke({
      mode: 'explanation',
      examType: args.examType,
      questionId: args.question.id,
      question: serializeQuestion(args.question),
    });
  },

  async requestHint(args: HintArgs): Promise<AIResponse> {
    return invoke({
      mode: 'hint',
      examType: args.examType,
      questionId: args.question.id,
      hintLevel: args.level,
      question: serializeQuestion(args.question),
    });
  },

  async chat(args: ChatArgs): Promise<AIResponse> {
    return invoke({
      mode: 'chat',
      examType: args.examType,
      messages: args.messages,
    });
  },
};

interface InvokePayload {
  mode: AIMode;
  examType?: ExamType;
  questionId?: string;
  question?: ReturnType<typeof serializeQuestion>;
  hintLevel?: 1 | 2 | 3;
  messages?: AIChatMessage[];
}

async function invoke(payload: InvokePayload): Promise<AIResponse> {
  const { data, error } = await supabase.functions.invoke<any>('ai-tutor', {
    body: payload,
  });

  // supabase-js wraps non-2xx as `error` but still returns the body as `data`
  // in some versions. Check both.
  if (error) {
    // FunctionsHttpError carries .context with status; try to parse body for rate-limit.
    const status = (error as any)?.context?.status;
    let body: any = null;
    try {
      const resp = (error as any)?.context;
      if (resp?.json) body = await resp.json();
    } catch {
      // ignore
    }
    if (status === 429 || body?.error === 'rate_limited') {
      throw new AIError(body?.message ?? 'Rate limit AI tercapai.', 429, {
        type: 'rate_limited',
        message: body?.message ?? 'Rate limit AI tercapai.',
        usedToday: body?.usedToday ?? 0,
        dailyLimit: body?.dailyLimit ?? 10,
      });
    }
    throw new AIError(error.message ?? 'AI request failed', status);
  }

  if (!data || typeof data.content !== 'string') {
    throw new AIError('AI response invalid', 500);
  }

  return data as AIResponse;
}

function serializeQuestion(q: Question) {
  return {
    questionText: q.questionText,
    options: q.options.map((o) => ({ id: o.id, text: o.text })),
    correctOption: q.correctOption,
    subject: q.subject,
    explanationText: q.explanationText,
  };
}
