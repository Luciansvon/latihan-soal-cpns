// Supabase Edge Function: ai-tutor
// Proxy to OpenRouter that builds adaptive prompts from the user's learning
// style profile and enforces a per-user daily rate limit.
//
// Env vars required:
//   OPENROUTER_API_KEY       — OpenRouter API key (Supabase Vault)
//   OPENROUTER_MODEL         — optional, defaults to free Gemini Flash
//   AI_DAILY_LIMIT           — optional, defaults to 10
//   SUPABASE_URL             — auto-provided by Supabase runtime
//   SUPABASE_ANON_KEY        — auto-provided
//   SUPABASE_SERVICE_ROLE_KEY — auto-provided, used for log insert / cache read
//
// Deploy:
//   supabase functions deploy ai-tutor
//   supabase secrets set OPENROUTER_API_KEY=sk-...

// deno-lint-ignore-file no-explicit-any
import { serve } from 'https://deno.land/std@0.224.0/http/server.ts';
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2.39.8';

const OPENROUTER_URL = 'https://openrouter.ai/api/v1/chat/completions';
const DEFAULT_MODEL = 'google/gemini-2.0-flash-exp:free';

const CORS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers':
    'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
};

type Mode = 'explanation' | 'hint' | 'chat';

interface ChatMessage {
  role: 'system' | 'user' | 'assistant';
  content: string;
}

interface RequestBody {
  mode: Mode;
  questionId?: string;
  question?: {
    questionText: string;
    options?: Array<{ id: string; text: string }>;
    correctOption?: string;
    subject?: string;
    explanationText?: string;
  };
  examType?: string;
  hintLevel?: 1 | 2 | 3;
  messages?: ChatMessage[];
}

interface LearningStyle {
  visual?: number;
  auditory?: number;
  reading?: number;
  kinesthetic?: number;
  activist?: number;
  reflector?: number;
  theorist?: number;
  pragmatist?: number;
}

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: CORS });
  }
  if (req.method !== 'POST') {
    return json({ error: 'Method not allowed' }, 405);
  }

  try {
    // 1. Auth
    const authHeader = req.headers.get('Authorization') ?? '';
    if (!authHeader.startsWith('Bearer ')) {
      return json({ error: 'Missing bearer token' }, 401);
    }
    const userClient = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_ANON_KEY')!,
      { global: { headers: { Authorization: authHeader } } }
    );
    const { data: { user }, error: userErr } = await userClient.auth.getUser();
    if (userErr || !user) return json({ error: 'Unauthorized' }, 401);

    // 2. Parse + validate body
    const body: RequestBody = await req.json();
    if (!body.mode || !['explanation', 'hint', 'chat'].includes(body.mode)) {
      return json({ error: 'Invalid mode' }, 400);
    }

    // 3. Service-role client for rate limit + profile lookup + log insert
    const admin = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!,
      { auth: { persistSession: false, autoRefreshToken: false } }
    );

    // 4. Rate limit
    const dailyLimit = parseInt(Deno.env.get('AI_DAILY_LIMIT') ?? '10', 10);
    const todayStart = new Date();
    todayStart.setHours(0, 0, 0, 0);
    const { count: usedToday, error: countErr } = await admin
      .from('ai_request_log')
      .select('id', { head: true, count: 'exact' })
      .eq('user_id', user.id)
      .gte('created_at', todayStart.toISOString());
    if (countErr) return json({ error: countErr.message }, 500);
    if ((usedToday ?? 0) >= dailyLimit) {
      return json(
        { error: 'rate_limited', message: `Limit ${dailyLimit} request AI per hari sudah tercapai.`, usedToday: usedToday ?? 0, dailyLimit },
        429
      );
    }

    // 5. Load profile for learning style
    const { data: profile } = await admin
      .from('profiles')
      .select('learning_style, target_exam')
      .eq('id', user.id)
      .maybeSingle();
    const learningStyle: LearningStyle = (profile?.learning_style ?? {}) as LearningStyle;
    const examType = body.examType ?? profile?.target_exam ?? 'CPNS';

    // 6. Resolve question if questionId given
    let question = body.question;
    if (body.questionId && !question) {
      const { data: q } = await admin
        .from('questions')
        .select('question_text, options, correct_option, subject, explanation_text')
        .eq('id', body.questionId)
        .maybeSingle();
      if (q) {
        question = {
          questionText: q.question_text,
          options: q.options,
          correctOption: q.correct_option,
          subject: q.subject,
          explanationText: q.explanation_text ?? undefined,
        };
      }
    }

    // 7. Build messages
    const messages = buildMessages(body, question, learningStyle, examType);

    // 8. Call OpenRouter
    const apiKey = Deno.env.get('OPENROUTER_API_KEY');
    if (!apiKey) return json({ error: 'OPENROUTER_API_KEY not set' }, 500);

    const model = Deno.env.get('OPENROUTER_MODEL') ?? DEFAULT_MODEL;
    const orRes = await fetch(OPENROUTER_URL, {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${apiKey}`,
        'Content-Type': 'application/json',
        'HTTP-Referer': 'https://latihan-soal-cpns',
        'X-Title': 'Latihan Soal CPNS',
      },
      body: JSON.stringify({
        model,
        messages,
        max_tokens: body.mode === 'hint' ? 200 : 700,
        temperature: body.mode === 'chat' ? 0.7 : 0.4,
      }),
    });
    const orJson = await orRes.json();
    if (!orRes.ok) {
      return json({ error: orJson?.error?.message ?? 'OpenRouter error', detail: orJson }, 502);
    }

    const content = orJson?.choices?.[0]?.message?.content ?? '';
    const tokensIn = orJson?.usage?.prompt_tokens ?? null;
    const tokensOut = orJson?.usage?.completion_tokens ?? null;

    // 9. Log request (best-effort; do not fail the response on log error)
    try {
      await admin.from('ai_request_log').insert({
        user_id: user.id,
        mode: body.mode,
        question_id: body.questionId ?? null,
        model,
        tokens_in: tokensIn,
        tokens_out: tokensOut,
        hint_level: body.hintLevel ?? null,
      });
    } catch {
      // Ignore
    }

    return json(
      {
        content,
        mode: body.mode,
        model,
        usedToday: (usedToday ?? 0) + 1,
        dailyLimit,
      },
      200
    );
  } catch (e: any) {
    return json({ error: e?.message ?? 'unknown error' }, 500);
  }
});

// ============================================================
// Prompt construction
// ============================================================
function buildMessages(
  body: RequestBody,
  question: RequestBody['question'],
  style: LearningStyle,
  examType: string
): ChatMessage[] {
  const persona = buildPersona(examType);
  const styleHint = describeStyle(style);

  if (body.mode === 'chat') {
    const sys: ChatMessage = {
      role: 'system',
      content: `${persona}\n\n${styleHint}\n\nKamu sedang chatting dengan murid. Jawab ringkas, hangat, fokus ke ujian ${examType}. Jangan halusinasi: kalau tidak tahu, bilang tidak tahu.`,
    };
    return [sys, ...(body.messages ?? [])];
  }

  const questionBlock = question
    ? formatQuestion(question)
    : '(Soal tidak tersedia dalam request.)';

  const subjectStrategy = strategyForSubject(question?.subject);

  if (body.mode === 'hint') {
    const level = body.hintLevel ?? 1;
    const levelInstruction =
      level === 1
        ? 'Berikan SATU petunjuk SAMAR. Jangan sebut opsi mana yang benar. Cukup arahkan ke konsep yang relevan.'
        : level === 2
        ? 'Berikan petunjuk SEDANG. Singgung pendekatan atau rumus tanpa menyebut jawaban langsung.'
        : 'Berikan petunjuk KUAT. Bisa eliminasi 1-2 opsi yang jelas salah, tapi jangan sebut jawaban final.';
    return [
      {
        role: 'system',
        content: `${persona}\n\n${styleHint}\n\n${subjectStrategy}\n\n${levelInstruction}\nMaksimum 3 kalimat.`,
      },
      { role: 'user', content: questionBlock },
    ];
  }

  // explanation
  return [
    {
      role: 'system',
      content: `${persona}\n\n${styleHint}\n\n${subjectStrategy}\n\nTugas: jelaskan jawaban yang benar dengan alur logis. Sebutkan jawaban benarnya di awal, lalu uraikan kenapa. Jika tipe TKP, jelaskan kenapa opsi tertinggi paling baik. Hindari basa-basi. Maksimum 6 kalimat.`,
    },
    { role: 'user', content: questionBlock },
  ];
}

/**
 * Strategi pengajaran spesifik per subject — turunan langsung dari analisis
 * TNI Efektif.md (cognitive load + literasi paradoks PISA 2022). Disuntik ke
 * system prompt agar AI mengikuti pendekatan adaptif sesuai jenis soal.
 */
function strategyForSubject(subject?: string): string {
  switch (subject) {
    case 'TKP':
      return [
        'Untuk TKP: bayangkan dirimu sebagai "Robot Birokrat Sempurna" yang kebal',
        'emosi pribadi dan ego sektoral. Acuan urutan prioritas opsi: (1) Pelayanan',
        'Publik, (2) Profesionalisme & Integritas, (3) Jejaring Kerja kolaboratif,',
        '(4) Anti Radikalisme & loyalitas NKRI. Tekankan kata kunci ini di pembahasan.',
      ].join(' ');
    case 'TIU':
      return [
        'Untuk TIU: pakai pendekatan micro-dosing — fokus pada 1 trik atau pola',
        'inti, bukan teori panjang. Berikan 1 langkah kerja konkret. Untuk soal',
        'figural, ajak siswa membayangkan rotasi/pencerminan secara spasial dulu',
        'sebelum membaca opsi.',
      ].join(' ');
    case 'TWK':
      return [
        'Untuk TWK HOTS: ringkas inti narasi soal dalam 1 kalimat (skim-then-extract).',
        'Petakan kausalitas: peristiwa → nilai kebangsaan yang relevan. Jika cocok,',
        'kaitkan dengan timeline (mind-map vertikal) supaya retensi lebih lengket.',
      ].join(' ');
    case 'MATEMATIKA':
      return 'Untuk Matematika: tulis 1 langkah kerja per baris. Hindari paragraf panjang. Ucapkan kunci konsep dalam kalimat pendek.';
    case 'BAHASA_INDONESIA':
      return 'Untuk Bahasa Indonesia: tunjukkan jejak struktur (subjek-predikat / tesis-argumen) sebelum menyimpulkan.';
    case 'PSIKOTES':
      return 'Untuk Psikotes: dorong pengenalan pola (siluet/analogi) cepat, tanpa over-baca instruksi. Konsisten lebih penting dari sempurna.';
    case 'PENGETAHUAN_HUKUM':
      return 'Untuk Pengetahuan Hukum: kutip pasal/UU spesifik sebagai jangkar. Jelaskan asas dasar dulu sebelum detail kasus.';
    default:
      return 'Sajikan pembahasan ringkas, dengan kalimat pendek dan struktur poin yang mudah dipindai.';
  }
}

function buildPersona(examType: string): string {
  return `Kamu "Pak Guru", tutor virtual aplikasi LatihanSoal untuk persiapan ujian ${examType} (CPNS / TNI / Polri). Gaya bicara hangat, tegas, dan mudah dimengerti. Selalu balas dalam Bahasa Indonesia. Hindari kata "sebagai AI" / "model bahasa".`;
}

function describeStyle(s: LearningStyle): string {
  const top = topStyles(s);
  if (top.length === 0) {
    return 'Profil gaya belajar siswa belum diketahui — gunakan pendekatan netral (campuran reading + visual).';
  }
  const lines: string[] = ['Profil gaya belajar siswa:'];
  for (const t of top) lines.push(`- ${t.label} (skor ${t.score})`);
  lines.push(`Strategi penjelasan: ${strategyFor(top.map((t) => t.key))}`);
  return lines.join('\n');
}

function topStyles(s: LearningStyle): Array<{ key: string; label: string; score: number }> {
  const entries: Array<{ key: string; label: string; score: number }> = [];
  const map: Record<string, string> = {
    visual: 'Visual',
    auditory: 'Auditori',
    reading: 'Reading/Writing',
    kinesthetic: 'Kinestetik',
    activist: 'Activist (Honey-Mumford)',
    reflector: 'Reflector',
    theorist: 'Theorist',
    pragmatist: 'Pragmatist',
  };
  for (const [k, label] of Object.entries(map)) {
    const v = (s as any)[k];
    if (typeof v === 'number' && v > 0) entries.push({ key: k, label, score: v });
  }
  entries.sort((a, b) => b.score - a.score);
  return entries.slice(0, 2);
}

function strategyFor(keys: string[]): string {
  const tips: string[] = [];
  for (const k of keys) {
    switch (k) {
      case 'visual':
        tips.push('gunakan analogi visual (bayangkan diagram, peta, tabel)');
        break;
      case 'auditory':
        tips.push('jelaskan seolah berbicara — ucap intinya dulu, lalu ulang dengan kata berbeda');
        break;
      case 'reading':
        tips.push('struktur poin-poin singkat dan istilah kunci dicetak tebal');
        break;
      case 'kinesthetic':
        tips.push('berikan langkah konkret atau contoh aksi praktis');
        break;
      case 'activist':
        tips.push('mulai dengan tantangan atau contoh kasus dulu, baru teori');
        break;
      case 'reflector':
        tips.push('beri waktu untuk merenung — sajikan beberapa sudut pandang');
        break;
      case 'theorist':
        tips.push('mulai dari prinsip umum / rumus, lalu turunkan ke kasus');
        break;
      case 'pragmatist':
        tips.push('fokus ke aplikasi: "kalau ketemu soal seperti ini, lakukan X"');
        break;
    }
  }
  return tips.join('; ') + '.';
}

function formatQuestion(q: NonNullable<RequestBody['question']>): string {
  const lines: string[] = [];
  if (q.subject) lines.push(`Mata pelajaran: ${q.subject}`);
  lines.push(`Soal: ${q.questionText}`);
  if (q.options && q.options.length > 0) {
    lines.push('Pilihan:');
    for (const o of q.options) lines.push(`  ${o.id}. ${o.text}`);
  }
  if (q.correctOption) lines.push(`Jawaban yang benar: ${q.correctOption}`);
  if (q.explanationText) lines.push(`Pembahasan singkat yang sudah ada: ${q.explanationText}`);
  return lines.join('\n');
}

function json(payload: unknown, status: number): Response {
  return new Response(JSON.stringify(payload), {
    status,
    headers: { ...CORS, 'Content-Type': 'application/json' },
  });
}
