// Brand colors - Indonesia inspired (merah putih), non-generic
export const Colors = {
  // Primary brand
  primary: '#CC0001',        // Merah Indonesia
  primaryDark: '#990001',
  primaryLight: '#FF3333',

  // Exam type accent colors
  cpns: '#CC0001',
  tni: '#1B4332',
  polri: '#1A3A5C',

  // Semantic
  success: '#16A34A',
  warning: '#D97706',
  error: '#DC2626',
  info: '#2563EB',

  // Gamification
  xpGold: '#F59E0B',
  streakFire: '#F97316',
  levelBadge: '#7C3AED',

  // Neutral scale
  black: '#0A0A0A',
  gray900: '#111827',
  gray800: '#1F2937',
  gray700: '#374151',
  gray600: '#4B5563',
  gray500: '#6B7280',
  gray400: '#9CA3AF',
  gray300: '#D1D5DB',
  gray200: '#E5E7EB',
  gray100: '#F3F4F6',
  gray50: '#F9FAFB',
  white: '#FFFFFF',

  // Background
  bgPrimary: '#FFFFFF',
  bgSecondary: '#F9FAFB',
  bgCard: '#FFFFFF',

  // Border
  border: '#E5E7EB',
  borderFocus: '#CC0001',

  // Text
  textPrimary: '#111827',
  textSecondary: '#6B7280',
  textMuted: '#9CA3AF',
  textOnDark: '#FFFFFF',

  // Subject colors
  twk: '#7C3AED',    // purple
  tiu: '#2563EB',    // blue
  tkp: '#059669',    // green
  math: '#D97706',   // amber
  indo: '#CC0001',   // red
  umum: '#0891B2',   // cyan
  hukum: '#BE185D',  // pink
} as const;

// Cognitive Calm — token Material-3 untuk screen Latihan & Tryout (red brand).
// Background warm pinkish (#fff8f6), primary red (#bc0100), tertiary deep blue
// (#0059ba), sesuai DESIGN.md di ui_baru_apk/stitch/cognitive_calm.
export const CognitiveCalm = {
  primary: '#bc0100',
  primaryContainer: '#eb0000',
  onPrimary: '#ffffff',
  onPrimaryContainer: '#fffbff',
  secondary: '#b72114',
  secondaryContainer: '#ff5540',
  onSecondaryContainer: '#5c0100',
  tertiary: '#0059ba',
  tertiaryContainer: '#0071e8',
  onTertiary: '#ffffff',
  onTertiaryContainer: '#fefcff',
  error: '#ba1a1a',
  errorContainer: '#ffdad6',
  surface: '#fff8f6',
  background: '#fff8f6',
  surfaceContainerLowest: '#ffffff',
  surfaceContainerLow: '#fff0ee',
  surfaceContainer: '#ffe9e6',
  surfaceContainerHigh: '#ffe2dd',
  surfaceContainerHighest: '#ffdad4',
  surfaceVariant: '#ffdad4',
  onSurface: '#2b1613',
  onSurfaceVariant: '#603e39',
  outline: '#956d67',
  outlineVariant: '#ebbbb4',
  inverseSurface: '#422a27',
  shadow: '#0f0a08',
} as const;

// Hyper-Personalized Minimalism — token untuk screen Progress (navy + glass).
// Deep navy primary, electric blue actions, sage green growth, sesuai DESIGN.md
// di ui_baru_apk/stitch/hyper_personalized_minimalism.
export const HyperMinimal = {
  deepNavy: '#0A192F',
  electricBlue: '#0052FF',
  sageGreen: '#769B85',
  glassSurface: 'rgba(255, 255, 255, 0.7)',
  borderSubtle: 'rgba(10, 25, 47, 0.08)',
  primary: '#000000',
  onPrimary: '#ffffff',
  secondary: '#003ec6',
  onSecondary: '#ffffff',
  error: '#ba1a1a',
  surface: '#f7f9fb',
  background: '#f7f9fb',
  surfaceContainerLowest: '#ffffff',
  surfaceContainerLow: '#f2f4f6',
  surfaceContainer: '#eceef0',
  surfaceContainerHigh: '#e6e8ea',
  onSurface: '#191c1e',
  onSurfaceVariant: '#44474d',
  outline: '#75777e',
  outlineVariant: '#c5c6cd',
} as const;

// "Patriot Edu System" — token Material-3 dari mockup Google Stitch.
// Dipakai khusus untuk screen yang mengadopsi desain Stitch (Profil, Beranda,
// Latihan empty state) tanpa mengganti Colors lama agar screen lain tak regresi.
export const Stitch = {
  primary: '#ba0013',
  primaryContainer: '#e31e24',
  onPrimary: '#ffffff',
  onPrimaryContainer: '#fffafa',
  surface: '#f7f9fb',
  background: '#f7f9fb',
  surfaceContainerLowest: '#ffffff',
  surfaceContainerLow: '#f2f4f6',
  surfaceContainer: '#eceef0',
  surfaceContainerHigh: '#e6e8ea',
  surfaceContainerHighest: '#e0e3e5',
  surfaceVariant: '#e0e3e5',
  onSurface: '#191c1e',
  onSurfaceVariant: '#5d3f3c',
  secondary: '#565e74',
  secondaryContainer: '#dae2fd',
  onSecondaryContainer: '#5c647a',
  outline: '#926f6b',
  outlineVariant: '#e7bdb8',
  inverseSurface: '#2d3133',
  inverseOnSurface: '#eff1f3',
  tertiary: '#0050d4',
  error: '#ba1a1a',
  shadow: '#0f172a',
} as const;

// Plus Jakarta Sans — family per weight (RN custom font: pakai fontFamily,
// bukan fontWeight). Dimuat di App.tsx via useFonts.
export const Fonts = {
  regular: 'PlusJakartaSans_400Regular',
  medium: 'PlusJakartaSans_500Medium',
  semibold: 'PlusJakartaSans_600SemiBold',
  bold: 'PlusJakartaSans_700Bold',
  extrabold: 'PlusJakartaSans_800ExtraBold',
} as const;
