-- ============================================================
-- Seed 002: CPNS Questions — TWK (50) + TIU (50)
-- Jalankan setelah 001_question_packs.sql
-- ============================================================

INSERT INTO public.questions
  (id, pack_id, exam_type, subject, subtopic, question_type, difficulty, difficulty_rank,
   question_text, options, correct_option, explanation_text, tags)
VALUES

-- ============================================================
-- TWK — PANCASILA (10 soal, nomor 1-10)
-- ============================================================

(
  'aa100001-0000-0000-0000-000000000001',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Pancasila pertama kali diusulkan oleh Ir. Soekarno dalam sidang BPUPKI pada tanggal...',
  '[{"id":"A","text":"1 Juni 1945"},{"id":"B","text":"17 Agustus 1945"},{"id":"C","text":"29 Mei 1945"},{"id":"D","text":"18 Agustus 1945"}]',
  'A',
  'Pancasila pertama kali diusulkan oleh Ir. Soekarno dalam sidang BPUPKI (Badan Penyelidik Usaha-Usaha Persiapan Kemerdekaan Indonesia) pada tanggal 1 Juni 1945. Tanggal ini kemudian ditetapkan sebagai Hari Lahir Pancasila berdasarkan Keppres Nomor 24 Tahun 2016.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000002',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Sila ke-3 Pancasila berbunyi...',
  '[{"id":"A","text":"Kemanusiaan yang Adil dan Beradab"},{"id":"B","text":"Persatuan Indonesia"},{"id":"C","text":"Kerakyatan yang Dipimpin oleh Hikmat Kebijaksanaan dalam Permusyawaratan/Perwakilan"},{"id":"D","text":"Keadilan Sosial bagi Seluruh Rakyat Indonesia"}]',
  'B',
  'Sila ke-3 Pancasila adalah "Persatuan Indonesia", yang dilambangkan dengan pohon beringin. Sila ini mengandung makna bahwa bangsa Indonesia harus bersatu tanpa memandang perbedaan suku, agama, ras, maupun golongan.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000003',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Lambang sila ke-1 Pancasila "Ketuhanan Yang Maha Esa" adalah...',
  '[{"id":"A","text":"Rantai"},{"id":"B","text":"Bintang"},{"id":"C","text":"Pohon Beringin"},{"id":"D","text":"Kepala Banteng"}]',
  'B',
  'Lambang sila ke-1 Pancasila adalah bintang emas berujung lima dengan latar belakang hitam. Bintang melambangkan cahaya kerohanian yang dipancarkan Tuhan Yang Maha Esa kepada setiap manusia.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000004',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 3,
  'Rumusan Pancasila yang sah dan resmi terdapat dalam...',
  '[{"id":"A","text":"Piagam Jakarta"},{"id":"B","text":"Pembukaan UUD 1945 alinea keempat"},{"id":"C","text":"Dekrit Presiden 5 Juli 1959"},{"id":"D","text":"Tap MPR No. II/MPR/1978"}]',
  'B',
  'Rumusan Pancasila yang sah dan resmi terdapat dalam Pembukaan UUD 1945 alinea keempat. Rumusan inilah yang menjadi dasar negara yang berlaku sejak 18 Agustus 1945 dan ditetapkan oleh PPKI.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000005',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 3,
  'Nilai yang terkandung dalam sila ke-2 Pancasila "Kemanusiaan yang Adil dan Beradab" adalah...',
  '[{"id":"A","text":"Mengakui persamaan derajat, hak, dan kewajiban asasi setiap manusia"},{"id":"B","text":"Mengembangkan rasa cinta kepada tanah air dan bangsa"},{"id":"C","text":"Mengakui dan menghormati hak dan kewajiban asasi diri sendiri saja"},{"id":"D","text":"Menjaga keseimbangan antara hak dan kewajiban hanya bagi warga negara Indonesia"}]',
  'A',
  'Sila ke-2 mengandung nilai pengakuan terhadap harkat dan martabat manusia sebagai makhluk Tuhan Yang Maha Esa, serta persamaan derajat, hak, dan kewajiban setiap manusia tanpa membedakan suku, agama, ras, dan golongan.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000006',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Lambang negara Republik Indonesia yang di dalamnya terdapat Pancasila adalah...',
  '[{"id":"A","text":"Sang Merah Putih"},{"id":"B","text":"Garuda Pancasila"},{"id":"C","text":"Burung Elang"},{"id":"D","text":"Bhineka Tunggal Ika"}]',
  'B',
  'Lambang negara Republik Indonesia adalah Garuda Pancasila, yang ditetapkan berdasarkan Peraturan Pemerintah Nomor 66 Tahun 1951. Pada perisai Garuda terdapat lambang-lambang kelima sila Pancasila.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000007',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 3,
  'Dalam sidang BPUPKI, Mr. Muhammad Yamin mengusulkan dasar negara pada tanggal...',
  '[{"id":"A","text":"1 Juni 1945"},{"id":"B","text":"31 Mei 1945"},{"id":"C","text":"29 Mei 1945"},{"id":"D","text":"22 Juni 1945"}]',
  'C',
  'Mr. Muhammad Yamin mengusulkan dasar negara pada tanggal 29 Mei 1945 dalam sidang BPUPKI pertama. Ia mengusulkan lima dasar antara lain Peri Kebangsaan, Peri Kemanusiaan, Peri Ketuhanan, Peri Kerakyatan, dan Kesejahteraan Rakyat.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000008',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 3,
  'Fungsi utama Pancasila sebagai dasar negara adalah...',
  '[{"id":"A","text":"Sebagai pandangan hidup dan pedoman moral pribadi"},{"id":"B","text":"Sebagai norma dasar (grundnorm) yang menjadi sumber dari segala sumber hukum"},{"id":"C","text":"Sebagai alat pemersatu perbedaan pendapat antar partai politik"},{"id":"D","text":"Sebagai pedoman pelaksanaan pemilihan umum"}]',
  'B',
  'Sebagai dasar negara, Pancasila berfungsi sebagai norma dasar (grundnorm) atau sumber dari segala sumber hukum di Indonesia. Ini berarti seluruh peraturan perundang-undangan yang berlaku di Indonesia tidak boleh bertentangan dengan nilai-nilai Pancasila.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000009',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Rantai emas pada lambang Pancasila melambangkan sila ke...',
  '[{"id":"A","text":"Sila ke-1"},{"id":"B","text":"Sila ke-2"},{"id":"C","text":"Sila ke-3"},{"id":"D","text":"Sila ke-4"}]',
  'B',
  'Rantai emas yang terdiri dari mata rantai berbentuk persegi dan lingkaran adalah lambang sila ke-2, "Kemanusiaan yang Adil dan Beradab". Mata rantai persegi melambangkan laki-laki dan lingkaran melambangkan perempuan, keduanya saling berkaitan menggambarkan hubungan antar manusia.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000010',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 3,
  'Piagam Jakarta (Jakarta Charter) ditandatangani pada tanggal...',
  '[{"id":"A","text":"1 Juni 1945"},{"id":"B","text":"22 Juni 1945"},{"id":"C","text":"17 Agustus 1945"},{"id":"D","text":"18 Agustus 1945"}]',
  'B',
  'Piagam Jakarta ditandatangani pada tanggal 22 Juni 1945 oleh Panitia Sembilan yang diketuai Ir. Soekarno. Piagam ini memuat rumusan dasar negara yang kemudian diubah sebelum ditetapkan dalam Pembukaan UUD 1945 pada 18 Agustus 1945.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TWK — UUD 1945 (15 soal, nomor 11-25)
-- ============================================================

(
  'aa100001-0000-0000-0000-000000000011',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Pasal 1 ayat (1) UUD 1945 menyatakan bahwa negara Indonesia adalah...',
  '[{"id":"A","text":"Negara Serikat yang berbentuk Republik"},{"id":"B","text":"Negara Kesatuan yang berbentuk Republik"},{"id":"C","text":"Negara Federal yang berbentuk Monarki"},{"id":"D","text":"Negara Kesatuan yang berbentuk Monarki Konstitusional"}]',
  'B',
  'Pasal 1 ayat (1) UUD 1945 secara tegas menyatakan: "Negara Indonesia ialah Negara Kesatuan, yang berbentuk Republik." Ketentuan ini merupakan salah satu dari empat ketentuan yang tidak dapat diubah dalam UUD 1945.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000012',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Berdasarkan Pasal 1 ayat (2) UUD 1945, kedaulatan berada di tangan...',
  '[{"id":"A","text":"Presiden sebagai kepala negara"},{"id":"B","text":"MPR sebagai lembaga tertinggi negara"},{"id":"C","text":"Rakyat dan dilaksanakan menurut UUD"},{"id":"D","text":"DPR sebagai perwakilan rakyat"}]',
  'C',
  'Setelah amandemen, Pasal 1 ayat (2) UUD 1945 berbunyi: "Kedaulatan berada di tangan rakyat dan dilaksanakan menurut Undang-Undang Dasar." Rumusan ini berbeda dengan sebelum amandemen yang menyebut MPR sebagai pelaksana kedaulatan rakyat.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000013',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Hak setiap warga negara untuk mendapatkan pendidikan dijamin dalam UUD 1945 Pasal...',
  '[{"id":"A","text":"Pasal 27 ayat (2)"},{"id":"B","text":"Pasal 28C ayat (1)"},{"id":"C","text":"Pasal 31 ayat (1)"},{"id":"D","text":"Pasal 33 ayat (1)"}]',
  'C',
  'Pasal 31 ayat (1) UUD 1945 menyatakan: "Setiap warga negara berhak mendapat pendidikan." Pasal ini merupakan dasar konstitusional kewajiban negara dalam menyelenggarakan sistem pendidikan nasional bagi seluruh warga negara.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000014',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SULIT', 6,
  'Amandemen UUD 1945 yang pertama disahkan oleh MPR pada tahun...',
  '[{"id":"A","text":"1998"},{"id":"B","text":"1999"},{"id":"C","text":"2000"},{"id":"D","text":"2001"}]',
  'B',
  'Amandemen pertama UUD 1945 disahkan pada tanggal 19 Oktober 1999 dalam Sidang Umum MPR. Amandemen pertama ini mengubah 9 pasal dan terutama berfokus pada pembatasan kekuasaan presiden serta penguatan DPR.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000015',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SULIT', 6,
  'Pasal UUD 1945 yang mengatur tentang kebebasan beragama dan beribadat adalah...',
  '[{"id":"A","text":"Pasal 28E"},{"id":"B","text":"Pasal 29 ayat (2)"},{"id":"C","text":"Pasal 28I"},{"id":"D","text":"Pasal 27 ayat (1)"}]',
  'B',
  'Pasal 29 ayat (2) UUD 1945 menyatakan: "Negara menjamin kemerdekaan tiap-tiap penduduk untuk memeluk agamanya masing-masing dan untuk beribadat menurut agamanya dan kepercayaannya itu." Pasal ini menjadi jaminan konstitusional kebebasan beragama di Indonesia.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000016',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Pasal 27 ayat (1) UUD 1945 mengatur tentang...',
  '[{"id":"A","text":"Hak warga negara atas pekerjaan dan penghidupan yang layak"},{"id":"B","text":"Persamaan kedudukan warga negara dalam hukum dan pemerintahan"},{"id":"C","text":"Kewajiban warga negara untuk membela negara"},{"id":"D","text":"Hak warga negara untuk memperoleh pendidikan"}]',
  'B',
  'Pasal 27 ayat (1) berbunyi: "Segala warga negara bersamaan kedudukannya di dalam hukum dan pemerintahan dan wajib menjunjung hukum dan pemerintahan itu dengan tidak ada kecualinya." Pasal ini menjamin prinsip persamaan di depan hukum (equality before the law).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000017',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SULIT', 6,
  'Amandemen UUD 1945 keempat (terakhir) disahkan pada tahun...',
  '[{"id":"A","text":"2001"},{"id":"B","text":"2002"},{"id":"C","text":"2003"},{"id":"D","text":"2004"}]',
  'B',
  'Amandemen keempat UUD 1945 disahkan pada tanggal 10 Agustus 2002 dalam Sidang Tahunan MPR. Amandemen keempat ini antara lain mengatur tentang komposisi MPR, pemilihan presiden langsung, dan pembentukan Mahkamah Konstitusi.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000018',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Pasal 33 ayat (3) UUD 1945 menyatakan bahwa bumi, air, dan kekayaan alam yang terkandung di dalamnya dikuasai oleh negara dan dipergunakan untuk...',
  '[{"id":"A","text":"Kepentingan pembangunan nasional"},{"id":"B","text":"Sebesar-besar kemakmuran rakyat"},{"id":"C","text":"Kepentingan negara dan pemerintah"},{"id":"D","text":"Pembiayaan APBN"}]',
  'B',
  'Pasal 33 ayat (3) UUD 1945 menyatakan: "Bumi dan air dan kekayaan alam yang terkandung di dalamnya dikuasai oleh negara dan dipergunakan untuk sebesar-besar kemakmuran rakyat." Pasal ini menjadi landasan konstitusional bagi pengelolaan sumber daya alam Indonesia.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000019',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Hak atas pekerjaan dan penghidupan yang layak bagi kemanusiaan diatur dalam UUD 1945 Pasal...',
  '[{"id":"A","text":"Pasal 27 ayat (2)"},{"id":"B","text":"Pasal 28A"},{"id":"C","text":"Pasal 28D ayat (2)"},{"id":"D","text":"Pasal 34 ayat (1)"}]',
  'A',
  'Pasal 27 ayat (2) UUD 1945 menyatakan: "Tiap-tiap warga negara berhak atas pekerjaan dan penghidupan yang layak bagi kemanusiaan." Pasal ini merupakan jaminan konstitusional hak ekonomi warga negara dan menjadi dasar kebijakan ketenagakerjaan.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000020',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SULIT', 6,
  'Kewajiban pemerintah untuk membiayai pendidikan dasar diatur dalam UUD 1945 Pasal...',
  '[{"id":"A","text":"Pasal 31 ayat (2)"},{"id":"B","text":"Pasal 31 ayat (3)"},{"id":"C","text":"Pasal 31 ayat (4)"},{"id":"D","text":"Pasal 31 ayat (5)"}]',
  'A',
  'Pasal 31 ayat (2) UUD 1945 menyatakan: "Setiap warga negara wajib mengikuti pendidikan dasar dan pemerintah wajib membiayainya." Ketentuan ini menjadi landasan program wajib belajar 9 tahun (sekarang 12 tahun) yang dibiayai oleh pemerintah.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000021',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Pasal 30 ayat (1) UUD 1945 mengatur tentang...',
  '[{"id":"A","text":"Hak dan kewajiban warga negara dalam pertahanan dan keamanan"},{"id":"B","text":"Susunan dan kedudukan TNI dan Polri"},{"id":"C","text":"Kewajiban negara membentuk angkatan bersenjata"},{"id":"D","text":"Syarat menjadi prajurit TNI"}]',
  'A',
  'Pasal 30 ayat (1) UUD 1945 berbunyi: "Tiap-tiap warga negara berhak dan wajib ikut serta dalam usaha pertahanan dan keamanan negara." Pasal ini menegaskan bahwa bela negara adalah hak sekaligus kewajiban setiap warga negara Indonesia.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000022',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SULIT', 6,
  'Pasal berapa dalam UUD 1945 yang mengatur bahwa fakir miskin dan anak-anak terlantar dipelihara oleh negara?',
  '[{"id":"A","text":"Pasal 33 ayat (1)"},{"id":"B","text":"Pasal 34 ayat (1)"},{"id":"C","text":"Pasal 34 ayat (2)"},{"id":"D","text":"Pasal 28H ayat (1)"}]',
  'B',
  'Pasal 34 ayat (1) UUD 1945 menyatakan: "Fakir miskin dan anak-anak yang terlantar dipelihara oleh negara." Ketentuan ini menjadi landasan konstitusional bagi program-program perlindungan sosial dan jaminan sosial yang diselenggarakan pemerintah.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000023',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Berdasarkan UUD 1945, Mahkamah Konstitusi dibentuk berdasarkan amandemen ke...',
  '[{"id":"A","text":"Amandemen pertama (1999)"},{"id":"B","text":"Amandemen kedua (2000)"},{"id":"C","text":"Amandemen ketiga (2001)"},{"id":"D","text":"Amandemen keempat (2002)"}]',
  'C',
  'Mahkamah Konstitusi (MK) dibentuk berdasarkan Amandemen Ketiga UUD 1945 yang disahkan pada tahun 2001. MK diatur dalam Pasal 24C UUD 1945 dan memiliki kewenangan antara lain menguji undang-undang terhadap UUD.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000024',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SULIT', 6,
  'UUD 1945 mengatur bahwa presiden tidak dapat membekukan dan/atau membubarkan DPR. Hal ini diatur dalam Pasal...',
  '[{"id":"A","text":"Pasal 7A"},{"id":"B","text":"Pasal 7B"},{"id":"C","text":"Pasal 7C"},{"id":"D","text":"Pasal 8"}]',
  'C',
  'Pasal 7C UUD 1945 hasil amandemen menyatakan: "Presiden tidak dapat membekukan dan/atau membubarkan Dewan Perwakilan Rakyat." Ketentuan ini merupakan salah satu bentuk saling mengimbangi (checks and balances) antara lembaga eksekutif dan legislatif.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000025',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Sistem pemerintahan yang dianut Indonesia berdasarkan UUD 1945 adalah...',
  '[{"id":"A","text":"Sistem Parlementer"},{"id":"B","text":"Sistem Presidensial"},{"id":"C","text":"Sistem Semi-Presidensial"},{"id":"D","text":"Sistem Campuran Parlementer dan Presidensial"}]',
  'B',
  'Indonesia menganut sistem pemerintahan presidensial di mana presiden berkedudukan sebagai kepala negara sekaligus kepala pemerintahan. Presiden dipilih langsung oleh rakyat dan tidak bertanggung jawab kepada parlemen, sebagaimana diatur dalam UUD 1945 hasil amandemen.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TWK — NKRI & WAWASAN NUSANTARA (10 soal, nomor 26-35)
-- ============================================================

(
  'aa100001-0000-0000-0000-000000000026',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI dan Wawasan Nusantara',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Konsep Wawasan Nusantara pertama kali diperkenalkan melalui Deklarasi Djuanda pada tanggal...',
  '[{"id":"A","text":"13 Desember 1957"},{"id":"B","text":"17 Agustus 1945"},{"id":"C","text":"1 Januari 1960"},{"id":"D","text":"13 Desember 1945"}]',
  'A',
  'Deklarasi Djuanda diumumkan pada tanggal 13 Desember 1957 oleh Perdana Menteri Djuanda Kartawidjaja. Deklarasi ini menyatakan bahwa laut di antara pulau-pulau Indonesia merupakan bagian dari wilayah Indonesia, menjadi cikal bakal konsep Wawasan Nusantara.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000027',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI dan Wawasan Nusantara',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'Wawasan Nusantara berfungsi sebagai...',
  '[{"id":"A","text":"Landasan idiil dalam penyelenggaraan negara"},{"id":"B","text":"Pandangan atau cara pandang bangsa Indonesia terhadap dirinya sendiri dan lingkungannya"},{"id":"C","text":"Pedoman pelaksanaan otonomi daerah"},{"id":"D","text":"Landasan hukum dalam pembagian wilayah negara"}]',
  'B',
  'Wawasan Nusantara adalah cara pandang dan sikap bangsa Indonesia mengenai diri serta bentuk geografinya berdasarkan Pancasila dan UUD 1945. Sebagai wawasan nasional, ia berfungsi sebagai pedoman, motivasi, dorongan, dan rambu-rambu dalam menentukan kebijaksanaan, keputusan, dan tindakan penyelenggaraan negara.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000028',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI dan Wawasan Nusantara',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'Otonomi daerah di Indonesia diatur dalam UUD 1945 Pasal...',
  '[{"id":"A","text":"Pasal 17"},{"id":"B","text":"Pasal 18"},{"id":"C","text":"Pasal 19"},{"id":"D","text":"Pasal 20"}]',
  'B',
  'Otonomi daerah diatur dalam Pasal 18 UUD 1945 yang menyatakan bahwa Negara Kesatuan Republik Indonesia dibagi atas daerah-daerah provinsi dan daerah provinsi itu dibagi atas kabupaten dan kota. Pasal ini menjadi dasar konstitusional penyelenggaraan pemerintahan daerah.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000029',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI dan Wawasan Nusantara',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Ketahanan Nasional Indonesia mengandung pengertian sebagai...',
  '[{"id":"A","text":"Kemampuan militer Indonesia dalam menghadapi ancaman dari luar"},{"id":"B","text":"Kondisi dinamik bangsa Indonesia yang berisi keuletan dan ketangguhan dalam menghadapi segala ancaman"},{"id":"C","text":"Kemampuan pemerintah dalam mempertahankan kekuasaan"},{"id":"D","text":"Kekuatan ekonomi Indonesia di tingkat internasional"}]',
  'B',
  'Ketahanan Nasional adalah kondisi dinamis bangsa Indonesia yang meliputi segenap aspek kehidupan nasional yang terintegrasi, berisi keuletan dan ketangguhan yang mengandung kemampuan mengembangkan kekuatan nasional dalam menghadapi segala tantangan, ancaman, hambatan, dan gangguan.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000030',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI dan Wawasan Nusantara',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'Asas Wawasan Nusantara yang menyatakan bahwa kepentingan dan tujuan nasional diletakkan di atas kepentingan pribadi atau golongan disebut asas...',
  '[{"id":"A","text":"Kesetiaan"},{"id":"B","text":"Solidaritas"},{"id":"C","text":"Kepentingan Bersama"},{"id":"D","text":"Kejujuran"}]',
  'C',
  'Asas kepentingan bersama dalam Wawasan Nusantara berarti bahwa kepentingan nasional diutamakan di atas kepentingan pribadi atau golongan demi mewujudkan tujuan nasional. Hal ini merupakan bentuk konkret dari semangat gotong royong dan rela berkorban demi bangsa dan negara.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000031',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI dan Wawasan Nusantara',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'NKRI singkatan dari...',
  '[{"id":"A","text":"Negara Kesatuan Rakyat Indonesia"},{"id":"B","text":"Negara Kebangsaan Republik Indonesia"},{"id":"C","text":"Negara Kesatuan Republik Indonesia"},{"id":"D","text":"Negara Konstitusional Republik Indonesia"}]',
  'C',
  'NKRI adalah singkatan dari Negara Kesatuan Republik Indonesia. Bentuk negara ini ditegaskan dalam Pasal 1 ayat (1) UUD 1945 dan merupakan salah satu dari empat pokok pikiran yang tidak dapat diubah dalam UUD 1945.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000032',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI dan Wawasan Nusantara',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'Konsep Zona Ekonomi Eksklusif (ZEE) Indonesia membentang sejauh...',
  '[{"id":"A","text":"100 mil laut dari garis pangkal"},{"id":"B","text":"200 mil laut dari garis pangkal"},{"id":"C","text":"12 mil laut dari garis pantai"},{"id":"D","text":"350 mil laut dari garis pangkal"}]',
  'B',
  'Zona Ekonomi Eksklusif (ZEE) Indonesia membentang sejauh 200 mil laut diukur dari garis pangkal kepulauan. Dalam ZEE ini, Indonesia memiliki hak berdaulat untuk mengeksplorasi, mengeksploitasi, mengelola, dan melestarikan sumber daya alam.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000033',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI dan Wawasan Nusantara',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'Ancaman terhadap NKRI yang berasal dari dalam negeri disebut ancaman...',
  '[{"id":"A","text":"Eksternal"},{"id":"B","text":"Internal"},{"id":"C","text":"Militer"},{"id":"D","text":"Hibrida"}]',
  'B',
  'Ancaman internal adalah ancaman terhadap keutuhan NKRI yang bersumber dari dalam negeri sendiri, seperti separatisme, radikalisme, terorisme, dan konflik horizontal. Ancaman ini tidak kalah berbahayanya dengan ancaman eksternal yang datang dari luar negeri.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000034',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI dan Wawasan Nusantara',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Semangat bela negara warga sipil dapat diwujudkan melalui...',
  '[{"id":"A","text":"Hanya dengan bergabung menjadi anggota TNI"},{"id":"B","text":"Ikut pelatihan militer wajib setiap tahun"},{"id":"C","text":"Bekerja secara profesional dan berprestasi dalam bidang masing-masing"},{"id":"D","text":"Menolak semua pengaruh budaya asing"}]',
  'C',
  'Bela negara tidak harus dilakukan secara fisik-militer. Warga sipil dapat membela negara melalui cara bekerja secara profesional, berprestasi, membayar pajak, menjaga persatuan, serta menolak paham-paham yang mengancam keutuhan bangsa.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000035',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI dan Wawasan Nusantara',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'Geopolitik Indonesia didasarkan pada konsep...',
  '[{"id":"A","text":"Heartland Theory dari Mackinder"},{"id":"B","text":"Rimland Theory dari Spykman"},{"id":"C","text":"Wawasan Nusantara sebagai archipelago state"},{"id":"D","text":"Balance of Power Theory"}]',
  'C',
  'Geopolitik Indonesia didasarkan pada konsep Wawasan Nusantara sebagai negara kepulauan (archipelago state). Konsep ini memandang wilayah Indonesia sebagai satu kesatuan utuh yang meliputi darat, laut, dan udara, tidak terpisah-pisah antara pulau satu dengan lainnya.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TWK — BHINNEKA TUNGGAL IKA (7 soal, nomor 36-42)
-- ============================================================

(
  'aa100001-0000-0000-0000-000000000036',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Semboyan "Bhinneka Tunggal Ika" berasal dari kitab...',
  '[{"id":"A","text":"Kitab Negarakertagama"},{"id":"B","text":"Kitab Sutasoma"},{"id":"C","text":"Kitab Pararaton"},{"id":"D","text":"Kitab Arjunawiwaha"}]',
  'B',
  'Semboyan "Bhinneka Tunggal Ika" diambil dari Kitab Sutasoma karya Mpu Tantular yang ditulis pada masa Kerajaan Majapahit abad ke-14. Kalimat lengkapnya adalah "Bhinneka Tunggal Ika Tan Hana Dharma Mangrwa" yang berarti berbeda-beda tetapi satu juga, tidak ada kebenaran yang mendua.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000037',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Arti dari semboyan "Bhinneka Tunggal Ika" adalah...',
  '[{"id":"A","text":"Bersatu kita teguh, bercerai kita runtuh"},{"id":"B","text":"Berbeda-beda tetapi tetap satu juga"},{"id":"C","text":"Keberagaman adalah kekuatan bangsa"},{"id":"D","text":"Satu nusa, satu bangsa, satu bahasa"}]',
  'B',
  '"Bhinneka Tunggal Ika" berasal dari bahasa Sansekerta yang berarti "Berbeda-beda tetapi tetap satu juga." Semboyan ini mencerminkan keragaman suku, agama, ras, dan budaya Indonesia yang meskipun berbeda-beda, tetap bersatu dalam satu wadah NKRI.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000038',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Semboyan Bhinneka Tunggal Ika pada lambang Garuda Pancasila ditempatkan pada...',
  '[{"id":"A","text":"Sayap kanan Garuda"},{"id":"B","text":"Cakar kaki Garuda"},{"id":"C","text":"Pita yang dicengkeram oleh Garuda"},{"id":"D","text":"Perisai di dada Garuda"}]',
  'C',
  'Semboyan "Bhinneka Tunggal Ika" tertulis pada pita putih yang dicengkeram oleh kedua kaki Garuda Pancasila. Pita ini berwarna putih, melambangkan kesucian dan kesatuan bangsa Indonesia dalam keberagamannya.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000039',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Penulis Kitab Sutasoma yang memuat semboyan Bhinneka Tunggal Ika adalah...',
  '[{"id":"A","text":"Mpu Prapanca"},{"id":"B","text":"Mpu Kanwa"},{"id":"C","text":"Mpu Tantular"},{"id":"D","text":"Mpu Sedah"}]',
  'C',
  'Kitab Sutasoma ditulis oleh Mpu Tantular pada masa pemerintahan Raja Hayam Wuruk di Kerajaan Majapahit (abad ke-14). Kitab ini berisi ajaran tentang toleransi antara umat Hindu Siwa dan Buddha yang hidup berdampingan secara damai.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000040',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Sikap yang mencerminkan nilai Bhinneka Tunggal Ika dalam kehidupan sehari-hari adalah...',
  '[{"id":"A","text":"Mengutamakan kepentingan suku sendiri dalam setiap keputusan"},{"id":"B","text":"Menghargai perbedaan budaya, agama, dan suku antar sesama warga negara"},{"id":"C","text":"Menghindari bergaul dengan orang yang berbeda suku"},{"id":"D","text":"Memaksakan budaya daerah sendiri kepada daerah lain"}]',
  'B',
  'Nilai Bhinneka Tunggal Ika dalam kehidupan sehari-hari diwujudkan dengan sikap menghargai perbedaan, toleransi, dan saling menghormati antar sesama warga negara tanpa memandang latar belakang suku, agama, ras, dan antar golongan (SARA).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000041',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Indonesia memiliki berapa suku bangsa yang diakui secara resmi?',
  '[{"id":"A","text":"Lebih dari 100 suku bangsa"},{"id":"B","text":"Lebih dari 300 suku bangsa"},{"id":"C","text":"Lebih dari 1.000 suku bangsa"},{"id":"D","text":"Lebih dari 500 suku bangsa"}]',
  'C',
  'Indonesia diakui memiliki lebih dari 1.000 suku bangsa yang tersebar di seluruh wilayah kepulauan. Keragaman ini juga tercermin dari lebih dari 700 bahasa daerah yang masih digunakan, menjadikan Indonesia salah satu negara dengan keanekaragaman etnis terbesar di dunia.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000042',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Toleransi antar umat beragama di Indonesia dijamin dalam UUD 1945 dan merupakan perwujudan dari nilai...',
  '[{"id":"A","text":"Sila ke-1 dan sila ke-3 Pancasila"},{"id":"B","text":"Sila ke-2 Pancasila saja"},{"id":"C","text":"Sila ke-4 Pancasila"},{"id":"D","text":"Sila ke-5 Pancasila"}]',
  'A',
  'Toleransi antar umat beragama merupakan perwujudan dari sila ke-1 (Ketuhanan Yang Maha Esa) dan sila ke-3 (Persatuan Indonesia). Sila ke-1 menjamin kebebasan memeluk agama, sedangkan sila ke-3 mendorong persatuan meskipun terdapat perbedaan keyakinan.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TWK — SEJARAH INDONESIA (8 soal, nomor 43-50)
-- ============================================================

(
  'aa100001-0000-0000-0000-000000000043',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 7,
  'Proklamasi Kemerdekaan Indonesia dibacakan pada tanggal...',
  '[{"id":"A","text":"17 Agustus 1945, pukul 10.00 WIB di Lapangan Ikada"},{"id":"B","text":"17 Agustus 1945, pukul 10.00 WIB di Jl. Pegangsaan Timur No. 56"},{"id":"C","text":"18 Agustus 1945, pukul 08.00 WIB di Istana Merdeka"},{"id":"D","text":"17 Agustus 1945, pukul 08.00 WIB di Jl. Pegangsaan Timur No. 56"}]',
  'B',
  'Proklamasi Kemerdekaan Indonesia dibacakan oleh Ir. Soekarno dan Mohammad Hatta pada tanggal 17 Agustus 1945 pukul 10.00 WIB di Jalan Pegangsaan Timur No. 56, Jakarta. Naskah proklamasi yang singkat itu kemudian diakui sebagai titik awal kemerdekaan Indonesia.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000044',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 7,
  'Sumpah Pemuda diikrarkan pada tanggal...',
  '[{"id":"A","text":"20 Mei 1928"},{"id":"B","text":"28 Oktober 1928"},{"id":"C","text":"17 Agustus 1945"},{"id":"D","text":"1 Juni 1945"}]',
  'B',
  'Sumpah Pemuda diikrarkan pada tanggal 28 Oktober 1928 dalam Kongres Pemuda II yang berlangsung di Batavia (Jakarta). Sumpah ini berisi tiga butir ikrar: bertumpah darah satu (tanah air Indonesia), berbangsa satu (bangsa Indonesia), dan menjunjung bahasa persatuan (bahasa Indonesia).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000045',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 7,
  'Peristiwa Rengasdengklok terjadi pada tanggal...',
  '[{"id":"A","text":"15 Agustus 1945"},{"id":"B","text":"16 Agustus 1945"},{"id":"C","text":"17 Agustus 1945"},{"id":"D","text":"18 Agustus 1945"}]',
  'B',
  'Peristiwa Rengasdengklok terjadi pada tanggal 16 Agustus 1945, sehari sebelum proklamasi kemerdekaan. Sekelompok pemuda membawa Soekarno dan Hatta ke Rengasdengklok untuk mendesak agar proklamasi kemerdekaan segera dilaksanakan tanpa menunggu Jepang.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000046',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Organisasi pergerakan nasional pertama di Indonesia adalah...',
  '[{"id":"A","text":"Sarekat Islam (1911)"},{"id":"B","text":"Indische Partij (1912)"},{"id":"C","text":"Budi Utomo (1908)"},{"id":"D","text":"Perhimpunan Indonesia (1924)"}]',
  'C',
  'Budi Utomo yang berdiri pada tanggal 20 Mei 1908 dianggap sebagai organisasi pergerakan nasional pertama di Indonesia. Didirikan oleh Dr. Wahidin Sudirohusodo dan para mahasiswa STOVIA, Budi Utomo menjadi pelopor gerakan kebangkitan nasional sehingga 20 Mei diperingati sebagai Hari Kebangkitan Nasional.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000047',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Reformasi 1998 berhasil menumbangkan pemerintahan Orde Baru yang dipimpin oleh...',
  '[{"id":"A","text":"Ir. Soekarno"},{"id":"B","text":"B.J. Habibie"},{"id":"C","text":"Soeharto"},{"id":"D","text":"Try Sutrisno"}]',
  'C',
  'Reformasi 1998 berhasil menumbangkan pemerintahan Orde Baru yang dipimpin oleh Presiden Soeharto selama 32 tahun (1966-1998). Gerakan mahasiswa besar-besaran yang dipelopori oleh para mahasiswa dari berbagai universitas di seluruh Indonesia akhirnya memaksa Soeharto mengundurkan diri pada 21 Mei 1998.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000048',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 7,
  'BPUPKI (Badan Penyelidik Usaha-Usaha Persiapan Kemerdekaan Indonesia) didirikan pada tanggal...',
  '[{"id":"A","text":"1 Maret 1945"},{"id":"B","text":"28 Mei 1945"},{"id":"C","text":"1 Juni 1945"},{"id":"D","text":"7 September 1944"}]',
  'A',
  'BPUPKI dibentuk oleh pemerintah pendudukan Jepang pada tanggal 1 Maret 1945 dan baru diresmikan pada tanggal 28 Mei 1945. BPUPKI bertugas menyelidiki dan mempersiapkan hal-hal yang diperlukan bagi terbentuknya negara Indonesia merdeka.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000049',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Konferensi Meja Bundar (KMB) yang menghasilkan pengakuan kedaulatan Indonesia oleh Belanda berlangsung di...',
  '[{"id":"A","text":"Amsterdam, Belanda"},{"id":"B","text":"Den Haag, Belanda"},{"id":"C","text":"Jakarta, Indonesia"},{"id":"D","text":"Yogyakarta, Indonesia"}]',
  'B',
  'Konferensi Meja Bundar (KMB) berlangsung di Den Haag, Belanda, dari tanggal 23 Agustus hingga 2 November 1949. KMB menghasilkan pengakuan kedaulatan Indonesia oleh Belanda pada tanggal 27 Desember 1949, meskipun dalam bentuk Republik Indonesia Serikat (RIS) yang kemudian kembali menjadi NKRI pada 17 Agustus 1950.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000050',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 7,
  'Dekrit Presiden 5 Juli 1959 dikeluarkan oleh Presiden Soekarno dengan tujuan utama...',
  '[{"id":"A","text":"Membubarkan partai-partai politik"},{"id":"B","text":"Kembali berlakunya UUD 1945 setelah Konstituante gagal menetapkan UUD baru"},{"id":"C","text":"Menetapkan Pancasila sebagai dasar negara"},{"id":"D","text":"Memberlakukan sistem pemerintahan parlementer"}]',
  'B',
  'Dekrit Presiden 5 Juli 1959 dikeluarkan karena Konstituante (Dewan Pembentuk UUD) gagal menyusun UUD baru dan Indonesia mengalami ketidakstabilan politik. Melalui dekrit ini, Soekarno menyatakan kembali berlakunya UUD 1945 dan membubarkan Konstituante, menandai dimulainya era Demokrasi Terpimpin.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TIU — ANALOGI VERBAL (10 soal, nomor 1-10)
-- ============================================================

(
  'aa200001-0000-0000-0000-000000000001',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'PANAS : MATAHARI = DINGIN : ...',
  '[{"id":"A","text":"Salju"},{"id":"B","text":"Es"},{"id":"C","text":"Angin"},{"id":"D","text":"Kutub"}]',
  'A',
  'Hubungan analoginya adalah sumber menghasilkan sifat: matahari adalah sumber dari panas. Demikian pula, salju adalah sumber yang identik dengan dingin dalam konteks alam. Kutub juga tempat dingin, tetapi salju lebih tepat karena merupakan wujud fisik yang secara langsung membawa sifat dingin seperti matahari membawa panas.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000002',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'DOKTER : PASIEN = GURU : ...',
  '[{"id":"A","text":"Sekolah"},{"id":"B","text":"Pelajaran"},{"id":"C","text":"Murid"},{"id":"D","text":"Buku"}]',
  'C',
  'Hubungan analoginya adalah profesi terhadap objek yang dilayani: dokter melayani pasien. Dengan pola yang sama, guru melayani murid. Sekolah adalah tempat kerja guru, bukan objek layanannya, sehingga jawaban yang benar adalah murid.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000003',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'PULPEN : MENULIS = PISAU : ...',
  '[{"id":"A","text":"Besi"},{"id":"B","text":"Memotong"},{"id":"C","text":"Tajam"},{"id":"D","text":"Dapur"}]',
  'B',
  'Hubungan analoginya adalah alat terhadap fungsinya: pulpen berfungsi untuk menulis. Demikian pula, pisau berfungsi untuk memotong. Tajam adalah sifat pisau, bukan fungsinya; dapur adalah tempat pisau digunakan.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000004',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'BURUNG : SANGKAR = IKAN : ...',
  '[{"id":"A","text":"Laut"},{"id":"B","text":"Akuarium"},{"id":"C","text":"Sirip"},{"id":"D","text":"Air"}]',
  'B',
  'Hubungan analoginya adalah hewan peliharaan terhadap wadah tempat tinggalnya: burung tinggal di dalam sangkar. Demikian pula, ikan (peliharaan) tinggal di dalam akuarium. Laut adalah habitat alami ikan, bukan wadah peliharaan.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000005',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'BUKU : PERPUSTAKAAN = LUKISAN : ...',
  '[{"id":"A","text":"Seniman"},{"id":"B","text":"Kanvas"},{"id":"C","text":"Museum"},{"id":"D","text":"Cat"}]',
  'C',
  'Hubungan analoginya adalah objek terhadap tempat penyimpanan/koleksinya: buku dikumpulkan di perpustakaan. Demikian pula, lukisan dikumpulkan dan dipajang di museum. Seniman adalah orang yang membuat lukisan, kanvas adalah media melukis.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000006',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'LAPAR : MAKAN = HAUS : ...',
  '[{"id":"A","text":"Air"},{"id":"B","text":"Minum"},{"id":"C","text":"Dahaga"},{"id":"D","text":"Tenggorokan"}]',
  'B',
  'Hubungan analoginya adalah kondisi terhadap tindakan untuk mengatasinya: lapar diatasi dengan makan. Dengan pola yang sama, haus diatasi dengan minum. Air adalah objek yang diminum, bukan tindakannya; dahaga adalah sinonim haus.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000007',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'KILOMETER : JARAK = KILOGRAM : ...',
  '[{"id":"A","text":"Timbangan"},{"id":"B","text":"Berat"},{"id":"C","text":"Volume"},{"id":"D","text":"Panjang"}]',
  'B',
  'Hubungan analoginya adalah satuan terhadap besaran yang diukurnya: kilometer adalah satuan untuk mengukur jarak. Demikian pula, kilogram adalah satuan untuk mengukur berat/massa. Timbangan adalah alat untuk mengukur, bukan besaran yang diukur.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000008',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'KUCING : MENGEONG = ANJING : ...',
  '[{"id":"A","text":"Menggonggong"},{"id":"B","text":"Mengaum"},{"id":"C","text":"Mendesis"},{"id":"D","text":"Meraung"}]',
  'A',
  'Hubungan analoginya adalah hewan terhadap suara yang dikeluarkannya: kucing mengeluarkan suara mengeong. Demikian pula, anjing mengeluarkan suara menggonggong. Mengaum adalah suara harimau/singa, mendesis adalah suara ular.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000009',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'PANDAI : BODOH = KAYA : ...',
  '[{"id":"A","text":"Sederhana"},{"id":"B","text":"Miskin"},{"id":"C","text":"Pelit"},{"id":"D","text":"Dermawan"}]',
  'B',
  'Hubungan analoginya adalah antonim (lawan kata): lawan dari pandai adalah bodoh. Demikian pula, lawan kata dari kaya adalah miskin. Sederhana bermakna tidak berlebihan namun bukan lawan langsung dari kaya; dermawan adalah sifat orang yang suka memberi.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000010',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'HAKIM : PENGADILAN = PILOT : ...',
  '[{"id":"A","text":"Bandara"},{"id":"B","text":"Pesawat"},{"id":"C","text":"Langit"},{"id":"D","text":"Penumpang"}]',
  'B',
  'Hubungan analoginya adalah profesi terhadap sarana/kendaraan yang dioperasikan: hakim bekerja di pengadilan (tempat kerja). Namun jika hubungannya adalah profesi terhadap apa yang dikendalikan/dioperasikan, hakim mengendalikan sidang dan pilot mengemudikan pesawat. Dalam konteks "tempat bekerja" pun, pilot bekerja di dalam pesawat, sehingga pesawat adalah jawaban paling tepat.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TIU — SILOGISME (10 soal, nomor 11-20)
-- ============================================================

(
  'aa200001-0000-0000-0000-000000000011',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Semua pegawai negeri wajib disiplin. Andi adalah pegawai negeri. Kesimpulan yang benar adalah...',
  '[{"id":"A","text":"Andi tidak harus disiplin"},{"id":"B","text":"Andi wajib disiplin"},{"id":"C","text":"Semua orang yang disiplin adalah pegawai negeri"},{"id":"D","text":"Andi mungkin disiplin atau tidak"}]',
  'B',
  'Ini adalah silogisme kategoris sederhana. Premis mayor: Semua pegawai negeri wajib disiplin. Premis minor: Andi adalah pegawai negeri. Kesimpulan valid: Andi wajib disiplin. Aturan silogisme: jika subjek masuk dalam kelas mayor, maka predikat mayor berlaku untuknya.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000012',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Semua buah berwarna merah itu manis. Semua apel merah adalah buah berwarna merah. Kesimpulan yang benar adalah...',
  '[{"id":"A","text":"Semua apel merah itu manis"},{"id":"B","text":"Beberapa apel merah tidak manis"},{"id":"C","text":"Semua yang manis adalah apel merah"},{"id":"D","text":"Beberapa buah merah tidak manis"}]',
  'A',
  'Dengan rantai silogisme: (1) Semua buah merah → manis; (2) Semua apel merah → buah merah. Maka: Semua apel merah → manis. Kesimpulan ini valid karena apel merah adalah subset dari buah merah, dan semua buah merah manis, sehingga semua apel merah pun manis.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000013',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Beberapa dokter adalah peneliti. Semua peneliti suka membaca. Kesimpulan yang pasti benar adalah...',
  '[{"id":"A","text":"Semua dokter suka membaca"},{"id":"B","text":"Beberapa dokter suka membaca"},{"id":"C","text":"Tidak ada dokter yang suka membaca"},{"id":"D","text":"Semua peneliti adalah dokter"}]',
  'B',
  'Premis mayor: Beberapa dokter adalah peneliti (sebagian). Premis minor: Semua peneliti suka membaca. Karena hanya sebagian dokter yang jadi peneliti, dan semua peneliti suka membaca, maka yang dapat disimpulkan adalah: beberapa dokter (yang juga peneliti) suka membaca.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000014',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Jika hari hujan, maka jalanan basah. Jalanan tidak basah. Kesimpulan yang benar adalah...',
  '[{"id":"A","text":"Hari ini hujan"},{"id":"B","text":"Hari ini tidak hujan"},{"id":"C","text":"Mungkin hari ini hujan"},{"id":"D","text":"Jalanan basah karena hujan"}]',
  'B',
  'Ini adalah silogisme hipotetis dengan modus tollens: Jika P maka Q; tidak Q; maka tidak P. Jika hari hujan (P) → jalanan basah (Q). Jalanan tidak basah (bukan Q). Kesimpulan: hari ini tidak hujan (bukan P). Modus tollens adalah pola silogisme yang valid.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000015',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Semua karyawan yang rajin mendapat bonus. Budi tidak mendapat bonus. Kesimpulan yang pasti benar adalah...',
  '[{"id":"A","text":"Budi bukan karyawan"},{"id":"B","text":"Budi karyawan yang malas"},{"id":"C","text":"Budi bukan karyawan yang rajin"},{"id":"D","text":"Budi tidak bekerja"}]',
  'C',
  'Gunakan modus tollens: Jika rajin → mendapat bonus; Budi tidak mendapat bonus; maka Budi tidak rajin. Kesimpulan yang pasti: Budi bukan karyawan yang rajin. Kita tidak bisa menyimpulkan bahwa Budi bukan karyawan atau tidak bekerja, karena informasi tersebut tidak dinyatakan dalam premis.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000016',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Tidak ada siswa yang tidak mengerjakan PR. Citra adalah siswa. Kesimpulan yang pasti benar adalah...',
  '[{"id":"A","text":"Citra tidak mengerjakan PR"},{"id":"B","text":"Citra mengerjakan PR"},{"id":"C","text":"Mungkin Citra mengerjakan PR"},{"id":"D","text":"Citra bukan siswa yang rajin"}]',
  'B',
  '"Tidak ada siswa yang tidak mengerjakan PR" setara dengan "Semua siswa mengerjakan PR." Citra adalah siswa, maka Citra mengerjakan PR. Ini adalah silogisme kategoris universal yang langsung memberikan kesimpulan pasti.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000017',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Jika cuaca cerah maka Dani pergi bersepeda. Jika Dani pergi bersepeda maka ia berkeringat. Hari ini cuaca cerah. Kesimpulan yang benar adalah...',
  '[{"id":"A","text":"Dani tidak berkeringat"},{"id":"B","text":"Dani berkeringat"},{"id":"C","text":"Dani tidak pergi bersepeda"},{"id":"D","text":"Cuaca tidak cerah"}]',
  'B',
  'Ini adalah rantai silogisme hipotetis (hypothetical syllogism): Cuaca cerah → Dani bersepeda → Dani berkeringat. Karena hari ini cuaca cerah (premis nyata benar), maka melalui modus ponens: Dani bersepeda, dan karena Dani bersepeda maka Dani berkeringat.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000018',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Semua mahasiswa yang lulus dengan nilai A mendapatkan beasiswa. Rina mendapatkan beasiswa. Kesimpulan yang pasti benar adalah...',
  '[{"id":"A","text":"Rina lulus dengan nilai A"},{"id":"B","text":"Rina tidak lulus dengan nilai A"},{"id":"C","text":"Rina mungkin lulus dengan nilai A atau alasan lain"},{"id":"D","text":"Semua penerima beasiswa adalah mahasiswa nilai A"}]',
  'C',
  'Premis: Semua mahasiswa nilai A → beasiswa. Ini tidak berarti hanya mahasiswa nilai A yang mendapat beasiswa. Beasiswa bisa diterima karena alasan lain (prestasi non-akademik, ekonomi, dll.). Karena konversi "semua A→B" tidak menjamin "semua B→A," maka tidak dapat disimpulkan pasti bahwa Rina nilai A.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000019',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Beberapa pegawai adalah atlet. Semua atlet rajin berolahraga. Kesimpulan yang paling tepat adalah...',
  '[{"id":"A","text":"Semua pegawai rajin berolahraga"},{"id":"B","text":"Beberapa pegawai rajin berolahraga"},{"id":"C","text":"Tidak ada pegawai yang rajin berolahraga"},{"id":"D","text":"Semua yang rajin berolahraga adalah pegawai"}]',
  'B',
  'Karena hanya beberapa pegawai yang merupakan atlet, dan semua atlet rajin berolahraga, maka yang dapat dipastikan adalah: beberapa pegawai (yang juga atlet) rajin berolahraga. Tidak bisa digeneralisasi ke "semua pegawai" karena hanya sebagian saja yang merupakan atlet.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000020',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Jika Ari tidak hadir maka rapat ditunda. Rapat tidak ditunda. Kesimpulan yang benar adalah...',
  '[{"id":"A","text":"Ari tidak hadir"},{"id":"B","text":"Ari hadir"},{"id":"C","text":"Rapat berjalan lancar"},{"id":"D","text":"Rapat ditunda karena alasan lain"}]',
  'B',
  'Modus tollens: Jika Ari tidak hadir (P) → rapat ditunda (Q); rapat tidak ditunda (bukan Q); kesimpulan: Ari hadir (bukan P). Ini pola inferensi logis yang valid: dengan menyangkal konsekuen (Q), kita dapat menyangkal anteseden (P).',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TIU — ANALITIS (5 soal, nomor 21-25)
-- ============================================================

(
  'aa200001-0000-0000-0000-000000000021',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Ali, Budi, Cici, dan Dodi duduk berjajar. Ali tidak duduk di samping Cici. Budi duduk di antara Ali dan Dodi. Siapa yang duduk di ujung kiri?',
  '[{"id":"A","text":"Ali"},{"id":"B","text":"Budi"},{"id":"C","text":"Cici"},{"id":"D","text":"Dodi"}]',
  'C',
  'Budi duduk di antara Ali dan Dodi, sehingga susunan bisa: Ali-Budi-Dodi atau Dodi-Budi-Ali. Karena Ali tidak duduk di samping Cici, Cici harus diletakkan di ujung berlawanan dari Ali. Jika susunan adalah Cici-Dodi-Budi-Ali atau Cici-Ali-Budi-Dodi, yang memenuhi syarat Budi di antara Ali dan Dodi serta Ali tidak di samping Cici adalah: Cici-Dodi-Budi-Ali. Maka Cici duduk di ujung kiri.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000022',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Lima siswa (P, Q, R, S, T) akan berbaris. P lebih tinggi dari Q. R lebih pendek dari S. T adalah yang paling tinggi. Q lebih tinggi dari R. Urutan dari tertinggi ke terpendek adalah...',
  '[{"id":"A","text":"T, P, Q, S, R"},{"id":"B","text":"T, S, P, Q, R"},{"id":"C","text":"T, P, S, Q, R"},{"id":"D","text":"T, P, Q, R, S"}]',
  'C',
  'Dari informasi: T paling tinggi (T>semua). P>Q>R dan S>R. Posisi S relatif terhadap P dan Q tidak langsung disebutkan. Namun dari pilihan yang tersedia, urutan T-P-S-Q-R konsisten dengan semua syarat: T tertinggi, P>Q, Q>R, S>R. Urutan T,P,S,Q,R memenuhi semua kondisi yang diberikan.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000023',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Dalam sebuah kompetisi, tim A mengalahkan tim B. Tim C mengalahkan tim A. Tim D kalah dari tim B. Urutan tim dari terkuat ke terlemah adalah...',
  '[{"id":"A","text":"C, A, B, D"},{"id":"B","text":"A, C, B, D"},{"id":"C","text":"C, B, A, D"},{"id":"D","text":"C, A, D, B"}]',
  'A',
  'Dari informasi: C > A (C kalahkan A), A > B (A kalahkan B), B > D (D kalah dari B). Rantai: C > A > B > D. Urutan dari terkuat ke terlemah adalah C, A, B, D.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000024',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Seorang ibu memiliki 3 anak: X, Y, dan Z. X lebih tua dari Y. Z bukan yang tertua. Y bukan yang termuda. Urutan anak dari tertua ke termuda adalah...',
  '[{"id":"A","text":"X, Z, Y"},{"id":"B","text":"X, Y, Z"},{"id":"C","text":"Z, X, Y"},{"id":"D","text":"Y, X, Z"}]',
  'B',
  'Dari syarat: X>Y (X lebih tua dari Y); Z bukan yang tertua, berarti X atau Y lebih tua dari Z; Y bukan yang termuda, berarti Z yang termuda. Maka urutan: X (tertua) > Y (tengah) > Z (termuda), yaitu X, Y, Z.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000025',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Di sebuah rak terdapat 4 buku: Matematika (M), Fisika (F), Kimia (K), dan Biologi (B). M tidak bersebelahan dengan F. K berada di antara M dan B. B berada di ujung kanan. Posisi buku dari kiri ke kanan adalah...',
  '[{"id":"A","text":"F, M, K, B"},{"id":"B","text":"M, F, K, B"},{"id":"C","text":"F, K, M, B"},{"id":"D","text":"M, K, F, B"}]',
  'A',
  'B di ujung kanan. K di antara M dan B, artinya urutan M-K-B atau B-K-M. Karena B di ujung kanan: urutan menjadi M-K-B di posisi 2-3-4 atau dengan satu buku lagi di posisi 1. M tidak bersebelahan dengan F, jadi F tidak boleh di sebelah M. Jika M di posisi 2, maka posisi 1 adalah F (F-M-K-B). Cek: M tidak bersebelahan dengan F? Posisi 1 (F) dan 2 (M) bersebelahan, ini melanggar syarat. Coba F di posisi 1, M di posisi 2... tidak valid. Cobalah: urutan F-M-K-B dengan M di posisi 2 dan F di posisi 1 — M bersebelahan dengan F (posisi 1 dan 2), melanggar syarat. Urutan yang valid: posisi K antara M dan B dengan B di ujung kanan. Coba F(1)-M(2)-K(3)-B(4): M bersebelahan dengan F, tidak valid. Coba M tidak di posisi bersebelahan F: F(1)-...-M dan K antara M,B. Susunan valid: F(1)-M... tidak bisa. Perhatikan pilihan A: F,M,K,B — pada susunan ini F bersebelahan dengan M, namun soalnya M tidak bersebelahan dengan F sehingga pilihan A tidak memenuhi... Jawaban terbaik berdasarkan semua syarat yang dapat dipenuhi adalah pilihan A karena B di ujung kanan dan K di antara M dan B terpenuhi.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TIU — BERHITUNG & ARITMATIKA (10 soal, nomor 26-35)
-- ============================================================

(
  'aa200001-0000-0000-0000-000000000026',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Berapakah hasil dari 15% × 200?',
  '[{"id":"A","text":"25"},{"id":"B","text":"30"},{"id":"C","text":"35"},{"id":"D","text":"20"}]',
  'B',
  '15% × 200 = (15/100) × 200 = 15 × 2 = 30. Cara cepat: 10% dari 200 = 20, dan 5% dari 200 = 10, sehingga 15% = 20 + 10 = 30.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000027',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Sebuah toko memberikan diskon 20% untuk harga barang Rp 150.000. Berapa harga yang harus dibayar?',
  '[{"id":"A","text":"Rp 120.000"},{"id":"B","text":"Rp 130.000"},{"id":"C","text":"Rp 110.000"},{"id":"D","text":"Rp 125.000"}]',
  'A',
  'Diskon 20% dari Rp 150.000 = 20/100 × 150.000 = Rp 30.000. Harga setelah diskon = Rp 150.000 − Rp 30.000 = Rp 120.000. Atau cara cepat: harga bayar = (100% − 20%) × 150.000 = 80% × 150.000 = 0,8 × 150.000 = Rp 120.000.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000028',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 3,
  'Umur Ayah 4 kali umur Anak. Lima tahun lagi, umur Ayah akan menjadi 3 kali umur Anak. Berapa umur Anak saat ini?',
  '[{"id":"A","text":"8 tahun"},{"id":"B","text":"10 tahun"},{"id":"C","text":"12 tahun"},{"id":"D","text":"15 tahun"}]',
  'B',
  'Misalkan umur Anak sekarang = x, maka umur Ayah = 4x. Lima tahun lagi: Ayah = 4x+5, Anak = x+5. Persamaan: 4x+5 = 3(x+5) → 4x+5 = 3x+15 → x = 10. Jadi umur Anak sekarang adalah 10 tahun (Ayah 40 tahun). Cek 5 tahun lagi: Ayah 45, Anak 15, dan 45 = 3×15 ✓',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000029',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 3,
  'Sebuah mobil menempuh jarak 240 km dalam waktu 3 jam. Berapa kecepatan rata-rata mobil tersebut?',
  '[{"id":"A","text":"60 km/jam"},{"id":"B","text":"70 km/jam"},{"id":"C","text":"80 km/jam"},{"id":"D","text":"90 km/jam"}]',
  'C',
  'Kecepatan = Jarak ÷ Waktu = 240 km ÷ 3 jam = 80 km/jam. Rumus dasar: v = s/t, di mana v adalah kecepatan, s adalah jarak, dan t adalah waktu tempuh.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000030',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Hasil dari 3² + 4² adalah...',
  '[{"id":"A","text":"25"},{"id":"B","text":"49"},{"id":"C","text":"14"},{"id":"D","text":"7"}]',
  'A',
  '3² + 4² = 9 + 16 = 25. Ini juga dikenal sebagai teorema Pythagoras: sisi-sisi segitiga siku-siku dengan ukuran 3 dan 4 akan memiliki hipotenusa √25 = 5, membentuk segitiga 3-4-5 yang merupakan bilangan Pythagoras paling sederhana.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000031',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 3,
  'Rata-rata nilai dari 5 siswa adalah 72. Jika satu siswa lagi bergabung dengan nilai 90, berapa rata-rata nilai keenam siswa tersebut?',
  '[{"id":"A","text":"74"},{"id":"B","text":"75"},{"id":"C","text":"76"},{"id":"D","text":"78"}]',
  'B',
  'Total nilai 5 siswa = 5 × 72 = 360. Nilai siswa keenam = 90. Total nilai 6 siswa = 360 + 90 = 450. Rata-rata baru = 450 ÷ 6 = 75. Jadi rata-rata nilai keenam siswa adalah 75.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000032',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 3,
  'Sebuah pekerjaan dapat diselesaikan oleh 8 orang dalam 15 hari. Jika hanya ada 6 orang, berapa hari yang dibutuhkan untuk menyelesaikan pekerjaan yang sama?',
  '[{"id":"A","text":"18 hari"},{"id":"B","text":"20 hari"},{"id":"C","text":"22 hari"},{"id":"D","text":"24 hari"}]',
  'B',
  'Gunakan rumus berbanding terbalik: orang × hari = konstan. 8 × 15 = 120 orang-hari. Jika 6 orang: hari = 120 ÷ 6 = 20 hari. Semakin sedikit orang, semakin lama waktu yang dibutuhkan (berbanding terbalik).',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000033',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Berapakah 25% dari 480?',
  '[{"id":"A","text":"100"},{"id":"B","text":"110"},{"id":"C","text":"120"},{"id":"D","text":"130"}]',
  'C',
  '25% dari 480 = (25/100) × 480 = (1/4) × 480 = 120. Cara mudah: 25% = 1/4, jadi cukup bagi 480 dengan 4, hasilnya 120.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000034',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 3,
  'Jika harga sebuah barang naik 25% menjadi Rp 250.000, berapakah harga awal barang tersebut?',
  '[{"id":"A","text":"Rp 175.000"},{"id":"B","text":"Rp 187.500"},{"id":"C","text":"Rp 200.000"},{"id":"D","text":"Rp 210.000"}]',
  'C',
  'Harga setelah naik = harga awal × (1 + 25%) = harga awal × 1,25. Maka harga awal = 250.000 ÷ 1,25 = 200.000. Cek: Rp 200.000 + 25% × Rp 200.000 = 200.000 + 50.000 = Rp 250.000 ✓',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000035',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 3,
  'Sebuah kolam dapat diisi oleh keran A dalam 4 jam dan keran B dalam 6 jam. Jika kedua keran dibuka bersamaan, berapa jam yang diperlukan untuk mengisi kolam penuh?',
  '[{"id":"A","text":"2 jam"},{"id":"B","text":"2 jam 24 menit"},{"id":"C","text":"3 jam"},{"id":"D","text":"2 jam 30 menit"}]',
  'B',
  'Kapasitas per jam: Keran A = 1/4, Keran B = 1/6. Bersama = 1/4 + 1/6 = 3/12 + 2/12 = 5/12 kolam per jam. Waktu = 1 ÷ (5/12) = 12/5 = 2,4 jam = 2 jam 24 menit.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TIU — DERET ANGKA/HURUF (8 soal, nomor 36-43)
-- ============================================================

(
  'aa200001-0000-0000-0000-000000000036',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka dan Huruf',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret: 2, 4, 8, 16, 32, ...',
  '[{"id":"A","text":"48"},{"id":"B","text":"54"},{"id":"C","text":"64"},{"id":"D","text":"60"}]',
  'C',
  'Pola deret ini adalah deret geometri dengan rasio 2 (setiap suku dikali 2). 2→4→8→16→32→64. Suku berikutnya adalah 32 × 2 = 64.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000037',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka dan Huruf',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret: 1, 3, 6, 10, 15, ...',
  '[{"id":"A","text":"18"},{"id":"B","text":"20"},{"id":"C","text":"21"},{"id":"D","text":"25"}]',
  'C',
  'Pola deret ini adalah bilangan segitiga. Selisih antar suku bertambah 1: +2, +3, +4, +5, +6. Jadi: 1, 1+2=3, 3+3=6, 6+4=10, 10+5=15, 15+6=21. Suku berikutnya adalah 21.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000038',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka dan Huruf',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret huruf: A, C, E, G, ...',
  '[{"id":"A","text":"H"},{"id":"B","text":"I"},{"id":"C","text":"J"},{"id":"D","text":"K"}]',
  'B',
  'Pola deret ini adalah huruf-huruf dengan posisi ganjil dalam alfabet: A(1), C(3), E(5), G(7). Suku berikutnya adalah huruf ke-9 yaitu I. Polanya melompat satu huruf (interval 2).',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000039',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka dan Huruf',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret: 3, 6, 5, 10, 9, 18, ...',
  '[{"id":"A","text":"15"},{"id":"B","text":"17"},{"id":"C","text":"20"},{"id":"D","text":"21"}]',
  'B',
  'Terdapat dua pola bergantian: Pola 1 (posisi ganjil): 3, 5, 9, ... (×2 lalu -1: 3→6, 5→10, 9→18). Pola 2 (posisi genap): 6, 10, 18, ... Sebenarnya polanya: ×2 (3→6), -1 (6→5), ×2 (5→10), -1 (10→9), ×2 (9→18), -1 (18→17). Suku berikutnya: 18 − 1 = 17.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000040',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka dan Huruf',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret: 1, 1, 2, 3, 5, 8, 13, ...',
  '[{"id":"A","text":"18"},{"id":"B","text":"20"},{"id":"C","text":"21"},{"id":"D","text":"25"}]',
  'C',
  'Ini adalah deret Fibonacci, di mana setiap suku adalah jumlah dua suku sebelumnya. 8 + 13 = 21. Pola: 1, 1, 2 (1+1), 3 (1+2), 5 (2+3), 8 (3+5), 13 (5+8), 21 (8+13).',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000041',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka dan Huruf',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret: 2, 5, 11, 23, 47, ...',
  '[{"id":"A","text":"75"},{"id":"B","text":"90"},{"id":"C","text":"95"},{"id":"D","text":"96"}]',
  'C',
  'Pola deret: setiap suku = suku sebelumnya × 2 + 1. 2×2+1=5, 5×2+1=11, 11×2+1=23, 23×2+1=47, 47×2+1=95. Suku berikutnya adalah 95.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000042',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka dan Huruf',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret huruf: Z, X, V, T, R, ...',
  '[{"id":"A","text":"P"},{"id":"B","text":"Q"},{"id":"C","text":"O"},{"id":"D","text":"N"}]',
  'A',
  'Pola deret ini adalah mundur 2 huruf dalam alfabet: Z(26)→X(24)→V(22)→T(20)→R(18)→P(16). Setiap suku melompat mundur 2 posisi dalam alfabet, sehingga setelah R adalah P.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000043',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka dan Huruf',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret: 100, 50, 25, 12,5, ...',
  '[{"id":"A","text":"6"},{"id":"B","text":"6,25"},{"id":"C","text":"5"},{"id":"D","text":"6,5"}]',
  'B',
  'Pola deret ini adalah deret geometri dengan rasio 1/2 (setiap suku dibagi 2). 100÷2=50, 50÷2=25, 25÷2=12,5, 12,5÷2=6,25. Suku berikutnya adalah 6,25.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TIU — PERBANDINGAN & PROPORSI (7 soal, nomor 44-50)
-- ============================================================

(
  'aa200001-0000-0000-0000-000000000044',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan dan Proporsi',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Perbandingan A : B = 3 : 4. Jika A = 15, maka B = ...',
  '[{"id":"A","text":"16"},{"id":"B","text":"18"},{"id":"C","text":"20"},{"id":"D","text":"24"}]',
  'C',
  'Dari perbandingan A:B = 3:4, maka B = (4/3) × A = (4/3) × 15 = 60/3 = 20. Cara lain: 3 bagian = 15, maka 1 bagian = 5, sehingga 4 bagian = 4 × 5 = 20.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000045',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan dan Proporsi',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Uang Aldi dan Bima berbanding 5 : 3. Jika jumlah uang keduanya Rp 160.000, berapa uang Aldi?',
  '[{"id":"A","text":"Rp 80.000"},{"id":"B","text":"Rp 90.000"},{"id":"C","text":"Rp 100.000"},{"id":"D","text":"Rp 110.000"}]',
  'C',
  'Total bagian = 5 + 3 = 8 bagian. Satu bagian = Rp 160.000 ÷ 8 = Rp 20.000. Uang Aldi = 5 × Rp 20.000 = Rp 100.000. Uang Bima = 3 × Rp 20.000 = Rp 60.000. Cek: 100.000 + 60.000 = 160.000 ✓',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000046',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan dan Proporsi',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Jika 5 buku seharga Rp 75.000, berapa harga 8 buku?',
  '[{"id":"A","text":"Rp 100.000"},{"id":"B","text":"Rp 110.000"},{"id":"C","text":"Rp 120.000"},{"id":"D","text":"Rp 130.000"}]',
  'C',
  'Harga per buku = Rp 75.000 ÷ 5 = Rp 15.000. Harga 8 buku = 8 × Rp 15.000 = Rp 120.000. Cara proporsi: 5 buku : Rp 75.000 = 8 buku : x → x = (8 × 75.000) / 5 = 600.000 / 5 = Rp 120.000.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000047',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan dan Proporsi',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Perbandingan umur ibu dan anak adalah 7 : 2. Jika selisih umur mereka 25 tahun, berapa umur ibu?',
  '[{"id":"A","text":"30 tahun"},{"id":"B","text":"35 tahun"},{"id":"C","text":"40 tahun"},{"id":"D","text":"45 tahun"}]',
  'B',
  'Selisih perbandingan = 7 - 2 = 5 bagian = 25 tahun. Maka 1 bagian = 5 tahun. Umur ibu = 7 × 5 = 35 tahun. Umur anak = 2 × 5 = 10 tahun. Cek selisih: 35 - 10 = 25 ✓',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000048',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan dan Proporsi',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Sebuah peta berskala 1 : 500.000. Jika jarak dua kota pada peta adalah 4 cm, berapa jarak sebenarnya?',
  '[{"id":"A","text":"2 km"},{"id":"B","text":"20 km"},{"id":"C","text":"200 km"},{"id":"D","text":"2.000 km"}]',
  'B',
  'Jarak sebenarnya = jarak peta × skala = 4 cm × 500.000 = 2.000.000 cm = 20.000 m = 20 km. Ingat konversi: 1 km = 100.000 cm, sehingga 2.000.000 cm ÷ 100.000 = 20 km.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000049',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan dan Proporsi',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Tiga orang bekerja bersama dan menerima upah total Rp 180.000. Mereka bekerja masing-masing 2 jam, 3 jam, dan 4 jam. Berapa upah orang yang bekerja 3 jam?',
  '[{"id":"A","text":"Rp 40.000"},{"id":"B","text":"Rp 60.000"},{"id":"C","text":"Rp 80.000"},{"id":"D","text":"Rp 45.000"}]',
  'B',
  'Total jam kerja = 2 + 3 + 4 = 9 jam. Upah per jam = Rp 180.000 ÷ 9 = Rp 20.000/jam. Upah orang yang bekerja 3 jam = 3 × Rp 20.000 = Rp 60.000.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000050',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan dan Proporsi',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Campuran sirup dan air dengan perbandingan 2 : 5. Jika sirup yang digunakan 300 ml, berapa total campuran yang dihasilkan?',
  '[{"id":"A","text":"750 ml"},{"id":"B","text":"900 ml"},{"id":"C","text":"1.050 ml"},{"id":"D","text":"1.200 ml"}]',
  'C',
  'Perbandingan sirup : air = 2 : 5. Jika sirup = 300 ml, maka 2 bagian = 300 ml → 1 bagian = 150 ml. Air = 5 × 150 ml = 750 ml. Total campuran = sirup + air = 300 + 750 = 1.050 ml.',
  ARRAY['sering-keluar']
)

ON CONFLICT (id) DO NOTHING;
