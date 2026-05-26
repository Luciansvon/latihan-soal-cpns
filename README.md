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

## ⚠️ Sebelum Build: Hindari Kegagalan CI

Tiga hal ini WAJIB, kalau dilewati build GitHub Actions / EAS akan gagal:

1. **Jangan hapus `.npmrc`.** Project pakai React 19 / RN 0.85 dengan konflik peer-dependency. File `.npmrc` (`legacy-peer-deps=true`) memastikan `npm install` & `npm ci` di CI tidak gagal.
2. **Ganti placeholder project ID.** `app.json` & `eas.json` berisi `your-eas-project-id`. Jalankan `eas init` (lihat di bawah) untuk mengisinya dengan ID asli — `eas build --non-interactive` di CI butuh ini.
3. **Set GitHub Secrets** (`EXPO_TOKEN`, `EXPO_PUBLIC_SUPABASE_URL`, `EXPO_PUBLIC_SUPABASE_ANON_KEY`) sebelum push ke `main`.

---

## Setup

### 1. Install dependencies

```bash
npm install
```

### 2. Hubungkan ke Expo (ganti placeholder project ID)

```bash
npm install -g eas-cli
eas login          # buat akun gratis di expo.dev dulu
eas init           # otomatis isi projectId asli ke app.json + eas.json
```

Commit perubahan `app.json`/`eas.json` setelah `eas init`.

### 3. Konfigurasi environment

```bash
cp .env.example .env
```

Isi `.env`:
```
EXPO_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
EXPO_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
```

### 4. Setup Supabase

- Buat project di [supabase.com](https://supabase.com)
- Jalankan `supabase/migrations/001_initial_schema.sql` di SQL Editor Supabase
- Aktifkan Email Auth di Authentication > Providers

### 5. Jalankan dev server

```bash
npx expo start
```

Scan QR dengan Expo Go, atau tekan `a` untuk Android emulator.

---

## Build APK & OTA Update (via GitHub Actions)

Build dan update jalan otomatis lewat GitHub Actions — tidak perlu jalankan EAS manual dari terminal.

### Setup Secrets (sekali saja)

`Settings → Secrets and variables → Actions → New repository secret`:

| Secret | Dari mana |
|---|---|
| `EXPO_TOKEN` | expo.dev → Account Settings → Access Tokens → Create |
| `EXPO_PUBLIC_SUPABASE_URL` | Supabase → Settings → API |
| `EXPO_PUBLIC_SUPABASE_ANON_KEY` | Supabase → Settings → API |

### Download APK

1. Push ke `main` (atau jalankan workflow **Build APK** manual di tab Actions).
2. Tunggu build selesai (~10–15 menit).
3. Buka **Actions → run terakhir → Artifacts → `latihan-soal-cpns-xxxx`** → download `.apk`.
4. Install ke HP (aktifkan "Install dari sumber tidak dikenal").

### Update Tanpa Reinstall (OTA)

Untuk perubahan kode JS biasa, **tidak perlu build APK baru**: push ke `main` → workflow **OTA Update** otomatis jalankan `eas update`. APK yang terinstall akan download update saat dibuka & apply di restart berikutnya.

**Rebuild APK hanya perlu** saat ada perubahan native (tambah plugin Expo baru, ganti versi SDK).

### Build manual (alternatif, dari lokal)

```bash
eas build --platform android --profile preview --output ./app.apk
eas update --branch preview --message "deskripsi update"
```

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
