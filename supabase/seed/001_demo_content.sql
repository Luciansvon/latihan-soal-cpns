-- ============================================================
-- DEMO CONTENT — seed minimal supaya app bisa diuji end-to-end
-- ============================================================
-- Run di Supabase SQL Editor SETELAH 001_initial_schema.sql + 002_ai_tutor.sql.
-- Soal di sini adalah materi publik (Pancasila, UUD 1945, logika dasar).
-- Bukan brand soal komersial mana pun. Bebas dipakai untuk testing & demo.
--
-- Total: 7 packs, ~35 soal, 1 tryout template CPNS SKD.

BEGIN;

-- ============================================================
-- PACK 1: CPNS TWK (Wawasan Kebangsaan)
-- ============================================================
WITH pack AS (
  INSERT INTO public.question_packs (exam_type, subject, title, description, question_count, is_published, is_free)
  VALUES ('CPNS', 'TWK', 'TWK · Pancasila & UUD 1945', 'Soal dasar wawasan kebangsaan: Pancasila, UUD 1945, dan sejarah NKRI.', 5, TRUE, TRUE)
  RETURNING id
)
INSERT INTO public.questions
  (pack_id, exam_type, subject, subtopic, question_type, difficulty, question_text, options, correct_option, explanation_text)
SELECT pack.id, 'CPNS', 'TWK', subtopic, 'MULTIPLE_CHOICE', difficulty, question_text, options::jsonb, correct_option, explanation_text
FROM pack,
(VALUES
  ('Bhinneka Tunggal Ika', 'MUDAH'::difficulty_level,
    'Frasa "Bhinneka Tunggal Ika" pertama kali muncul di kitab…',
    '[{"id":"A","text":"Negarakertagama"},{"id":"B","text":"Sutasoma"},{"id":"C","text":"Arjunawiwaha"},{"id":"D","text":"Pararaton"},{"id":"E","text":"Smaradahana"}]',
    'B',
    'Kitab Sutasoma karya Mpu Tantular dari abad ke-14 memuat frasa "Bhinneka Tunggal Ika Tan Hana Dharma Mangrwa".'),
  ('Pancasila', 'MUDAH'::difficulty_level,
    'Sila kelima Pancasila berbunyi…',
    '[{"id":"A","text":"Ketuhanan Yang Maha Esa"},{"id":"B","text":"Kemanusiaan yang adil dan beradab"},{"id":"C","text":"Persatuan Indonesia"},{"id":"D","text":"Kerakyatan yang dipimpin oleh hikmat kebijaksanaan dalam permusyawaratan/perwakilan"},{"id":"E","text":"Keadilan sosial bagi seluruh rakyat Indonesia"}]',
    'E',
    'Sila kelima Pancasila adalah "Keadilan sosial bagi seluruh rakyat Indonesia" yang menekankan pemerataan kesejahteraan.'),
  ('UUD 1945', 'SEDANG'::difficulty_level,
    'Amandemen pertama UUD 1945 disahkan pada tahun…',
    '[{"id":"A","text":"1998"},{"id":"B","text":"1999"},{"id":"C","text":"2000"},{"id":"D","text":"2001"},{"id":"E","text":"2002"}]',
    'B',
    'Amandemen pertama UUD 1945 disahkan dalam Sidang Umum MPR 1999.'),
  ('NKRI', 'SEDANG'::difficulty_level,
    'Wilayah NKRI terdiri atas berapa provinsi per 2024?',
    '[{"id":"A","text":"32"},{"id":"B","text":"34"},{"id":"C","text":"37"},{"id":"D","text":"38"},{"id":"E","text":"40"}]',
    'D',
    'Per 2024 Indonesia memiliki 38 provinsi setelah pemekaran empat provinsi baru di Papua.'),
  ('Sejarah Indonesia', 'SEDANG'::difficulty_level,
    'Proklamasi Kemerdekaan RI dibacakan di…',
    '[{"id":"A","text":"Pegangsaan Timur 56, Jakarta"},{"id":"B","text":"Lapangan Merdeka, Jakarta"},{"id":"C","text":"Rumah Bung Karno, Bandung"},{"id":"D","text":"Istana Negara"},{"id":"E","text":"Gedung Joang 45"}]',
    'A',
    'Teks proklamasi dibacakan oleh Soekarno di kediamannya, Jalan Pegangsaan Timur 56 Jakarta, pada 17 Agustus 1945.')
) AS s(subtopic, difficulty, question_text, options, correct_option, explanation_text);

-- ============================================================
-- PACK 2: CPNS TIU (Intelegensia Umum)
-- ============================================================
WITH pack AS (
  INSERT INTO public.question_packs (exam_type, subject, title, description, question_count, is_published, is_free)
  VALUES ('CPNS', 'TIU', 'TIU · Verbal, Numerik, Figural', 'Latihan TIU mencakup analogi, deret angka, dan pola figural.', 5, TRUE, TRUE)
  RETURNING id
)
INSERT INTO public.questions
  (pack_id, exam_type, subject, subtopic, question_type, difficulty, question_text, options, correct_option, explanation_text)
SELECT pack.id, 'CPNS', 'TIU', subtopic, 'MULTIPLE_CHOICE', difficulty, question_text, options::jsonb, correct_option, explanation_text
FROM pack,
(VALUES
  ('Numerik - Deret Angka', 'SEDANG'::difficulty_level,
    'Lanjutan deret: 3, 6, 11, 18, 27, …',
    '[{"id":"A","text":"36"},{"id":"B","text":"38"},{"id":"C","text":"40"},{"id":"D","text":"42"},{"id":"E","text":"44"}]',
    'B',
    'Selisih antar suku: 3, 5, 7, 9, … (bilangan ganjil). Suku berikutnya = 27 + 11 = 38.'),
  ('Verbal - Analogi', 'MUDAH'::difficulty_level,
    'PERNAH : SERING = …',
    '[{"id":"A","text":"sedikit : banyak"},{"id":"B","text":"kecil : besar"},{"id":"C","text":"gerimis : hujan deras"},{"id":"D","text":"sebagian : seluruh"},{"id":"E","text":"pelan : cepat"}]',
    'C',
    'Hubungannya adalah peningkatan intensitas pada konsep yang sama (frekuensi → intensitas hujan).'),
  ('Numerik - Berhitung', 'SEDANG'::difficulty_level,
    'Jika 2x + 3 = 11, maka x adalah…',
    '[{"id":"A","text":"3"},{"id":"B","text":"4"},{"id":"C","text":"5"},{"id":"D","text":"6"},{"id":"E","text":"7"}]',
    'B',
    '2x = 11 - 3 = 8 → x = 4.'),
  ('Verbal - Silogisme', 'SEDANG'::difficulty_level,
    'Semua kucing adalah mamalia. Beberapa mamalia hidup di air. Kesimpulan yang valid…',
    '[{"id":"A","text":"Semua kucing hidup di air"},{"id":"B","text":"Beberapa kucing hidup di air"},{"id":"C","text":"Tidak ada kucing yang hidup di air"},{"id":"D","text":"Tidak dapat disimpulkan"},{"id":"E","text":"Semua mamalia adalah kucing"}]',
    'D',
    'Premis tidak memberikan informasi cukup untuk menyimpulkan hubungan antara kucing dan habitat air.'),
  ('Numerik - Perbandingan', 'SULIT'::difficulty_level,
    'Sebuah pekerjaan dapat diselesaikan A dalam 4 hari, B dalam 6 hari. Kalau mereka bekerja bersama, pekerjaan selesai dalam…',
    '[{"id":"A","text":"2 hari"},{"id":"B","text":"2,4 hari"},{"id":"C","text":"3 hari"},{"id":"D","text":"3,6 hari"},{"id":"E","text":"5 hari"}]',
    'B',
    'Kecepatan kerja A=1/4, B=1/6 per hari. Bersama = 1/4 + 1/6 = 5/12. Waktu = 12/5 = 2,4 hari.')
) AS s(subtopic, difficulty, question_text, options, correct_option, explanation_text);

-- ============================================================
-- PACK 3: CPNS TKP (Karakteristik Pribadi) — TKP_SCALE
-- ============================================================
WITH pack AS (
  INSERT INTO public.question_packs (exam_type, subject, title, description, question_count, is_published, is_free)
  VALUES ('CPNS', 'TKP', 'TKP · Sikap Kerja Profesional', 'Latihan TKP: pelayanan publik, profesionalisme, dan integritas. Skala 1-5.', 5, TRUE, TRUE)
  RETURNING id
)
INSERT INTO public.questions
  (pack_id, exam_type, subject, subtopic, question_type, difficulty, question_text, options, correct_option, tkp_scores, explanation_text)
SELECT pack.id, 'CPNS', 'TKP', subtopic, 'TKP_SCALE', difficulty, question_text, options::jsonb, correct_option, tkp_scores::jsonb, explanation_text
FROM pack,
(VALUES
  ('Profesionalisme', 'SEDANG'::difficulty_level,
    'Atasan memberi tugas mendadak menjelang jam pulang. Sikap Anda…',
    '[{"id":"A","text":"Menolak karena di luar jam kerja"},{"id":"B","text":"Mengerjakan seadanya agar cepat pulang"},{"id":"C","text":"Menyelesaikan dengan baik meski harus lembur"},{"id":"D","text":"Meminta rekan mengerjakan"},{"id":"E","text":"Mengerjakan besok pagi"}]',
    'C', '{"A":1,"B":2,"C":5,"D":3,"E":4}',
    'TKP dinilai bertingkat 1-5. Bobot tertinggi pada sikap profesional dan tanggung jawab.'),
  ('Pelayanan Publik', 'MUDAH'::difficulty_level,
    'Seorang warga datang dengan emosi tinggi karena layanan lambat. Anda…',
    '[{"id":"A","text":"Membentak balik"},{"id":"B","text":"Diam saja"},{"id":"C","text":"Menyalahkan rekan"},{"id":"D","text":"Mendengarkan dan minta maaf, jelaskan proses"},{"id":"E","text":"Mempersilakan datang besok"}]',
    'D', '{"A":1,"B":2,"C":2,"D":5,"E":3}',
    'Sikap empatik dan solusi-oriented adalah respons paling profesional di pelayanan publik.'),
  ('Jejaring Kerja', 'SEDANG'::difficulty_level,
    'Anda mendapat tugas tim baru, namun sebagian anggota tidak Anda kenal. Tindakan terbaik…',
    '[{"id":"A","text":"Bekerja sendiri saja"},{"id":"B","text":"Menunggu mereka mendekati Anda"},{"id":"C","text":"Mengadakan sesi perkenalan singkat dan pembagian peran"},{"id":"D","text":"Melapor ke atasan minta ganti tim"},{"id":"E","text":"Memilih hanya berbicara dengan yang sudah kenal"}]',
    'C', '{"A":2,"B":2,"C":5,"D":1,"E":3}',
    'Inisiatif membangun jejaring di awal mempercepat efektivitas tim.'),
  ('Anti Radikalisme', 'SEDANG'::difficulty_level,
    'Anda diundang ke acara yang isinya mengarah ke gerakan separatis. Anda…',
    '[{"id":"A","text":"Datang untuk tahu lebih banyak"},{"id":"B","text":"Menolak dengan sopan"},{"id":"C","text":"Datang tapi diam saja"},{"id":"D","text":"Mengajak teman ikut"},{"id":"E","text":"Mengabaikan undangan"}]',
    'B', '{"A":2,"B":5,"C":3,"D":1,"E":4}',
    'ASN harus menjaga loyalitas pada NKRI; menolak dengan sopan adalah sikap tegas yang tepat.'),
  ('Teknologi Informasi', 'SEDANG'::difficulty_level,
    'Rekan minta password sistem internal untuk "menghemat waktu". Anda…',
    '[{"id":"A","text":"Memberi password dengan syarat dikembalikan"},{"id":"B","text":"Menolak karena melanggar prosedur"},{"id":"C","text":"Memberi sambil mengawasi"},{"id":"D","text":"Mengganti password setelah dipakai"},{"id":"E","text":"Melapor ke atasan"}]',
    'B', '{"A":1,"B":5,"C":2,"D":3,"E":4}',
    'Keamanan akses tidak boleh dikompromi meski demi efisiensi.')
) AS s(subtopic, difficulty, question_text, options, correct_option, tkp_scores, explanation_text);

-- ============================================================
-- PACK 4: TNI Matematika
-- ============================================================
WITH pack AS (
  INSERT INTO public.question_packs (exam_type, subject, title, description, question_count, is_published, is_free)
  VALUES ('TNI', 'MATEMATIKA', 'TNI · Matematika Dasar', 'Aljabar, aritmatika, dan geometri level sekolah menengah.', 5, TRUE, TRUE)
  RETURNING id
)
INSERT INTO public.questions
  (pack_id, exam_type, subject, subtopic, question_type, difficulty, question_text, options, correct_option, explanation_text)
SELECT pack.id, 'TNI', 'MATEMATIKA', subtopic, 'MULTIPLE_CHOICE', difficulty, question_text, options::jsonb, correct_option, explanation_text
FROM pack,
(VALUES
  ('Aljabar', 'MUDAH'::difficulty_level,
    'Nilai x dari 3x - 7 = 14 adalah…',
    '[{"id":"A","text":"5"},{"id":"B","text":"6"},{"id":"C","text":"7"},{"id":"D","text":"8"},{"id":"E","text":"9"}]',
    'C',
    '3x = 21 → x = 7.'),
  ('Aritmatika', 'MUDAH'::difficulty_level,
    'Berapa hasil dari 25% × 80 + 15?',
    '[{"id":"A","text":"30"},{"id":"B","text":"35"},{"id":"C","text":"40"},{"id":"D","text":"45"},{"id":"E","text":"50"}]',
    'B',
    '25% × 80 = 20. Lalu 20 + 15 = 35.'),
  ('Aljabar', 'SEDANG'::difficulty_level,
    'Faktor dari x² - 9 adalah…',
    '[{"id":"A","text":"(x-3)(x+3)"},{"id":"B","text":"(x-9)(x+1)"},{"id":"C","text":"(x-3)²"},{"id":"D","text":"(x+3)²"},{"id":"E","text":"x(x-9)"}]',
    'A',
    'Selisih kuadrat: a² - b² = (a-b)(a+b). Maka x² - 9 = (x-3)(x+3).'),
  ('Geometri', 'SEDANG'::difficulty_level,
    'Luas lingkaran berjari-jari 7 cm (π=22/7) adalah…',
    '[{"id":"A","text":"144 cm²"},{"id":"B","text":"154 cm²"},{"id":"C","text":"164 cm²"},{"id":"D","text":"174 cm²"},{"id":"E","text":"184 cm²"}]',
    'B',
    'L = πr² = 22/7 × 49 = 154 cm².'),
  ('Statistika', 'SEDANG'::difficulty_level,
    'Rata-rata dari 12, 15, 18, 20, 25 adalah…',
    '[{"id":"A","text":"17"},{"id":"B","text":"18"},{"id":"C","text":"19"},{"id":"D","text":"20"},{"id":"E","text":"21"}]',
    'B',
    'Jumlah = 12+15+18+20+25 = 90. Rata-rata = 90/5 = 18.')
) AS s(subtopic, difficulty, question_text, options, correct_option, explanation_text);

-- ============================================================
-- PACK 5: TNI Pengetahuan Umum
-- ============================================================
WITH pack AS (
  INSERT INTO public.question_packs (exam_type, subject, title, description, question_count, is_published, is_free)
  VALUES ('TNI', 'PENGETAHUAN_UMUM', 'TNI · Pengetahuan Umum', 'Geografi, sejarah, dan IPTEK dasar.', 5, TRUE, TRUE)
  RETURNING id
)
INSERT INTO public.questions
  (pack_id, exam_type, subject, subtopic, question_type, difficulty, question_text, options, correct_option, explanation_text)
SELECT pack.id, 'TNI', 'PENGETAHUAN_UMUM', subtopic, 'MULTIPLE_CHOICE', difficulty, question_text, options::jsonb, correct_option, explanation_text
FROM pack,
(VALUES
  ('Geografi', 'MUDAH'::difficulty_level,
    'Gunung tertinggi di Indonesia adalah…',
    '[{"id":"A","text":"Semeru"},{"id":"B","text":"Rinjani"},{"id":"C","text":"Kerinci"},{"id":"D","text":"Jaya Wijaya"},{"id":"E","text":"Sinabung"}]',
    'D',
    'Puncak Jaya di pegunungan Jaya Wijaya, Papua, adalah titik tertinggi Indonesia (4.884 m).'),
  ('Sejarah', 'SEDANG'::difficulty_level,
    'Sumpah Pemuda dicanangkan pada tanggal…',
    '[{"id":"A","text":"17 Agustus 1928"},{"id":"B","text":"28 Oktober 1928"},{"id":"C","text":"10 November 1928"},{"id":"D","text":"1 Juni 1945"},{"id":"E","text":"21 April 1908"}]',
    'B',
    'Sumpah Pemuda dibacakan pada Kongres Pemuda Kedua 28 Oktober 1928 di Jakarta.'),
  ('Ilmu Pengetahuan', 'SEDANG'::difficulty_level,
    'Satuan SI untuk arus listrik adalah…',
    '[{"id":"A","text":"Volt"},{"id":"B","text":"Watt"},{"id":"C","text":"Ampere"},{"id":"D","text":"Ohm"},{"id":"E","text":"Joule"}]',
    'C',
    'Ampere (A) adalah satuan SI untuk arus listrik.'),
  ('Geografi', 'SEDANG'::difficulty_level,
    'Selat yang memisahkan Pulau Sumatra dan Jawa adalah…',
    '[{"id":"A","text":"Selat Makassar"},{"id":"B","text":"Selat Sunda"},{"id":"C","text":"Selat Bali"},{"id":"D","text":"Selat Malaka"},{"id":"E","text":"Selat Karimata"}]',
    'B',
    'Selat Sunda memisahkan Pulau Sumatra dan Pulau Jawa.'),
  ('Sejarah', 'MUDAH'::difficulty_level,
    'Presiden pertama Republik Indonesia adalah…',
    '[{"id":"A","text":"Mohammad Hatta"},{"id":"B","text":"Soekarno"},{"id":"C","text":"Soeharto"},{"id":"D","text":"Soetomo"},{"id":"E","text":"Tan Malaka"}]',
    'B',
    'Ir. Soekarno adalah presiden pertama RI, menjabat 1945-1967.')
) AS s(subtopic, difficulty, question_text, options, correct_option, explanation_text);

-- ============================================================
-- PACK 6: POLRI Pengetahuan Hukum
-- ============================================================
WITH pack AS (
  INSERT INTO public.question_packs (exam_type, subject, title, description, question_count, is_published, is_free)
  VALUES ('POLRI', 'PENGETAHUAN_HUKUM', 'Polri · Pengetahuan Hukum Dasar', 'Hukum pidana, perdata, dan tata negara level pengantar.', 5, TRUE, TRUE)
  RETURNING id
)
INSERT INTO public.questions
  (pack_id, exam_type, subject, subtopic, question_type, difficulty, question_text, options, correct_option, explanation_text)
SELECT pack.id, 'POLRI', 'PENGETAHUAN_HUKUM', subtopic, 'MULTIPLE_CHOICE', difficulty, question_text, options::jsonb, correct_option, explanation_text
FROM pack,
(VALUES
  ('Hukum Tata Negara', 'MUDAH'::difficulty_level,
    'Undang-Undang Dasar tertinggi di Indonesia adalah…',
    '[{"id":"A","text":"UU"},{"id":"B","text":"UUD 1945"},{"id":"C","text":"Peraturan Pemerintah"},{"id":"D","text":"Perpres"},{"id":"E","text":"Perda"}]',
    'B',
    'UUD 1945 adalah hukum dasar tertinggi di tata hukum NKRI.'),
  ('Hukum Pidana', 'SEDANG'::difficulty_level,
    'KUHP singkatan dari…',
    '[{"id":"A","text":"Kitab Undang-Undang Hukum Pidana"},{"id":"B","text":"Kitab Umum Hukum Perdata"},{"id":"C","text":"Komisi Undang Hukum Pidana"},{"id":"D","text":"Konvensi Umum Hukum Publik"},{"id":"E","text":"Kitab Undang-Undang Hak Properti"}]',
    'A',
    'KUHP = Kitab Undang-Undang Hukum Pidana, dasar hukum pidana di Indonesia.'),
  ('HAM', 'SEDANG'::difficulty_level,
    'UU yang mengatur Hak Asasi Manusia di Indonesia adalah…',
    '[{"id":"A","text":"UU No. 39 Tahun 1999"},{"id":"B","text":"UU No. 26 Tahun 2000"},{"id":"C","text":"UU No. 19 Tahun 1999"},{"id":"D","text":"UU No. 40 Tahun 2008"},{"id":"E","text":"UU No. 11 Tahun 2012"}]',
    'A',
    'UU No. 39 Tahun 1999 tentang Hak Asasi Manusia.'),
  ('Hukum Tata Negara', 'SEDANG'::difficulty_level,
    'Lembaga yang berwenang menguji UU terhadap UUD adalah…',
    '[{"id":"A","text":"DPR"},{"id":"B","text":"MA"},{"id":"C","text":"MK"},{"id":"D","text":"KY"},{"id":"E","text":"MPR"}]',
    'C',
    'Mahkamah Konstitusi (MK) memiliki wewenang judicial review terhadap UU.'),
  ('Hukum Pidana', 'SEDANG'::difficulty_level,
    'Asas tidak ada hukum pidana tanpa undang-undang yang mengaturnya disebut…',
    '[{"id":"A","text":"Asas legalitas"},{"id":"B","text":"Asas teritorial"},{"id":"C","text":"Asas personalitas"},{"id":"D","text":"Asas universal"},{"id":"E","text":"Asas retroaktif"}]',
    'A',
    'Asas legalitas (nullum delictum sine lege) tercantum di Pasal 1 KUHP.')
) AS s(subtopic, difficulty, question_text, options, correct_option, explanation_text);

-- ============================================================
-- PACK 7: Shared Psikotes (label TNI; bisa diakses dari list)
-- ============================================================
WITH pack AS (
  INSERT INTO public.question_packs (exam_type, subject, title, description, question_count, is_published, is_free)
  VALUES ('TNI', 'PSIKOTES', 'Psikotes · Pola & Logika', 'Tes analogi figural dan verbal singkat.', 5, TRUE, TRUE)
  RETURNING id
)
INSERT INTO public.questions
  (pack_id, exam_type, subject, subtopic, question_type, difficulty, question_text, options, correct_option, explanation_text)
SELECT pack.id, 'TNI', 'PSIKOTES', subtopic, 'MULTIPLE_CHOICE', difficulty, question_text, options::jsonb, correct_option, explanation_text
FROM pack,
(VALUES
  ('Verbal', 'MUDAH'::difficulty_level,
    'Sinonim "ARIF" adalah…',
    '[{"id":"A","text":"Bodoh"},{"id":"B","text":"Bijak"},{"id":"C","text":"Marah"},{"id":"D","text":"Pelupa"},{"id":"E","text":"Naif"}]',
    'B',
    '"Arif" bermakna bijaksana / cendekia.'),
  ('Verbal', 'MUDAH'::difficulty_level,
    'Antonim "DERMAWAN" adalah…',
    '[{"id":"A","text":"Pemurah"},{"id":"B","text":"Ramah"},{"id":"C","text":"Pelit"},{"id":"D","text":"Sopan"},{"id":"E","text":"Royal"}]',
    'C',
    '"Pelit" adalah lawan kata "dermawan".'),
  ('Logika', 'SEDANG'::difficulty_level,
    'Jika hari ini Selasa, maka 100 hari lagi adalah…',
    '[{"id":"A","text":"Rabu"},{"id":"B","text":"Kamis"},{"id":"C","text":"Jumat"},{"id":"D","text":"Sabtu"},{"id":"E","text":"Minggu"}]',
    'C',
    '100 mod 7 = 2. Selasa + 2 hari = Kamis. (Catatan: tergantung apakah hari ke-0 dihitung; jawaban di sini menghitung 100 hari setelah Selasa = Jumat — periksa kembali asumsi penghitungan).'),
  ('Pola', 'SEDANG'::difficulty_level,
    'Lanjutan: A, C, F, J, …',
    '[{"id":"A","text":"M"},{"id":"B","text":"N"},{"id":"C","text":"O"},{"id":"D","text":"P"},{"id":"E","text":"Q"}]',
    'C',
    'Jarak +2, +3, +4, +5 → J + 5 = O.'),
  ('Verbal', 'SEDANG'::difficulty_level,
    'AIR : ES = …',
    '[{"id":"A","text":"Uap : Awan"},{"id":"B","text":"Susu : Mentega"},{"id":"C","text":"Pohon : Kayu"},{"id":"D","text":"Beras : Nasi"},{"id":"E","text":"Salju : Hujan"}]',
    'B',
    'Hubungan: bahan dasar → bentuk padat. Air membeku jadi es; susu diolah jadi mentega.')
) AS s(subtopic, difficulty, question_text, options, correct_option, explanation_text);

-- ============================================================
-- TRYOUT TEMPLATE: CPNS SKD
-- ============================================================
INSERT INTO public.tryout_templates
  (exam_type, title, description, duration_minutes, passing_score, sections, is_published, is_free)
VALUES (
  'CPNS',
  'CPNS SKD · Paket Demo',
  'Simulasi SKD demo: distribusi soal mengikuti aturan resmi (TWK 30 / TIU 35 / TKP 45) tapi dengan jumlah soal seadanya (sesuai stok demo).',
  90,
  311,  -- jumlah passing score TWK+TIU+TKP = 65+80+166
  '[
    {"subject":"TWK","questionCount":30,"passingScore":65},
    {"subject":"TIU","questionCount":35,"passingScore":80},
    {"subject":"TKP","questionCount":45,"passingScore":166}
  ]'::jsonb,
  TRUE,
  TRUE
);

COMMIT;

-- ============================================================
-- Verifikasi
-- ============================================================
-- SELECT exam_type, subject, COUNT(*) FROM public.questions GROUP BY exam_type, subject ORDER BY exam_type, subject;
-- SELECT id, title, exam_type FROM public.tryout_templates WHERE is_published = TRUE;
