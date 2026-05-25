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

### 🟡 PLACEHOLDER (UI shell ada, logika belum nyambung)
- [ ] `src/screens/latihan/PracticeSessionScreen.tsx` — masih teks placeholder
- [ ] `src/screens/tryout/TryoutSessionScreen.tsx` — masih teks placeholder
- [ ] `src/screens/tryout/TryoutListScreen.tsx` — template hardcoded + "Coming Soon"
- [ ] `src/screens/progress/SessionDetailScreen.tsx` — pakai `placeholderData` (mock)
- [ ] `src/screens/profil/DownloadManagerScreen.tsx` — cuma empty state
- [ ] `src/screens/beranda/BerandaScreen.tsx` — UI jadi, cek apakah data masih mock
- [ ] `src/screens/progress/ProgressDashboardScreen.tsx` — UI jadi, cek apakah data masih mock

### ❌ BELUM ADA SAMA SEKALI
- [ ] `src/services/DownloadService.ts`
- [ ] `src/services/SyncManager.ts`
- [ ] `src/services/GamificationService.ts`
- [ ] `src/services/AIService.ts` (OpenRouter client wrapper)
- [ ] `src/services/NotificationService.ts`
- [ ] `supabase/functions/ai-tutor/index.ts` (folder ada, isi kosong)
- [ ] Components: `QuestionCard`, `OptionButton`, `StreakRing`, `XPBar`, `ScoreChart`, `AITutorChat`, `AdaptiveExplanation`
- [ ] `src/constants/learningStrategyMap.ts`
- [ ] Seed konten soal (min. ~50–100 soal per kategori di Supabase)

---

## Urutan Pengerjaan (dependency-aware)

### TAHAP 1 — Latihan Soal (inti, kerjakan dulu)
**Tujuan:** user bisa pilih kategori → kerjakan soal → lihat pembahasan → skor tersimpan.

1. `src/components/question/QuestionCard.tsx` — render stem soal + tipe (MULTIPLE_CHOICE / TKP_SCALE).
2. `src/components/question/OptionButton.tsx` — opsi A–D (state: idle/selected/correct/wrong) + haptic feedback.
3. Implement `PracticeSessionScreen.tsx`:
   - Ambil soal via `QuestionRepository` (SQLite kalau pack sudah di-download) atau fallback Supabase.
   - Index soal, pilih jawaban, reveal pembahasan setelah jawab.
   - Hitung skor pakai `ScoreCalculator`.
   - Simpan sesi + jawaban via `SessionRepository` (set `is_synced = 0`).
   - Navigate ke `SessionResultScreen` dengan hasil nyata.
4. Pastikan `CategoryListScreen` + `LatihanHomeScreen` mengirim param kategori yang benar.

**Acceptance:** kerjakan 1 sesi offline → skor benar muncul di Result → row tersimpan di SQLite.

### TAHAP 2 — Tryout
**Tujuan:** simulasi SKD fullscreen dengan timer + sub-skor TWK/TIU/TKP.

1. `src/components/tryout/CountdownTimer.tsx` — timer mundur, warning saat <5 menit, auto-submit saat habis.
2. Implement `TryoutSessionScreen.tsx`:
   - Load `tryout_templates` dari Supabase (100 soal / 90 menit untuk SKD).
   - Mode fullscreen, tanpa pembahasan selama berjalan, navigasi antar soal + flagging.
   - Auto-submit saat timer 0.
3. `TryoutResultScreen.tsx`: sub-skor per seksi + indikator ambang batas (TWK≥65, TIU≥80, TKP≥166).
4. Ganti `TryoutListScreen` "Coming Soon" → list dari `tryout_templates`.

**Acceptance:** selesaikan tryout SKD → sub-skor TWK/TIU/TKP benar + status lolos/tidak per seksi.

### TAHAP 3 — Offline Download + Sync
1. `src/services/DownloadService.ts` — ambil pack dari Supabase → tulis ke SQLite batch 100 → update progress di Zustand `DownloadSlice`.
2. Implement `DownloadManagerScreen.tsx` — list pack, tombol download, progress bar, status DONE.
3. `src/services/SyncManager.ts`:
   - Push semua record `is_synced = 0` (sessions, answers, bookmarks) ke Supabase.
   - Pull profile/XP/streak (server wins untuk XP).
   - Trigger saat foreground + reconnect (NetInfo listener sudah ada di `App.tsx`).

**Acceptance:** offline → latihan → online → sesi ter-sync ke Supabase (cek tabel `practice_sessions`).

### TAHAP 4 — AI Tutor (OpenRouter)
1. `supabase/functions/ai-tutor/index.ts` — Edge Function panggil OpenRouter (`https://openrouter.ai/api/v1/chat/completions`). API key dari Supabase Vault (env secret), **jangan** di client. Payload sertakan `learning_style_profile`, `exam_type`, konteks soal.
2. `src/services/AIService.ts` — wrapper panggil Edge Function (model-agnostic).
3. `src/constants/learningStrategyMap.ts` — mapping profil VARK/Honey-Mumford → strategi konkret per kategori.
4. `src/components/ai/AdaptiveExplanation.tsx` — render pembahasan sesuai profil gaya belajar.
5. `src/components/ai/AITutorChat.tsx` — chat persona "Pak Guru" (bukan ChatGPT clone).
6. Hint bertahap 3 level + rate limit 10 request/hari.

**Acceptance:** buka soal → minta penjelasan AI → keluar pembahasan adaptif sesuai profil. Cek bundle Hermes tetap lolos (`expo export`).

### TAHAP 5 — Progress (data nyata)
1. Ganti mock di `ProgressDashboardScreen` + `SessionDetailScreen` + `HistoryListScreen` dengan agregasi dari SQLite/Supabase.
2. `src/components/charts/AccuracyChart.tsx` (react-native-gifted-charts) — akurasi per kategori.

**Acceptance:** dashboard menampilkan akurasi & riwayat dari sesi nyata.

### TAHAP 6 — Gamifikasi (nice-to-have)
1. `src/services/GamificationService.ts` — award XP, hitung level (`N²×100`), update streak, cek achievement.
2. Components: `StreakRing`, `XPBar`, modal achievement unlock (confetti).
3. Sambungkan ke akhir sesi latihan/tryout di Beranda.
4. Daily challenge (10 soal/hari, reset 23:59).

### TAHAP 7 — Polish (opsional, setelah 1–5 jalan)
- Adaptive practice (prioritas kategori <60% akurasi), custom tryout, notif lokal streak (`NotificationService` + expo-notifications), share hasil ke WhatsApp (teks).

---

## Konten Soal (blocker untuk testing nyata)
- [ ] Seed `question_packs` + `questions` di Supabase (min. 50–100 soal/kategori: TWK, TIU, TKP, TNI, Polri).
- Tanpa ini, Tahap 1–5 tidak bisa diuji end-to-end dengan data nyata.

## Setup Manual (di luar kode — tanggung jawab user)
- [ ] `eas init` → ganti placeholder `your-eas-project-id` di `app.json` + `eas.json`.
- [ ] Set GitHub Secrets: `EXPO_TOKEN`, `EXPO_PUBLIC_SUPABASE_URL`, `EXPO_PUBLIC_SUPABASE_ANON_KEY`.
- [ ] Set OpenRouter API key di Supabase Vault (untuk Edge Function `ai-tutor`).
- [ ] Jalankan `supabase/migrations/001_initial_schema.sql` di SQL Editor Supabase + aktifkan Email Auth.

## Aturan Scoring (referensi — sudah di `ScoreCalculator.ts`)
| Ujian | Benar | Salah | Catatan |
|---|---|---|---|
| CPNS TWK | +5 | 0 | Ambang ≥65 |
| CPNS TIU | +5 | 0 | Ambang ≥80 |
| CPNS TKP | +1..+5 | — | Skala, ambang ≥166 |
| TNI Akademik | +4 | **−1** | Negative marking |
| Polri | +5 | 0 | Tergantung template |
