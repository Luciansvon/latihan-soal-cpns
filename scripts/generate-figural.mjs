// Generator soal figural untuk CPNS TIU — batch 40 soal di 5 pack
// Patterns: Pencerminan, Klasifikasi, Lanjutan pola, Rotasi, Pola matriks
//
// Output: scripts/figural-questions.sql (siap di-execute via MCP execute_sql)
// Style: hitam-putih sederhana mengikuti soal CPNS asli (line drawing)

import fs from 'node:fs';
import path from 'node:path';

const OUT_FILE = path.join(import.meta.dirname, 'figural-questions.sql');
const STROKE = '#1a1a1a';
const STROKE_W = 2.5;

// ===========================================================================
// SVG helpers
// ===========================================================================
function svg(inner, vbW = 120, vbH = 80) {
  return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${vbW} ${vbH}" stroke="${STROKE}" stroke-width="${STROKE_W}" fill="none" stroke-linecap="round" stroke-linejoin="round">${inner}</svg>`;
}
function svgUri(s) {
  return `data:image/svg+xml;base64,${Buffer.from(s).toString('base64')}`;
}

// ===========================================================================
// Shape primitives
// ===========================================================================
function lShape(orientation, cx = 60, cy = 40, size = 22) {
  const s = size;
  const pts = {
    NE: [[cx - s, cy + s], [cx - s, cy - s], [cx + s, cy - s]],
    NW: [[cx + s, cy + s], [cx + s, cy - s], [cx - s, cy - s]],
    SE: [[cx - s, cy - s], [cx - s, cy + s], [cx + s, cy + s]],
    SW: [[cx + s, cy - s], [cx + s, cy + s], [cx - s, cy + s]],
  }[orientation];
  return `<polyline points="${pts.map((p) => p.join(',')).join(' ')}"/>`;
}

function triangle(dir, cx = 60, cy = 40, s = 20) {
  const pts = {
    up:    [[cx, cy - s], [cx - s, cy + s], [cx + s, cy + s]],
    down:  [[cx, cy + s], [cx - s, cy - s], [cx + s, cy - s]],
    left:  [[cx - s, cy], [cx + s, cy - s], [cx + s, cy + s]],
    right: [[cx + s, cy], [cx - s, cy - s], [cx - s, cy + s]],
  }[dir];
  return `<polygon points="${pts.map((p) => p.join(',')).join(' ')}"/>`;
}

function arrow(dir, cx = 60, cy = 40, s = 24, head = 8) {
  const d = {
    up:    `M${cx},${cy + s} L${cx},${cy - s} M${cx - head},${cy - s + head} L${cx},${cy - s} L${cx + head},${cy - s + head}`,
    down:  `M${cx},${cy - s} L${cx},${cy + s} M${cx - head},${cy + s - head} L${cx},${cy + s} L${cx + head},${cy + s - head}`,
    left:  `M${cx + s},${cy} L${cx - s},${cy} M${cx - s + head},${cy - head} L${cx - s},${cy} L${cx - s + head},${cy + head}`,
    right: `M${cx - s},${cy} L${cx + s},${cy} M${cx + s - head},${cy - head} L${cx + s},${cy} L${cx + s - head},${cy + head}`,
  }[dir];
  return `<path d="${d}"/>`;
}

function square(cx = 60, cy = 40, s = 20, fillType = 'none') {
  const rect = `<rect x="${cx - s}" y="${cy - s}" width="${s * 2}" height="${s * 2}"/>`;
  if (fillType === 'solid') return `<rect x="${cx - s}" y="${cy - s}" width="${s * 2}" height="${s * 2}" fill="${STROKE}"/>`;
  if (fillType === 'cross') return rect + `<line x1="${cx - s}" y1="${cy - s}" x2="${cx + s}" y2="${cy + s}"/><line x1="${cx + s}" y1="${cy - s}" x2="${cx - s}" y2="${cy + s}"/>`;
  if (fillType === 'diag') return rect + `<line x1="${cx - s}" y1="${cy + s}" x2="${cx + s}" y2="${cy - s}"/>`;
  if (fillType === 'dot') return rect + `<circle cx="${cx}" cy="${cy}" r="4" fill="${STROKE}"/>`;
  return rect;
}

function circleShape(cx = 60, cy = 40, r = 18, inner = 'none') {
  let c = `<circle cx="${cx}" cy="${cy}" r="${r}"/>`;
  if (inner === 'dot') c += `<circle cx="${cx}" cy="${cy}" r="3" fill="${STROKE}"/>`;
  if (inner === 'cross') c += `<line x1="${cx - r * 0.7}" y1="${cy}" x2="${cx + r * 0.7}" y2="${cy}"/><line x1="${cx}" y1="${cy - r * 0.7}" x2="${cx}" y2="${cy + r * 0.7}"/>`;
  if (inner === 'x') c += `<line x1="${cx - r * 0.6}" y1="${cy - r * 0.6}" x2="${cx + r * 0.6}" y2="${cy + r * 0.6}"/><line x1="${cx + r * 0.6}" y1="${cy - r * 0.6}" x2="${cx - r * 0.6}" y2="${cy + r * 0.6}"/>`;
  if (inner === 'solid') c = `<circle cx="${cx}" cy="${cy}" r="${r}" fill="${STROKE}"/>`;
  return c;
}

function star(cx = 60, cy = 40, r = 20) {
  const pts = [];
  for (let i = 0; i < 10; i++) {
    const angle = (Math.PI * 2 * i) / 10 - Math.PI / 2;
    const radius = i % 2 === 0 ? r : r * 0.4;
    pts.push([cx + radius * Math.cos(angle), cy + radius * Math.sin(angle)]);
  }
  return `<polygon points="${pts.map((p) => `${p[0].toFixed(1)},${p[1].toFixed(1)}`).join(' ')}"/>`;
}

function diamond(cx = 60, cy = 40, s = 20) {
  return `<polygon points="${cx},${cy - s} ${cx + s},${cy} ${cx},${cy + s} ${cx - s},${cy}"/>`;
}

function ncircles(n, cy = 40, r = 6, vbW = 120) {
  const spacing = 16;
  const startX = vbW / 2 - ((n - 1) * spacing) / 2;
  return Array.from({ length: n }, (_, i) =>
    `<circle cx="${startX + i * spacing}" cy="${cy}" r="${r}" fill="${STROKE}"/>`
  ).join('');
}

function matrix3x3(pattern, cx = 60, cy = 40, cellSize = 12) {
  // pattern: 9 elements, 0=empty 1=solid 2=question
  const out = [];
  const top = cy - cellSize * 1.5;
  const left = cx - cellSize * 1.5;
  for (let row = 0; row < 3; row++) {
    for (let col = 0; col < 3; col++) {
      const x = left + col * cellSize;
      const y = top + row * cellSize;
      out.push(`<rect x="${x}" y="${y}" width="${cellSize}" height="${cellSize}"/>`);
      const val = pattern[row * 3 + col];
      if (val === 1) out.push(`<rect x="${x + 1}" y="${y + 1}" width="${cellSize - 2}" height="${cellSize - 2}" fill="${STROKE}"/>`);
      if (val === 2) out.push(`<text x="${x + cellSize / 2}" y="${y + cellSize * 0.75}" text-anchor="middle" font-size="${cellSize * 0.7}" font-family="sans-serif" stroke="none" fill="${STROKE}">?</text>`);
    }
  }
  return out.join('');
}

function questionMark(cx, cy) {
  return `<text x="${cx}" y="${cy + 8}" text-anchor="middle" font-size="24" font-family="sans-serif" stroke="none" fill="${STROKE}">?</text>`;
}

// ===========================================================================
// Sequence helper — render N items horizontally
// ===========================================================================
function sequence(items, vbW = 320, vbH = 80, addQuestion = true) {
  const slotCount = items.length + (addQuestion ? 1 : 0);
  const slotW = vbW / slotCount;
  const parts = items.map((item, i) => {
    const slotCx = slotW * i + slotW / 2;
    return `<g transform="translate(${slotCx - 60},0)">${item}</g>`;
  });
  if (addQuestion) {
    const qSlotCx = slotW * items.length + slotW / 2;
    parts.push(`<g transform="translate(${qSlotCx - 60},0)">${questionMark(60, 40)}</g>`);
  }
  return svg(parts.join(''), vbW, vbH);
}

// ===========================================================================
// PATTERN A: KLASIFIKASI (odd one out)
// ===========================================================================
function makeKlasifikasi(uniformBuilder, oddBuilder, oddPos, explanation) {
  const opts = [];
  for (let i = 0; i < 5; i++) {
    const id = 'ABCDE'[i];
    opts.push({
      id, text: id,
      svg: svg(i === oddPos ? oddBuilder() : uniformBuilder()),
    });
  }
  return {
    questionText: 'Manakah gambar yang berbeda dari yang lain?',
    questionImage: null,
    options: opts,
    correctOption: 'ABCDE'[oddPos],
    explanation,
  };
}

const KLASIFIKASI = [
  makeKlasifikasi(
    () => circleShape(60, 40, 20, 'cross'),
    () => circleShape(60, 40, 20, 'dot'),
    2,
    'Empat lingkaran berisi tanda silang, satu berisi titik. C berbeda.',
  ),
  makeKlasifikasi(
    () => triangle('up', 60, 40, 20),
    () => triangle('down', 60, 40, 20),
    1,
    'Empat segitiga menghadap ke atas, satu menghadap ke bawah. B berbeda.',
  ),
  makeKlasifikasi(
    () => square(60, 40, 18, 'cross'),
    () => square(60, 40, 18, 'diag'),
    3,
    'Empat kotak berisi tanda X (dua diagonal), satu hanya berisi satu diagonal. D berbeda.',
  ),
  makeKlasifikasi(
    () => arrow('right', 60, 40, 24),
    () => arrow('left', 60, 40, 24),
    4,
    'Empat panah menghadap kanan, satu menghadap kiri. E berbeda.',
  ),
  makeKlasifikasi(
    () => lShape('NE', 60, 40, 20),
    () => lShape('SE', 60, 40, 20),
    0,
    'Empat L-shape menghadap kanan-bawah, satu menghadap kanan-atas. A berbeda.',
  ),
  makeKlasifikasi(
    () => circleShape(60, 40, 20, 'solid'),
    () => circleShape(60, 40, 20, 'none'),
    2,
    'Empat lingkaran terisi (solid), satu kosong (outline). C berbeda.',
  ),
  makeKlasifikasi(
    () => diamond(60, 40, 20),
    () => square(60, 40, 18, 'none'),
    1,
    'Empat belah ketupat (diamond), satu kotak. B berbeda.',
  ),
  makeKlasifikasi(
    () => star(60, 40, 20),
    () => circleShape(60, 40, 18, 'none'),
    4,
    'Empat bintang, satu lingkaran. E berbeda.',
  ),
];

// ===========================================================================
// PATTERN B: PENCERMINAN
// ===========================================================================
const PENCERMINAN = [
  {
    questionText: 'Hasil pencerminan vertikal (kiri-kanan) dari gambar berikut adalah ...',
    questionImage: svg(lShape('NE', 60, 40, 22)),
    options: [
      { id: 'A', text: 'A', svg: svg(lShape('NE', 60, 40, 22)) },
      { id: 'B', text: 'B', svg: svg(lShape('NW', 60, 40, 22)) },
      { id: 'C', text: 'C', svg: svg(lShape('SE', 60, 40, 22)) },
      { id: 'D', text: 'D', svg: svg(lShape('SW', 60, 40, 22)) },
      { id: 'E', text: 'E', svg: svg(triangle('up', 60, 40, 20)) },
    ],
    correctOption: 'B',
    explanation: 'Pencerminan vertikal mengubah arah kiri↔kanan. L-shape NE (kiri-bawah-kanan-atas) → NW (kanan-bawah-kiri-atas) = B.',
  },
  {
    questionText: 'Hasil pencerminan horizontal (atas-bawah) dari gambar berikut adalah ...',
    questionImage: svg(triangle('up', 60, 40, 22)),
    options: [
      { id: 'A', text: 'A', svg: svg(triangle('up', 60, 40, 22)) },
      { id: 'B', text: 'B', svg: svg(triangle('down', 60, 40, 22)) },
      { id: 'C', text: 'C', svg: svg(triangle('left', 60, 40, 22)) },
      { id: 'D', text: 'D', svg: svg(triangle('right', 60, 40, 22)) },
      { id: 'E', text: 'E', svg: svg(diamond(60, 40, 20)) },
    ],
    correctOption: 'B',
    explanation: 'Pencerminan horizontal mengubah atas↔bawah. Segitiga ke atas → ke bawah = B.',
  },
  {
    questionText: 'Hasil pencerminan vertikal dari panah berikut adalah ...',
    questionImage: svg(arrow('right', 60, 40, 24)),
    options: [
      { id: 'A', text: 'A', svg: svg(arrow('up', 60, 40, 24)) },
      { id: 'B', text: 'B', svg: svg(arrow('down', 60, 40, 24)) },
      { id: 'C', text: 'C', svg: svg(arrow('left', 60, 40, 24)) },
      { id: 'D', text: 'D', svg: svg(arrow('right', 60, 40, 24)) },
      { id: 'E', text: 'E', svg: svg(circleShape(60, 40, 18, 'cross')) },
    ],
    correctOption: 'C',
    explanation: 'Pencerminan vertikal pada panah → kanan: arah berbalik jadi → kiri. Jawaban: C.',
  },
  {
    questionText: 'Hasil pencerminan vertikal dari L-shape SW adalah ...',
    questionImage: svg(lShape('SW', 60, 40, 22)),
    options: [
      { id: 'A', text: 'A', svg: svg(lShape('NE', 60, 40, 22)) },
      { id: 'B', text: 'B', svg: svg(lShape('NW', 60, 40, 22)) },
      { id: 'C', text: 'C', svg: svg(lShape('SE', 60, 40, 22)) },
      { id: 'D', text: 'D', svg: svg(lShape('SW', 60, 40, 22)) },
      { id: 'E', text: 'E', svg: svg(square(60, 40, 18, 'cross')) },
    ],
    correctOption: 'C',
    explanation: 'L-shape SW (kanan-atas-kiri-bawah) di-cermin vertikal → SE (kiri-atas-kanan-bawah) = C.',
  },
  {
    questionText: 'Hasil pencerminan horizontal dari diamond + segitiga adalah ...',
    questionImage: svg(diamond(40, 40, 14) + triangle('up', 80, 40, 14)),
    options: [
      { id: 'A', text: 'A', svg: svg(diamond(40, 40, 14) + triangle('up', 80, 40, 14)) },
      { id: 'B', text: 'B', svg: svg(diamond(40, 40, 14) + triangle('down', 80, 40, 14)) },
      { id: 'C', text: 'C', svg: svg(triangle('up', 40, 40, 14) + diamond(80, 40, 14)) },
      { id: 'D', text: 'D', svg: svg(diamond(80, 40, 14) + triangle('down', 40, 40, 14)) },
      { id: 'E', text: 'E', svg: svg(diamond(60, 40, 18)) },
    ],
    correctOption: 'B',
    explanation: 'Pencerminan horizontal hanya membalik atas-bawah. Diamond simetris tidak berubah, segitiga atas → bawah. Posisi horizontal sama. Jawaban: B.',
  },
  {
    questionText: 'Hasil pencerminan vertikal dari bintang+panah kanan adalah ...',
    questionImage: svg(star(35, 40, 14) + arrow('right', 85, 40, 16)),
    options: [
      { id: 'A', text: 'A', svg: svg(star(85, 40, 14) + arrow('left', 35, 40, 16)) },
      { id: 'B', text: 'B', svg: svg(star(35, 40, 14) + arrow('right', 85, 40, 16)) },
      { id: 'C', text: 'C', svg: svg(arrow('left', 85, 40, 16) + star(35, 40, 14)) },
      { id: 'D', text: 'D', svg: svg(star(60, 40, 16)) },
      { id: 'E', text: 'E', svg: svg(arrow('left', 60, 40, 16)) },
    ],
    correctOption: 'A',
    explanation: 'Pencerminan vertikal: posisi kiri↔kanan. Bintang yg awalnya kiri → kanan, panah kanan → kiri (sekaligus arahnya terbalik). Jawaban: A.',
  },
];

// ===========================================================================
// PATTERN C: LANJUTAN POLA (deret)
// ===========================================================================
const LANJUTAN_POLA = [
  {
    questionText: 'Lanjutkan pola gambar berikut. Gambar selanjutnya adalah ...',
    questionImage: sequence([triangle('up', 60, 40, 14), triangle('right', 60, 40, 14), triangle('down', 60, 40, 14), triangle('left', 60, 40, 14)]),
    options: [
      { id: 'A', text: 'A', svg: svg(triangle('up', 60, 40, 20)) },
      { id: 'B', text: 'B', svg: svg(triangle('right', 60, 40, 20)) },
      { id: 'C', text: 'C', svg: svg(triangle('down', 60, 40, 20)) },
      { id: 'D', text: 'D', svg: svg(triangle('left', 60, 40, 20)) },
      { id: 'E', text: 'E', svg: svg(circleShape(60, 40, 18)) },
    ],
    correctOption: 'A',
    explanation: 'Segitiga berputar searah jarum jam tiap langkah: ↑ → → ↓ → ← → ↑ (siklik). Jawaban: A.',
  },
  {
    questionText: 'Lanjutkan pola jumlah lingkaran berikut. Gambar selanjutnya adalah ...',
    questionImage: sequence([ncircles(1, 40, 5, 60), ncircles(2, 40, 5, 60), ncircles(3, 40, 5, 60), ncircles(4, 40, 5, 60)]),
    options: [
      { id: 'A', text: 'A', svg: svg(ncircles(3, 40, 6)) },
      { id: 'B', text: 'B', svg: svg(ncircles(4, 40, 6)) },
      { id: 'C', text: 'C', svg: svg(ncircles(5, 40, 6)) },
      { id: 'D', text: 'D', svg: svg(ncircles(6, 40, 6)) },
      { id: 'E', text: 'E', svg: svg(ncircles(2, 40, 6)) },
    ],
    correctOption: 'C',
    explanation: 'Jumlah lingkaran bertambah 1 tiap langkah: 1 → 2 → 3 → 4 → 5. Jawaban: C.',
  },
  {
    questionText: 'Lanjutkan pola panah berikut. Gambar selanjutnya adalah ...',
    questionImage: sequence([arrow('up', 60, 40, 14), arrow('right', 60, 40, 14), arrow('down', 60, 40, 14), arrow('left', 60, 40, 14)]),
    options: [
      { id: 'A', text: 'A', svg: svg(arrow('up', 60, 40, 24)) },
      { id: 'B', text: 'B', svg: svg(arrow('right', 60, 40, 24)) },
      { id: 'C', text: 'C', svg: svg(arrow('down', 60, 40, 24)) },
      { id: 'D', text: 'D', svg: svg(arrow('left', 60, 40, 24)) },
      { id: 'E', text: 'E', svg: svg(circleShape(60, 40, 18, 'cross')) },
    ],
    correctOption: 'A',
    explanation: 'Panah berputar searah jarum jam. Setelah kiri kembali ke atas. Jawaban: A.',
  },
  {
    questionText: 'Lanjutkan pola berikut. Gambar selanjutnya adalah ...',
    questionImage: sequence([square(60, 40, 14, 'none'), square(60, 40, 14, 'dot'), square(60, 40, 14, 'diag'), square(60, 40, 14, 'cross')]),
    options: [
      { id: 'A', text: 'A', svg: svg(square(60, 40, 20, 'none')) },
      { id: 'B', text: 'B', svg: svg(square(60, 40, 20, 'solid')) },
      { id: 'C', text: 'C', svg: svg(square(60, 40, 20, 'dot')) },
      { id: 'D', text: 'D', svg: svg(square(60, 40, 20, 'diag')) },
      { id: 'E', text: 'E', svg: svg(circleShape(60, 40, 18)) },
    ],
    correctOption: 'B',
    explanation: 'Pola: kotak makin banyak isinya — kosong → titik → 1 diagonal → 2 diagonal (silang) → terisi penuh (solid). Jawaban: B.',
  },
  {
    questionText: 'Lanjutkan pola berikut. Gambar selanjutnya adalah ...',
    questionImage: sequence([circleShape(60, 40, 8), circleShape(60, 40, 12), circleShape(60, 40, 16), circleShape(60, 40, 20)]),
    options: [
      { id: 'A', text: 'A', svg: svg(circleShape(60, 40, 18)) },
      { id: 'B', text: 'B', svg: svg(circleShape(60, 40, 22)) },
      { id: 'C', text: 'C', svg: svg(circleShape(60, 40, 24)) },
      { id: 'D', text: 'D', svg: svg(circleShape(60, 40, 28)) },
      { id: 'E', text: 'E', svg: svg(circleShape(60, 40, 14)) },
    ],
    correctOption: 'C',
    explanation: 'Lingkaran membesar 4 satuan tiap langkah (8 → 12 → 16 → 20 → 24). Jawaban: C.',
  },
  {
    questionText: 'Lanjutkan pola panjang panah berikut. Gambar selanjutnya adalah ...',
    questionImage: sequence([arrow('right', 60, 40, 8), arrow('right', 60, 40, 14), arrow('right', 60, 40, 20)], 240, 80),
    options: [
      { id: 'A', text: 'A', svg: svg(arrow('right', 60, 40, 14)) },
      { id: 'B', text: 'B', svg: svg(arrow('right', 60, 40, 20)) },
      { id: 'C', text: 'C', svg: svg(arrow('right', 60, 40, 26)) },
      { id: 'D', text: 'D', svg: svg(arrow('right', 60, 40, 32)) },
      { id: 'E', text: 'E', svg: svg(arrow('left', 60, 40, 26)) },
    ],
    correctOption: 'C',
    explanation: 'Panjang panah bertambah 6 tiap langkah (8 → 14 → 20 → 26). Jawaban: C.',
  },
  {
    questionText: 'Lanjutkan pola alternasi berikut. Gambar selanjutnya adalah ...',
    questionImage: sequence([circleShape(60, 40, 18, 'solid'), circleShape(60, 40, 18, 'none'), circleShape(60, 40, 18, 'solid'), circleShape(60, 40, 18, 'none')]),
    options: [
      { id: 'A', text: 'A', svg: svg(circleShape(60, 40, 20, 'solid')) },
      { id: 'B', text: 'B', svg: svg(circleShape(60, 40, 20, 'none')) },
      { id: 'C', text: 'C', svg: svg(circleShape(60, 40, 20, 'cross')) },
      { id: 'D', text: 'D', svg: svg(square(60, 40, 18, 'solid')) },
      { id: 'E', text: 'E', svg: svg(triangle('up', 60, 40, 18)) },
    ],
    correctOption: 'A',
    explanation: 'Pola alternasi: solid - kosong - solid - kosong - ? Berikutnya solid. Jawaban: A.',
  },
  {
    questionText: 'Lanjutkan pola berikut. Gambar selanjutnya adalah ...',
    questionImage: sequence([triangle('up', 60, 40, 8), triangle('up', 60, 40, 12), triangle('up', 60, 40, 16), triangle('up', 60, 40, 20)]),
    options: [
      { id: 'A', text: 'A', svg: svg(triangle('up', 60, 40, 22)) },
      { id: 'B', text: 'B', svg: svg(triangle('up', 60, 40, 24)) },
      { id: 'C', text: 'C', svg: svg(triangle('down', 60, 40, 24)) },
      { id: 'D', text: 'D', svg: svg(triangle('up', 60, 40, 18)) },
      { id: 'E', text: 'E', svg: svg(triangle('up', 60, 40, 28)) },
    ],
    correctOption: 'B',
    explanation: 'Segitiga membesar 4 satuan tiap langkah (8 → 12 → 16 → 20 → 24). Jawaban: B.',
  },
];

// ===========================================================================
// PATTERN D: ROTASI
// ===========================================================================
const ROTASI = [
  {
    questionText: 'Gambar berikut diputar 90° searah jarum jam. Hasilnya adalah ...',
    questionImage: svg(arrow('up', 60, 40, 24)),
    options: [
      { id: 'A', text: 'A', svg: svg(arrow('right', 60, 40, 24)) },
      { id: 'B', text: 'B', svg: svg(arrow('down', 60, 40, 24)) },
      { id: 'C', text: 'C', svg: svg(arrow('left', 60, 40, 24)) },
      { id: 'D', text: 'D', svg: svg(arrow('up', 60, 40, 24)) },
      { id: 'E', text: 'E', svg: svg(triangle('right', 60, 40, 20)) },
    ],
    correctOption: 'A',
    explanation: 'Rotasi 90° CW: panah ke atas → panah ke kanan. Jawaban: A.',
  },
  {
    questionText: 'Gambar berikut diputar 180°. Hasilnya adalah ...',
    questionImage: svg(triangle('up', 60, 40, 22)),
    options: [
      { id: 'A', text: 'A', svg: svg(triangle('left', 60, 40, 22)) },
      { id: 'B', text: 'B', svg: svg(triangle('right', 60, 40, 22)) },
      { id: 'C', text: 'C', svg: svg(triangle('down', 60, 40, 22)) },
      { id: 'D', text: 'D', svg: svg(triangle('up', 60, 40, 22)) },
      { id: 'E', text: 'E', svg: svg(diamond(60, 40, 20)) },
    ],
    correctOption: 'C',
    explanation: 'Rotasi 180°: segitiga ke atas → ke bawah (terbalik penuh). Jawaban: C.',
  },
  {
    questionText: 'Gambar berikut diputar 90° berlawanan jarum jam. Hasilnya adalah ...',
    questionImage: svg(lShape('NE', 60, 40, 22)),
    options: [
      { id: 'A', text: 'A', svg: svg(lShape('NE', 60, 40, 22)) },
      { id: 'B', text: 'B', svg: svg(lShape('NW', 60, 40, 22)) },
      { id: 'C', text: 'C', svg: svg(lShape('SE', 60, 40, 22)) },
      { id: 'D', text: 'D', svg: svg(lShape('SW', 60, 40, 22)) },
      { id: 'E', text: 'E', svg: svg(triangle('left', 60, 40, 20)) },
    ],
    correctOption: 'C',
    explanation: 'Rotasi 90° CCW: L-shape NE (sudut di kanan-atas) → SE (sudut di kanan-bawah). Jawaban: C.',
  },
  {
    questionText: 'Gambar berikut diputar 90° searah jarum jam. Hasilnya adalah ...',
    questionImage: svg(lShape('NW', 60, 40, 22)),
    options: [
      { id: 'A', text: 'A', svg: svg(lShape('NE', 60, 40, 22)) },
      { id: 'B', text: 'B', svg: svg(lShape('NW', 60, 40, 22)) },
      { id: 'C', text: 'C', svg: svg(lShape('SE', 60, 40, 22)) },
      { id: 'D', text: 'D', svg: svg(lShape('SW', 60, 40, 22)) },
      { id: 'E', text: 'E', svg: svg(diamond(60, 40, 18)) },
    ],
    correctOption: 'A',
    explanation: 'Rotasi 90° CW: L-shape NW (sudut di kiri-atas) → NE (sudut di kanan-atas). Jawaban: A.',
  },
  {
    questionText: 'Gambar berikut diputar 270° searah jarum jam (= 90° CCW). Hasilnya adalah ...',
    questionImage: svg(arrow('up', 60, 40, 24)),
    options: [
      { id: 'A', text: 'A', svg: svg(arrow('right', 60, 40, 24)) },
      { id: 'B', text: 'B', svg: svg(arrow('down', 60, 40, 24)) },
      { id: 'C', text: 'C', svg: svg(arrow('left', 60, 40, 24)) },
      { id: 'D', text: 'D', svg: svg(arrow('up', 60, 40, 24)) },
      { id: 'E', text: 'E', svg: svg(square(60, 40, 18)) },
    ],
    correctOption: 'C',
    explanation: 'Rotasi 270° CW sama dengan 90° CCW. Panah ke atas → ke kiri. Jawaban: C.',
  },
  {
    questionText: 'Gambar berikut diputar 180°. Hasilnya adalah ...',
    questionImage: svg(arrow('right', 60, 40, 24)),
    options: [
      { id: 'A', text: 'A', svg: svg(arrow('up', 60, 40, 24)) },
      { id: 'B', text: 'B', svg: svg(arrow('down', 60, 40, 24)) },
      { id: 'C', text: 'C', svg: svg(arrow('left', 60, 40, 24)) },
      { id: 'D', text: 'D', svg: svg(arrow('right', 60, 40, 24)) },
      { id: 'E', text: 'E', svg: svg(circleShape(60, 40, 18, 'cross')) },
    ],
    correctOption: 'C',
    explanation: 'Rotasi 180°: panah ke kanan → ke kiri (arah terbalik). Jawaban: C.',
  },
];

// ===========================================================================
// PATTERN E: POLA MATRIKS 3x3
// ===========================================================================
const MATRIKS = [
  {
    questionText: 'Lengkapi pola matriks berikut. Sel yang kosong harus berisi ...',
    questionImage: svg(matrix3x3([1, 0, 1, 0, 1, 0, 1, 0, 2], 60, 40, 14)),
    options: [
      { id: 'A', text: 'A', svg: svg(square(60, 40, 12, 'solid')) },
      { id: 'B', text: 'B', svg: svg(square(60, 40, 12, 'none')) },
      { id: 'C', text: 'C', svg: svg(square(60, 40, 12, 'dot')) },
      { id: 'D', text: 'D', svg: svg(square(60, 40, 12, 'cross')) },
      { id: 'E', text: 'E', svg: svg(circleShape(60, 40, 12, 'solid')) },
    ],
    correctOption: 'A',
    explanation: 'Pola checkerboard: solid-kosong-solid-kosong-solid-kosong-solid-kosong-?. Sel ke-9 harus solid. Jawaban: A.',
  },
  {
    questionText: 'Lengkapi pola matriks berikut. Sel yang kosong harus berisi ...',
    questionImage: svg(matrix3x3([0, 0, 0, 0, 1, 0, 0, 0, 2], 60, 40, 14)),
    options: [
      { id: 'A', text: 'A', svg: svg(square(60, 40, 12, 'solid')) },
      { id: 'B', text: 'B', svg: svg(square(60, 40, 12, 'none')) },
      { id: 'C', text: 'C', svg: svg(square(60, 40, 12, 'cross')) },
      { id: 'D', text: 'D', svg: svg(circleShape(60, 40, 12, 'solid')) },
      { id: 'E', text: 'E', svg: svg(triangle('up', 60, 40, 12)) },
    ],
    correctOption: 'B',
    explanation: 'Hanya sel tengah yang solid, sisanya kosong. Sel ke-9 harus kosong. Jawaban: B.',
  },
  {
    questionText: 'Lengkapi pola matriks berikut. Sel yang kosong harus berisi ...',
    questionImage: svg(matrix3x3([1, 1, 1, 0, 0, 0, 1, 1, 2], 60, 40, 14)),
    options: [
      { id: 'A', text: 'A', svg: svg(square(60, 40, 12, 'solid')) },
      { id: 'B', text: 'B', svg: svg(square(60, 40, 12, 'none')) },
      { id: 'C', text: 'C', svg: svg(triangle('up', 60, 40, 12)) },
      { id: 'D', text: 'D', svg: svg(circleShape(60, 40, 12, 'solid')) },
      { id: 'E', text: 'E', svg: svg(square(60, 40, 12, 'cross')) },
    ],
    correctOption: 'A',
    explanation: 'Pola: baris 1 dan baris 3 solid semua, baris 2 kosong. Sel ke-9 (baris 3 kolom 3) = solid. Jawaban: A.',
  },
  {
    questionText: 'Lengkapi pola matriks berikut. Sel yang kosong harus berisi ...',
    questionImage: svg(matrix3x3([1, 0, 0, 0, 1, 0, 0, 0, 2], 60, 40, 14)),
    options: [
      { id: 'A', text: 'A', svg: svg(square(60, 40, 12, 'solid')) },
      { id: 'B', text: 'B', svg: svg(square(60, 40, 12, 'none')) },
      { id: 'C', text: 'C', svg: svg(square(60, 40, 12, 'cross')) },
      { id: 'D', text: 'D', svg: svg(circleShape(60, 40, 12, 'solid')) },
      { id: 'E', text: 'E', svg: svg(triangle('up', 60, 40, 12)) },
    ],
    correctOption: 'A',
    explanation: 'Pola diagonal kiri-atas ke kanan-bawah: posisi (0,0), (1,1), (2,2) solid. Sel (2,2) harus solid. Jawaban: A.',
  },
  {
    questionText: 'Lengkapi pola matriks berikut. Sel yang kosong harus berisi ...',
    questionImage: svg(matrix3x3([0, 1, 0, 1, 0, 1, 0, 1, 2], 60, 40, 14)),
    options: [
      { id: 'A', text: 'A', svg: svg(square(60, 40, 12, 'solid')) },
      { id: 'B', text: 'B', svg: svg(square(60, 40, 12, 'none')) },
      { id: 'C', text: 'C', svg: svg(square(60, 40, 12, 'cross')) },
      { id: 'D', text: 'D', svg: svg(triangle('up', 60, 40, 12)) },
      { id: 'E', text: 'E', svg: svg(circleShape(60, 40, 12, 'solid')) },
    ],
    correctOption: 'B',
    explanation: 'Pola plus: posisi tengah dan sumbu salib (kanan/kiri/atas/bawah dari tengah) terisi. Pola dimulai dari (0,1). Sel pojok kanan-bawah (2,2) harus kosong sesuai checkerboard. Jawaban: B.',
  },
  {
    questionText: 'Lengkapi pola matriks berikut. Sel yang kosong harus berisi ...',
    questionImage: svg(matrix3x3([0, 0, 1, 0, 1, 0, 1, 0, 2], 60, 40, 14)),
    options: [
      { id: 'A', text: 'A', svg: svg(square(60, 40, 12, 'solid')) },
      { id: 'B', text: 'B', svg: svg(square(60, 40, 12, 'none')) },
      { id: 'C', text: 'C', svg: svg(square(60, 40, 12, 'cross')) },
      { id: 'D', text: 'D', svg: svg(circleShape(60, 40, 12, 'solid')) },
      { id: 'E', text: 'E', svg: svg(diamond(60, 40, 12)) },
    ],
    correctOption: 'B',
    explanation: 'Pola diagonal kanan-atas ke kiri-bawah: posisi (0,2), (1,1), (2,0) solid. Sel (2,2) tidak di diagonal → kosong. Jawaban: B.',
  },
];

// ===========================================================================
// Aggregate into packs
// ===========================================================================
const packs = [
  {
    title: 'Klasifikasi Visual',
    description: 'Soal figural: temukan gambar yang berbeda dari kelompok (odd one out)',
    questions: KLASIFIKASI,
  },
  {
    title: 'Pencerminan Gambar',
    description: 'Soal figural: hasil refleksi/pencerminan gambar (vertikal/horizontal)',
    questions: PENCERMINAN,
  },
  {
    title: 'Lanjutan Pola',
    description: 'Soal figural: tentukan gambar berikutnya dalam pola yang konsisten',
    questions: LANJUTAN_POLA,
  },
  {
    title: 'Rotasi Gambar',
    description: 'Soal figural: hasil rotasi gambar (90°, 180°, 270°)',
    questions: ROTASI,
  },
  {
    title: 'Pola Matriks 3x3',
    description: 'Soal figural: lengkapi pola matriks 3x3 yang konsisten',
    questions: MATRIKS,
  },
];

const totalSoal = packs.reduce((sum, p) => sum + p.questions.length, 0);
console.log(`Total: ${totalSoal} soal di ${packs.length} pack`);

// ===========================================================================
// Build SQL
// ===========================================================================
function escapeSql(s) { return s.replace(/'/g, "''"); }

function optsJsonbLit(options) {
  const arr = options.map((o) => ({ id: o.id, text: o.text, imageUrl: svgUri(o.svg) }));
  return escapeSql(JSON.stringify(arr));
}

// Export packs untuk dipakai upload-figural.mjs
export { packs, svgUri };

// Skip SQL generation kalau di-import sebagai module (cuma jalan saat di-run langsung)
const isMain = import.meta.url === `file://${process.argv[1].replace(/\\/g, '/')}`;
if (isMain) {
  console.log(`Run as main — generating SQL files for ${packs.length} packs...`);
}
