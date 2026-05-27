// Fix double-encoded UTF-8 di src/screens
// Approach: scan untuk sequence pendek yang start dengan ð/â/Ã (lead byte UTF-8
// yang ke-misread as cp1252) dan decode kembali. Char di luar pola di-skip.

import fs from 'node:fs';
import path from 'node:path';

const CP1252_MAP = {
  '€': 0x80, '‚': 0x82, 'ƒ': 0x83, '„': 0x84, '…': 0x85,
  '†': 0x86, '‡': 0x87, 'ˆ': 0x88, '‰': 0x89, 'Š': 0x8A,
  '‹': 0x8B, 'Œ': 0x8C, 'Ž': 0x8E, '‘': 0x91, '’': 0x92,
  '“': 0x93, '”': 0x94, '•': 0x95, '–': 0x96, '—': 0x97,
  '˜': 0x98, '™': 0x99, 'š': 0x9A, '›': 0x9B, 'œ': 0x9C,
  'ž': 0x9E, 'Ÿ': 0x9F,
};

function charToByte(ch) {
  const code = ch.charCodeAt(0);
  if (code <= 0xFF) return code;
  return CP1252_MAP[ch] ?? null;
}

function decodeSeq(seq) {
  const bytes = [];
  for (const c of seq) {
    const b = charToByte(c);
    if (b === null) return null;
    bytes.push(b);
  }
  const decoded = Buffer.from(bytes).toString('utf8');
  // Validasi: decoded harus tidak ada replacement char
  if (decoded.includes('�')) return null;
  // Validasi: hasil decode harus PENDEK dari input (kalau sama panjang berarti gak corruption)
  if (decoded.length >= seq.length) return null;
  return decoded;
}

function fixContent(content) {
  let result = '';
  let i = 0;
  let changes = 0;
  while (i < content.length) {
    const ch = content[i];
    // ð (0xF0) = lead byte 4-byte UTF-8 sequence → 4 chars after corruption
    // â (0xE2) = lead byte 3-byte UTF-8 sequence → 3 chars after corruption
    // Ã (0xC3) = lead byte 2-byte UTF-8 sequence → 2 chars after corruption
    let seqLen = 0;
    if (ch === 'ð') seqLen = 4;
    else if (ch === 'â') seqLen = 3;
    else if (ch === 'Ã') seqLen = 2;

    if (seqLen > 0 && i + seqLen <= content.length) {
      const seq = content.substr(i, seqLen);
      const decoded = decodeSeq(seq);
      if (decoded !== null) {
        result += decoded;
        i += seqLen;
        changes++;
        continue;
      }
    }
    result += ch;
    i++;
  }
  return changes > 0 ? result : null;
}

function walk(dir) {
  const out = [];
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) out.push(...walk(full));
    else if (entry.isFile() && /\.(tsx?|jsx?|md)$/.test(entry.name)) out.push(full);
  }
  return out;
}

const root = path.join(import.meta.dirname, '..', 'src');
const files = walk(root);

let fixedCount = 0;
let totalChanges = 0;
for (const file of files) {
  const content = fs.readFileSync(file, 'utf8');
  const result = fixContent(content);
  if (result === null) continue;
  fs.writeFileSync(file, result, 'utf8');
  fixedCount++;
  console.log(`Fixed: ${path.relative(root, file)}`);
}
console.log(`\nTotal: ${fixedCount}/${files.length} files fixed`);
