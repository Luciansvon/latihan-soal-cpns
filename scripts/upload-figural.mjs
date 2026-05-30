// Upload soal figural batch ke Supabase via supabase-js (anon key)
// Requires: temporary INSERT policy untuk anon (sudah di-set via MCP)
//
// Cara run:
//   node scripts/upload-figural.mjs

import fs from 'node:fs';
import path from 'node:path';
import { createClient } from '@supabase/supabase-js';

// Load .env manually (no dotenv dependency)
const envFile = path.join(import.meta.dirname, '..', '.env');
const env = {};
for (const line of fs.readFileSync(envFile, 'utf8').split('\n')) {
  const [k, ...v] = line.split('=');
  if (k && !k.startsWith('#') && v.length) env[k.trim()] = v.join('=').trim();
}

const supabase = createClient(
  env.EXPO_PUBLIC_SUPABASE_URL,
  env.EXPO_PUBLIC_SUPABASE_ANON_KEY,
);

// Re-import data dari generate-figural untuk insert via JS (bukan SQL)
// Untuk ini, kita import langsung struktur questions dari script generator.
// Lebih clean — gak perlu parse SQL.

// SIMPLIFIED: kita import langsung dari modul generate-figural.
// Modul itu sudah generate `packs` array. Kita re-export-nya.

// Karena generate-figural.mjs adalah top-level script (gak export), kita inline data-nya.

const { packs, svgUri } = await import('./generate-figural.mjs');

console.log(`Loading ${packs.length} packs...`);

for (let pi = 0; pi < packs.length; pi++) {
  const p = packs[pi];
  console.log(`\nPack ${pi + 1}: ${p.title} (${p.questions.length} soal)`);

  // Insert pack
  const { data: packData, error: packErr } = await supabase
    .from('question_packs')
    .insert({
      exam_type: 'CPNS',
      subject: 'TIU',
      title: p.title,
      description: p.description,
      question_count: p.questions.length,
      is_free: true,
      is_published: true,
    })
    .select('id')
    .single();

  if (packErr) {
    console.error('Pack insert failed:', packErr.message);
    process.exit(1);
  }
  const packId = packData.id;
  console.log(`  Pack created: ${packId}`);

  // Insert questions
  for (let qi = 0; qi < p.questions.length; qi++) {
    const q = p.questions[qi];
    const { error: qErr } = await supabase.from('questions').insert({
      pack_id: packId,
      exam_type: 'CPNS',
      subject: 'TIU',
      subtopic: 'Figural',
      question_type: 'MULTIPLE_CHOICE',
      difficulty: 'SEDANG',
      question_text: q.questionText,
      question_image_url: q.questionImage ? svgUri(q.questionImage) : null,
      options: q.options.map((o) => ({ id: o.id, text: o.text, imageUrl: svgUri(o.svg) })),
      correct_option: q.correctOption,
      explanation_text: q.explanation,
    });
    if (qErr) {
      console.error(`  Q${qi + 1} insert failed:`, qErr.message);
      process.exit(1);
    }
  }
  console.log(`  ${p.questions.length} questions inserted`);
}

console.log('\nDone — all packs uploaded.');
