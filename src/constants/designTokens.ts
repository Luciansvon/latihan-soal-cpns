// Design tokens diport dari prototype `UI APK LATIHAN SOAL CPNS/`.
// Filosofi: monokrom 60/30/10 — cream/beige (60%), ink dark (30%), aksen putih
// + primary tipis (10%). Lihat HANDOFF.md section 5 untuk detail.
//
// Cara pakai:
//   import { themeOf, Tokens } from '@/constants/designTokens';
//   const theme = themeOf('azure', false);     // light azure
//   <View style={{ backgroundColor: theme.bg, padding: Tokens.space[5] }} />

// ─────────────────────────── Palettes ───────────────────────────
export type PaletteName = 'azure' | 'mint' | 'ocean' | 'burgundy' | 'plum' | 'forest';

export interface Palette {
  primary: string;     // 10% accent (brand hint, jarang dipakai)
  primaryDim: string;  // primary lebih terang (hover/disabled)
  accent: string;      // near-black untuk sub-accent / daily challenge banner
  tint: string;        // soft fill
  bg: string;          // 60% page background — cream (BUKAN putih)
  surface: string;     // 30% card background (white di light mode)
  ink: string;         // dark surfaces + text utama (hero/CTA dark)
  sub: string;         // text sekunder, ikon idle
  soft: string;        // divider, neutral bar bg, badge GRATIS
  border: string;      // border tipis
}

export const PALETTES: Record<PaletteName, Palette> = {
  azure: {
    primary: '#3D6BAA', primaryDim: '#6087BD', accent: '#1F1F1F',
    tint: '#D5DDEC', bg: '#E5E1D2', surface: '#FFFFFF',
    ink: '#1A2A40', sub: '#5E6878', soft: '#D7D3C3',
    border: 'rgba(15,29,61,0.08)',
  },
  mint: {
    primary: '#2F8970', primaryDim: '#4FA08A', accent: '#1F1F1F',
    tint: '#D7E5DC', bg: '#E5E0CF', surface: '#FFFFFF',
    ink: '#1A2A24', sub: '#5C7068', soft: '#D8D3BF',
    border: 'rgba(15,38,32,0.08)',
  },
  ocean: {
    primary: '#326E85', primaryDim: '#558A9F', accent: '#1F1F1F',
    tint: '#D3DFE5', bg: '#E4E0CF', surface: '#FFFFFF',
    ink: '#162831', sub: '#5C6E76', soft: '#D6D2BF',
    border: 'rgba(11,32,43,0.08)',
  },
  burgundy: {
    primary: '#8E4A4A', primaryDim: '#A56363', accent: '#1F1F1F',
    tint: '#E6D2D2', bg: '#E8E1D0', surface: '#FFFFFF',
    ink: '#2A1818', sub: '#7B5E5E', soft: '#DBD3C0',
    border: 'rgba(42,16,9,0.08)',
  },
  plum: {
    primary: '#724066', primaryDim: '#8A5A7D', accent: '#1F1F1F',
    tint: '#E2D2DC', bg: '#E5DED9', surface: '#FFFFFF',
    ink: '#251826', sub: '#7B6271', soft: '#D6CFC8',
    border: 'rgba(38,12,32,0.08)',
  },
  forest: {
    primary: '#3D5E42', primaryDim: '#587859', accent: '#1F1F1F',
    tint: '#D1DDCB', bg: '#E2DEC9', surface: '#FFFFFF',
    ink: '#1A241C', sub: '#5E6B5C', soft: '#D5D1BC',
    border: 'rgba(15,31,18,0.08)',
  },
};

const DARK_BASE = {
  bg: '#161412',
  surface: '#211E1A',
  ink: '#F2EEE6',
  sub: '#9A938A',
  soft: '#2A2620',
  border: 'rgba(255,255,255,0.07)',
};

export function themeOf(name: PaletteName = 'azure', dark = false): Palette {
  const p = PALETTES[name] ?? PALETTES.azure;
  if (!dark) return p;
  // In dark mode, swap bg/surface/ink/sub/soft/border and dim the tint.
  const hex = p.primary.replace('#', '');
  const r = parseInt(hex.slice(0, 2), 16);
  const g = parseInt(hex.slice(2, 4), 16);
  const b = parseInt(hex.slice(4, 6), 16);
  return {
    ...p,
    bg: DARK_BASE.bg,
    surface: DARK_BASE.surface,
    ink: DARK_BASE.ink,
    sub: DARK_BASE.sub,
    soft: DARK_BASE.soft,
    border: DARK_BASE.border,
    tint: `rgba(${r},${g},${b},0.18)`,
  };
}

// ─────────────────────────── Status colors (semantik) ───────────────────────────
// Penting: di prototype, "lulus/benar" pakai ink dark (BUKAN hijau). Hanya
// "salah/kurang/warning timer" yang pakai merah desaturated.
export const Status = {
  correctBg: '#1A2A40',        // = palette.ink (override per palette saat dipakai)
  correctFg: '#FFFFFF',
  wrongBg: '#F3DDDD',
  wrongFg: '#6E2828',
  warningBg: '#F3DDDD',
  warningFg: '#6E2828',
} as const;

// ─────────────────────────── Sub-color (per-subtest tile) ───────────────────────────
// Cuma untuk icon container 36–48px. Bukan flood card.
export const Subtest = {
  TWK: '#5A7AA6', // slate blue
  TIU: '#7565A6', // muted purple
  TKP: '#1F1F1F', // near-black
} as const;

// ─────────────────────────── Typography ───────────────────────────
// Font Manrope — dimuat lewat Google Fonts. expo-font setup ada di App.tsx kalau perlu.
// Skala dasar untuk design width 412px (Android).
export const Type = {
  family: 'Manrope',
  numeric: 'tabular-nums' as const,
  weight: {
    regular: '400' as const,
    medium: '500' as const,
    semibold: '600' as const,
    bold: '700' as const,
    extrabold: '800' as const,
  },
  size: {
    displayXl: 32,   // login welcome
    displayLg: 28,   // onboarding heading
    display: 22,     // page title / hero score (22-24)
    headline: 17,    // modal heading (17-18)
    title: 15,       // card title
    body: 14,        // body 14-15
    caption: 12,     // caption 11-13
    micro: 10,       // badge/label 9-10
  },
  letterSpacing: {
    tight: -1,
    snug: -0.6,
    normal: 0,
    wide: 0.4,       // uppercase caption
    wider: 0.5,      // micro uppercase
  },
  lineHeight: {
    tight: 1.15,
    snug: 1.25,
    normal: 1.4,
    relaxed: 1.6,
  },
} as const;

// ─────────────────────────── Spacing ───────────────────────────
// Skala: 4 6 8 10 12 14 16 18 20 22 24 28 32
// Page padding side: 22; card padding: 14-18; gap between cards: 10.
export const Tokens = {
  space: [4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32] as const,
  /** Page horizontal padding */
  page: 22,
  /** Card inner padding */
  cardPadding: 16,
  /** Gap between cards in a stack */
  stackGap: 10,
  radius: {
    pill: 999,
    chip: 999,
    cardSm: 12,
    card: 16,
    cardLg: 22,    // hero card
    icon: 12,
    input: 16,
  },
  shadow: {
    /** Primary CTA tipis (subtle elevation) */
    cta: {
      shadowColor: '#000',
      shadowOpacity: 0.25,
      shadowOffset: { width: 0, height: 2 },
      shadowRadius: 4,
      elevation: 2,
    },
    /** Hero card dark (lebih dalam) */
    heroDark: {
      shadowColor: '#000',
      shadowOpacity: 0.3,
      shadowOffset: { width: 0, height: 6 },
      shadowRadius: 12,
      elevation: 6,
    },
    /** Default card (sangat tipis — design ini lebih suka border) */
    none: {},
  },
} as const;
