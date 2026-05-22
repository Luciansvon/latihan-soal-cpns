# Latihan Soal CPNS · TNI · Polri

Aplikasi mobile React Native untuk membantu persiapan ujian masuk CPNS, TNI, dan Polri. Fitur utama: latihan soal, simulasi tryout, analisis gaya belajar berbasis riset ilmiah, AI tutor adaptif, dan mode offline.

---

## Tech Stack

| Layer | Teknologi |
|---|---|
| Framework | React Native + Expo SDK 56 (Managed Workflow) |
| Bahasa | TypeScript (strict) |
| Backend | Supabase (PostgreSQL + Auth + Storage + Edge Functions) |
| Database Offline | expo-sqlite v16 |
| State | Zustand v5 + TanStack Query v5 |
| Navigasi | React Navigation v7 |
| AI Tutor | OpenRouter API (via Supabase Edge Function) |

---

## Fitur

- **Latihan Soal** — Bank soal per kategori (TWK, TIU, TKP, TNI, Polri) dengan pembahasan
- **Simulasi Tryout** — Timer fullscreen, skor per seksi, indikator nilai ambang batas CPNS
- **Analisis Gaya Belajar** — 12 pertanyaan berbasis VARK Model (Fleming & Mills, 1992) + Honey & Mumford (1982)
- **AI Tutor Adaptif** — Pembahasan soal disesuaikan dengan profil gaya belajar via OpenRouter
- **Offline Mode** — Download paket soal ke SQLite, latihan tanpa internet
- **Gamifikasi** — XP, level, streak, achievement badge, daily challenge
- **Progress Tracking** — Akurasi per kategori, riwayat sesi, deteksi kelemahan

---

## Struktur Proyek

```
src/
├── navigation/       # React Navigation stacks & types
├── screens/          # Semua layar per fitur
│   ├── auth/         # Welcome, Login, Register
│   ├── onboarding/   # Onboarding, LearningStyleQuiz, HasilAnalisis
│   ├── beranda/      # Dashboard utama
│   ├── latihan/      # Practice session flow
│   ├── tryout/       # Mock exam flow
│   ├── progress/     # Analytics & history
│   └── profil/       # Profile, achievements, settings
├── components/       # Reusable UI components
├── store/            # Zustand global store
├── db/               # SQLite layer (migrations + repositories)
├── services/         # Supabase client, SyncManager, AIService
├── utils/            # ScoreCalculator, LearningStyleEngine
├── constants/        # Colors, examConfig, motivationMessages
└── types/            # TypeScript domain types

supabase/
├── migrations/       # PostgreSQL schema + RLS policies
└── functions/        # Edge Functions (AI tutor, dll)
```

---

## Setup

### 1. Install dependencies

```bash
npm install
```

### 2. Konfigurasi environment

```bash
cp .env.example .env
```

Isi `.env`:
```
EXPO_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
EXPO_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
```

### 3. Setup Supabase

- Buat project di [supabase.com](https://supabase.com)
- Jalankan `supabase/migrations/001_initial_schema.sql` di SQL Editor Supabase
- Aktifkan Email Auth di Authentication > Providers

### 4. Jalankan dev server

```bash
npx expo start
```

Scan QR dengan Expo Go, atau tekan `a` untuk Android emulator.

---

## Build APK

Untuk distribusi personal (sideload):

```bash
npm install -g eas-cli
eas login
eas build:configure
eas build --platform android --profile preview
```

### Update Tanpa Reinstall (OTA)

Setelah APK terinstall, update cukup dengan:

```bash
eas update --branch preview --message "deskripsi update"
```

App akan download update otomatis saat dibuka, apply di restart berikutnya.

---

## Aturan Penilaian Ujian

| Ujian | Benar | Salah | Catatan |
|---|---|---|---|
| CPNS TWK | +5 | 0 | Ambang batas: ≥65 |
| CPNS TIU | +5 | 0 | Ambang batas: ≥80 |
| CPNS TKP | +1 s/d +5 | — | Skala, tidak ada salah. Ambang: ≥166 |
| TNI Akademik | +4 | **-1** | Negative marking |
| Polri | +5 | 0 | Tergantung template tryout |

---

## Analisis Gaya Belajar

Kuis 12 pertanyaan situasional berdasarkan dua kerangka ilmiah:

- **VARK Model** — Fleming, N.D. & Mills, C. (1992). *"Not Another Inventory, Rather a Catalyst for Reflection."* To Improve the Academy, Vol. 11, 137–155.
- **Honey & Mumford** — Honey, P. & Mumford, A. (1982). *The Manual of Learning Styles.* Peter Honey Publications.

Hasil profil digunakan untuk menyesuaikan pembahasan AI, rekomendasi strategi belajar, dan urutan materi yang diprioritaskan.

---

## Status Pengembangan

| Fitur | Status |
|---|---|
| Auth (Login/Register) | ✅ Selesai |
| Onboarding + Kuis Gaya Belajar | ✅ Selesai |
| Database Schema (Supabase + SQLite) | ✅ Selesai |
| Navigasi lengkap | ✅ Selesai |
| Practice Session (render soal) | 🚧 In Progress |
| Tryout fullscreen timer | 🚧 In Progress |
| Download offline packs | 🚧 In Progress |
| Sync Manager (offline→online) | 🚧 In Progress |
| AI Tutor (OpenRouter) | 🚧 In Progress |
| Progress dashboard + charts | 🚧 In Progress |
| Gamifikasi (XP, streak, badge) | 📋 Planned |
