-- ============================================================
-- Seed 004: POLRI Questions (50 soal)
-- Distribusi:
--   MATEMATIKA        : 10 soal (Aritmatika, Aljabar, Geometri)
--   BAHASA_INDONESIA  : 10 soal (Pemahaman Bacaan, Tata Bahasa, Ejaan)
--   PENGETAHUAN_UMUM  : 10 soal (Sejarah, Geografi, IPA Umum)
--   PSIKOTES          :  5 soal (Deret, Logika Sederhana)
--   PENGETAHUAN_HUKUM : 15 soal (KUHP 5, KUHPer 3, HTN & HAM 4, Tugas Polri 3)
-- ============================================================

INSERT INTO public.questions
  (id, pack_id, exam_type, subject, subtopic, question_type, difficulty, difficulty_rank,
   question_text, options, correct_option, explanation_text, tags)
VALUES

-- ============================================================
-- MATEMATIKA — Aritmatika (4 soal)
-- ============================================================

  ('cc100001-0000-0000-0000-000000000001',
   'c0000001-0000-0000-0000-000000000001',
   'POLRI', 'MATEMATIKA', 'Aritmatika', 'MULTIPLE_CHOICE', 'MUDAH', 3,
   'Seorang anggota Polri berjaga selama 8 jam sehari. Jika ia berjaga selama 22 hari dalam sebulan, berapa total jam berjaganya?',
   '[{"id":"A","text":"160 jam"},{"id":"B","text":"176 jam"},{"id":"C","text":"180 jam"},{"id":"D","text":"192 jam"}]',
   'B',
   'Total jam berjaga = 8 jam/hari × 22 hari = 176 jam.',
   ARRAY['sering-keluar']),

  ('cc100001-0000-0000-0000-000000000002',
   'c0000001-0000-0000-0000-000000000001',
   'POLRI', 'MATEMATIKA', 'Aritmatika', 'MULTIPLE_CHOICE', 'MUDAH', 3,
   'Harga sebuah seragam Polri adalah Rp450.000. Jika mendapat diskon 10%, berapa harga setelah diskon?',
   '[{"id":"A","text":"Rp390.000"},{"id":"B","text":"Rp400.000"},{"id":"C","text":"Rp405.000"},{"id":"D","text":"Rp410.000"}]',
   'C',
   'Diskon 10% dari Rp450.000 = 0,10 × 450.000 = Rp45.000. Harga setelah diskon = 450.000 − 45.000 = Rp405.000.',
   ARRAY['sering-keluar']),

  ('cc100001-0000-0000-0000-000000000003',
   'c0000001-0000-0000-0000-000000000001',
   'POLRI', 'MATEMATIKA', 'Aritmatika', 'MULTIPLE_CHOICE', 'SEDANG', 3,
   'Sebuah kendaraan patroli menempuh jarak 240 km dengan kecepatan rata-rata 80 km/jam. Berapa waktu tempuhnya?',
   '[{"id":"A","text":"2,5 jam"},{"id":"B","text":"3 jam"},{"id":"C","text":"3,5 jam"},{"id":"D","text":"4 jam"}]',
   'B',
   'Waktu = Jarak ÷ Kecepatan = 240 km ÷ 80 km/jam = 3 jam.',
   ARRAY['sering-keluar']),

  ('cc100001-0000-0000-0000-000000000004',
   'c0000001-0000-0000-0000-000000000001',
   'POLRI', 'MATEMATIKA', 'Aritmatika', 'MULTIPLE_CHOICE', 'SULIT', 3,
   'Dalam sebuah pembagian tugas, 40% dari total anggota bertugas di Sektor A, 35% di Sektor B, dan sisanya di Sektor C. Jika anggota di Sektor C berjumlah 50 orang, berapa total seluruh anggota?',
   '[{"id":"A","text":"150 orang"},{"id":"B","text":"175 orang"},{"id":"C","text":"200 orang"},{"id":"D","text":"250 orang"}]',
   'C',
   'Persentase di Sektor C = 100% − 40% − 35% = 25%. Jika 25% = 50 orang, maka total = 50 ÷ 0,25 = 200 orang.',
   ARRAY['sering-keluar']),

-- ============================================================
-- MATEMATIKA — Aljabar (3 soal)
-- ============================================================

  ('cc100001-0000-0000-0000-000000000005',
   'c0000001-0000-0000-0000-000000000001',
   'POLRI', 'MATEMATIKA', 'Aljabar', 'MULTIPLE_CHOICE', 'MUDAH', 5,
   'Jika 4x − 8 = 20, maka nilai x adalah...',
   '[{"id":"A","text":"5"},{"id":"B","text":"6"},{"id":"C","text":"7"},{"id":"D","text":"8"}]',
   'C',
   '4x − 8 = 20 → 4x = 28 → x = 28 ÷ 4 = 7.',
   ARRAY['sering-keluar']),

  ('cc100001-0000-0000-0000-000000000006',
   'c0000001-0000-0000-0000-000000000001',
   'POLRI', 'MATEMATIKA', 'Aljabar', 'MULTIPLE_CHOICE', 'SEDANG', 5,
   'Sistem persamaan: 3x + y = 20 dan x − y = 4. Nilai x + y adalah...',
   '[{"id":"A","text":"8"},{"id":"B","text":"10"},{"id":"C","text":"12"},{"id":"D","text":"14"}]',
   'A',
   'Jumlahkan kedua persamaan: (3x + y) + (x − y) = 20 + 4 → 4x = 24 → x = 6. Substitusi ke x − y = 4: 6 − y = 4 → y = 2. Jadi x + y = 6 + 2 = 8. Cek: 3(6) + 2 = 20 ✓, 6 − 2 = 4 ✓.',
   ARRAY['sering-keluar']),

  ('cc100001-0000-0000-0000-000000000007',
   'c0000001-0000-0000-0000-000000000001',
   'POLRI', 'MATEMATIKA', 'Aljabar', 'MULTIPLE_CHOICE', 'SEDANG', 5,
   'Jika a + b = 12 dan a² + b² = 80, maka nilai ab adalah...',
   '[{"id":"A","text":"28"},{"id":"B","text":"30"},{"id":"C","text":"32"},{"id":"D","text":"36"}]',
   'C',
   '(a + b)² = a² + 2ab + b². 12² = 80 + 2ab. 144 = 80 + 2ab. 2ab = 64. ab = 32.',
   ARRAY['sering-keluar']),

-- ============================================================
-- MATEMATIKA — Geometri (3 soal)
-- ============================================================

  ('cc100001-0000-0000-0000-000000000008',
   'c0000001-0000-0000-0000-000000000001',
   'POLRI', 'MATEMATIKA', 'Geometri', 'MULTIPLE_CHOICE', 'MUDAH', 7,
   'Luas sebuah persegi dengan sisi 12 cm adalah...',
   '[{"id":"A","text":"120 cm²"},{"id":"B","text":"132 cm²"},{"id":"C","text":"144 cm²"},{"id":"D","text":"156 cm²"}]',
   'C',
   'Luas persegi = sisi × sisi = 12 × 12 = 144 cm².',
   ARRAY['sering-keluar']),

  ('cc100001-0000-0000-0000-000000000009',
   'c0000001-0000-0000-0000-000000000001',
   'POLRI', 'MATEMATIKA', 'Geometri', 'MULTIPLE_CHOICE', 'SEDANG', 7,
   'Sebuah kolam berbentuk trapesium dengan sisi sejajar 10 m dan 14 m, serta tinggi 6 m. Berapa luas kolam tersebut?',
   '[{"id":"A","text":"60 m²"},{"id":"B","text":"72 m²"},{"id":"C","text":"80 m²"},{"id":"D","text":"96 m²"}]',
   'B',
   'Luas trapesium = ½ × (jumlah sisi sejajar) × tinggi = ½ × (10 + 14) × 6 = ½ × 24 × 6 = 72 m².',
   ARRAY['sering-keluar']),

  ('cc100001-0000-0000-0000-000000000010',
   'c0000001-0000-0000-0000-000000000001',
   'POLRI', 'MATEMATIKA', 'Geometri', 'MULTIPLE_CHOICE', 'SEDANG', 7,
   'Keliling sebuah lingkaran dengan diameter 14 cm adalah... (π = 22/7)',
   '[{"id":"A","text":"22 cm"},{"id":"B","text":"44 cm"},{"id":"C","text":"66 cm"},{"id":"D","text":"88 cm"}]',
   'B',
   'Keliling lingkaran = π × diameter = (22/7) × 14 = 22 × 2 = 44 cm.',
   ARRAY['sering-keluar']),

-- ============================================================
-- BAHASA INDONESIA — Pemahaman Bacaan (4 soal)
-- ============================================================

  ('cc200001-0000-0000-0000-000000000001',
   'c0000001-0000-0000-0000-000000000002',
   'POLRI', 'BAHASA_INDONESIA', 'Pemahaman Bacaan', 'MULTIPLE_CHOICE', 'SEDANG', 7,
   'Bacalah paragraf berikut: "Kepolisian Negara Republik Indonesia dalam melaksanakan tugas dan wewenangnya wajib memelihara kepercayaan masyarakat. Hal ini dilakukan melalui pelayanan prima, penghormatan terhadap hak asasi manusia, dan tindakan yang transparan dan akuntabel." Simpulan yang tepat dari paragraf tersebut adalah...',
   '[{"id":"A","text":"Polri hanya bertugas melayani masyarakat"},{"id":"B","text":"Kepercayaan masyarakat dibangun melalui pelayanan dan integritas Polri"},{"id":"C","text":"HAM merupakan prioritas utama Polri"},{"id":"D","text":"Transparansi adalah satu-satunya cara membangun kepercayaan"}]',
   'B',
   'Simpulan mencakup keseluruhan isi paragraf. Paragraf menyatakan kepercayaan dibangun lewat tiga cara: pelayanan prima, penghormatan HAM, dan transparansi/akuntabilitas. Pilihan B merangkum inti tersebut paling tepat.',
   ARRAY['sering-keluar']),

  ('cc200001-0000-0000-0000-000000000002',
   'c0000001-0000-0000-0000-000000000002',
   'POLRI', 'BAHASA_INDONESIA', 'Pemahaman Bacaan', 'MULTIPLE_CHOICE', 'MUDAH', 7,
   'Manakah kalimat di bawah ini yang merupakan kalimat efektif?',
   '[{"id":"A","text":"Kami semua telah pergi ke kantor polisi bersama-sama dengan kami"},{"id":"B","text":"Para siswa-siswi mengikuti seleksi masuk Polri"},{"id":"C","text":"Anggota Polri bertugas menjaga keamanan dan ketertiban masyarakat"},{"id":"D","text":"Di dalam kantor tersebut terdapat banyak polisi-polisi yang bertugas"}]',
   'C',
   'Kalimat efektif adalah kalimat yang padat, jelas, dan tidak mengandung unsur berlebihan. Pilihan C adalah kalimat yang paling efektif. A ("kami bersama-sama dengan kami") dan B ("para siswa-siswi" = tautologi) dan D ("polisi-polisi" setelah "banyak") mengandung pemborosan kata.',
   ARRAY['sering-keluar']),

  ('cc200001-0000-0000-0000-000000000003',
   'c0000001-0000-0000-0000-000000000002',
   'POLRI', 'BAHASA_INDONESIA', 'Pemahaman Bacaan', 'MULTIPLE_CHOICE', 'SEDANG', 7,
   'Kata "akuntabel" dalam kalimat "tindakan yang transparan dan akuntabel" memiliki makna...',
   '[{"id":"A","text":"Dapat dipercaya dan jujur"},{"id":"B","text":"Dapat dipertanggungjawabkan"},{"id":"C","text":"Terbuka untuk umum"},{"id":"D","text":"Bebas dari korupsi"}]',
   'B',
   '"Akuntabel" berasal dari kata "akuntabilitas" (accountability) yang berarti dapat dipertanggungjawabkan kepada pihak yang berwenang dan masyarakat. Ini berbeda dari "transparan" yang lebih menekankan keterbukaan.',
   ARRAY['sering-keluar']),

  ('cc200001-0000-0000-0000-000000000004',
   'c0000001-0000-0000-0000-000000000002',
   'POLRI', 'BAHASA_INDONESIA', 'Pemahaman Bacaan', 'MULTIPLE_CHOICE', 'SULIT', 7,
   'Perhatikan kalimat: "Sehubungan dengan hal itu, pihak kepolisian akan memperketat pengamanan di sekitar area tersebut." Frasa "sehubungan dengan hal itu" berfungsi sebagai...',
   '[{"id":"A","text":"Konjungsi tujuan"},{"id":"B","text":"Konjungsi antar kalimat yang menyatakan hubungan"},{"id":"C","text":"Konjungsi pertentangan"},{"id":"D","text":"Frasa keterangan waktu"}]',
   'B',
   '"Sehubungan dengan hal itu" adalah konjungsi antarkalimat yang menunjukkan hubungan kausalitas atau relevansi antara satu kalimat dengan kalimat sebelumnya. Fungsinya untuk mengaitkan ide antarparagraf atau antarkalimat.',
   ARRAY['sering-keluar']),

-- ============================================================
-- BAHASA INDONESIA — Tata Bahasa (3 soal)
-- ============================================================

  ('cc200001-0000-0000-0000-000000000005',
   'c0000001-0000-0000-0000-000000000002',
   'POLRI', 'BAHASA_INDONESIA', 'Tata Bahasa', 'MULTIPLE_CHOICE', 'MUDAH', 6,
   'Bentuk kata ulang yang menyatakan makna "banyak" adalah...',
   '[{"id":"A","text":"mondar-mandir"},{"id":"B","text":"mobil-mobilan"},{"id":"C","text":"buku-buku"},{"id":"D","text":"sayur-mayur"}]',
   'C',
   '"Buku-buku" adalah kata ulang penuh yang menyatakan makna jamak/banyak. "Mondar-mandir" = berulang. "Mobil-mobilan" = menyerupai. "Sayur-mayur" = bermacam-macam jenis.',
   ARRAY['sering-keluar']),

  ('cc200001-0000-0000-0000-000000000006',
   'c0000001-0000-0000-0000-000000000002',
   'POLRI', 'BAHASA_INDONESIA', 'Tata Bahasa', 'MULTIPLE_CHOICE', 'SEDANG', 6,
   'Kalimat yang menggunakan konjungsi "walaupun" dengan benar adalah...',
   '[{"id":"A","text":"Ia lulus seleksi walaupun sudah belajar keras"},{"id":"B","text":"Walaupun cuaca hujan, operasi tetap dilanjutkan"},{"id":"C","text":"Ia tidak hadir walaupun ada rapat"},{"id":"D","text":"Walaupun karena sakit ia tidak bisa hadir"}]',
   'B',
   '"Walaupun" adalah konjungsi subordinatif konsesif yang menghubungkan dua klausa yang bertentangan. Pola yang benar: [walaupun + kondisi], [hasil yang bertentangan]. Pilihan B menunjukkan pola ini dengan tepat: walaupun hujan, operasi tetap jalan.',
   ARRAY['sering-keluar']),

  ('cc200001-0000-0000-0000-000000000007',
   'c0000001-0000-0000-0000-000000000002',
   'POLRI', 'BAHASA_INDONESIA', 'Tata Bahasa', 'MULTIPLE_CHOICE', 'SEDANG', 6,
   'Manakah penulisan kata berimbuhan yang benar?',
   '[{"id":"A","text":"mem-bantu"},{"id":"B","text":"mentransfer"},{"id":"C","text":"mengkomunikasikan"},{"id":"D","text":"memperlakukan"}]',
   'D',
   '"Memperlakukan" (me- + per + lakukan) adalah bentuk yang tepat. "Mentransfer" seharusnya "mentransfer" (me+N: trans→tetap karena gugus konsonan tr). "Mengkomunikasikan" seharusnya "mengomunikasikan" (k luluh setelah me-). Pilihan D sudah benar secara morfologi.',
   ARRAY['sering-keluar']),

-- ============================================================
-- BAHASA INDONESIA — Ejaan (3 soal)
-- ============================================================

  ('cc200001-0000-0000-0000-000000000008',
   'c0000001-0000-0000-0000-000000000002',
   'POLRI', 'BAHASA_INDONESIA', 'Ejaan', 'MULTIPLE_CHOICE', 'MUDAH', 3,
   'Penulisan gelar yang benar adalah...',
   '[{"id":"A","text":"Kompol. Budi Santoso, S.H"},{"id":"B","text":"KOMPOL Budi Santoso S.H."},{"id":"C","text":"Kompol Budi Santoso, S.H."},{"id":"D","text":"kompol budi santoso, s.h."}]',
   'C',
   'Penulisan pangkat/gelar: singkatan pangkat diikuti nama orang tidak menggunakan tanda titik. Gelar akademik di belakang nama menggunakan tanda titik dan dipisahkan koma dari nama. Pilihan C adalah penulisan yang paling tepat.',
   ARRAY['sering-keluar']),

  ('cc200001-0000-0000-0000-000000000009',
   'c0000001-0000-0000-0000-000000000002',
   'POLRI', 'BAHASA_INDONESIA', 'Ejaan', 'MULTIPLE_CHOICE', 'SEDANG', 3,
   'Penulisan angka yang benar dalam kalimat resmi adalah...',
   '[{"id":"A","text":"Kecelakaan terjadi pada pukul 3 sore"},{"id":"B","text":"Kecelakaan terjadi pada pukul tiga sore"},{"id":"C","text":"Kecelakaan terjadi pada pukul 15.00"},{"id":"D","text":"Kecelakaan terjadi pada pukul 15:00"}]',
   'C',
   'Dalam penulisan resmi, waktu ditulis dalam format 24 jam menggunakan tanda titik sebagai pemisah jam dan menit (15.00), bukan tanda titik dua (15:00) yang merupakan format internasional/asing.',
   ARRAY['sering-keluar']),

  ('cc200001-0000-0000-0000-000000000010',
   'c0000001-0000-0000-0000-000000000002',
   'POLRI', 'BAHASA_INDONESIA', 'Ejaan', 'MULTIPLE_CHOICE', 'MUDAH', 3,
   'Penulisan kata majemuk yang benar adalah...',
   '[{"id":"A","text":"rumah sakit"},{"id":"B","text":"rumahsakit"},{"id":"C","text":"Rumah Sakit"},{"id":"D","text":"rumah-sakit"}]',
   'A',
   '"Rumah sakit" adalah kata majemuk yang ditulis terpisah dan huruf kecil semua (kecuali di awal kalimat atau untuk nama institusi). Kata majemuk dalam bahasa Indonesia umumnya ditulis terpisah, bukan digabung atau menggunakan tanda hubung.',
   ARRAY['sering-keluar']),

-- ============================================================
-- PENGETAHUAN UMUM — Sejarah (4 soal)
-- ============================================================

  ('cc300001-0000-0000-0000-000000000001',
   'c0000001-0000-0000-0000-000000000003',
   'POLRI', 'PENGETAHUAN_UMUM', 'Sejarah Indonesia', 'MULTIPLE_CHOICE', 'MUDAH', 6,
   'Kepolisian Negara Republik Indonesia (Polri) secara resmi berdiri tanggal...',
   '[{"id":"A","text":"1 Juli 1946"},{"id":"B","text":"17 Agustus 1945"},{"id":"C","text":"19 Agustus 1945"},{"id":"D","text":"5 Oktober 1945"}]',
   'A',
   'Hari Bhayangkara diperingati setiap 1 Juli, yang menandai hari Polri berdiri sebagai lembaga tersendiri di bawah Presiden pada tanggal 1 Juli 1946. Pada awal kemerdekaan, Polri masih berada di bawah koordinasi militer.',
   ARRAY['sering-keluar']),

  ('cc300001-0000-0000-0000-000000000002',
   'c0000001-0000-0000-0000-000000000003',
   'POLRI', 'PENGETAHUAN_UMUM', 'Sejarah Indonesia', 'MULTIPLE_CHOICE', 'SEDANG', 6,
   'Reformasi Polri yang memisahkan Polri dari TNI terjadi pada era...',
   '[{"id":"A","text":"Orde Lama, 1959"},{"id":"B","text":"Orde Baru, 1978"},{"id":"C","text":"Reformasi, 1999-2000"},{"id":"D","text":"Era SBY, 2005"}]',
   'C',
   'Pemisahan Polri dari TNI (ABRI) dilakukan pada era Reformasi. Secara resmi Polri dipisahkan dari ABRI melalui Instruksi Presiden No. 2 Tahun 1999 dan dikukuhkan dengan Tap MPR No. VI/MPR/2000.',
   ARRAY['sering-keluar']),

  ('cc300001-0000-0000-0000-000000000003',
   'c0000001-0000-0000-0000-000000000003',
   'POLRI', 'PENGETAHUAN_UMUM', 'Sejarah Indonesia', 'MULTIPLE_CHOICE', 'MUDAH', 6,
   'Sumpah Pemuda yang menjadi tonggak persatuan bangsa Indonesia diikrarkan pada tahun...',
   '[{"id":"A","text":"1926"},{"id":"B","text":"1927"},{"id":"C","text":"1928"},{"id":"D","text":"1930"}]',
   'C',
   'Sumpah Pemuda dikrarkan pada Kongres Pemuda II tanggal 28 Oktober 1928 di Batavia (Jakarta). Ikrar ini menyatukan tekad pemuda Indonesia: satu tanah air, satu bangsa, dan satu bahasa.',
   ARRAY['sering-keluar']),

  ('cc300001-0000-0000-0000-000000000004',
   'c0000001-0000-0000-0000-000000000003',
   'POLRI', 'PENGETAHUAN_UMUM', 'Sejarah Indonesia', 'MULTIPLE_CHOICE', 'SEDANG', 6,
   'Konferensi Meja Bundar (KMB) yang menghasilkan pengakuan kedaulatan Indonesia oleh Belanda berlangsung di...',
   '[{"id":"A","text":"Amsterdam, 1949"},{"id":"B","text":"Den Haag, 1949"},{"id":"C","text":"Rotterdam, 1950"},{"id":"D","text":"Brussel, 1949"}]',
   'B',
   'Konferensi Meja Bundar (KMB) berlangsung di Den Haag, Belanda, pada 23 Agustus − 2 November 1949. Hasil KMB adalah Belanda mengakui kedaulatan Indonesia pada 27 Desember 1949.',
   ARRAY['sering-keluar']),

-- ============================================================
-- PENGETAHUAN UMUM — Geografi (3 soal)
-- ============================================================

  ('cc300001-0000-0000-0000-000000000005',
   'c0000001-0000-0000-0000-000000000003',
   'POLRI', 'PENGETAHUAN_UMUM', 'Geografi', 'MULTIPLE_CHOICE', 'MUDAH', 5,
   'Ibu kota Indonesia yang baru (IKN) yang sedang dibangun berlokasi di provinsi...',
   '[{"id":"A","text":"Kalimantan Selatan"},{"id":"B","text":"Kalimantan Tengah"},{"id":"C","text":"Kalimantan Timur"},{"id":"D","text":"Kalimantan Barat"}]',
   'C',
   'Ibu Kota Nusantara (IKN) dibangun di Kabupaten Penajam Paser Utara dan sebagian Kutai Kartanegara, Provinsi Kalimantan Timur. Pemindahan ini diatur dalam UU No. 3 Tahun 2022.',
   ARRAY['sering-keluar']),

  ('cc300001-0000-0000-0000-000000000006',
   'c0000001-0000-0000-0000-000000000003',
   'POLRI', 'PENGETAHUAN_UMUM', 'Geografi', 'MULTIPLE_CHOICE', 'SEDANG', 5,
   'Di antara pilihan berikut, pulau yang wilayahnya DIBAGI dengan negara lain (bukan sepenuhnya milik Indonesia) adalah...',
   '[{"id":"A","text":"Sumatera"},{"id":"B","text":"Kalimantan"},{"id":"C","text":"Jawa"},{"id":"D","text":"Sulawesi"}]',
   'B',
   'Kalimantan adalah pulau yang wilayahnya dibagi tiga negara: Indonesia (Kalimantan Barat, Tengah, Selatan, Timur, dan Utara), Malaysia (Sabah dan Sarawak), dan Brunei Darussalam. Sumatera, Jawa, dan Sulawesi seluruhnya berada dalam wilayah NKRI.',
   ARRAY['sering-keluar']),

  ('cc300001-0000-0000-0000-000000000007',
   'c0000001-0000-0000-0000-000000000003',
   'POLRI', 'PENGETAHUAN_UMUM', 'Geografi', 'MULTIPLE_CHOICE', 'MUDAH', 5,
   'Negara yang berbatasan darat langsung dengan Indonesia adalah...',
   '[{"id":"A","text":"Australia, Malaysia, Papua Nugini"},{"id":"B","text":"Malaysia, Papua Nugini, Timor Leste"},{"id":"C","text":"Filipina, Malaysia, Papua Nugini"},{"id":"D","text":"Malaysia, Brunei, Singapura"}]',
   'B',
   'Indonesia berbatasan darat langsung dengan tiga negara: Malaysia (di Pulau Kalimantan), Papua Nugini (di Pulau Papua), dan Timor Leste (di Pulau Timor). Australia berbatasan laut, bukan darat.',
   ARRAY['sering-keluar']),

-- ============================================================
-- PENGETAHUAN UMUM — IPA Umum (3 soal)
-- ============================================================

  ('cc300001-0000-0000-0000-000000000008',
   'c0000001-0000-0000-0000-000000000003',
   'POLRI', 'PENGETAHUAN_UMUM', 'Ilmu Pengetahuan Alam', 'MULTIPLE_CHOICE', 'MUDAH', 7,
   'Gas yang paling banyak terdapat di atmosfer bumi adalah...',
   '[{"id":"A","text":"Oksigen (O₂)"},{"id":"B","text":"Karbon dioksida (CO₂)"},{"id":"C","text":"Nitrogen (N₂)"},{"id":"D","text":"Argon (Ar)"}]',
   'C',
   'Nitrogen (N₂) merupakan gas terbanyak di atmosfer bumi, sekitar 78%. Urutan gas di atmosfer: Nitrogen (78%), Oksigen (21%), Argon (0,93%), Karbon dioksida (0,04%), dan gas lainnya.',
   ARRAY['sering-keluar']),

  ('cc300001-0000-0000-0000-000000000009',
   'c0000001-0000-0000-0000-000000000003',
   'POLRI', 'PENGETAHUAN_UMUM', 'Ilmu Pengetahuan Alam', 'MULTIPLE_CHOICE', 'MUDAH', 7,
   'Proses yang terjadi ketika tanaman mengubah sinar matahari menjadi energi kimia disebut...',
   '[{"id":"A","text":"Respirasi"},{"id":"B","text":"Transpirasi"},{"id":"C","text":"Fotosintesis"},{"id":"D","text":"Fermentasi"}]',
   'C',
   'Fotosintesis adalah proses biokimia di mana tanaman, alga, dan beberapa bakteri menggunakan energi cahaya matahari untuk mengubah CO₂ dan air menjadi glukosa dan oksigen. Rumus: 6CO₂ + 6H₂O + cahaya → C₆H₁₂O₆ + 6O₂.',
   ARRAY['sering-keluar']),

  ('cc300001-0000-0000-0000-000000000010',
   'c0000001-0000-0000-0000-000000000003',
   'POLRI', 'PENGETAHUAN_UMUM', 'Ilmu Pengetahuan Alam', 'MULTIPLE_CHOICE', 'SEDANG', 7,
   'Golongan darah O dikatakan sebagai donor universal karena...',
   '[{"id":"A","text":"Dapat menerima darah dari semua golongan"},{"id":"B","text":"Tidak memiliki antigen A maupun B pada sel darah merahnya"},{"id":"C","text":"Memiliki antibodi yang kuat"},{"id":"D","text":"Paling banyak ditemukan di masyarakat"}]',
   'B',
   'Golongan darah O disebut donor universal karena sel darah merahnya tidak memiliki antigen A maupun antigen B, sehingga tidak akan ditolak oleh sistem imun penerima dari golongan darah manapun (dalam kondisi darurat).',
   ARRAY['sering-keluar']),

-- ============================================================
-- PSIKOTES — Deret Angka (3 soal)
-- ============================================================

  ('cc400001-0000-0000-0000-000000000001',
   'c0000001-0000-0000-0000-000000000004',
   'POLRI', 'PSIKOTES', 'Deret Angka', 'MULTIPLE_CHOICE', 'MUDAH', 8,
   'Tentukan angka berikutnya: 5, 10, 20, 40, 80, ...',
   '[{"id":"A","text":"120"},{"id":"B","text":"140"},{"id":"C","text":"160"},{"id":"D","text":"180"}]',
   'C',
   'Deret geometri dengan rasio 2 (setiap suku dikalikan 2). 5→10→20→40→80→160. Suku berikutnya = 80 × 2 = 160.',
   ARRAY['sering-keluar']),

  ('cc400001-0000-0000-0000-000000000002',
   'c0000001-0000-0000-0000-000000000004',
   'POLRI', 'PSIKOTES', 'Deret Angka', 'MULTIPLE_CHOICE', 'SEDANG', 8,
   'Tentukan angka berikutnya: 100, 92, 85, 79, 74, ...',
   '[{"id":"A","text":"68"},{"id":"B","text":"69"},{"id":"C","text":"70"},{"id":"D","text":"71"}]',
   'C',
   'Selisih antar suku: -8, -7, -6, -5, ... (berkurang 1 setiap langkah). Selisih berikutnya = -4. Suku berikutnya = 74 − 4 = 70.',
   ARRAY['sering-keluar']),

  ('cc400001-0000-0000-0000-000000000003',
   'c0000001-0000-0000-0000-000000000004',
   'POLRI', 'PSIKOTES', 'Deret Angka', 'MULTIPLE_CHOICE', 'SEDANG', 8,
   'Temukan angka yang hilang: 3, 6, ?, 24, 48',
   '[{"id":"A","text":"10"},{"id":"B","text":"12"},{"id":"C","text":"14"},{"id":"D","text":"16"}]',
   'B',
   'Deret geometri dengan rasio 2 (setiap suku dikalikan 2). 3→6→12→24→48. Angka yang hilang adalah 12.',
   ARRAY['sering-keluar']),

-- ============================================================
-- PSIKOTES — Logika Sederhana (2 soal)
-- ============================================================

  ('cc400001-0000-0000-0000-000000000004',
   'c0000001-0000-0000-0000-000000000004',
   'POLRI', 'PSIKOTES', 'Logika Sederhana', 'MULTIPLE_CHOICE', 'SEDANG', 8,
   'Semua polisi wajib jujur. Budi adalah seorang polisi. Kesimpulan yang tepat adalah...',
   '[{"id":"A","text":"Budi mungkin jujur"},{"id":"B","text":"Budi pasti jujur"},{"id":"C","text":"Budi tidak selalu jujur"},{"id":"D","text":"Budi wajib menjadi polisi"}]',
   'B',
   'Ini adalah silogisme kategoris. Premis mayor: semua polisi wajib jujur. Premis minor: Budi adalah polisi. Kesimpulan logis: Budi (sebagai polisi) wajib jujur, artinya Budi pasti jujur.',
   ARRAY['sering-keluar']),

  ('cc400001-0000-0000-0000-000000000005',
   'c0000001-0000-0000-0000-000000000004',
   'POLRI', 'PSIKOTES', 'Logika Sederhana', 'MULTIPLE_CHOICE', 'SEDANG', 8,
   'Jika tidak hujan, maka Ani pergi patroli. Hari ini Ani tidak pergi patroli. Kesimpulan yang tepat adalah...',
   '[{"id":"A","text":"Hari ini tidak hujan"},{"id":"B","text":"Hari ini hujan"},{"id":"C","text":"Ani sakit"},{"id":"D","text":"Ani malas bertugas"}]',
   'B',
   'Ini adalah modus tollens: jika P → Q, dan bukan Q, maka bukan P. Premis: jika tidak hujan (P) → Ani patroli (Q). Fakta: Ani tidak patroli (bukan Q). Kesimpulan: hari ini hujan (bukan P = tidak berlaku, artinya P salah = hujan).',
   ARRAY['sering-keluar']),

-- ============================================================
-- PENGETAHUAN HUKUM — Hukum Pidana / KUHP (5 soal)
-- ============================================================

  ('cc500001-0000-0000-0000-000000000001',
   'c0000001-0000-0000-0000-000000000005',
   'POLRI', 'PENGETAHUAN_HUKUM', 'Hukum Pidana (KUHP)', 'MULTIPLE_CHOICE', 'SEDANG', 8,
   'Pasal 338 KUHP mengatur tentang...',
   '[{"id":"A","text":"Pencurian biasa"},{"id":"B","text":"Pembunuhan biasa"},{"id":"C","text":"Pembunuhan berencana"},{"id":"D","text":"Penganiayaan berat"}]',
   'B',
   'Pasal 338 KUHP mengatur tentang pembunuhan biasa (doodslag), yaitu "Barang siapa dengan sengaja merampas nyawa orang lain, diancam karena pembunuhan dengan pidana penjara paling lama 15 tahun." Pembunuhan berencana diatur dalam Pasal 340 KUHP.',
   ARRAY['sering-keluar']),

  ('cc500001-0000-0000-0000-000000000002',
   'c0000001-0000-0000-0000-000000000005',
   'POLRI', 'PENGETAHUAN_HUKUM', 'Hukum Pidana (KUHP)', 'MULTIPLE_CHOICE', 'SEDANG', 8,
   'Pasal 340 KUHP mengatur tentang pembunuhan berencana dengan ancaman hukuman...',
   '[{"id":"A","text":"Penjara maksimal 15 tahun"},{"id":"B","text":"Penjara maksimal 20 tahun"},{"id":"C","text":"Pidana mati, penjara seumur hidup, atau penjara 20 tahun"},{"id":"D","text":"Penjara seumur hidup saja"}]',
   'C',
   'Pasal 340 KUHP berbunyi: "Barang siapa dengan sengaja dan dengan rencana lebih dahulu merampas nyawa orang lain, diancam karena pembunuhan dengan rencana, dengan pidana mati atau pidana penjara seumur hidup atau selama waktu tertentu, paling lama dua puluh tahun."',
   ARRAY['sering-keluar']),

  ('cc500001-0000-0000-0000-000000000003',
   'c0000001-0000-0000-0000-000000000005',
   'POLRI', 'PENGETAHUAN_HUKUM', 'Hukum Pidana (KUHP)', 'MULTIPLE_CHOICE', 'SEDANG', 8,
   'Tindak pidana pencurian biasa diatur dalam KUHP Pasal...',
   '[{"id":"A","text":"Pasal 351"},{"id":"B","text":"Pasal 362"},{"id":"C","text":"Pasal 368"},{"id":"D","text":"Pasal 372"}]',
   'B',
   'Pasal 362 KUHP mengatur tentang pencurian biasa: "Barang siapa mengambil barang sesuatu, yang seluruhnya atau sebagian kepunyaan orang lain, dengan maksud untuk dimiliki secara melawan hukum, diancam karena pencurian, dengan pidana penjara paling lama 5 tahun."',
   ARRAY['sering-keluar']),

  ('cc500001-0000-0000-0000-000000000004',
   'c0000001-0000-0000-0000-000000000005',
   'POLRI', 'PENGETAHUAN_HUKUM', 'Hukum Pidana (KUHP)', 'MULTIPLE_CHOICE', 'SULIT', 8,
   'Pencurian dengan kekerasan (begal/perampokan) diatur dalam KUHP Pasal...',
   '[{"id":"A","text":"Pasal 362"},{"id":"B","text":"Pasal 363"},{"id":"C","text":"Pasal 365"},{"id":"D","text":"Pasal 368"}]',
   'C',
   'Pasal 365 KUHP mengatur pencurian dengan kekerasan atau ancaman kekerasan. Ancamannya lebih berat dari pencurian biasa (Pasal 362) atau pencurian dengan pemberatan (Pasal 363). Jika mengakibatkan kematian, ancaman bisa penjara seumur hidup.',
   ARRAY['sering-keluar']),

  ('cc500001-0000-0000-0000-000000000005',
   'c0000001-0000-0000-0000-000000000005',
   'POLRI', 'PENGETAHUAN_HUKUM', 'Hukum Pidana (KUHP)', 'MULTIPLE_CHOICE', 'SEDANG', 8,
   'Pasal 351 KUHP mengatur tentang...',
   '[{"id":"A","text":"Penggelapan"},{"id":"B","text":"Penipuan"},{"id":"C","text":"Penganiayaan"},{"id":"D","text":"Penadahan"}]',
   'C',
   'Pasal 351 KUHP mengatur tentang penganiayaan (mishandeling). Ayat 1: penganiayaan diancam penjara maksimal 2 tahun 8 bulan. Ayat 2: jika mengakibatkan luka berat, maksimal 5 tahun. Ayat 3: jika mengakibatkan kematian, maksimal 7 tahun.',
   ARRAY['sering-keluar']),

-- ============================================================
-- PENGETAHUAN HUKUM — Hukum Perdata / KUHPer (3 soal)
-- ============================================================

  ('cc500001-0000-0000-0000-000000000006',
   'c0000001-0000-0000-0000-000000000005',
   'POLRI', 'PENGETAHUAN_HUKUM', 'Hukum Perdata (KUHPer)', 'MULTIPLE_CHOICE', 'SEDANG', 7,
   'Syarat sahnya suatu perjanjian menurut Pasal 1320 KUHPerdata adalah...',
   '[{"id":"A","text":"Ada saksi, tertulis, bermaterai, dan notaris"},{"id":"B","text":"Sepakat, cakap, objek tertentu, dan causa yang halal"},{"id":"C","text":"Ada imbalan, jelas tujuannya, tertulis, dan ditandatangani"},{"id":"D","text":"Bebas, sah, jelas, dan bermaterai"}]',
   'B',
   'Pasal 1320 KUHPerdata menyebutkan empat syarat sahnya perjanjian: (1) kesepakatan mereka yang mengikatkan dirinya, (2) kecakapan untuk membuat suatu perikatan, (3) suatu pokok persoalan tertentu, dan (4) suatu sebab yang tidak terlarang (causa yang halal).',
   ARRAY['sering-keluar']),

  ('cc500001-0000-0000-0000-000000000007',
   'c0000001-0000-0000-0000-000000000005',
   'POLRI', 'PENGETAHUAN_HUKUM', 'Hukum Perdata (KUHPer)', 'MULTIPLE_CHOICE', 'SEDANG', 7,
   'Perbuatan melawan hukum dalam hukum perdata Indonesia diatur dalam KUHPerdata Pasal...',
   '[{"id":"A","text":"Pasal 1313"},{"id":"B","text":"Pasal 1320"},{"id":"C","text":"Pasal 1365"},{"id":"D","text":"Pasal 1457"}]',
   'C',
   'Pasal 1365 KUHPerdata mengatur tentang perbuatan melawan hukum (onrechtmatige daad): "Tiap perbuatan yang melanggar hukum dan membawa kerugian kepada orang lain, mewajibkan orang yang menimbulkan kerugian itu karena kesalahannya untuk mengganti kerugian tersebut."',
   ARRAY['sering-keluar']),

  ('cc500001-0000-0000-0000-000000000008',
   'c0000001-0000-0000-0000-000000000005',
   'POLRI', 'PENGETAHUAN_HUKUM', 'Hukum Perdata (KUHPer)', 'MULTIPLE_CHOICE', 'SULIT', 7,
   'Kadaluwarsa (verjaring) suatu tuntutan perdata dalam KUHPerdata secara umum berlaku selama...',
   '[{"id":"A","text":"5 tahun"},{"id":"B","text":"10 tahun"},{"id":"C","text":"20 tahun"},{"id":"D","text":"30 tahun"}]',
   'D',
   'Pasal 1967 KUHPerdata menyatakan bahwa semua tuntutan hukum, baik yang bersifat kebendaan maupun yang bersifat perorangan, hapus karena daluwarsa setelah 30 tahun, terhitung sejak saat tuntutan dapat diajukan. Namun ada kadaluwarsa khusus yang lebih pendek untuk kasus tertentu.',
   ARRAY['jarang-keluar']),

-- ============================================================
-- PENGETAHUAN HUKUM — Hukum Tata Negara & HAM (4 soal)
-- ============================================================

  ('cc500001-0000-0000-0000-000000000009',
   'c0000001-0000-0000-0000-000000000005',
   'POLRI', 'PENGETAHUAN_HUKUM', 'Hukum Tata Negara dan HAM', 'MULTIPLE_CHOICE', 'MUDAH', 6,
   'Hak untuk hidup sebagai hak asasi manusia yang tidak dapat dikurangi dalam keadaan apapun (non-derogable rights) diatur dalam UUD 1945 Pasal...',
   '[{"id":"A","text":"Pasal 27 ayat (1)"},{"id":"B","text":"Pasal 28A"},{"id":"C","text":"Pasal 28I ayat (1)"},{"id":"D","text":"Pasal 30 ayat (1)"}]',
   'C',
   'Pasal 28I ayat (1) UUD 1945 menyatakan: "Hak untuk hidup, hak untuk tidak disiksa, hak kemerdekaan pikiran dan hati nurani, hak beragama, hak untuk tidak diperbudak, hak untuk diakui sebagai pribadi di hadapan hukum, dan hak untuk tidak dituntut atas dasar hukum yang berlaku surut adalah hak asasi manusia yang tidak dapat dikurangi dalam keadaan apapun."',
   ARRAY['sering-keluar']),

  ('cc500001-0000-0000-0000-000000000010',
   'c0000001-0000-0000-0000-000000000005',
   'POLRI', 'PENGETAHUAN_HUKUM', 'Hukum Tata Negara dan HAM', 'MULTIPLE_CHOICE', 'SEDANG', 6,
   'Undang-Undang yang mengatur tentang Hak Asasi Manusia di Indonesia adalah...',
   '[{"id":"A","text":"UU No. 39 Tahun 1999"},{"id":"B","text":"UU No. 26 Tahun 2000"},{"id":"C","text":"UU No. 40 Tahun 2008"},{"id":"D","text":"UU No. 12 Tahun 2005"}]',
   'A',
   'UU No. 39 Tahun 1999 tentang Hak Asasi Manusia adalah undang-undang pokok yang mengatur HAM di Indonesia, mulai dari hak sipil, politik, ekonomi, sosial, dan budaya. UU No. 26 Tahun 2000 mengatur Pengadilan HAM untuk kejahatan berat.',
   ARRAY['sering-keluar']),

  ('cc500001-0000-0000-0000-000000000011',
   'c0000001-0000-0000-0000-000000000005',
   'POLRI', 'PENGETAHUAN_HUKUM', 'Hukum Tata Negara dan HAM', 'MULTIPLE_CHOICE', 'SEDANG', 6,
   'Mahkamah Konstitusi (MK) berwenang untuk mengadili...',
   '[{"id":"A","text":"Tindak pidana korupsi"},{"id":"B","text":"Pengujian undang-undang terhadap UUD 1945"},{"id":"C","text":"Sengketa antara individu dengan pemerintah"},{"id":"D","text":"Pelanggaran HAM berat"}]',
   'B',
   'Kewenangan Mahkamah Konstitusi menurut UUD 1945 Pasal 24C antara lain: (1) menguji UU terhadap UUD, (2) memutus sengketa kewenangan lembaga negara, (3) memutus pembubaran parpol, dan (4) memutus perselisihan hasil pemilu. Tindak pidana korupsi ditangani KPK/Kejaksaan/Polri.',
   ARRAY['sering-keluar']),

  ('cc500001-0000-0000-0000-000000000012',
   'c0000001-0000-0000-0000-000000000005',
   'POLRI', 'PENGETAHUAN_HUKUM', 'Hukum Tata Negara dan HAM', 'MULTIPLE_CHOICE', 'SEDANG', 6,
   'Lembaga yang berwenang melakukan pengawasan terhadap penyelenggaraan negara dan perlindungan HAM di Indonesia adalah...',
   '[{"id":"A","text":"Komisi Yudisial (KY)"},{"id":"B","text":"Komnas HAM"},{"id":"C","text":"Ombudsman RI"},{"id":"D","text":"Mahkamah Agung (MA)"}]',
   'B',
   'Komnas HAM (Komisi Nasional Hak Asasi Manusia) adalah lembaga independen yang bertugas melakukan pengkajian, penelitian, penyuluhan, pemantauan, dan mediasi terkait HAM di Indonesia, berdasarkan UU No. 39 Tahun 1999.',
   ARRAY['sering-keluar']),

-- ============================================================
-- PENGETAHUAN HUKUM — Tugas Pokok Polri (3 soal)
-- ============================================================

  ('cc500001-0000-0000-0000-000000000013',
   'c0000001-0000-0000-0000-000000000005',
   'POLRI', 'PENGETAHUAN_HUKUM', 'Tugas Pokok Polri', 'MULTIPLE_CHOICE', 'MUDAH', 5,
   'Undang-Undang yang mengatur tentang Kepolisian Negara Republik Indonesia adalah...',
   '[{"id":"A","text":"UU No. 34 Tahun 2004"},{"id":"B","text":"UU No. 2 Tahun 2002"},{"id":"C","text":"UU No. 8 Tahun 1981"},{"id":"D","text":"UU No. 3 Tahun 2002"}]',
   'B',
   'UU No. 2 Tahun 2002 tentang Kepolisian Negara Republik Indonesia adalah landasan hukum utama penyelenggaraan fungsi kepolisian. UU No. 34 Tahun 2004 mengatur TNI, UU No. 8 Tahun 1981 adalah KUHAP.',
   ARRAY['sering-keluar']),

  ('cc500001-0000-0000-0000-000000000014',
   'c0000001-0000-0000-0000-000000000005',
   'POLRI', 'PENGETAHUAN_HUKUM', 'Tugas Pokok Polri', 'MULTIPLE_CHOICE', 'SEDANG', 5,
   'Tugas pokok Polri sesuai UU No. 2 Tahun 2002 Pasal 13 adalah...',
   '[{"id":"A","text":"Menegakkan hukum, menjaga ketertiban, dan melindungi masyarakat"},{"id":"B","text":"Memelihara keamanan dan ketertiban masyarakat, menegakkan hukum, serta memberikan perlindungan, pengayoman, dan pelayanan kepada masyarakat"},{"id":"C","text":"Melakukan penyelidikan, penyidikan, dan penuntutan"},{"id":"D","text":"Menjaga pertahanan negara dan keamanan dalam negeri"}]',
   'B',
   'Pasal 13 UU No. 2 Tahun 2002 menyebutkan tugas pokok Polri: (a) memelihara keamanan dan ketertiban masyarakat; (b) menegakkan hukum; dan (c) memberikan perlindungan, pengayoman, dan pelayanan kepada masyarakat.',
   ARRAY['sering-keluar']),

  ('cc500001-0000-0000-0000-000000000015',
   'c0000001-0000-0000-0000-000000000005',
   'POLRI', 'PENGETAHUAN_HUKUM', 'Tugas Pokok Polri', 'MULTIPLE_CHOICE', 'SEDANG', 5,
   'Dalam proses penyidikan, Polri berwenang melakukan penangkapan terhadap tersangka. Berdasarkan KUHAP, penangkapan tanpa surat perintah dapat dilakukan dalam kasus...',
   '[{"id":"A","text":"Kejahatan ringan (tindak pidana dengan ancaman di bawah 1 tahun)"},{"id":"B","text":"Tertangkap tangan (in flagrante delicto)"},{"id":"C","text":"Tersangka dikenal oleh masyarakat luas"},{"id":"D","text":"Tersangka memiliki rekam jejak kriminal"}]',
   'B',
   'Berdasarkan KUHAP (UU No. 8 Tahun 1981) Pasal 18, penangkapan dilakukan dengan surat perintah. Namun penangkapan dapat dilakukan tanpa surat perintah dalam hal tertangkap tangan (in flagrante delicto), dengan ketentuan harus segera menyerahkan tertangkap beserta barang bukti kepada penyidik.',
   ARRAY['sering-keluar'])

ON CONFLICT (id) DO NOTHING;
