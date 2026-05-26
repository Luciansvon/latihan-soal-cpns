# Handoff — CPNS Latihan Soal (UI Prototype)

Dokumen ini buat developer (Claude Code / siapa pun) yang akan implementasi aplikasi
beneran berdasarkan prototype UI di project ini.

---

## 1. Apa yang ada di sini

Prototype interaktif (single-file React + Babel) berisi **11 layar Android** dari aplikasi
latihan soal CPNS. Semua interaksi sudah jalan: navigasi antar layar, timer countdown,
flag soal, navigator grid, filter chip, micro-interactions, dll. Yang **belum** ada:
backend, auth beneran, persistensi, dan soal asli (cuma 6 soal demo).

**Bukan production code.** Treat ini sebagai *executable spec* — gampang dibaca, semua
visual & behaviour sudah final. Tinggal di-port ke stack pilihan.

### Layar yang sudah ada

1. **Onboarding** (3 slide — progress, tryout, why) + skip
2. **Login / Register** (toggle pill, email/password, guest)
3. **Home** — greet + continue card (ink dark) + 3 subtest tiles + daily challenge + weekly chart
4. **Pilih subtes** — pick TWK/TIU/TKP + mode latihan/tryout
5. **Halaman soal** — timer pill, flag, grid navigator (bottom-sheet), 5 opsi A–E, autosave indicator, progress strip per-soal
6. **Hasil** — hero card ink dark dengan score 358/500, 3 KPI strip (benar/salah/kosong), durasi & rata-rata
7. **Pembahasan** — banner correct/wrong, opsi dengan tag jawaban benar/jawaban kamu, kotak penjelasan
8. **Statistik** — hero ring akurasi, sparkline 7H/30H/90H, per-subtest bar
9. **Riwayat sesi** — filter chip per-subtest, list sesi dengan badge Lulus/Kurang, tanggal
10. **Paket soal** — segmented (sub/tryout/bonus), list paket dengan progress dan badge GRATIS/PREMIUM
11. **Profil** — avatar + stats grid + setting list (notifikasi toggle, help, privasi) + sign out

---

## 2. Struktur file

```
index.html          ← entry, mount React, expose Tweaks panel
shared.jsx          ← i18n (ID/EN), data soal demo, PhoneFrame, useScreens hook
proto-hangat.jsx    ← semua screen components + ProtoHangat root
tweaks-panel.jsx    ← Tweaks shell (dev-only, jangan ikut diport ke prod)
```

Semua React inline `<script type="text/babel">`. Style: inline `style={{...}}` + 1 blok
keyframes global di `proto-hangat.jsx` (cari `<style>` di dalam `ProtoHangat`).

---

## 3. Stack rekomendasi untuk production

| Concern        | Pakai                                                |
| -------------- | ---------------------------------------------------- |
| Framework      | **React Native + Expo** (Android-first) atau **Next.js** kalau web-first |
| State          | Zustand atau React Context — state lokal udah cukup, kompleksitas kecil |
| Routing/nav    | Expo Router / React Navigation (stack + bottom tabs) |
| Backend        | Supabase (auth + Postgres + RLS) atau Firebase       |
| Auth           | Email/password + Google OAuth                        |
| Soal storage   | Postgres table `questions`, pakai pembahasan inline  |
| Analytics      | PostHog atau Plausible                               |

Prototype ini full client-side React DOM — port-nya ke RN tinggal swap `<div>`→`<View>`,
`<button>`→`<Pressable>`, dan ganti CSS shadow ke `elevation`/`shadowOffset`. Animasi
bisa pakai `react-native-reanimated`.

---

## 4. Navigation graph

Pakai stack-based navigation dengan tab di bawah:

```
[onboarding (3 slides)] → [login/register] → ROOT
                                              ├── (tab) home
                                              │     ├── subtest → soal → result → pembahasan
                                              │     └── paket → subtest → soal → result → pembahasan
                                              ├── (tab) stats
                                              └── (tab) profile
                                                    ├── riwayat → pembahasan
                                                    └── paket
```

- Tab bar muncul di **home / stats / profile** saja.
- "Back" gesture dari soal/subtest harus konfirmasi kalau ada jawaban un-submitted.
- Onboarding cuma sekali per device — simpan flag di local storage.

---

## 5. Design tokens (sistem monokrom, 60/30/10)

### Filosofi warna

Design ini sengaja **monokromatik**: dominan cream/beige (60%), ink dark (30%), aksen
putih dan primary hint warna (10% total). Primary palette warna (azure/mint/dll) sengaja
**jarang muncul** — hanya untuk warna brand dan beberapa subtle accent (sparkline,
ilustrasi onboarding). Mayoritas CTA + hero card pakai **ink dark + text putih**, bukan
flood warna primary.

Kenapa: hasil iterasi sama user, biar mata adem dipakai berjam-jam buat ngerjain soal,
dan tetap punya kontras yang kuat tanpa rasa "loud".

### Palette

Lihat `proto-hangat.jsx` → object `palettes`. 6 palette tersedia (azure, mint, ocean,
burgundy, plum, forest). Default: **azure**. Setiap palette punya shape sama:

```js
{
  primary:    '#3D6BAA',     // brand hint — dipakai SANGAT JARANG
  primaryDim: '#6087BD',     // primary lebih terang (hover/disabled)
  accent:     '#1F1F1F',     // near-black untuk sub-accent, daily challenge banner
  tint:       '#D5DDEC',     // soft fill (jarang dipakai sekarang)
  bg:         '#E5E1D2',     // page background — cream yang cukup tegas, BUKAN putih
  surface:    '#FFFFFF',     // card background
  ink:        '#1A2A40',     // dark surfaces + text utama
  sub:        '#5E6878',     // text sekunder, ikon idle
  soft:       '#D7D3C3',     // divider, neutral bar bg, badge GRATIS
  border:     'rgba(15,29,61,0.08)',
}
```

### Aturan pemakaian (60/30/10)

| Layer       | Warna           | Pakai di                                                          |
| ----------- | --------------- | ----------------------------------------------------------------- |
| 60% dominan | `bg` (cream)    | Page background semua screen                                      |
| 30% support | `surface` putih + `ink` dark | Card biasa = putih. Hero/CTA/avatar/toggle aktif = ink dark    |
| 10% accent  | `#fff` di atas ink, `primary` tipis | Text & ikon di atas ink dark; stripe halus di hero card     |

**Penting buat text di atas `ink` dark:** SELALU `#fff` (atau `rgba(255,255,255,0.65)`
untuk muted), JANGAN pakai `primary` atau `accent` di atas ink — hasilnya dark-on-dark
yang nggak kebaca. Bug ini muncul beberapa kali waktu iterasi.

### Status colors (semantik, tidak ikut palette)

- **Benar / Lulus**: `theme.ink` background + `#fff` text (bukan hijau)
- **Salah / Kurang**: bg `#F3DDDD` + text `#6E2828` (merah desaturated, satu-satunya warna semantik)
- **Warning timer (< 5 menit)**: bg `#F3DDDD` + text `#6E2828`

### Sub-color (per-subtest tile)

- TWK: `#5A7AA6` (slate blue)
- TIU: `#7565A6` (muted purple)
- TKP: `#1F1F1F` (near black)

Dipakai cuma di icon container kecil 36–48px. Bukan flood ke card.

### Dark mode

`bg/surface/ink/sub/soft/border` di-replace dari `darkBase`:
```js
{ bg: '#161412', surface: '#211E1A', ink: '#F2EEE6', sub: '#9A938A',
  soft: '#2A2620', border: 'rgba(255,255,255,0.07)' }
```
Primary tetap, tint jadi `rgba(...primary..., 0.18)`.

### Typography

- **Display + body: Manrope** (400/500/600/700/800) — Google Fonts
- Tabular numerals untuk semua angka (`fontVariantNumeric: 'tabular-nums'`)
- Skala dasar (Android, design width 412):
  - `display-xl`: 32px / 800 / letter -1 (login welcome)
  - `display-lg`: 28px / 800 / letter -0.8 (onboarding heading)
  - `display`: 22-24px / 800 / letter -0.6 (page title, hero score)
  - `headline`: 17-18px / 800 / letter -0.4 (modal heading)
  - `title`: 15px / 800 (card title)
  - `body`: 14-15px / 500-600
  - `caption`: 11-13px / 600-700 / sometimes letter +0.4 uppercase
  - `micro`: 9-10px / 800 / letter +0.5 uppercase (badge/label)

### Spacing (px)

`4 · 6 · 8 · 10 · 12 · 14 · 16 · 18 · 20 · 22 · 24 · 28 · 32`

Page padding side: **22**. Card padding: **14–18**. Gap between cards: **10**.

### Radii

- Pill button: `999`
- Card: `16–22` (lebih besar untuk hero)
- Chip / small button: `999`
- Icon container: `10–14`
- Input field: `16`

### Shadow

Primary CTA dapat shadow tipis dari ink:
`boxShadow: 0 2px 8px -2px rgba(0,0,0,0.25)`

Card hero (dark): `0 6px 18px -6px rgba(0,0,0,0.3)` (avatar besar di profil)

Di luar itu, **shadow seminimal mungkin** — lebih banyak pakai border tipis untuk separation.

---

## 6. Data shapes

```ts
type User = {
  id: string;
  name: string;
  email: string;
  avatarUrl?: string;
  joinedAt: string; // ISO
  streak: number;   // hari berturut
};

type Subtest = 'twk' | 'tiu' | 'tkp';

type Soal = {
  id: string;
  sub: Subtest;
  q: { id: string; en: string };       // multi-lang
  opts: { id: string; en: string }[];  // 5 options A-E
  ans: number;                          // index correct (untuk TKP, lihat scores)
  scores?: number[];                    // TKP: bobot per opsi 1-5
  exp: { id: string; en: string };     // pembahasan
};

type Paket = {
  id: string;
  title: string;
  sub: Subtest | 'FULL' | 'MIX';
  count: number;       // jumlah soal
  time: number;        // estimasi menit
  cat: 'sub' | 'try' | 'bonus';
  badge: 'GRATIS' | 'PREMIUM';
  isNew?: boolean;
  desc?: string;
};

type Sesi = {
  id: string;
  userId: string;
  paketId?: string;
  mode: 'tryout' | 'latihan';
  startedAt: string;
  finishedAt?: string;
  durationSec: number;
  answers: Record<string /* soalId */, {
    pick: number;       // index opsi
    flagged: boolean;
    timeSec: number;
  }>;
  score: number;        // 0-500 untuk full, atau 0-100 untuk subtest
  status: 'lulus' | 'kurang' | 'in_progress';
};
```

---

## 7. Endpoints yang perlu diimplementasi

| Method | Path                          | Tujuan                                    |
| ------ | ----------------------------- | ----------------------------------------- |
| POST   | `/auth/register`              | email + password                          |
| POST   | `/auth/login`                 | return token                              |
| POST   | `/auth/guest`                 | anonymous session                         |
| GET    | `/me`                         | profile + streak                          |
| GET    | `/pakets?cat=sub\|try\|bonus` | catalog                                   |
| GET    | `/pakets/:id`                 | detail + first N soal                     |
| GET    | `/pakets/:id/soal`            | paginated, atau load all at start         |
| POST   | `/sesi`                       | start sesi (server set start time)        |
| PATCH  | `/sesi/:id/answer`            | autosave per jawaban (idempotent)         |
| POST   | `/sesi/:id/finish`            | hitung score, lock, return result        |
| GET    | `/sesi?limit=20`              | riwayat                                   |
| GET    | `/sesi/:id`                   | recap + pembahasan                        |
| GET    | `/stats?range=7d\|30d\|90d`   | aggregat akurasi per subtes               |
| GET    | `/soal/sering-salah`          | bonus pack — soal yang user sering salah  |

### Aturan scoring (server-side, jangan trust client)

- **TWK / TIU**: betul = 5, salah = 0, kosong = 0. Total ÷ jumlah_soal × 100.
- **TKP**: setiap opsi punya bobot 1–5 (lihat `Soal.scores`). Total ÷ (max_per_soal × jumlah_soal) × 100.
- **Full CAT**: TWK weight × 65, TIU weight × 80, TKP weight × ambang_lulus_166. Lihat
  Permen PANRB terbaru untuk passing grade exact.

---

## 8. Yang perlu di-handle developer (gak ada di prototype)

- [ ] **Autentikasi** — email/pass, Google, guest
- [ ] **Persistensi sesi** — autosave tiap jawab (PATCH idempotent dengan jawaban index)
- [ ] **Resume sesi** — kalau user keluar tengah-tengah, balik ke nomor terakhir + timer di-pause/continue
- [ ] **Offline mode** — minimal cache soal terakhir biar bisa lanjut sesi tanpa internet
- [ ] **Push notif** — daily reminder, hasil try-out mingguan
- [ ] **Pembelian premium** — Google Play Billing (in-app)
- [ ] **Konten manajemen** — admin panel buat upload/edit soal
- [ ] **Error states** — empty riwayat (UI udah ada), no network, soal gagal load
- [ ] **Loading states** — skeleton shimmer (belum ada di prototype, gampang nambahin)
- [ ] **Accessibility** — VoiceOver/TalkBack labels, focus ring di keyboard nav
- [ ] **Lupa password** screen — belum ada di prototype, tinggal nambah
- [ ] **Edit profil** screen — belum ada di prototype

---

## 9. Cara pakai prototype sebagai referensi

1. **Cek interaksi** — semua tombol bisa diklik di prototype. Klik → liat behavior expected.
2. **Cek copy** — semua teks ID/EN ada di `shared.jsx` → `I18N`. Copy production sebaiknya
   dimoderasi sama copywriter, tapi vocab + struktur bisa langsung dipakai.
3. **Cek warna persis** — buka DevTools, inspect element. Atau lihat `palettes` di
   `proto-hangat.jsx`.
4. **Cek spacing/sizing persis** — semua angka inline di style. Konsisten ke skala spacing
   di section 5.
5. **Pakai Tweaks panel** untuk lihat dark mode, font scale, palette lain — biar tahu
   range warna yang perlu di-handle.

---

## 10. Out of scope dari prototype

- Soal di-hardcode 6 buah (di `shared.jsx` → `SOAL_BANK`). Production butuh tabel
  ribuan soal + admin CMS.
- Stats hardcoded (`74%`, `307 soal`, sparkline statis). Aggregate beneran dari sesi.
- Dummy user "Aulia Rahmadhani". Replace dengan data dari `/me`.
- Tweaks panel cuma untuk preview design. Jangan ship ke prod.

---

Happy building 👋
