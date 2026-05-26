-- ============================================================
-- Seed 003: TNI Questions (50 soal)
-- Distribusi:
--   MATEMATIKA       : 15 soal (Aritmatika 5, Aljabar 5, Geometri 3, Statistika 2)
--   BAHASA_INDONESIA : 12 soal (Pemahaman Bacaan 4, Tata Bahasa 4, Ejaan & Kosakata 4)
--   PENGETAHUAN_UMUM : 12 soal (Sejarah Indonesia 4, Geografi 4, IPA 4)
--   PSIKOTES         :  6 soal (Deret Angka 3, Spasial/Figurasi 3)
--   KEDINASAN        :  5 soal (Regulasi TNI, Tugas Pokok, Bela Negara)
-- Sistem penilaian TNI: benar +4, salah -1 (negative marking)
-- ============================================================

INSERT INTO public.questions
  (id, pack_id, exam_type, subject, subtopic, question_type, difficulty, difficulty_rank,
   question_text, options, correct_option, explanation_text, tags)
VALUES

-- ============================================================
-- MATEMATIKA — Aritmatika (5 soal)
-- ============================================================

  ('bb100001-0000-0000-0000-000000000001',
   'b0000001-0000-0000-0000-000000000001',
   'TNI', 'MATEMATIKA', 'Aritmatika', 'MULTIPLE_CHOICE', 'MUDAH', 3,
   'Jika harga 5 kg beras adalah Rp65.000, berapa harga 8 kg beras?',
   '[{"id":"A","text":"Rp90.000"},{"id":"B","text":"Rp100.000"},{"id":"C","text":"Rp104.000"},{"id":"D","text":"Rp108.000"}]',
   'C',
   'Harga per kg beras = Rp65.000 ÷ 5 = Rp13.000. Harga 8 kg = Rp13.000 × 8 = Rp104.000.',
   ARRAY['sering-keluar']),

  ('bb100001-0000-0000-0000-000000000002',
   'b0000001-0000-0000-0000-000000000001',
   'TNI', 'MATEMATIKA', 'Aritmatika', 'MULTIPLE_CHOICE', 'MUDAH', 3,
   'Seorang prajurit berlari sejauh 12 km dalam 1,5 jam. Berapa kecepatan rata-ratanya dalam km/jam?',
   '[{"id":"A","text":"6 km/jam"},{"id":"B","text":"7 km/jam"},{"id":"C","text":"8 km/jam"},{"id":"D","text":"9 km/jam"}]',
   'C',
   'Kecepatan = Jarak ÷ Waktu = 12 km ÷ 1,5 jam = 8 km/jam.',
   ARRAY['sering-keluar']),

  ('bb100001-0000-0000-0000-000000000003',
   'b0000001-0000-0000-0000-000000000001',
   'TNI', 'MATEMATIKA', 'Aritmatika', 'MULTIPLE_CHOICE', 'SEDANG', 3,
   'Sebuah unit TNI terdiri dari 120 prajurit. Jika 25% dikirim ke medan latihan, berapa prajurit yang tersisa di markas?',
   '[{"id":"A","text":"80 prajurit"},{"id":"B","text":"85 prajurit"},{"id":"C","text":"90 prajurit"},{"id":"D","text":"95 prajurit"}]',
   'C',
   '25% dari 120 = 0,25 × 120 = 30 prajurit dikirim. Tersisa = 120 − 30 = 90 prajurit.',
   ARRAY['sering-keluar']),

  ('bb100001-0000-0000-0000-000000000004',
   'b0000001-0000-0000-0000-000000000001',
   'TNI', 'MATEMATIKA', 'Aritmatika', 'MULTIPLE_CHOICE', 'SEDANG', 3,
   'Seorang penjual menjual barang seharga Rp180.000 dengan keuntungan 20%. Berapa harga beli barang tersebut?',
   '[{"id":"A","text":"Rp144.000"},{"id":"B","text":"Rp150.000"},{"id":"C","text":"Rp156.000"},{"id":"D","text":"Rp160.000"}]',
   'B',
   'Harga jual = Harga beli × (1 + persentase untung). 180.000 = Harga beli × 1,2. Harga beli = 180.000 ÷ 1,2 = Rp150.000.',
   ARRAY['sering-keluar']),

  ('bb100001-0000-0000-0000-000000000005',
   'b0000001-0000-0000-0000-000000000001',
   'TNI', 'MATEMATIKA', 'Aritmatika', 'MULTIPLE_CHOICE', 'SULIT', 3,
   'Dua kendaraan militer berangkat dari kota A dan kota B secara bersamaan menuju satu sama lain. Jarak A ke B adalah 360 km. Kendaraan pertama berkecepatan 60 km/jam dan kendaraan kedua 90 km/jam. Setelah berapa jam keduanya berpapasan?',
   '[{"id":"A","text":"2 jam"},{"id":"B","text":"2,4 jam"},{"id":"C","text":"3 jam"},{"id":"D","text":"3,5 jam"}]',
   'B',
   'Kedua kendaraan bergerak saling mendekati sehingga kecepatan relatif = 60 + 90 = 150 km/jam. Waktu berpapasan = 360 ÷ 150 = 2,4 jam.',
   ARRAY['sering-keluar']),

-- ============================================================
-- MATEMATIKA — Aljabar (5 soal)
-- ============================================================

  ('bb100001-0000-0000-0000-000000000006',
   'b0000001-0000-0000-0000-000000000001',
   'TNI', 'MATEMATIKA', 'Aljabar', 'MULTIPLE_CHOICE', 'MUDAH', 5,
   'Jika 3x + 7 = 22, maka nilai x adalah...',
   '[{"id":"A","text":"4"},{"id":"B","text":"5"},{"id":"C","text":"6"},{"id":"D","text":"7"}]',
   'B',
   '3x + 7 = 22 → 3x = 22 − 7 = 15 → x = 15 ÷ 3 = 5.',
   ARRAY['sering-keluar']),

  ('bb100001-0000-0000-0000-000000000007',
   'b0000001-0000-0000-0000-000000000001',
   'TNI', 'MATEMATIKA', 'Aljabar', 'MULTIPLE_CHOICE', 'MUDAH', 5,
   'Jika 2x − 4 = 10, maka nilai 3x adalah...',
   '[{"id":"A","text":"18"},{"id":"B","text":"21"},{"id":"C","text":"24"},{"id":"D","text":"27"}]',
   'B',
   '2x − 4 = 10 → 2x = 14 → x = 7. Maka 3x = 3 × 7 = 21.',
   ARRAY['sering-keluar']),

  ('bb100001-0000-0000-0000-000000000008',
   'b0000001-0000-0000-0000-000000000001',
   'TNI', 'MATEMATIKA', 'Aljabar', 'MULTIPLE_CHOICE', 'SEDANG', 5,
   'Sistem persamaan: x + y = 10 dan x − y = 4. Nilai x × y adalah...',
   '[{"id":"A","text":"18"},{"id":"B","text":"20"},{"id":"C","text":"21"},{"id":"D","text":"24"}]',
   'C',
   'Dari x + y = 10 dan x − y = 4, jumlahkan: 2x = 14 → x = 7. Substitusi: 7 + y = 10 → y = 3. Jadi x × y = 7 × 3 = 21.',
   ARRAY['sering-keluar']),

  ('bb100001-0000-0000-0000-000000000009',
   'b0000001-0000-0000-0000-000000000001',
   'TNI', 'MATEMATIKA', 'Aljabar', 'MULTIPLE_CHOICE', 'SEDANG', 5,
   'Jika f(x) = 2x² − 3x + 1, maka nilai f(3) adalah...',
   '[{"id":"A","text":"8"},{"id":"B","text":"10"},{"id":"C","text":"12"},{"id":"D","text":"16"}]',
   'B',
   'f(3) = 2(3²) − 3(3) + 1 = 2(9) − 9 + 1 = 18 − 9 + 1 = 10.',
   ARRAY['jarang-keluar']),

  ('bb100001-0000-0000-0000-000000000010',
   'b0000001-0000-0000-0000-000000000001',
   'TNI', 'MATEMATIKA', 'Aljabar', 'MULTIPLE_CHOICE', 'SULIT', 5,
   'Jumlah dua bilangan adalah 45 dan selisihnya adalah 9. Hasil kali kedua bilangan tersebut adalah...',
   '[{"id":"A","text":"486"},{"id":"B","text":"504"},{"id":"C","text":"522"},{"id":"D","text":"540"}]',
   'A',
   'Misalkan dua bilangan a dan b. a + b = 45 dan a − b = 9. Maka a = 27 dan b = 18. Hasil kali = 27 × 18 = 486.',
   ARRAY['sering-keluar']),

-- ============================================================
-- MATEMATIKA — Geometri (3 soal)
-- ============================================================

  ('bb100001-0000-0000-0000-000000000011',
   'b0000001-0000-0000-0000-000000000001',
   'TNI', 'MATEMATIKA', 'Geometri', 'MULTIPLE_CHOICE', 'MUDAH', 7,
   'Sebuah lingkaran memiliki jari-jari 7 cm. Luas lingkaran tersebut adalah... (π = 22/7)',
   '[{"id":"A","text":"144 cm²"},{"id":"B","text":"154 cm²"},{"id":"C","text":"164 cm²"},{"id":"D","text":"176 cm²"}]',
   'B',
   'Luas lingkaran = π × r² = (22/7) × 7² = (22/7) × 49 = 22 × 7 = 154 cm².',
   ARRAY['sering-keluar']),

  ('bb100001-0000-0000-0000-000000000012',
   'b0000001-0000-0000-0000-000000000001',
   'TNI', 'MATEMATIKA', 'Geometri', 'MULTIPLE_CHOICE', 'SEDANG', 7,
   'Sebuah lapangan berbentuk persegi panjang berukuran panjang 80 m dan lebar 50 m. Seorang prajurit berlari mengelilingi lapangan sebanyak 5 kali. Berapa total jarak yang ditempuh?',
   '[{"id":"A","text":"1.200 m"},{"id":"B","text":"1.300 m"},{"id":"C","text":"1.400 m"},{"id":"D","text":"1.500 m"}]',
   'B',
   'Keliling persegi panjang = 2 × (panjang + lebar) = 2 × (80 + 50) = 2 × 130 = 260 m. Total jarak 5 kali = 260 × 5 = 1.300 m.',
   ARRAY['sering-keluar']),

  ('bb100001-0000-0000-0000-000000000013',
   'b0000001-0000-0000-0000-000000000001',
   'TNI', 'MATEMATIKA', 'Geometri', 'MULTIPLE_CHOICE', 'SEDANG', 7,
   'Sebuah segitiga siku-siku memiliki dua sisi yang saling tegak lurus dengan panjang 6 cm dan 8 cm. Panjang sisi miring (hipotenusa) segitiga tersebut adalah...',
   '[{"id":"A","text":"9 cm"},{"id":"B","text":"10 cm"},{"id":"C","text":"11 cm"},{"id":"D","text":"12 cm"}]',
   'B',
   'Menggunakan teorema Pythagoras: c² = a² + b² = 6² + 8² = 36 + 64 = 100. Jadi c = √100 = 10 cm.',
   ARRAY['sering-keluar']),

-- ============================================================
-- MATEMATIKA — Statistika (2 soal)
-- ============================================================

  ('bb100001-0000-0000-0000-000000000014',
   'b0000001-0000-0000-0000-000000000001',
   'TNI', 'MATEMATIKA', 'Statistika', 'MULTIPLE_CHOICE', 'MUDAH', 6,
   'Nilai rata-rata 5 prajurit dalam tes fisik adalah 75. Jika nilai prajurit keenam adalah 90, maka rata-rata baru adalah...',
   '[{"id":"A","text":"77,5"},{"id":"B","text":"78"},{"id":"C","text":"79"},{"id":"D","text":"80"}]',
   'A',
   'Total nilai 5 prajurit = 75 × 5 = 375. Setelah ditambah nilai keenam: 375 + 90 = 465. Rata-rata baru = 465 ÷ 6 = 77,5.',
   ARRAY['sering-keluar']),

  ('bb100001-0000-0000-0000-000000000015',
   'b0000001-0000-0000-0000-000000000001',
   'TNI', 'MATEMATIKA', 'Statistika', 'MULTIPLE_CHOICE', 'SEDANG', 6,
   'Data nilai tes 7 prajurit: 60, 70, 75, 80, 85, 90, 95. Berapa nilai mediannya?',
   '[{"id":"A","text":"75"},{"id":"B","text":"80"},{"id":"C","text":"82,5"},{"id":"D","text":"85"}]',
   'B',
   'Data sudah terurut. Jumlah data = 7 (ganjil). Median = nilai ke-(7+1)/2 = nilai ke-4 = 80.',
   ARRAY['sering-keluar']),

-- ============================================================
-- BAHASA INDONESIA — Pemahaman Bacaan (4 soal)
-- ============================================================

  ('bb200001-0000-0000-0000-000000000001',
   'b0000001-0000-0000-0000-000000000002',
   'TNI', 'BAHASA_INDONESIA', 'Pemahaman Bacaan', 'MULTIPLE_CHOICE', 'SEDANG', 7,
   'Bacalah paragraf berikut: "Tentara Nasional Indonesia memiliki tugas mulia dalam menjaga kedaulatan negara. Setiap prajurit dituntut memiliki jiwa patriotisme yang tinggi, disiplin, dan loyalitas tanpa batas kepada bangsa dan negara." Gagasan utama paragraf di atas adalah...',
   '[{"id":"A","text":"Prajurit TNI harus disiplin dalam bertugas"},{"id":"B","text":"TNI memiliki tugas menjaga kedaulatan dengan prajurit berkarakter kuat"},{"id":"C","text":"Loyalitas prajurit kepada negara adalah hal utama"},{"id":"D","text":"Patriotisme merupakan syarat utama menjadi prajurit TNI"}]',
   'B',
   'Gagasan utama adalah inti dari seluruh paragraf. Kalimat pertama menyebutkan tugas mulia TNI menjaga kedaulatan, dan kalimat berikutnya menjelaskan kualitas prajurit yang dibutuhkan untuk itu. Gagasan utama mencakup keduanya.',
   ARRAY['sering-keluar']),

  ('bb200001-0000-0000-0000-000000000002',
   'b0000001-0000-0000-0000-000000000002',
   'TNI', 'BAHASA_INDONESIA', 'Pemahaman Bacaan', 'MULTIPLE_CHOICE', 'SEDANG', 7,
   'Perhatikan kalimat berikut: "Meskipun cuaca buruk, para prajurit tetap melaksanakan latihan tempur sesuai jadwal yang telah ditetapkan." Makna kata "meskipun" dalam kalimat tersebut adalah...',
   '[{"id":"A","text":"Menunjukkan sebab akibat"},{"id":"B","text":"Menunjukkan syarat"},{"id":"C","text":"Menunjukkan pertentangan/konsesi"},{"id":"D","text":"Menunjukkan tujuan"}]',
   'C',
   '"Meskipun" adalah konjungsi yang menyatakan pertentangan atau konsesi, yaitu keadaan yang tidak menghalangi terjadinya sesuatu. Cuaca buruk tidak menghalangi latihan tetap berlangsung.',
   ARRAY['sering-keluar']),

  ('bb200001-0000-0000-0000-000000000003',
   'b0000001-0000-0000-0000-000000000002',
   'TNI', 'BAHASA_INDONESIA', 'Pemahaman Bacaan', 'MULTIPLE_CHOICE', 'MUDAH', 7,
   'Kata "patriotisme" dalam kalimat "Setiap prajurit harus memiliki jiwa patriotisme" berasal dari kata dasar...',
   '[{"id":"A","text":"patri"},{"id":"B","text":"patriot"},{"id":"C","text":"patriotis"},{"id":"D","text":"patrios"}]',
   'B',
   '"Patriotisme" dibentuk dari kata dasar "patriot" (orang yang mencintai dan berjuang untuk tanah air) ditambah akhiran "-isme" yang bermakna paham atau aliran.',
   ARRAY['sering-keluar']),

  ('bb200001-0000-0000-0000-000000000004',
   'b0000001-0000-0000-0000-000000000002',
   'TNI', 'BAHASA_INDONESIA', 'Pemahaman Bacaan', 'MULTIPLE_CHOICE', 'SULIT', 7,
   'Bacalah teks berikut: "Operasi militer bukan perang (OMBP) merupakan salah satu fungsi TNI yang tidak kalah penting dari perang konvensional. OMBP mencakup penanggulangan bencana, pengamanan perbatasan, dan bantuan kemanusiaan." Manakah pernyataan yang TIDAK sesuai dengan teks?',
   '[{"id":"A","text":"OMBP adalah salah satu fungsi TNI"},{"id":"B","text":"OMBP mencakup penanggulangan bencana alam"},{"id":"C","text":"OMBP lebih penting daripada perang konvensional"},{"id":"D","text":"Pengamanan perbatasan termasuk dalam OMBP"}]',
   'C',
   'Teks menyatakan OMBP "tidak kalah penting" dari perang konvensional, artinya keduanya sama pentingnya, bukan OMBP lebih penting. Pernyataan C menyalahi isi teks.',
   ARRAY['sering-keluar']),

-- ============================================================
-- BAHASA INDONESIA — Tata Bahasa (4 soal)
-- ============================================================

  ('bb200001-0000-0000-0000-000000000005',
   'b0000001-0000-0000-0000-000000000002',
   'TNI', 'BAHASA_INDONESIA', 'Tata Bahasa', 'MULTIPLE_CHOICE', 'MUDAH', 6,
   'Kalimat yang menggunakan kata penghubung sebab-akibat yang tepat adalah...',
   '[{"id":"A","text":"Ia tidak lulus tes TNI sehingga ia kurang persiapan"},{"id":"B","text":"Ia kurang persiapan sehingga ia tidak lulus tes TNI"},{"id":"C","text":"Sehingga kurang persiapan, ia tidak lulus tes TNI"},{"id":"D","text":"Ia tidak lulus tes TNI karena sehingga kurang persiapan"}]',
   'B',
   '"Sehingga" digunakan untuk menghubungkan sebab (anak kalimat di depan) dengan akibat (induk kalimat di belakang). Pola yang benar: [sebab] sehingga [akibat]. Pilihan B adalah satu-satunya yang mengikuti pola ini dengan benar.',
   ARRAY['sering-keluar']),

  ('bb200001-0000-0000-0000-000000000006',
   'b0000001-0000-0000-0000-000000000002',
   'TNI', 'BAHASA_INDONESIA', 'Tata Bahasa', 'MULTIPLE_CHOICE', 'SEDANG', 6,
   'Manakah kalimat di bawah ini yang menggunakan imbuhan "me-" dengan benar?',
   '[{"id":"A","text":"Para prajurit mensukseskan operasi tersebut"},{"id":"B","text":"Komandan memerintahkan seluruh pasukan maju"},{"id":"C","text":"Para prajurit mengkonsumsi ransum sesuai jadwal"},{"id":"D","text":"Batalion ini mentransfer alutsista ke gudang"}]',
   'B',
   '"Memerintahkan" berasal dari perintah + me- + -kan. Penerapan me- pada kata dasar berawalan konsonan p, t, k, s yang diikuti vokal mengalami peluluhan (me + perintah = memerintah). Pilihan B adalah yang paling tepat secara morfologis.',
   ARRAY['sering-keluar']),

  ('bb200001-0000-0000-0000-000000000007',
   'b0000001-0000-0000-0000-000000000002',
   'TNI', 'BAHASA_INDONESIA', 'Tata Bahasa', 'MULTIPLE_CHOICE', 'SEDANG', 6,
   'Kalimat pasif yang tepat dari kalimat aktif "Komandan memeriksa seluruh perlengkapan prajurit" adalah...',
   '[{"id":"A","text":"Seluruh perlengkapan prajurit sudah diperiksa"},{"id":"B","text":"Seluruh perlengkapan prajurit diperiksa oleh komandan"},{"id":"C","text":"Komandan memeriksa seluruh perlengkapan prajurit"},{"id":"D","text":"Perlengkapan prajurit yang diperiksa oleh komandan"}]',
   'B',
   'Kalimat pasif dibentuk dengan memindahkan objek menjadi subjek dan mengubah predikat aktif (me-) menjadi pasif (di-). "Komandan memeriksa seluruh perlengkapan prajurit" → "Seluruh perlengkapan prajurit diperiksa oleh komandan."',
   ARRAY['sering-keluar']),

  ('bb200001-0000-0000-0000-000000000008',
   'b0000001-0000-0000-0000-000000000002',
   'TNI', 'BAHASA_INDONESIA', 'Tata Bahasa', 'MULTIPLE_CHOICE', 'MUDAH', 6,
   'Sinonim dari kata "gigih" adalah...',
   '[{"id":"A","text":"lemah"},{"id":"B","text":"tekun"},{"id":"C","text":"malas"},{"id":"D","text":"pasif"}]',
   'B',
   '"Gigih" berarti bersungguh-sungguh dan tidak mudah menyerah. Sinonim (kata yang bermakna sama atau hampir sama) dari "gigih" adalah "tekun", yang berarti rajin dan bersungguh-sungguh.',
   ARRAY['sering-keluar']),

-- ============================================================
-- BAHASA INDONESIA — Ejaan & Kosakata (4 soal)
-- ============================================================

  ('bb200001-0000-0000-0000-000000000009',
   'b0000001-0000-0000-0000-000000000002',
   'TNI', 'BAHASA_INDONESIA', 'Ejaan dan Kosakata', 'MULTIPLE_CHOICE', 'MUDAH', 4,
   'Penulisan kata yang benar menurut PUEBI (Pedoman Umum Ejaan Bahasa Indonesia) adalah...',
   '[{"id":"A","text":"di-bombardir"},{"id":"B","text":"dibom-bardir"},{"id":"C","text":"dibombardir"},{"id":"D","text":"di bombardir"}]',
   'C',
   '"Dibombardir" adalah kata kerja pasif yang ditulis serangkai karena "di-" berfungsi sebagai awalan (prefiks), bukan kata depan. Kata depan "di" ditulis terpisah hanya jika menunjukkan tempat (di markas, di sana).',
   ARRAY['sering-keluar']),

  ('bb200001-0000-0000-0000-000000000010',
   'b0000001-0000-0000-0000-000000000002',
   'TNI', 'BAHASA_INDONESIA', 'Ejaan dan Kosakata', 'MULTIPLE_CHOICE', 'SEDANG', 4,
   'Kalimat yang menggunakan tanda baca yang benar adalah...',
   '[{"id":"A","text":"Komandan berkata, saya perintahkan kalian maju!"},{"id":"B","text":"Komandan berkata: \"Saya perintahkan kalian maju!\""},{"id":"C","text":"Komandan berkata. \"Saya perintahkan kalian maju!\""},{"id":"D","text":"Komandan berkata; \"Saya perintahkan kalian maju!\""}]',
   'B',
   'Kalimat langsung yang didahului kata pengantar seperti "berkata" menggunakan tanda titik dua (:) sebelum kutipan, dan kutipan diapit tanda petik dua ("..."). Pilihan B sudah mengikuti aturan ini dengan benar.',
   ARRAY['sering-keluar']),

  ('bb200001-0000-0000-0000-000000000011',
   'b0000001-0000-0000-0000-000000000002',
   'TNI', 'BAHASA_INDONESIA', 'Ejaan dan Kosakata', 'MULTIPLE_CHOICE', 'MUDAH', 4,
   'Antonim (lawan kata) dari "ofensif" adalah...',
   '[{"id":"A","text":"agresif"},{"id":"B","text":"defensif"},{"id":"C","text":"aktif"},{"id":"D","text":"konfrontatif"}]',
   'B',
   '"Ofensif" berarti bersifat menyerang. Antonimnya adalah "defensif" yang berarti bersifat bertahan/melindungi.',
   ARRAY['sering-keluar']),

  ('bb200001-0000-0000-0000-000000000012',
   'b0000001-0000-0000-0000-000000000002',
   'TNI', 'BAHASA_INDONESIA', 'Ejaan dan Kosakata', 'MULTIPLE_CHOICE', 'SEDANG', 4,
   'Kata serapan yang penulisannya benar menurut PUEBI adalah...',
   '[{"id":"A","text":"aktifitas"},{"id":"B","text":"aktifitas"},{"id":"C","text":"aktivitas"},{"id":"D","text":"acktivitas"}]',
   'C',
   'Penulisan yang benar adalah "aktivitas" (bukan "aktifitas"). Kata ini diserap dari bahasa Inggris "activity". Huruf "v" dipertahankan sesuai kaidah serapan dalam PUEBI.',
   ARRAY['sering-keluar']),

-- ============================================================
-- PENGETAHUAN UMUM — Sejarah Indonesia (4 soal)
-- ============================================================

  ('bb300001-0000-0000-0000-000000000001',
   'b0000001-0000-0000-0000-000000000003',
   'TNI', 'PENGETAHUAN_UMUM', 'Sejarah Indonesia', 'MULTIPLE_CHOICE', 'MUDAH', 6,
   'Proklamasi kemerdekaan Indonesia dibacakan pada tanggal...',
   '[{"id":"A","text":"16 Agustus 1945"},{"id":"B","text":"17 Agustus 1945"},{"id":"C","text":"18 Agustus 1945"},{"id":"D","text":"20 Agustus 1945"}]',
   'B',
   'Proklamasi kemerdekaan Republik Indonesia dibacakan oleh Soekarno-Hatta pada tanggal 17 Agustus 1945 di Jalan Pegangsaan Timur No. 56, Jakarta.',
   ARRAY['sering-keluar']),

  ('bb300001-0000-0000-0000-000000000002',
   'b0000001-0000-0000-0000-000000000003',
   'TNI', 'PENGETAHUAN_UMUM', 'Sejarah Indonesia', 'MULTIPLE_CHOICE', 'SEDANG', 6,
   'Tentara Nasional Indonesia (TNI) secara resmi dibentuk pada tanggal...',
   '[{"id":"A","text":"5 Oktober 1945"},{"id":"B","text":"17 Agustus 1945"},{"id":"C","text":"1 Januari 1946"},{"id":"D","text":"3 Juni 1947"}]',
   'A',
   'TNI secara resmi dibentuk pada tanggal 5 Oktober 1945, yang semula bernama Tentara Keamanan Rakyat (TKR). Tanggal ini diperingati setiap tahun sebagai Hari TNI.',
   ARRAY['sering-keluar']),

  ('bb300001-0000-0000-0000-000000000003',
   'b0000001-0000-0000-0000-000000000003',
   'TNI', 'PENGETAHUAN_UMUM', 'Sejarah Indonesia', 'MULTIPLE_CHOICE', 'SEDANG', 6,
   'Peristiwa pemberontakan G30S/PKI terjadi pada tahun...',
   '[{"id":"A","text":"1963"},{"id":"B","text":"1964"},{"id":"C","text":"1965"},{"id":"D","text":"1966"}]',
   'C',
   'Peristiwa G30S/PKI (Gerakan 30 September/Partai Komunis Indonesia) terjadi pada malam 30 September hingga 1 Oktober 1965. Peristiwa ini melibatkan penculikan dan pembunuhan tujuh perwira tinggi TNI Angkatan Darat.',
   ARRAY['sering-keluar']),

  ('bb300001-0000-0000-0000-000000000004',
   'b0000001-0000-0000-0000-000000000003',
   'TNI', 'PENGETAHUAN_UMUM', 'Sejarah Indonesia', 'MULTIPLE_CHOICE', 'MUDAH', 6,
   'Siapakah Panglima Besar TNI pertama Republik Indonesia?',
   '[{"id":"A","text":"Jenderal A.H. Nasution"},{"id":"B","text":"Jenderal Soedirman"},{"id":"C","text":"Jenderal Urip Sumoharjo"},{"id":"D","text":"Jenderal Gatot Subroto"}]',
   'B',
   'Jenderal Besar Soedirman adalah Panglima Besar Tentara Nasional Indonesia yang pertama. Beliau diangkat pada usia muda dan dikenal sebagai sosok pemimpin militer yang pantang menyerah, bahkan memimpin perang gerilya dalam kondisi sakit.',
   ARRAY['sering-keluar']),

-- ============================================================
-- PENGETAHUAN UMUM — Geografi (4 soal)
-- ============================================================

  ('bb300001-0000-0000-0000-000000000005',
   'b0000001-0000-0000-0000-000000000003',
   'TNI', 'PENGETAHUAN_UMUM', 'Geografi', 'MULTIPLE_CHOICE', 'MUDAH', 5,
   'Indonesia terletak di antara dua samudra, yaitu...',
   '[{"id":"A","text":"Samudra Atlantik dan Samudra Hindia"},{"id":"B","text":"Samudra Pasifik dan Samudra Atlantik"},{"id":"C","text":"Samudra Hindia dan Samudra Pasifik"},{"id":"D","text":"Samudra Arktik dan Samudra Pasifik"}]',
   'C',
   'Secara geografis, Indonesia terletak di antara Samudra Hindia (di sebelah barat dan selatan) dan Samudra Pasifik (di sebelah utara dan timur). Posisi ini menjadikan Indonesia sebagai negara kepulauan yang strategis.',
   ARRAY['sering-keluar']),

  ('bb300001-0000-0000-0000-000000000006',
   'b0000001-0000-0000-0000-000000000003',
   'TNI', 'PENGETAHUAN_UMUM', 'Geografi', 'MULTIPLE_CHOICE', 'MUDAH', 5,
   'Gunung tertinggi di Indonesia adalah...',
   '[{"id":"A","text":"Gunung Rinjani"},{"id":"B","text":"Gunung Kerinci"},{"id":"C","text":"Puncak Jaya (Carstensz Pyramid)"},{"id":"D","text":"Gunung Semeru"}]',
   'C',
   'Puncak Jaya atau Carstensz Pyramid di Papua adalah gunung tertinggi di Indonesia dengan ketinggian 4.884 meter di atas permukaan laut (mdpl). Gunung ini juga merupakan salah satu dari Seven Summits dunia.',
   ARRAY['sering-keluar']),

  ('bb300001-0000-0000-0000-000000000007',
   'b0000001-0000-0000-0000-000000000003',
   'TNI', 'PENGETAHUAN_UMUM', 'Geografi', 'MULTIPLE_CHOICE', 'SEDANG', 5,
   'Selat yang memisahkan Pulau Jawa dan Pulau Sumatra adalah...',
   '[{"id":"A","text":"Selat Madura"},{"id":"B","text":"Selat Sunda"},{"id":"C","text":"Selat Malaka"},{"id":"D","text":"Selat Lombok"}]',
   'B',
   'Selat Sunda memisahkan Pulau Jawa di timur dan Pulau Sumatra di barat. Di selat ini terdapat Pulau Krakatau yang terkenal dengan letusan gunung berapinya.',
   ARRAY['sering-keluar']),

  ('bb300001-0000-0000-0000-000000000008',
   'b0000001-0000-0000-0000-000000000003',
   'TNI', 'PENGETAHUAN_UMUM', 'Geografi', 'MULTIPLE_CHOICE', 'SEDANG', 5,
   'Laut di Indonesia yang berbatasan langsung dengan wilayah negara Malaysia dan Filipina adalah...',
   '[{"id":"A","text":"Laut Jawa"},{"id":"B","text":"Laut Banda"},{"id":"C","text":"Laut Sulawesi"},{"id":"D","text":"Laut Flores"}]',
   'C',
   'Laut Sulawesi (Celebes Sea) berbatasan langsung dengan Malaysia (Sabah) di sebelah utara dan Filipina di sebelah timur laut. Perairan ini memiliki nilai strategis dan keamanan yang penting bagi TNI.',
   ARRAY['sering-keluar']),

-- ============================================================
-- PENGETAHUAN UMUM — Ilmu Pengetahuan Alam (4 soal)
-- ============================================================

  ('bb300001-0000-0000-0000-000000000009',
   'b0000001-0000-0000-0000-000000000003',
   'TNI', 'PENGETAHUAN_UMUM', 'Ilmu Pengetahuan Alam', 'MULTIPLE_CHOICE', 'MUDAH', 7,
   'Lapisan atmosfer yang berfungsi melindungi bumi dari paparan sinar ultraviolet berbahaya adalah...',
   '[{"id":"A","text":"Troposfer"},{"id":"B","text":"Stratosfer"},{"id":"C","text":"Mesosfer"},{"id":"D","text":"Termosfer"}]',
   'B',
   'Lapisan ozon yang melindungi bumi dari sinar ultraviolet berada di stratosfer, tepatnya di lapisan ozonosfer (sekitar 15-35 km di atas permukaan bumi). Kerusakan lapisan ozon menjadi isu lingkungan global yang serius.',
   ARRAY['sering-keluar']),

  ('bb300001-0000-0000-0000-000000000010',
   'b0000001-0000-0000-0000-000000000003',
   'TNI', 'PENGETAHUAN_UMUM', 'Ilmu Pengetahuan Alam', 'MULTIPLE_CHOICE', 'MUDAH', 7,
   'Rumus kimia air adalah...',
   '[{"id":"A","text":"H₂O₂"},{"id":"B","text":"HO"},{"id":"C","text":"H₂O"},{"id":"D","text":"H₃O"}]',
   'C',
   'Rumus kimia air adalah H₂O, yang berarti setiap molekul air terdiri dari dua atom hidrogen (H) dan satu atom oksigen (O). H₂O₂ adalah hidrogen peroksida, senyawa yang berbeda dari air.',
   ARRAY['sering-keluar']),

  ('bb300001-0000-0000-0000-000000000011',
   'b0000001-0000-0000-0000-000000000003',
   'TNI', 'PENGETAHUAN_UMUM', 'Ilmu Pengetahuan Alam', 'MULTIPLE_CHOICE', 'SEDANG', 7,
   'Kecepatan cahaya di ruang hampa (vakum) adalah sekitar...',
   '[{"id":"A","text":"300.000 km/detik"},{"id":"B","text":"30.000 km/detik"},{"id":"C","text":"3.000 km/detik"},{"id":"D","text":"300 km/detik"}]',
   'A',
   'Kecepatan cahaya di ruang hampa adalah sekitar 300.000 km/detik atau tepatnya 299.792.458 m/detik. Nilai ini dilambangkan dengan huruf "c" dan merupakan konstanta fisika yang sangat penting.',
   ARRAY['sering-keluar']),

  ('bb300001-0000-0000-0000-000000000012',
   'b0000001-0000-0000-0000-000000000003',
   'TNI', 'PENGETAHUAN_UMUM', 'Ilmu Pengetahuan Alam', 'MULTIPLE_CHOICE', 'SEDANG', 7,
   'Planet yang dijuluki "Planet Merah" karena warna permukaannya adalah...',
   '[{"id":"A","text":"Venus"},{"id":"B","text":"Jupiter"},{"id":"C","text":"Mars"},{"id":"D","text":"Saturnus"}]',
   'C',
   'Mars dijuluki "Planet Merah" karena permukaannya kaya akan besi oksida (karat) yang memberikan warna merah kecokelatan. Mars adalah planet keempat dari matahari dan menjadi target eksplorasi antariksa modern.',
   ARRAY['sering-keluar']),

-- ============================================================
-- PSIKOTES — Deret Angka (3 soal)
-- ============================================================

  ('bb400001-0000-0000-0000-000000000001',
   'b0000001-0000-0000-0000-000000000004',
   'TNI', 'PSIKOTES', 'Deret Angka', 'MULTIPLE_CHOICE', 'MUDAH', 8,
   'Tentukan angka berikutnya dalam deret: 2, 4, 8, 16, 32, ...',
   '[{"id":"A","text":"48"},{"id":"B","text":"54"},{"id":"C","text":"64"},{"id":"D","text":"72"}]',
   'C',
   'Deret ini adalah deret geometri dengan rasio 2 (setiap suku dikalikan 2). 2 → 4 → 8 → 16 → 32 → 64. Suku berikutnya adalah 32 × 2 = 64.',
   ARRAY['sering-keluar']),

  ('bb400001-0000-0000-0000-000000000002',
   'b0000001-0000-0000-0000-000000000004',
   'TNI', 'PSIKOTES', 'Deret Angka', 'MULTIPLE_CHOICE', 'SEDANG', 8,
   'Tentukan angka berikutnya dalam deret: 3, 7, 13, 21, 31, ...',
   '[{"id":"A","text":"39"},{"id":"B","text":"41"},{"id":"C","text":"43"},{"id":"D","text":"45"}]',
   'C',
   'Selisih antar suku: 4, 6, 8, 10, ... (bertambah 2 setiap kali). Maka selisih berikutnya adalah 12. Suku berikutnya = 31 + 12 = 43.',
   ARRAY['sering-keluar']),

  ('bb400001-0000-0000-0000-000000000003',
   'b0000001-0000-0000-0000-000000000004',
   'TNI', 'PSIKOTES', 'Deret Angka', 'MULTIPLE_CHOICE', 'SULIT', 8,
   'Temukan suku ke-7 dalam deret Fibonacci yang dimulai dengan: 1, 1, 2, 3, 5, 8, ...',
   '[{"id":"A","text":"11"},{"id":"B","text":"12"},{"id":"C","text":"13"},{"id":"D","text":"14"}]',
   'C',
   'Deret Fibonacci: setiap suku = jumlah dua suku sebelumnya. 1, 1, 2, 3, 5, 8, 13. Suku ke-7 = 5 + 8 = 13.',
   ARRAY['sering-keluar']),

-- ============================================================
-- PSIKOTES — Spasial / Figurasi (3 soal)
-- ============================================================

  ('bb400001-0000-0000-0000-000000000004',
   'b0000001-0000-0000-0000-000000000004',
   'TNI', 'PSIKOTES', 'Spasial dan Figurasi', 'MULTIPLE_CHOICE', 'MUDAH', 8,
   'Sebuah kubus memiliki 6 sisi. Jika setiap sisi diwarnai dengan warna berbeda, berapa banyak warna yang dibutuhkan?',
   '[{"id":"A","text":"4"},{"id":"B","text":"5"},{"id":"C","text":"6"},{"id":"D","text":"8"}]',
   'C',
   'Kubus memiliki tepat 6 sisi (atas, bawah, depan, belakang, kiri, kanan). Jika setiap sisi harus memiliki warna yang berbeda, maka dibutuhkan tepat 6 warna.',
   ARRAY['sering-keluar']),

  ('bb400001-0000-0000-0000-000000000005',
   'b0000001-0000-0000-0000-000000000004',
   'TNI', 'PSIKOTES', 'Spasial dan Figurasi', 'MULTIPLE_CHOICE', 'SEDANG', 8,
   'Jika sebuah bujur sangkar ABCD diputar 90° searah jarum jam, maka sudut A yang semula di kiri atas akan berada di...',
   '[{"id":"A","text":"Kiri bawah"},{"id":"B","text":"Kanan atas"},{"id":"C","text":"Kanan bawah"},{"id":"D","text":"Tengah"}]',
   'B',
   'Rotasi 90° searah jarum jam memindahkan: kiri atas → kanan atas, kanan atas → kanan bawah, kanan bawah → kiri bawah, kiri bawah → kiri atas. Jadi sudut A (kiri atas) berpindah ke kanan atas.',
   ARRAY['sering-keluar']),

  ('bb400001-0000-0000-0000-000000000006',
   'b0000001-0000-0000-0000-000000000004',
   'TNI', 'PSIKOTES', 'Spasial dan Figurasi', 'MULTIPLE_CHOICE', 'SEDANG', 8,
   'Pola: Segitiga → Segiempat → Pentagon → Heksagon → ... Bentuk selanjutnya adalah...',
   '[{"id":"A","text":"Heptagon (7 sisi)"},{"id":"B","text":"Oktagon (8 sisi)"},{"id":"C","text":"Nonagon (9 sisi)"},{"id":"D","text":"Dekagon (10 sisi)"}]',
   'A',
   'Pola ini menambahkan 1 sisi setiap langkah: Segitiga (3) → Segiempat (4) → Pentagon (5) → Heksagon (6) → Heptagon (7). Bentuk selanjutnya adalah heptagon dengan 7 sisi.',
   ARRAY['sering-keluar']),

-- ============================================================
-- KEDINASAN TNI (5 soal)
-- ============================================================

  ('bb500001-0000-0000-0000-000000000001',
   'b0000001-0000-0000-0000-000000000005',
   'TNI', 'KEDINASAN', 'Regulasi TNI', 'MULTIPLE_CHOICE', 'SEDANG', 7,
   'Undang-Undang yang mengatur tentang Tentara Nasional Indonesia adalah...',
   '[{"id":"A","text":"UU No. 2 Tahun 2002"},{"id":"B","text":"UU No. 34 Tahun 2004"},{"id":"C","text":"UU No. 20 Tahun 1982"},{"id":"D","text":"UU No. 3 Tahun 2002"}]',
   'B',
   'UU No. 34 Tahun 2004 adalah Undang-Undang tentang Tentara Nasional Indonesia yang mengatur susunan, kedudukan, peran, dan fungsi TNI. UU No. 2 Tahun 2002 mengatur Kepolisian RI, UU No. 3 Tahun 2002 mengatur Pertahanan Negara.',
   ARRAY['sering-keluar']),

  ('bb500001-0000-0000-0000-000000000002',
   'b0000001-0000-0000-0000-000000000005',
   'TNI', 'KEDINASAN', 'Tugas Pokok TNI', 'MULTIPLE_CHOICE', 'SEDANG', 7,
   'Fungsi TNI sesuai UU No. 34 Tahun 2004 terdiri dari...',
   '[{"id":"A","text":"Penangkalan, penindakan, dan pemulihan"},{"id":"B","text":"Tempur, sosial, dan kemanusiaan"},{"id":"C","text":"Pertahanan, keamanan, dan pembangunan"},{"id":"D","text":"Darat, laut, dan udara"}]',
   'A',
   'Sesuai UU No. 34 Tahun 2004 Pasal 7, fungsi TNI dalam pelaksanaan tugas pokok terdiri atas penangkalan (mencegah dan menangkal ancaman), penindakan (menindak ancaman), dan pemulihan (memulihkan kondisi keamanan negara).',
   ARRAY['sering-keluar']),

  ('bb500001-0000-0000-0000-000000000003',
   'b0000001-0000-0000-0000-000000000005',
   'TNI', 'KEDINASAN', 'Bela Negara', 'MULTIPLE_CHOICE', 'SEDANG', 7,
   'Sapta Marga adalah kode etik atau pedoman hidup prajurit TNI yang terdiri dari berapa butir?',
   '[{"id":"A","text":"5 butir"},{"id":"B","text":"6 butir"},{"id":"C","text":"7 butir"},{"id":"D","text":"8 butir"}]',
   'C',
   'Sapta Marga berasal dari kata Sansekerta "sapta" (tujuh) dan "marga" (jalan/golongan). Sapta Marga merupakan tujuh kode etik prajurit TNI yang menjadi pedoman kehidupan prajurit dalam bermasyarakat, berbangsa, dan bernegara.',
   ARRAY['sering-keluar']),

  ('bb500001-0000-0000-0000-000000000004',
   'b0000001-0000-0000-0000-000000000005',
   'TNI', 'KEDINASAN', 'Regulasi TNI', 'MULTIPLE_CHOICE', 'MUDAH', 7,
   'Sumpah Prajurit TNI terdiri dari berapa poin/butir?',
   '[{"id":"A","text":"3 butir"},{"id":"B","text":"5 butir"},{"id":"C","text":"7 butir"},{"id":"D","text":"9 butir"}]',
   'B',
   'Sumpah Prajurit TNI terdiri dari 5 butir sumpah yang diucapkan pada saat pengangkatan menjadi prajurit. Kelima butir tersebut mencakup kesetiaan kepada NKRI, Pancasila, UUD 1945, kepatuhan pada atasan, dan menjunjung tinggi kehormatan prajurit.',
   ARRAY['sering-keluar']),

  ('bb500001-0000-0000-0000-000000000005',
   'b0000001-0000-0000-0000-000000000005',
   'TNI', 'KEDINASAN', 'Bela Negara', 'MULTIPLE_CHOICE', 'MUDAH', 7,
   'Bela negara sebagaimana diatur dalam UUD 1945 merupakan hak dan kewajiban setiap...',
   '[{"id":"A","text":"Warga negara laki-laki berusia 17-45 tahun"},{"id":"B","text":"Anggota TNI dan Polri"},{"id":"C","text":"Warga negara Indonesia"},{"id":"D","text":"Aparatur Sipil Negara"}]',
   'C',
   'Berdasarkan UUD 1945 Pasal 27 ayat (3) dan Pasal 30, bela negara adalah hak dan kewajiban setiap warga negara Indonesia, tanpa terkecuali, baik laki-laki maupun perempuan, tua maupun muda.',
   ARRAY['sering-keluar'])

ON CONFLICT (id) DO NOTHING;
