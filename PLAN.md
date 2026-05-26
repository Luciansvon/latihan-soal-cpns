# Rencana Pengerjaan — Sisa yang Belum Dikerjakan

> Dokumen ini untuk Claude Code CLI (dan manusia) supaya tahu **apa yang sudah jadi**, **apa yang masih placeholder**, dan **apa yang masih kosong**. Update checklist ini setiap selesai satu item.

**Prinsip (jangan dilanggar):**
- Personal use, distribusi via APK + OTA. Bukan production / App Store.
- Selesaikan fitur sampai **fully working** sebelum lanjut. Tidak ada fitur setengah jadi.
- Sebelum nulis kode Expo, baca docs versi terkunci: https://docs.expo.dev/versions/v56.0.0/
- Verifikasi build pakai `npx expo export --platform android` (bukan cuma `tsc`) — itu yang menangkap error Hermes/Metro seperti yang pernah terjadi.
- **Jangan** hapus `.npmrc`, jangan ganti `metro.config.js` ws-shim, jangan upgrade `@supabase/supabase-js` dari `2.39.8`.

---

## Status Saat Ini

### ✅ SUDAH JADI (berfungsi)
- [x] Scaffold project, `babel.config.js`, `metro.config.js` (ws shim), `.npmrc`, `tsconfig.json`
- [x] CI: `.github/workflows/build-apk.yml` (manual) + `ota-update.yml` (push→main)
- [x] Auth: Welcome / Login / Register + Supabase Auth (email)
- [x] Onboarding + LearningStyleQuiz (12 soal VARK) + HasilAnalisis
- [x] DB layer: `src/db/database.ts` + `QuestionRepository`, `SessionRepository`, `UserStateRepository`
- [x] Supabase schema: `supabase/migrations/001_initial_schema.sql` (tabel + RLS + materialized view)
- [x] Constants: `colors`, `examConfig`, `learningStyleQuestions`, `motivationMessages`
- [x] Utils: `LearningStyleEngine`, `ScoreCalculator`
- [x] Zustand store (`src/store/index.ts`), React Navigation lengkap
- [x] `src/components/question/QuestionCard.tsx` — difficulty badge, sering-keluar badge ✓
- [x] `src/components/question/OptionButton.tsx` — state idle/selected/correct/wrong ✓
- [x] `src/screens/latihan/PracticeSessionScreen.tsx` — fetch Supabase, jawab soal, reveal pembahasan, simpan ke `practice_sessions` + `user_answers`, navigate ke Result ✓
- [x] `src/screens/latihan/SessionResultScreen.tsx` — hero card, stats, XP, actions ✓
- [x] `src/screens/latihan/CategoryListScreen.tsx` — list mata pelajaran, navigate ke PracticeSession ✓
- [x] `supabase/seed/001_question_packs.sql` — 13 pack rows dengan UUID stabil ✓
- [x] `supabase/seed/002_cpns_questions.sql` — 50 TWK + 50 TIU ✓
- [x] `supabase/seed/002_cpns_tkp.sql` — 50 TKP (TKP_SCALE + tkp_scores) ✓
- [x] `supabase/seed/003_tni_questions.sql` — 50 TNI ✓
- [x] `supabase/seed/004_polri_questions.sql` — 50 POLRI ✓
- [x] Total 250 soal, semua punya `difficulty_rank`, diverifikasi end-to-end di Postgres 16 (schema + migration 002 + 4 seed jalan bersih, idempotent) ✓
- [x] Fix bug navigasi exam card di BerandaScreen + pack UUID di CategoryListScreen ✓
- [x] `src/constants/tryoutTemplates.ts` — sumber tunggal config tryout (CPNS/TNI/POLRI) ✓
- [x] `src/screens/tryout/TryoutSessionScreen.tsx` — load soal nyata per seksi, timer + auto-submit, flag, grid navigasi, hitung skor + simpan sesi TRYOUT ✓
- [x] `src/screens/tryout/TryoutResultScreen.tsx` — sub-skor per seksi nyata + lulus/tidak vs ambang batas ✓
- [x] `src/screens/tryout/TryoutList + TryoutDetail` — pakai template bersama ✓ (verified: tsc + expo export Hermes)

### 🟡 PLACEHOLDER (UI shell ada, logika belum nyambung)
- [ ] `src/screens/progress/ProgressDashboardScreen.tsx` — `hasSessions = false` hardcoded, tidak query Supabase
- [ ] `src/screens/progress/HistoryListScreen.tsx` — `hasSessions = false` hardcoded, empty state terus
- [ ] `src/screens/progress/SessionDetailScreen.tsx` — `placeholderData` mock, tidak ambil dari DB
- [ ] `src/screens/profil/DownloadManagerScreen.tsx` — empty state saja, tidak ada fungsionalitas

### ❌ BELUM ADA SAMA SEKALI
- [ ] `src/services/DownloadService.ts`
- [ ] `src/services/SyncManager.ts`
- [ ] `src/services/GamificationService.ts`
- [ ] `src/services/AIService.ts` (OpenRouter client wrapper)
- [ ] `src/services/NotificationService.ts`
- [ ] `supabase/functions/ai-tutor/index.ts` (folder ada, isi kosong)
- [ ] Components: `StreakRing`, `ScoreChart`, `AITutorChat`, `AdaptiveExplanation`
- [ ] `src/constants/learningStrategyMap.ts`
- [ ] Seed soal: `002_cpns_questions.sql` (TWK 200 + TIU 200 + TKP 200), `003_tni_questions.sql` (250 soal), `004_polri_questions.sql` (250 soal)

---

## Bug Kecil yang Harus Difix (sebelum lanjut)

1. **BerandaScreen exam cards tidak bisa diklik** — komponen tidak menerima `navigation` prop, dan `onPress` di exam card kosong. Fix: terima `navigation` dari `useNavigation()` atau tambah prop, lalu navigate ke `LatihanHome` atau langsung ke `CategoryList`.
2. **CategoryListScreen `packId: 'pack-001'` hardcoded** — seharusnya pakai UUID pack yang benar dari `question_packs` table (sesuai mapping `exam_type + subject` → UUID di seed 001).

---

## Urutan Pengerjaan (dependency-aware)

### TAHAP 1 — Konten Soal ✅ SELESAI
1. ✅ Fix bug BerandaScreen navigasi exam card.
2. ✅ Fix `packId` hardcoded di `CategoryListScreen` → pakai UUID dari `question_packs`.
3. ✅ `002_cpns_questions.sql` (50 TWK + 50 TIU), `002_cpns_tkp.sql` (50 TKP), `003_tni_questions.sql` (50), `004_polri_questions.sql` (50).
4. ✅ Diverifikasi end-to-end di Postgres 16 (schema + migration 002 + 4 seed jalan bersih, idempotent, correct_option valid, tkp_scores 1-5 unik).

**Sisa (manual, tanggung jawab user):** jalankan migration 001 + 002, lalu seed 001 → 002_cpns_questions → 002_cpns_tkp → 003 → 004 di Supabase SQL Editor.

**Catatan jumlah soal:** target awal PLAN 200/subjek; saat ini 50/subjek (cukup untuk MVP & testing). Tambah soal lewat seed file baru kapan saja.

**Acceptance:** buka app → pilih TWK → soal nyata muncul → jawab → skor tersimpan di Supabase.

### TAHAP 2 — Tryout ✅ SELESAI
1. ✅ `TryoutSessionScreen.tsx` — load soal nyata per seksi, render QuestionCard+OptionButton, timer + auto-submit, flag + grid navigasi, simpan sesi TRYOUT ke Supabase.
2. ✅ `TryoutResultScreen.tsx` — sub-skor per seksi dari jawaban nyata via ScoreCalculator + status lulus/tidak vs ambang batas.
3. ✅ `TryoutList` + `TryoutDetail` pakai `src/constants/tryoutTemplates.ts` (config statis, jumlah soal disesuaikan stok seed).

**Acceptance:** ✅ selesaikan tryout → sub-skor per seksi + status lolos/tidak. Diverifikasi tsc + expo export (Hermes).

### TAHAP 3 — Progress (data nyata)
1. `ProgressDashboardScreen.tsx` — query `practice_sessions` user dari Supabase, hitung akurasi per kategori.
2. `HistoryListScreen.tsx` — list session dari Supabase, filter by type.
3. `SessionDetailScreen.tsx` — fetch sesi dari Supabase by `sessionId`.
4. (Opsional) `src/components/charts/AccuracyChart.tsx` pakai react-native-gifted-charts.

**Acceptance:** dashboard menampilkan akurasi & riwayat dari sesi nyata (bukan mock).

### TAHAP 4 — Offline Download + Sync
1. `src/services/DownloadService.ts` — ambil soal dari Supabase → tulis ke SQLite batch 100 → update progress di Zustand.
2. Implement `DownloadManagerScreen.tsx` — list pack, tombol download, progress bar, status DONE.
3. `src/services/SyncManager.ts`:
   - Push semua record `is_synced = 0` ke Supabase.
   - Pull profile/XP/streak (server wins untuk XP).
   - Trigger saat foreground + reconnect.

**Acceptance:** offline → latihan dari pack yang didownload → online → sesi ter-sync ke Supabase.

### TAHAP 5 — AI Tutor (OpenRouter)
1. `supabase/functions/ai-tutor/index.ts` — Edge Function panggil OpenRouter. API key dari Supabase Vault (env secret), **jangan** di client.
2. `src/services/AIService.ts` — wrapper panggil Edge Function.
3. `src/constants/learningStrategyMap.ts` — mapping profil VARK → strategi per kategori.
4. `src/components/ai/AdaptiveExplanation.tsx` — render pembahasan sesuai profil gaya belajar.
5. `src/components/ai/AITutorChat.tsx` — chat persona "Pak Guru".
6. Hint bertahap 3 level + rate limit 10 request/hari.

**Acceptance:** buka soal → minta penjelasan AI → keluar pembahasan adaptif sesuai profil. Cek bundle Hermes tetap lolos (`expo export`).

### TAHAP 6 — Gamifikasi (nice-to-have)
1. `src/services/GamificationService.ts` — award XP, hitung level (`N²×100`), update streak, cek achievement.
2. Sambungkan ke akhir sesi latihan/tryout + daily challenge.

### TAHAP 7 — Polish (opsional, setelah 1–5 jalan)
- Adaptive practice (prioritas kategori <60% akurasi), notif lokal streak, share hasil ke WhatsApp (teks).

---

## Setup Manual (di luar kode — tanggung jawab user)
- [ ] `eas init` → ganti placeholder `your-eas-project-id` di `app.json` + `eas.json`.
- [ ] Set GitHub Secrets: `EXPO_TOKEN`, `EXPO_PUBLIC_SUPABASE_URL`, `EXPO_PUBLIC_SUPABASE_ANON_KEY`.
- [ ] Set OpenRouter API key di Supabase Vault (untuk Edge Function `ai-tutor`).
- [ ] Jalankan `supabase/migrations/001_initial_schema.sql` di SQL Editor Supabase + aktifkan Email Auth.
- [ ] Jalankan seed: 001 (packs) → 002 (CPNS) → 003 (TNI) → 004 (Polri) di SQL Editor.

## Aturan Scoring (referensi — sudah di `ScoreCalculator.ts`)
| Ujian | Benar | Salah | Catatan |
|---|---|---|---|
| CPNS TWK | +5 | 0 | Ambang ≥65 |
| CPNS TIU | +5 | 0 | Ambang ≥80 |
| CPNS TKP | +1..+5 | — | Skala, ambang ≥166 |
| TNI Akademik | +4 | **−1** | Negative marking |
| Polri | +5 | 0 | Tergantung template |
