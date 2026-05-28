# Stitch UI Implementation Plan

> **Untuk sesi Claude Code berikutnya (termasuk di HP):** baca file ini dulu, lalu lanjut implement.
> Sumber kebenaran ada di git — bukan di memory lokal laptop. Folder design ada di repo: `stitch_mobile_ui_ux_enhancement_pack/`.

## Konteks

User sudah membuat 3 mockup di Google Stitch (project "Mobile UI/UX Enhancement Pack", ID `6840429517530439824`) untuk mempercantik UX app **Wirago Academy** (app latihan soal CPNS/TNI/Polri). Implementasi React Native masih **PENDING** — tinggal translate HTML+Tailwind dari Stitch jadi komponen RN.

File design tersimpan di repo:
```
stitch_mobile_ui_ux_enhancement_pack/stitch_mobile_ui_ux_enhancement_pack/
├── latihan_empty_state/      (code.html + screen.png)
├── menu_profil_logout/       (code.html + screen.png)
├── beranda_loading_refresh/  (code.html + screen.png)
└── patriot_edu_system/DESIGN.md   (design system lengkap)
```

## Mapping Design → File App

| # | Stitch Design | Folder Stitch | File App Target | Aksi |
|---|---|---|---|---|
| 1 | **Latihan Empty State** | `latihan_empty_state/` | `src/screens/latihan/CategoryListScreen.tsx` | Replace blok empty state (saat ini sekitar baris yang render "Belum ada paket di filter ini.") jadi: illustration bulat + judul + subtitle + CTA besar "Mulai Latihan Pertamamu →" |
| 2 | **Menu Profil & Logout** | `menu_profil_logout/` | `src/screens/profil/ProfileScreen.tsx` | Kemungkinan full rewrite. Layout: card avatar+nama+email+"Edit Profil", list menu (Pengaturan Akun, Riwayat Pembelian, Hubungi Kami, Kebijakan Privasi) tiap item ada icon bulat + chevron, tombol merah "Keluar" |
| 3 | **Beranda Loading & Refresh** | `beranda_loading_refresh/` | `src/screens/beranda/BerandaScreen.tsx` | Tambah: pull-to-refresh (RefreshControl), skeleton loader state (shimmer), toast "Berhasil memuat data" |

## Design System "Patriot Edu System"

Detail lengkap di `stitch_mobile_ui_ux_enhancement_pack/.../patriot_edu_system/DESIGN.md`. Ringkasan token penting:

**Font:** Plus Jakarta Sans (weights 400/500/600/700)

**Warna kunci:**
| Token | Hex |
|---|---|
| primary | `#ba0013` |
| primary-container | `#e31e24` |
| on-primary | `#ffffff` |
| surface / background | `#f7f9fb` |
| surface-container-lowest | `#ffffff` |
| surface-container-low | `#f2f4f6` |
| surface-container-high | `#e6e8ea` |
| surface-container-highest | `#e0e3e5` |
| on-surface | `#191c1e` |
| on-surface-variant | `#5d3f3c` |
| secondary | `#565e74` |
| secondary-container | `#dae2fd` |
| outline-variant | `#e7bdb8` |
| inverse-surface (toast bg) | `#2d3133` |
| inverse-on-surface (toast text) | `#eff1f3` |
| tertiary | `#0050d4` |

**Tipografi (size / lineHeight / weight):**
- headline-lg: 24/32/700
- headline-md: 20/28/700
- headline-sm: 18/24/600
- body-lg: 16/24/400
- body-md: 14/20/400
- label-lg: 14/20/600 (letterSpacing 0.02em)
- label-md: 12/16/500

**Border radius:** lg 8px, xl 12px, full 9999px
**Margin halaman:** 20px horizontal, stack gap 16px, inner padding 16px

## ⚠️ Pertanyaan Terbuka — TANYA USER DULU sebelum coding

1. **Brand header Beranda:** mockup Stitch tulis "CitaTaruna" (placeholder lama). App sekarang sudah rebrand **Wirago Academy**. Pakai: (a) logo eagle + teks Wirago Academy, (b) teks doang, atau (c) ikut Stitch persis?
2. **Color system:** adopt full (replace `src/constants/colors.ts`), parsial (tambah token cuma untuk 3 screen baru), atau skip (pakai Colors existing)?
3. **Font Plus Jakarta Sans:** load via `@expo-google-fonts/plus-jakarta-sans` (match design, perlu rebuild APK), atau pakai system font?
4. **Urutan implement:** ProfileScreen dulu (paling urgent — user belum bisa logout), atau Latihan/Beranda dulu, atau paralel?

**Rekomendasi default kalau user minta langsung jalan:**
ProfileScreen dulu (logout adalah gap fungsional kritis) → pakai Plus Jakarta Sans → token Stitch **ditambah** ke `colors.ts` (bukan replace, biar gak ada regresi di 19 screen lain) → branding Wirago Academy.

## Catatan Teknis Translate HTML → RN

- Stitch pakai Tailwind + Material Symbols (web). Di RN ganti:
  - Material Symbols → `@expo/vector-icons` (Ionicons / MaterialIcons). Mapping ikon: `arrow_back`→`arrow-back`, `settings`→`settings-outline`, `edit`→`pencil`, `logout`→`log-out-outline`, `chevron_right`→`chevron-forward`, `manage_accounts`→`person-circle-outline`, `receipt_long`→`receipt-outline`, `support_agent`→`headset-outline`, `shield_person`→`shield-checkmark-outline`, `home`→`home`, `edit_note`→`create-outline`, `assignment`→`clipboard-outline`, `trending_up`→`trending-up`, `person`→`person-outline`, `search`→`search`, `refresh`→`refresh`, `check_circle`→`checkmark-circle`.
  - `animate-pulse` / `animate-spin` / shimmer → `Animated` API RN atau lib skeleton (mis. buat komponen `<Skeleton>` sederhana pakai `Animated.loop` opacity).
  - Pull-to-refresh → `RefreshControl` di `ScrollView`.
  - Toast → komponen overlay absolute + `Animated` slide-up, auto-dismiss timer.
  - Illustration empty state (latihan): mockup pakai gambar AI bulb+desk. Untuk RN bisa pakai Ionicons besar (mis. `bulb-outline`) di lingkaran cream, ATAU generate asset PNG terpisah. Konfirmasi ke user.
- Bottom tab nav SUDAH ada di app (jangan duplikat) — cukup pastikan screen baru kompatibel dengan tab navigator existing.
- Avatar di ProfileScreen: ambil dari profil Supabase (nama + email user login), bukan hardcode "Taruna Abdi".

## Status terkait (saat plan ini ditulis, 2026-05-28)
- Branch kerja: `claude-code/mvp`
- APK build terakhir: GitHub Actions run `26544797299` (commit `cd36164`) — splash fix + README rebrand Wirago Academy.
- 3 screen ini BELUM disentuh kode-nya.
