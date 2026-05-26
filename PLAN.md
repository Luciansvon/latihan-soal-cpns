# Rencana Pengerjaan — Status & Sisa Pekerjaan

> Dokumen ini untuk Claude Code CLI (dan manusia) supaya tahu apa yang sudah jadi dan apa yang masih perlu dikerjakan. Update tiap selesai milestone.

**Prinsip (jangan dilanggar):**
- Personal use, distribusi via APK + OTA. Bukan production / App Store.
- Selesaikan fitur sampai **fully working** sebelum lanjut.
- Sebelum nulis kode Expo, baca docs versi terkunci: https://docs.expo.dev/versions/v56.0.0/
- Verifikasi pakai `npx expo export --platform android` (bukan cuma `tsc`).
- **Jangan** hapus `.npmrc`, jangan ganti `metro.config.js` ws-shim, jangan upgrade `@supabase/supabase-js` dari `2.39.8`.

---

## Status Saat Ini (2026-05-26)

### SELESAI

#### Tahap 1 — Latihan Soal
- `src/components/question/QuestionCard.tsx`
- `src/components/question/OptionButton.tsx`
- `src/utils/uuid.ts`
- Rewrite `src/screens/latihan/PracticeSessionScreen.tsx` — fetch soal SQLite-first/Supabase-fallback, simpan sesi, hitung skor, reveal pembahasan per soal, navigate ke Result
- Rewrite `src/screens/latihan/SessionResultScreen.tsx` — load real session + answers
- Update `src/screens/latihan/CategoryListScreen.tsx` — pass subject yang benar, drop hardcoded `pack-001`
- Update `src/navigation/types.ts` — `packId` jadi optional

#### Tahap 2 — Tryout
- `src/types/exam.types.ts` — tambah `TryoutTemplate`
- `src/hooks/useTryoutSession.ts` — full state machine (fetch template, fetch soal per section, timer, navigation, flag, finalize per-section scoring)
- `src/components/tryout/CountdownTimer.tsx`
- Rewrite 4 screens: `TryoutListScreen` (fetch Supabase `tryout_templates`), `TryoutDetailScreen`, `TryoutSessionScreen` (pakai hook + grid navigator modal), `TryoutResultScreen` (sub-skor per section + status lulus per CPNS rule)

#### Tahap 3 — Offline Download + Sync
- `src/services/DownloadService.ts` — list packs, download pack (batched 100, progress reporting), delete pack
- `src/services/SyncManager.ts` — push sessions/answers ke Supabase, pull profile (server wins)
- Rewrite `src/screens/profil/DownloadManagerScreen.tsx` — list pack + download/delete + progress
- Update `App.tsx` — `useSyncTriggers` hook untuk auto-sync saat online reconnect + app foreground

#### Tahap 4 — AI Tutor
- `supabase/migrations/002_ai_tutor.sql` — table `ai_request_log` untuk rate limit
- `supabase/functions/ai-tutor/index.ts` — Edge Function (Deno) call OpenRouter, rate limit 10/hari/user, adaptive prompt builder by learning style
- `src/services/AIService.ts` — wrapper invoke Edge Function
- `src/constants/learningStrategyMap.ts` — fallback offline strategies per subject + VARK
- `src/constants/designTokens.ts` — palette + typography + spacing dari UI Claude Design (acuan visual)
- `src/components/ai/AdaptiveExplanation.tsx` — tampilkan strategi offline + generate AI + hint 3 level
- `src/components/ai/AITutorChat.tsx` — chat persona "Pak Guru"

#### Tahap 5 — Progress
- `src/hooks/useProgressData.ts` — agregasi sesi + akurasi per subject
- `src/components/charts/AccuracyChart.tsx` — bar accuracy custom
- Rewrite 3 screens: `ProgressDashboardScreen` (data nyata), `HistoryListScreen` (list + filter + score badge), `SessionDetailScreen` (full detail + per-section + sync status)

#### Tahap 6 — Gamifikasi
- `src/constants/achievements.ts` — 12 achievement (STREAK / VOLUME / ACCURACY / TRYOUT / MISC)
- `src/services/GamificationService.ts` — XP per session, level (`N²×100`), streak, achievement check, push profile + user_achievements ke Supabase (best-effort), idempotent via AsyncStorage
- 3 component: `StreakRing`, `XPBar`, `AchievementUnlockModal`
- Integrate ke `PracticeSession.finalize()` + `useTryoutSession.finalize()` + display di Result screens

#### Tahap 7 — Polish
- `src/services/NotificationService.ts` — daily reminder lokal pakai expo-notifications (opt-in)
- `src/services/ShareService.ts` — share hasil ke WhatsApp + system share sheet
- `src/utils/recommendation.ts` — adaptive practice helper (subject < 60% akurasi)
- Tambah tombol "Bagikan ke WhatsApp" di `SessionResultScreen` + `TryoutResultScreen`

#### Seed Konten Demo
- `supabase/seed/001_demo_content.sql` — 7 packs (~35 soal) + 1 tryout template CPNS SKD. Cukup untuk smoke test end-to-end.

---

## SETUP MANUAL (tanggung jawab user — tidak bisa Claude lakukan)

- [ ] `npm install` di root (sudah dilakukan)
- [ ] `eas init` → ganti placeholder `your-eas-project-id` di `app.json` + `eas.json`
- [ ] Set GitHub Secrets: `EXPO_TOKEN`, `EXPO_PUBLIC_SUPABASE_URL`, `EXPO_PUBLIC_SUPABASE_ANON_KEY`
- [ ] Jalankan `supabase/migrations/001_initial_schema.sql` di Supabase SQL Editor
- [ ] Jalankan `supabase/migrations/002_ai_tutor.sql` di Supabase SQL Editor
- [ ] (Opsional) Jalankan `supabase/seed/001_demo_content.sql` untuk demo content
- [ ] Aktifkan Email Auth di Supabase Authentication settings
- [ ] Deploy Edge Function: `supabase functions deploy ai-tutor`
- [ ] Set `OPENROUTER_API_KEY` di Supabase secrets: `supabase secrets set OPENROUTER_API_KEY=sk-...`
- [ ] (Opsional) `OPENROUTER_MODEL` override, `AI_DAILY_LIMIT` override

---

## TARGET RILIS APK PERTAMA (urutan prioritas)

> Disusun supaya app bisa **dirilis cepat tapi tidak prematur**.

**SUDAH READY untuk rilis** (kode + verifikasi):
- ✅ Semua Tahap 1–7 implementasi + tsc clean + Hermes bundle 4.2 MB sukses

**HARUS dikerjakan SEBELUM rilis APK pertama** (manual, user-side):
1. Cherry-pick seed 250 soal dari branch `claude/learning-app-military-police-ZB3og` (sesuai keputusan user — strategi "ambil soal + migration saja")
2. Setup Supabase: migrate 001 + 002 (rename konflik nomor: yang AI Tutor jadi 003), jalankan seed
3. `eas init` + ganti `your-eas-project-id` di app.json + eas.json
4. Push repo ke GitHub + set Secrets
5. `eas build --platform android --profile preview`

**TIDAK PRIORITAS untuk rilis pertama** (post-rilis, OTA bisa update):
- Mining konten soal lebih lengkap (lihat di bawah)
- UI redesign per screen dari Claude Design
- 8 fitur neuroedukatif berat (video, mind map, Pauli simulator)

---

## TAHAP 8 — Neuroedukatif Quick Wins (post-MVP, sebelum konten besar)

> Berdasarkan analisis `TNI Efektif.md` (Cognitive Load Theory + Dual Coding + paradoks literasi PISA 2022). Hanya item **low-effort high-value** yang dipilih supaya tidak nahan rilis.

| Prio | Item | Effort | Status |
|---|---|---|---|
| P1 | **Upgrade prompt `ai-tutor/index.ts`** — inject strategi: TKP persona "Robot Birokrat", TIU micro-dosing, TWK skim-then-extract | ~1 jam | ⏸️ |
| P1 | **TKP buzzword highlighter** — di `QuestionCard`, kalau subject=TKP, highlight kata kunci `Pelayanan/Jejaring/Profesionalisme/Anti-Radikalisme/Teknologi` | ~1 jam | ⏸️ |
| P2 | **Adaptive saran post-sesi** — di `SessionResultScreen`, render `recommendSubjects()` + tip dari `learningStrategyMap` sesuai VARK profile | ~2 jam | ⏸️ |
| P2 | **Skim trainer screen** — paragraf TWK panjang + countdown 30s + 1 soal pemahaman. Material pakai soal TWK seed yang sudah ada. | ~4 jam | ⏸️ |
| P3 | **Micro-dosing daily challenge** — extend `daily_challenges`: 5 soal/hari fokus 1 subtopic akurasi terendah (pakai `recommendSubjects()`) | ~3 jam | ⏸️ |

**TIDAK DIAMBIL** (butuh infra/konten yang menahan rilis):
- ❌ Video microlearning per topic — butuh hosting video + produksi konten
- ❌ Mind map / timeline visual — butuh konten editorial CMS
- ❌ Figural-only mode TIU — butuh seed soal figural (image-based) yang belum ada
- ❌ Pauli/Kraepelin/Kecermatan simulator — butuh komponen UI custom + scoring algoritma khusus + metronome → sub-app sendiri

---

## SCOPE TAMBAHAN (jangka panjang, tunggu user invoke)

- **Konten soal real-pattern** — mining soal CPNS/TNI/Polri dari internet/komunitas/medsos, analyze pattern, generate `supabase/seed/00X_real_content.sql` dengan ratusan soal per (exam, subject). Catatan detail: lihat memory `project-content-mining-scope`. **Catatan**: branch remote sudah ada 250 soal real yang lebih baik dari dummy saya — cherry-pick dulu, mining nanti untuk volume tambahan.
- **UI port dari Claude Design** — folder `UI APK LATIHAN SOAL CPNS/` adalah PROTOTYPE referensi (React DOM). Token sudah di-extract ke `src/constants/designTokens.ts`. Port screen-per-screen sambil user verify visual saat user request.
- **8 fitur neuroedukatif berat** dari `TNI Efektif.md` (video, mind map, Pauli simulator) — diaktifkan setelah app stabil di tangan beta users.

---

## CATATAN ARSITEKTUR

- **Logic terpisah dari UI** — hooks (`useProgressData`, `useTryoutSession`) dan services (`DownloadService`, `SyncManager`, `GamificationService`, `AIService`, `NotificationService`, `ShareService`) sengaja independent dari layout supaya saat UI dari Claude Design dipasang, pluming-nya tidak harus dirombak.
- **Idempotency**: `GamificationService.awardForSession()` cache per sessionId di AsyncStorage; aman dipanggil ulang saat Result screen di-revisit.
- **Offline-first**: SQLite jadi source of truth lokal. Supabase sync via `SyncManager` saat online + foreground.
- **Score rules** sudah final di `src/utils/ScoreCalculator.ts` (CPNS TWK/TIU +5, TKP skala 1-5, TNI -1 untuk salah). Ambang lulus CPNS di `src/constants/examConfig.ts`.

## Aturan Scoring (referensi)
| Ujian | Benar | Salah | Catatan |
|---|---|---|---|
| CPNS TWK | +5 | 0 | Ambang ≥65 |
| CPNS TIU | +5 | 0 | Ambang ≥80 |
| CPNS TKP | +1..+5 | — | Skala, ambang ≥166 |
| TNI Akademik | +4 | **−1** | Negative marking |
| Polri | +5 | 0 | Tergantung template |
