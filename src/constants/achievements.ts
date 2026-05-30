// Catalog achievement statis (di-bundle di app, tidak perlu fetch dari Supabase).
// Server bisa punya copy yang sama di tabel achievements untuk dipush via API
// terpisah, tapi cek unlock lokal pakai daftar ini saja agar offline-friendly.

import type { Achievement } from '../types/gamification.types';

export const ACHIEVEMENTS: Achievement[] = [
  // STREAK
  {
    id: 'streak_3',
    title: 'Konsisten 3 Hari',
    description: 'Latihan 3 hari berturut-turut.',
    iconName: 'flame',
    xpReward: 50,
    category: 'STREAK',
    conditionType: 'STREAK_DAYS',
    conditionValue: 3,
  },
  {
    id: 'streak_7',
    title: 'Pejuang Mingguan',
    description: 'Latihan 7 hari berturut-turut.',
    iconName: 'flame',
    xpReward: 100,
    category: 'STREAK',
    conditionType: 'STREAK_DAYS',
    conditionValue: 7,
  },
  {
    id: 'streak_30',
    title: 'Sebulan Tanpa Putus',
    description: 'Latihan 30 hari berturut-turut.',
    iconName: 'flame',
    xpReward: 500,
    category: 'STREAK',
    conditionType: 'STREAK_DAYS',
    conditionValue: 30,
  },

  // VOLUME
  {
    id: 'sessions_10',
    title: 'Pemanasan',
    description: 'Selesaikan 10 sesi latihan.',
    iconName: 'fitness',
    xpReward: 50,
    category: 'VOLUME',
    conditionType: 'SESSIONS_TOTAL',
    conditionValue: 10,
  },
  {
    id: 'sessions_50',
    title: 'Pekerja Keras',
    description: 'Selesaikan 50 sesi latihan.',
    iconName: 'fitness',
    xpReward: 200,
    category: 'VOLUME',
    conditionType: 'SESSIONS_TOTAL',
    conditionValue: 50,
  },
  {
    id: 'sessions_100',
    title: 'Maraton 100',
    description: 'Selesaikan 100 sesi latihan.',
    iconName: 'fitness',
    xpReward: 500,
    category: 'VOLUME',
    conditionType: 'SESSIONS_TOTAL',
    conditionValue: 100,
  },

  // ACCURACY
  {
    id: 'correct_100',
    title: '100 Jawaban Tepat',
    description: 'Akumulasi 100 jawaban benar.',
    iconName: 'checkmark-circle',
    xpReward: 100,
    category: 'ACCURACY',
    conditionType: 'CORRECT_TOTAL',
    conditionValue: 100,
  },
  {
    id: 'correct_500',
    title: '500 Jawaban Tepat',
    description: 'Akumulasi 500 jawaban benar.',
    iconName: 'checkmark-circle',
    xpReward: 300,
    category: 'ACCURACY',
    conditionType: 'CORRECT_TOTAL',
    conditionValue: 500,
  },
  {
    id: 'perfect_session',
    title: 'Sempurna!',
    description: 'Selesaikan satu sesi 100% benar.',
    iconName: 'trophy',
    xpReward: 75,
    category: 'ACCURACY',
    conditionType: 'PERFECT_SESSION',
    conditionValue: 1,
  },

  // TRYOUT
  {
    id: 'tryout_1',
    title: 'Tryout Pertama',
    description: 'Selesaikan 1 tryout penuh.',
    iconName: 'ribbon',
    xpReward: 100,
    category: 'TRYOUT',
    conditionType: 'TRYOUT_COMPLETED',
    conditionValue: 1,
  },
  {
    id: 'tryout_5',
    title: 'Siap Tempur',
    description: 'Selesaikan 5 tryout.',
    iconName: 'ribbon',
    xpReward: 300,
    category: 'TRYOUT',
    conditionType: 'TRYOUT_COMPLETED',
    conditionValue: 5,
  },

  // MISC
  {
    id: 'offline_3',
    title: 'Sang Petualang Offline',
    description: 'Selesaikan 3 sesi tanpa koneksi internet.',
    iconName: 'cloud-offline',
    xpReward: 75,
    category: 'MISC',
    conditionType: 'OFFLINE_SESSIONS',
    conditionValue: 3,
  },
];
