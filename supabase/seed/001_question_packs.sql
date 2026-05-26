-- ============================================================
-- Seed 001: Question Packs
-- JALANKAN DULU sebelum seed 002-004 karena questions.pack_id
-- referensi ke tabel ini.
-- UUID stabil (hardcoded) agar idempotent.
-- ============================================================

INSERT INTO public.question_packs
  (id, exam_type, subject, title, description, version, question_count, is_free, is_published)
VALUES
  -- CPNS
  ('a0000001-0000-0000-0000-000000000001', 'CPNS', 'TWK',
   'TWK — Bank Soal Lengkap',
   'Tes Wawasan Kebangsaan: Pancasila, UUD 1945, NKRI, Bhinneka Tunggal Ika, Sejarah Indonesia, Kebijakan Pemerintah.',
   1, 200, TRUE, TRUE),

  ('a0000001-0000-0000-0000-000000000002', 'CPNS', 'TIU',
   'TIU — Bank Soal Lengkap',
   'Tes Intelegensia Umum: Verbal (Analogi, Silogisme, Analitis), Numerik (Berhitung, Deret, Perbandingan), Figural, Logika.',
   1, 200, TRUE, TRUE),

  ('a0000001-0000-0000-0000-000000000003', 'CPNS', 'TKP',
   'TKP — Bank Soal Lengkap',
   'Tes Karakteristik Pribadi: Pelayanan Publik, Jejaring Kerja, Sosial Budaya, Teknologi Informasi, Profesionalisme, Anti Radikalisme.',
   1, 200, TRUE, TRUE),

  -- TNI
  ('b0000001-0000-0000-0000-000000000001', 'TNI', 'MATEMATIKA',
   'Matematika TNI — Bank Soal',
   'Aritmatika, Aljabar, Geometri, Statistika. Penilaian: benar +4, salah -1.',
   1, 80, TRUE, TRUE),

  ('b0000001-0000-0000-0000-000000000002', 'TNI', 'BAHASA_INDONESIA',
   'Bahasa Indonesia TNI — Bank Soal',
   'Pemahaman Bacaan, Tata Bahasa, Ejaan, Kosakata.',
   1, 60, TRUE, TRUE),

  ('b0000001-0000-0000-0000-000000000003', 'TNI', 'PENGETAHUAN_UMUM',
   'Pengetahuan Umum TNI — Bank Soal',
   'Geografi, Sejarah, Ilmu Pengetahuan, Olahraga, Seni Budaya.',
   1, 60, TRUE, TRUE),

  ('b0000001-0000-0000-0000-000000000004', 'TNI', 'PSIKOTES',
   'Psikotes TNI — Bank Soal',
   'Tes kemampuan berpikir logis, penalaran spasial, dan konsistensi kepribadian.',
   1, 30, TRUE, TRUE),

  ('b0000001-0000-0000-0000-000000000005', 'TNI', 'KEDINASAN',
   'Kedinasan TNI — Bank Soal',
   'Regulasi TNI, wawasan pertahanan negara, kedisiplinan dan kepemimpinan.',
   1, 20, TRUE, TRUE),

  -- POLRI
  ('c0000001-0000-0000-0000-000000000001', 'POLRI', 'MATEMATIKA',
   'Matematika Polri — Bank Soal',
   'Aritmatika, Aljabar, Geometri, Statistika.',
   1, 60, TRUE, TRUE),

  ('c0000001-0000-0000-0000-000000000002', 'POLRI', 'BAHASA_INDONESIA',
   'Bahasa Indonesia Polri — Bank Soal',
   'Pemahaman Bacaan, Tata Bahasa, Ejaan, Kosakata.',
   1, 50, TRUE, TRUE),

  ('c0000001-0000-0000-0000-000000000003', 'POLRI', 'PENGETAHUAN_UMUM',
   'Pengetahuan Umum Polri — Bank Soal',
   'Geografi, Sejarah, Ilmu Pengetahuan, Olahraga, Seni Budaya.',
   1, 50, TRUE, TRUE),

  ('c0000001-0000-0000-0000-000000000004', 'POLRI', 'PSIKOTES',
   'Psikotes Polri — Bank Soal',
   'Tes kemampuan berpikir logis, penalaran spasial, dan konsistensi kepribadian.',
   1, 30, TRUE, TRUE),

  ('c0000001-0000-0000-0000-000000000005', 'POLRI', 'PENGETAHUAN_HUKUM',
   'Pengetahuan Hukum Polri — Bank Soal',
   'Hukum Pidana (KUHP), Hukum Perdata (KUHPer), Hukum Tata Negara, HAM.',
   1, 60, TRUE, TRUE)

ON CONFLICT (id) DO UPDATE SET
  question_count = EXCLUDED.question_count,
  is_published   = EXCLUDED.is_published,
  updated_at     = NOW();
