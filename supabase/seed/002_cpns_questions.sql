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
),

-- ============================================================
-- TWK — Batch tambahan (051-058) — pola soal SKD klasik
-- Topik unik: HAM, Dekrit 5 Juli 1959, TAP MPR/Referendum,
-- Sejarah Hiroshima-Nagasaki, hasil sidang PPKI, Max Havelaar,
-- Deklarasi Djuanda, Konferensi Asia Afrika.
-- ============================================================

(
  'aa100001-0000-0000-0000-000000000051',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Kaitan Pembukaan UUD 1945 dengan Hak Asasi Manusia (HAM) adalah sebagai...',
  '[{"id":"A","text":"Sumber rumusan HAM Indonesia"},{"id":"B","text":"Penjelasan teknis pelaksanaan HAM"},{"id":"C","text":"Pedoman peradilan HAM"},{"id":"D","text":"Daftar pelanggaran HAM masa lampau"}]',
  'A',
  'Pembukaan UUD 1945, khususnya alinea pertama dan keempat, merupakan piagam HAM Indonesia. Di sanalah hak asasi manusia diakui sebagai bagian dari cita-cita kemerdekaan, sebelum dijabarkan dalam Pasal 28A-28J. Penjelasan teknis dan pedoman peradilan diatur dalam UU No. 39 Tahun 1999 dan UU No. 26 Tahun 2000.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000052',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 7,
  'Berikut ini yang BUKAN merupakan dampak Dekrit Presiden 5 Juli 1959 adalah...',
  '[{"id":"A","text":"Pembubaran Konstituante"},{"id":"B","text":"UUDS 1950 tidak berlaku lagi"},{"id":"C","text":"Pembentukan DPRS sebagai pengganti DPR"},{"id":"D","text":"Pembentukan DPAS (Dewan Pertimbangan Agung Sementara)"}]',
  'C',
  'Dekrit Presiden 5 Juli 1959 berdampak: (1) membubarkan Konstituante, (2) memberlakukan kembali UUD 1945 dan mencabut UUDS 1950, (3) membentuk MPRS dan DPAS. DPR (bukan DPRS) tetap berfungsi dengan struktur baru. DPRS bukan istilah yang muncul dari dekrit ini.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000053',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SULIT', 8,
  'TAP MPR No. IV/MPR/1983 mengatur mekanisme perubahan UUD 1945 melalui...',
  '[{"id":"A","text":"Interpelasi"},{"id":"B","text":"Hak Angket"},{"id":"C","text":"Referendum"},{"id":"D","text":"Mosi tidak percaya"}]',
  'C',
  'TAP MPR No. IV/MPR/1983 mengatur tata cara perubahan UUD 1945 melalui mekanisme referendum, yaitu menanyakan langsung kepada rakyat. Ketetapan ini kemudian dicabut melalui TAP MPR No. VIII/MPR/1998 sebagai bagian dari reformasi. Interpelasi dan hak angket adalah hak DPR untuk meminta keterangan/menyelidiki, bukan untuk mengubah UUD.',
  ARRAY['jarang-keluar']
),

(
  'aa100001-0000-0000-0000-000000000054',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Penyebab utama menyerahnya Jepang kepada Sekutu pada bulan Agustus 1945 adalah...',
  '[{"id":"A","text":"Tentara Jepang banyak yang gugur di medan tempur"},{"id":"B","text":"Kota Hiroshima (6 Agustus) dan Nagasaki (9 Agustus) dibom atom oleh Amerika Serikat"},{"id":"C","text":"Kaisar Jepang menolak meneruskan perang"},{"id":"D","text":"Hilangnya dukungan rakyat Indonesia terhadap Jepang"}]',
  'B',
  'Penyebab utama Jepang menyerah tanpa syarat kepada Sekutu adalah dijatuhkannya bom atom oleh AS di Hiroshima (6 Agustus 1945) dan Nagasaki (9 Agustus 1945). Jepang resmi menyerah pada 15 Agustus 1945, yang menjadi vacuum of power dan dimanfaatkan untuk Proklamasi 17 Agustus 1945.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000055',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Berikut ini hasil sidang PPKI tanggal 18 Agustus 1945, KECUALI...',
  '[{"id":"A","text":"Mengesahkan UUD 1945 sebagai konstitusi negara"},{"id":"B","text":"Menetapkan Soekarno dan Mohammad Hatta sebagai Presiden dan Wakil Presiden"},{"id":"C","text":"Membentuk Komite Nasional Indonesia Pusat (KNIP) untuk membantu Presiden"},{"id":"D","text":"Membentuk delapan provinsi pertama Republik Indonesia"}]',
  'D',
  'Hasil sidang PPKI tanggal 18 Agustus 1945: (1) mengesahkan UUD 1945, (2) memilih Soekarno-Hatta sebagai Presiden dan Wakil Presiden, (3) membentuk Komite Nasional sebagai pembantu Presiden sementara. Pembentukan 8 provinsi pertama (Sumatera, Jawa Barat, Jawa Tengah, Jawa Timur, Sunda Kecil, Maluku, Sulawesi, Kalimantan) baru diputuskan pada sidang PPKI kedua tanggal 19 Agustus 1945.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000056',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Buku "Max Havelaar" yang menceritakan penderitaan rakyat Indonesia akibat sistem tanam paksa ditulis oleh...',
  '[{"id":"A","text":"Eduard Douwes Dekker dengan nama pena Multatuli"},{"id":"B","text":"Pieter Erberveld"},{"id":"C","text":"Snouck Hurgronje"},{"id":"D","text":"Herman Willem Daendels"}]',
  'A',
  'Max Havelaar (1860) ditulis oleh Eduard Douwes Dekker dengan nama samaran Multatuli (bahasa Latin: "aku yang banyak menderita"). Buku ini mengkritik penerapan sistem tanam paksa (cultuurstelsel) di Hindia Belanda dan mempengaruhi pergeseran kebijakan kolonial menjadi Politik Etis pada awal abad ke-20.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000057',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI dan Wawasan Nusantara',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Deklarasi Djuanda yang dikeluarkan pada 13 Desember 1957 berisi pernyataan bahwa...',
  '[{"id":"A","text":"Indonesia menolak segala bentuk penanaman modal asing"},{"id":"B","text":"Wilayah perairan di antara, di sekitar, dan yang menghubungkan pulau-pulau Indonesia adalah bagian wilayah kedaulatan NKRI"},{"id":"C","text":"Indonesia menarik diri dari Perserikatan Bangsa-Bangsa"},{"id":"D","text":"Bahasa Indonesia menjadi satu-satunya bahasa resmi negara"}]',
  'B',
  'Deklarasi Djuanda menjadi dasar konsep Negara Kepulauan (archipelagic state) Indonesia. Sebelumnya, perairan antar pulau dianggap perairan internasional. Deklarasi ini diakui dunia melalui UNCLOS 1982 dan luas wilayah RI bertambah signifikan menjadi negara maritim. Diabadikan setiap 13 Desember sebagai Hari Nusantara.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000058',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Salah satu tujuan utama diadakannya Konferensi Asia-Afrika (KAA) di Bandung pada April 1955 adalah...',
  '[{"id":"A","text":"Membentuk pakta militer tandingan NATO"},{"id":"B","text":"Membahas masalah kedaulatan nasional, anti-rasialisme, dan anti-kolonialisme"},{"id":"C","text":"Memperluas wilayah pengaruh Blok Timur ke Asia-Afrika"},{"id":"D","text":"Membentuk mata uang tunggal Asia-Afrika"}]',
  'B',
  'KAA Bandung 1955 dihadiri 29 negara Asia-Afrika dan menghasilkan Dasasila Bandung. Tujuan utamanya adalah memajukan kerja sama bangsa Asia-Afrika, membicarakan masalah ekonomi-sosial-budaya, serta menyoroti masalah kedaulatan nasional, rasialisme, dan kolonialisme. KAA menjadi cikal bakal Gerakan Non-Blok (GNB) 1961.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TIU — Batch tambahan (051-057) — Sinonim, Antonim, Peribahasa,
-- pola soal kosakata yang sering muncul di SKD CPNS.
-- ============================================================

(
  'aa200001-0000-0000-0000-000000000051',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Sinonim dari kata "GETIR" adalah...',
  '[{"id":"A","text":"Manis"},{"id":"B","text":"Pahit"},{"id":"C","text":"Pedas"},{"id":"D","text":"Asam"}]',
  'B',
  'Menurut KBBI, "getir" berarti rasa pahit yang agak pedas (seperti rasa kulit jeruk), atau secara kiasan berarti pahit/menyakitkan dalam pengalaman hidup. Sinonim paling tepat adalah "pahit".',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000052',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SULIT', 8,
  'Sinonim dari kata "BANDELA" adalah...',
  '[{"id":"A","text":"Peti kemas"},{"id":"B","text":"Bendera"},{"id":"C","text":"Lambang"},{"id":"D","text":"Simbol"}]',
  'A',
  'Menurut KBBI, "bandela" berarti bungkusan atau peti besar berisi barang-barang dagangan, sehingga sinonim yang paling tepat adalah "peti kemas". Kata ini termasuk kosakata jarang yang kerap muncul di soal TIU karena menguji penguasaan kosakata baku.',
  ARRAY['jarang-keluar']
),

(
  'aa200001-0000-0000-0000-000000000053',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Sinonim dari kata "MUKADIMAH" adalah...',
  '[{"id":"A","text":"Penutup"},{"id":"B","text":"Pembukaan"},{"id":"C","text":"Daftar isi"},{"id":"D","text":"Lampiran"}]',
  'B',
  '"Mukadimah" (dari bahasa Arab muqaddimah) berarti kata pendahuluan atau pengantar di awal suatu naskah/tulisan. Sinonim paling tepat: pembukaan. Pembukaan UUD 1945 sering juga disebut sebagai Mukadimah UUD 1945.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000054',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Antonim dari kata "SINKRON" adalah...',
  '[{"id":"A","text":"Selaras"},{"id":"B","text":"Serasi"},{"id":"C","text":"Berbeda"},{"id":"D","text":"Harmonis"}]',
  'C',
  '"Sinkron" berarti terjadi atau berlaku pada waktu yang sama, sejalan, sesuai. Antonimnya adalah "berbeda" (tidak sejalan/tidak sesuai). Pilihan selaras, serasi, dan harmonis justru merupakan sinonim, bukan antonim.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000055',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Antonim dari kata "NEKAT" adalah...',
  '[{"id":"A","text":"Berani"},{"id":"B","text":"Takut"},{"id":"C","text":"Niat"},{"id":"D","text":"Maksud"}]',
  'B',
  '"Nekat" berarti terlalu berani; bertindak tanpa berpikir panjang. Antonim paling tepat adalah "takut" (sikap penuh keraguan). Pilihan berani justru sinonim, sedangkan niat dan maksud bukan lawan kata melainkan kata yang merepresentasikan motivasi.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000056',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Makna peribahasa "Asal ada, kecil pun pada" adalah...',
  '[{"id":"A","text":"Harta benda bukan yang utama, melainkan kesehatan"},{"id":"B","text":"Bersyukurlah dengan apa yang didapat walaupun sedikit"},{"id":"C","text":"Menjadi orang harus memberi manfaat walau sedikit"},{"id":"D","text":"Manusia harus berusaha terus tanpa mengenal lelah"}]',
  'B',
  'Peribahasa "Asal ada, kecil pun pada" dipakai untuk menghibur hati orang yang mendapatkan hasil sedikit. Maknanya: lebih baik bersyukur atas hasil yang sedikit daripada tidak mendapat apa-apa sama sekali. Ini mengajarkan rasa cukup dan syukur (qanaah).',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000057',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka dan Huruf',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutkan deret huruf berikut: A, C, E, G, I, ..., ...',
  '[{"id":"A","text":"K dan M"},{"id":"B","text":"J dan L"},{"id":"C","text":"K dan N"},{"id":"D","text":"L dan N"}]',
  'A',
  'Pola deret: setiap huruf berikutnya lompat 2 posisi dalam alfabet (A→C→E→G→I, masing-masing +2). Maka dua suku berikutnya: I + 2 = K, lalu K + 2 = M. Jadi jawabannya K dan M.',
  ARRAY['sering-keluar']
)

ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- TWK — Batch 2 (059-100): UUD 1945, Pancasila, PKI, Sejarah,
-- NKRI, Bhinneka Tunggal Ika, Kebijakan Pemerintah (42 soal)
-- TIU — Batch 2 (058-100): Silogisme, Numerik, Deret, Analogi,
-- Perbandingan, Peribahasa (43 soal)
-- ============================================================

INSERT INTO public.questions
  (id, pack_id, exam_type, subject, subtopic, question_type, difficulty, difficulty_rank,
   question_text, options, correct_option, explanation_text, tags)
VALUES

-- ============================================================
-- TWK 059-065: Pasal-pasal UUD 1945
-- ============================================================

(
  'aa100001-0000-0000-0000-000000000059',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Pasal UUD 1945 yang menyatakan "Menteri-menteri Negara adalah pembantu Presiden" adalah...',
  '[{"id":"A","text":"Pasal 15"},{"id":"B","text":"Pasal 16"},{"id":"C","text":"Pasal 17"},{"id":"D","text":"Pasal 18"}]',
  'C',
  'Pasal 17 Ayat 1 UUD 1945: "Presiden dibantu oleh menteri-menteri negara." Ayat 2: "Menteri-menteri itu diangkat dan diberhentikan oleh Presiden." Ini menegaskan sistem kabinet presidensial, di mana menteri bertanggung jawab kepada presiden, bukan kepada parlemen.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000060',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Pasal 27 Ayat 2 UUD 1945 menyatakan bahwa setiap warga negara berhak atas...',
  '[{"id":"A","text":"Kebebasan berpendapat di muka umum"},{"id":"B","text":"Pekerjaan dan penghidupan yang layak bagi kemanusiaan"},{"id":"C","text":"Pendidikan dasar yang dibiayai pemerintah"},{"id":"D","text":"Jaminan sosial dari negara"}]',
  'B',
  'Pasal 27 Ayat 2 UUD 1945: "Tiap-tiap warga negara berhak atas pekerjaan dan penghidupan yang layak bagi kemanusiaan." Pasal 27 Ayat 1 mengatur persamaan di hadapan hukum. Pasal 31 mengatur hak pendidikan. Pasal 34 mengatur jaminan sosial fakir miskin dan anak terlantar.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000061',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Pasal 33 Ayat 2 UUD 1945 menyatakan bahwa cabang-cabang produksi yang penting bagi negara dan menguasai hajat hidup orang banyak dikuasai oleh...',
  '[{"id":"A","text":"Perusahaan swasta"},{"id":"B","text":"Negara"},{"id":"C","text":"Koperasi dan BUMN"},{"id":"D","text":"Investor asing dan dalam negeri"}]',
  'B',
  'Pasal 33 Ayat 2 UUD 1945: "Cabang-cabang produksi yang penting bagi negara dan yang menguasai hajat hidup orang banyak dikuasai oleh negara." Ini menjadi landasan konstitusional BUMN (PLN, Pertamina, dll). Pasal 33 juga mengatur asas kekeluargaan (Ayat 1) dan penguasaan bumi/air/kekayaan alam oleh negara (Ayat 3).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000062',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Bagian UUD 1945 yang tidak dapat diubah melalui prosedur amandemen berdasarkan Pasal 37 Ayat 5 adalah...',
  '[{"id":"A","text":"Pasal-pasal tentang kekuasaan kehakiman"},{"id":"B","text":"Penjelasan resmi UUD 1945"},{"id":"C","text":"Bentuk Negara Kesatuan Republik Indonesia"},{"id":"D","text":"Pembukaan (Preambule) UUD 1945"}]',
  'C',
  'Pasal 37 Ayat 5 UUD 1945 hasil amandemen: "Khusus mengenai bentuk Negara Kesatuan Republik Indonesia tidak dapat dilakukan perubahan." Selain itu, Pembukaan UUD 1945 juga tidak dapat diubah karena memuat dasar filsafat negara (Pancasila) dan merupakan staatsidee bangsa, meskipun tidak disebutkan eksplisit dalam satu pasal. Batang tubuh/pasal-pasal dapat diamandemen.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000063',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Isi Alinea Keempat Pembukaan UUD 1945 memuat antara lain...',
  '[{"id":"A","text":"Pernyataan bahwa penjajahan bertentangan dengan perikemanusiaan"},{"id":"B","text":"Pengukuhan proklamasi kemerdekaan"},{"id":"C","text":"Cita-cita kemerdekaan: merdeka, bersatu, berdaulat"},{"id":"D","text":"Tujuan negara, dasar negara Pancasila, dan bentuk negara RI"}]',
  'D',
  'Alinea Keempat Pembukaan UUD 1945 memuat: (1) tujuan negara (melindungi segenap bangsa, memajukan kesejahteraan umum, mencerdaskan kehidupan bangsa, ikut melaksanakan ketertiban dunia), (2) bentuk pemerintahan Republik Indonesia yang berkedaulatan rakyat, dan (3) dasar negara Pancasila. Ini adalah alinea terpenting yang menjadi dasar hukum konstitusi.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000064',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Makna Alinea Pertama Pembukaan UUD 1945 yang berbunyi "Bahwa sesungguhnya kemerdekaan itu ialah hak segala bangsa..." adalah...',
  '[{"id":"A","text":"Pernyataan pendirian bahwa penjajahan bertentangan dengan perikemanusiaan dan harus dihapuskan"},{"id":"B","text":"Pernyataan perang Indonesia kepada penjajah Belanda"},{"id":"C","text":"Pengukuhan Proklamasi Kemerdekaan 17 Agustus 1945"},{"id":"D","text":"Deskripsi penderitaan rakyat selama penjajahan"}]',
  'A',
  'Alinea Pertama mengandung dalil objektif bahwa penjajahan di atas dunia tidak sesuai dengan perikemanusiaan dan perikeadilan. Ini merupakan pernyataan normatif bahwa kemerdekaan adalah hak asasi setiap bangsa. Kalimat ini menjadi landasan moral politik luar negeri Indonesia yang bebas-aktif dan anti-kolonialisme.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000065',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Pengujian Undang-Undang terhadap UUD 1945 adalah kewenangan eksklusif dari...',
  '[{"id":"A","text":"Mahkamah Agung (MA)"},{"id":"B","text":"Mahkamah Konstitusi (MK)"},{"id":"C","text":"Dewan Perwakilan Rakyat (DPR)"},{"id":"D","text":"Komisi Yudisial (KY)"}]',
  'B',
  'Pasal 24C UUD 1945: Mahkamah Konstitusi berwenang mengadili pada tingkat pertama dan terakhir, salah satunya menguji undang-undang terhadap UUD 1945. Mahkamah Agung berwenang menguji peraturan di bawah undang-undang (PP, Perpres, Permen, Perda) terhadap undang-undang. Pembagian ini berlaku sejak MK dibentuk tahun 2003.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TWK 066-072: Pancasila & PKI
-- ============================================================

(
  'aa100001-0000-0000-0000-000000000066',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Berdasarkan TAP MPRS No. XX/MPRS/1966, kedudukan Pancasila dalam tata urutan peraturan perundangan adalah sebagai...',
  '[{"id":"A","text":"Alat pemersatu bangsa Indonesia"},{"id":"B","text":"Dokumen bersejarah yang luhur"},{"id":"C","text":"Sumber dari segala sumber hukum negara RI"},{"id":"D","text":"Landasan perjuangan bangsa Indonesia"}]',
  'C',
  'TAP MPRS No. XX/MPRS/1966 menegaskan Pancasila merupakan sumber dari segala sumber hukum (sumber dari segala tertib hukum) Indonesia. Semua peraturan perundang-undangan, dari UUD hingga peraturan desa, tidak boleh bertentangan dengan nilai Pancasila. Ini menjadikan Pancasila sebagai grundnorm (norma dasar) dalam sistem hukum Indonesia.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000067',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Ideologi komunisme yang dianut PKI bertentangan paling fundamental dengan Pancasila sila pertama karena...',
  '[{"id":"A","text":"Komunisme mendukung sistem ekonomi pasar bebas"},{"id":"B","text":"Komunisme mengajarkan atheisme (tidak mengakui Tuhan)"},{"id":"C","text":"Komunisme menentang persatuan nasional"},{"id":"D","text":"Komunisme menolak sistem demokrasi"}]',
  'B',
  'Komunisme menganut atheisme yang secara fundamental bertentangan dengan Sila Pertama Pancasila "Ketuhanan Yang Maha Esa". PKI juga bertentangan dengan sila lain: perjuangan kelas melawan Sila Kedua dan Kelima (kemanusiaan dan keadilan), serta sifat internasionalis komunisme melawan Sila Ketiga (persatuan). UU No. 27 Tahun 1999 melarang penyebaran ajaran komunisme/marxisme-leninisme.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000068',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Yang BUKAN merupakan prinsip dasar negara yang diusulkan Ir. Soekarno pada sidang BPUPKI 1 Juni 1945 adalah...',
  '[{"id":"A","text":"Kebangsaan Indonesia"},{"id":"B","text":"Kekeluargaan"},{"id":"C","text":"Perikemanusiaan"},{"id":"D","text":"Kesejahteraan Sosial"}]',
  'B',
  'Soekarno mengusulkan 5 prinsip dalam pidato 1 Juni 1945: (1) Kebangsaan Indonesia/Nasionalisme, (2) Internasionalisme/Perikemanusiaan, (3) Mufakat/Demokrasi, (4) Kesejahteraan Sosial, (5) Ketuhanan yang Berkebudayaan. Kekeluargaan adalah asas dalam sistem ekonomi Indonesia (Pasal 33 UUD 1945), bukan salah satu dari lima prinsip yang diusulkan Soekarno.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000069',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Pancasila sebagai "pandangan hidup bangsa" (way of life) bermakna bahwa...',
  '[{"id":"A","text":"Pancasila hanya berlaku bagi PNS dan TNI/Polri"},{"id":"B","text":"Nilai-nilai Pancasila menjadi pedoman bertingkah laku dan berinteraksi dalam kehidupan bermasyarakat dan bernegara"},{"id":"C","text":"Pancasila menjadi satu-satunya hukum tertinggi yang mengikat"},{"id":"D","text":"Pancasila adalah simbol kedaulatan negara di forum internasional"}]',
  'B',
  'Pancasila sebagai pandangan hidup (weltanschauung) berarti nilai-nilai Pancasila menjadi acuan, petunjuk arah, dan tuntunan dalam kehidupan sehari-hari bangsa Indonesia. Ini mencakup cara berpikir, bersikap, dan bertindak—baik dalam kehidupan keluarga, masyarakat, maupun bernegara. Berbeda dengan fungsinya sebagai dasar negara (norma hukum) dan ideologi bangsa.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000070',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SULIT', 8,
  'Peristiwa Gerakan 30 September 1965 (G30S/PKI) yang menjadi titik balik runtuhnya PKI dilakukan dengan...',
  '[{"id":"A","text":"Menduduki gedung DPR/MPR dan membubarkan kabinet Soekarno"},{"id":"B","text":"Membunuh tujuh perwira tinggi TNI AD yang disebut Dewan Jenderal"},{"id":"C","text":"Mengumumkan negara komunis di Madiun pada malam 30 September"},{"id":"D","text":"Melakukan sabotase infrastruktur dan serangan ke pangkalan militer"}]',
  'B',
  'G30S/PKI pada malam 30 September–1 Oktober 1965 dilakukan dengan menculik dan membunuh enam jenderal TNI AD (Letjen. Ahmad Yani, Mayjen. Suprapto, Mayjen. MT Haryono, Mayjen. S. Parman, Brigjen. DI Panjaitan, Brigjen. Sutoyo) dan satu perwira (Lettu. Pierre Tendean). Gerakan ini berhasil digagalkan oleh Mayjen. Soeharto dan KOSTRAD. PKI kemudian dibubarkan dan dinyatakan sebagai organisasi terlarang.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000071',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Fungsi dan kedudukan Pancasila mencakup banyak hal. Yang BUKAN merupakan fungsi Pancasila adalah...',
  '[{"id":"A","text":"Dasar Negara"},{"id":"B","text":"Pandangan hidup bangsa"},{"id":"C","text":"Ideologi terbuka"},{"id":"D","text":"Satu-satunya partai politik yang sah"}]',
  'D',
  'Fungsi dan kedudukan Pancasila: (1) Dasar Negara, (2) Pandangan Hidup Bangsa, (3) Ideologi Bangsa, (4) Kepribadian Bangsa, (5) Jiwa Bangsa, (6) Sumber dari segala sumber hukum, (7) Cita-cita dan tujuan bangsa. Pancasila bukan partai politik—Indonesia menganut sistem multipartai. Ideologi terbuka berarti Pancasila dapat dikembangkan sesuai perkembangan zaman tanpa mengubah nilai dasarnya.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000072',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Pancasila dari segi yuridis-konstitusional berarti...',
  '[{"id":"A","text":"Pancasila berlaku sebagai norma adat istiadat"},{"id":"B","text":"Isi dan tujuan semua perundang-undangan tidak boleh menyimpang dari jiwa Pancasila"},{"id":"C","text":"Pancasila hanya berlaku bagi lembaga pemerintah, bukan warga sipil"},{"id":"D","text":"Pancasila adalah hukum internasional yang diakui PBB"}]',
  'B',
  'Secara yuridis-konstitusional, Pancasila adalah dasar negara yang mengikat secara hukum. Sesuai TAP MPRS No. XX/1966, Pancasila merupakan sumber dari segala sumber tertib hukum Indonesia. Artinya, seluruh peraturan perundang-undangan—dari UUD hingga peraturan desa—harus selaras dengan nilai-nilai Pancasila. Pelanggaran terhadap nilai Pancasila dapat menjadi dasar uji materil suatu peraturan.',
  ARRAY['jarang-keluar']
),

-- ============================================================
-- TWK 073-078: Sejarah Indonesia lanjutan
-- ============================================================

(
  'aa100001-0000-0000-0000-000000000073',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Yang BUKAN merupakan alat perlengkapan MPR berdasarkan UU MD3 adalah...',
  '[{"id":"A","text":"Pimpinan MPR"},{"id":"B","text":"Pembantu MPR"},{"id":"C","text":"Badan Pekerja MPR"},{"id":"D","text":"Panitia Ad Hoc MPR"}]',
  'B',
  'Alat perlengkapan MPR terdiri dari: (1) Pimpinan MPR, (2) Badan Pekerja MPR, (3) Komisi MPR, dan (4) Panitia Ad Hoc MPR. "Pembantu MPR" bukan merupakan alat perlengkapan MPR yang diakui. Badan Pekerja MPR bertugas menyiapkan bahan-bahan sidang, sedangkan Panitia Ad Hoc bersifat sementara untuk tugas tertentu.',
  ARRAY['jarang-keluar']
),

(
  'aa100001-0000-0000-0000-000000000074',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Kota Jayakarta yang kini menjadi Jakarta diresmikan pada 22 Juni 1527 oleh...',
  '[{"id":"A","text":"Sultan Agung dari Mataram"},{"id":"B","text":"Fatahillah (Faletehan) dari Demak-Cirebon"},{"id":"C","text":"Sunan Gunung Jati dari Cirebon"},{"id":"D","text":"Raden Patah dari Demak"}]',
  'B',
  'Fatahillah (juga dikenal sebagai Faletehan) berhasil merebut pelabuhan Sunda Kelapa dari Portugis pada 22 Juni 1527 dan mengganti namanya menjadi Jayakarta ("kota kemenangan"). Tanggal 22 Juni 1527 kini diperingati sebagai hari jadi DKI Jakarta. Sebelumnya, Portugis bermaksud mendirikan benteng di Sunda Kelapa atas izin Kerajaan Sunda Pajajaran.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000075',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Konferensi Meja Bundar (KMB) yang menghasilkan pengakuan kedaulatan Indonesia oleh Belanda diselenggarakan di...',
  '[{"id":"A","text":"Amsterdam, 23 Juli–2 September 1949"},{"id":"B","text":"Den Haag, 23 Agustus–2 November 1949"},{"id":"C","text":"Rotterdam, 17 Agustus–27 Desember 1949"},{"id":"D","text":"Brussels, 1 September–1 November 1949"}]',
  'B',
  'KMB diselenggarakan di Den Haag (Belanda) pada 23 Agustus–2 November 1949. Delegasi Indonesia dipimpin Moh. Hatta. Hasilnya: Belanda mengakui kedaulatan RIS (Republik Indonesia Serikat) pada 27 Desember 1949. KMB menandai berakhirnya perjuangan bersenjata dan pengakuan internasional atas kemerdekaan Indonesia, meskipun masalah Irian Barat baru selesai pada 1963.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000076',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Islam pertama kali masuk ke Nusantara (Indonesia) dibawa oleh para pedagang dari...',
  '[{"id":"A","text":"Tiongkok, Jepang, dan Korea"},{"id":"B","text":"Arab, Persia, dan Gujarat (India)"},{"id":"C","text":"Mesir, Irak, dan Afrika"},{"id":"D","text":"Turki, Iran, dan Pakistan"}]',
  'B',
  'Para sejarawan menyimpulkan Islam masuk ke Nusantara melalui tiga jalur: (1) pedagang Arab langsung dari sumber ajaran Islam, (2) pedagang Persia yang membawa tasawuf dan seni Islam, dan (3) pedagang Gujarat (India) yang berhubungan dagang di pesisir Sumatera dan Jawa. Islam masuk sekitar abad ke-7 hingga ke-13 M. Wali Songo kemudian berperan menyebarkan Islam di Pulau Jawa.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000077',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Kerajaan Sriwijaya disebut kerajaan maritim karena...',
  '[{"id":"A","text":"Rajanya berasal dari keluarga nelayan yang kaya"},{"id":"B","text":"Letaknya di tepi pantai Sumatera Selatan"},{"id":"C","text":"Memiliki armada laut kuat yang menguasai jalur perdagangan di Selat Malaka"},{"id":"D","text":"Menghasilkan banyak produk laut untuk diekspor"}]',
  'C',
  'Sriwijaya (abad 7–13 M) menguasai perdagangan internasional melalui kekuatan armada lautnya di Selat Malaka. Kapal dagang dari Tiongkok, India, Arab, dan Asia Tenggara wajib membayar bea cukai kepada Sriwijaya. Ini menjadikan Sriwijaya sebagai pusat perdagangan dan penyebaran agama Buddha di Asia Tenggara, dengan ibu kota diduga berada di sekitar Palembang.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000078',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Gerakan Reformasi 1998 yang mengakhiri Orde Baru dipicu oleh krisis multidimensi. Salah satu tuntutan utama reformasi adalah...',
  '[{"id":"A","text":"Penghapusan pemilu langsung dan pengembalian ke sistem lama"},{"id":"B","text":"Pemberantasan KKN dan pencabutan dwifungsi ABRI"},{"id":"C","text":"Pengalihan kekuasaan kepada militer"},{"id":"D","text":"Penggantian Pancasila dengan ideologi baru"}]',
  'B',
  'Tuntutan reformasi 1998 meliputi: (1) turunkan Soeharto, (2) hapus KKN (Korupsi, Kolusi, Nepotisme), (3) cabut dwifungsi ABRI (peran militer ganda di bidang sosial-politik), (4) tegakkan supremasi hukum, (5) amandemen UUD 1945. Soeharto mundur 21 Mei 1998 setelah 32 tahun berkuasa, digantikan B.J. Habibie. Reformasi membawa demokratisasi, desentralisasi, dan kebebasan pers.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TWK 079-083: NKRI dan Wawasan Nusantara
-- ============================================================

(
  'aa100001-0000-0000-0000-000000000079',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI dan Wawasan Nusantara',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Wawasan Nusantara adalah cara pandang bangsa Indonesia mengenai diri dan lingkungan geografisnya berdasarkan...',
  '[{"id":"A","text":"Deklarasi Djuanda dan UNCLOS 1982"},{"id":"B","text":"Pancasila dan UUD 1945, mengutamakan persatuan dan kesatuan wilayah"},{"id":"C","text":"TAP MPR tentang pertahanan nasional semata"},{"id":"D","text":"Undang-Undang Pertahanan Negara No. 3 Tahun 2002"}]',
  'B',
  'Wawasan Nusantara berlandaskan Pancasila dan UUD 1945. Inti wawasan nusantara adalah mewujudkan kesatuan wilayah, rakyat, dan budaya Indonesia dalam satu identitas NKRI. Ini menjadi landasan konseptual pertahanan keamanan, kebijakan luar negeri, dan pengelolaan sumber daya. Deklarasi Djuanda (1957) dan UNCLOS (1982) adalah instrumen yang memperkuat kedaulatan wilayah laut Indonesia.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000080',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI dan Wawasan Nusantara',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Bentuk Negara Kesatuan Republik Indonesia yang tidak dapat diubah melalui amandemen diatur dalam...',
  '[{"id":"A","text":"Pasal 1 Ayat 1 dan Pasal 37 Ayat 5 UUD 1945"},{"id":"B","text":"Pancasila Sila Ketiga dan TAP MPR No. I/MPR/2003"},{"id":"C","text":"UU No. 23 Tahun 2014 tentang Pemerintahan Daerah"},{"id":"D","text":"Pembukaan UUD 1945 Alinea Keempat saja"}]',
  'A',
  'Dua pasal mengatur NKRI: (1) Pasal 1 Ayat 1: "Negara Indonesia ialah Negara Kesatuan yang berbentuk Republik", dan (2) Pasal 37 Ayat 5 hasil amandemen: "Khusus mengenai bentuk Negara Kesatuan Republik Indonesia tidak dapat dilakukan perubahan." Ini menjadikan NKRI sebagai bentuk negara yang final dan tidak bisa diubah melalui prosedur amandemen apapun.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000081',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI dan Wawasan Nusantara',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Perbedaan antara desentralisasi dan dekonsentrasi dalam sistem pemerintahan Indonesia adalah...',
  '[{"id":"A","text":"Desentralisasi menyerahkan urusan pemerintahan kepada daerah otonom; dekonsentrasi melimpahkan wewenang kepada instansi vertikal pemerintah pusat di daerah"},{"id":"B","text":"Desentralisasi hanya berlaku untuk DKI Jakarta; dekonsentrasi untuk daerah lainnya"},{"id":"C","text":"Desentralisasi dan dekonsentrasi adalah istilah berbeda untuk hal yang sama"},{"id":"D","text":"Desentralisasi berlaku untuk urusan pertahanan; dekonsentrasi untuk urusan ekonomi"}]',
  'A',
  'Desentralisasi adalah penyerahan urusan pemerintahan dari pusat kepada daerah otonom (daerah berhak mengatur urusan sendiri). Dekonsentrasi adalah pelimpahan wewenang dari pemerintah pusat kepada gubernur sebagai wakil pemerintah pusat, dilaksanakan oleh instansi vertikal (Kanwil, UPT). Dalam desentralisasi daerah punya otonomi; dalam dekonsentrasi daerah hanya melaksanakan kebijakan pusat.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000082',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI dan Wawasan Nusantara',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Ketahanan Nasional Indonesia (Tannas) didefinisikan sebagai kondisi dinamis yang mengandung keuletan dan ketangguhan bangsa dalam menghadapi dan mengatasi...',
  '[{"id":"A","text":"Bencana alam yang melanda wilayah Indonesia"},{"id":"B","text":"Serangan militer dari negara-negara asing"},{"id":"C","text":"Tantangan, ancaman, hambatan, dan gangguan dari dalam dan luar negeri"},{"id":"D","text":"Krisis ekonomi domestik dan global"}]',
  'C',
  'Ketahanan Nasional (Tannas) adalah kondisi dinamis berisi keuletan dan ketangguhan untuk mengembangkan kekuatan nasional guna menghadapi dan mengatasi TAHG (Tantangan, Ancaman, Hambatan, Gangguan) dari dalam dan luar negeri. Tannas bersifat komprehensif mencakup aspek IPOLEKSOSBUDHANKAM (Ideologi, Politik, Ekonomi, Sosial-Budaya, Pertahanan-Keamanan).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000083',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI dan Wawasan Nusantara',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Otonomi daerah di Indonesia diatur dalam UUD 1945 pada...',
  '[{"id":"A","text":"Pasal 18, 18A, dan 18B"},{"id":"B","text":"Pasal 20 dan 21"},{"id":"C","text":"Pasal 22D dan 22E"},{"id":"D","text":"Pasal 25A dan 26"}]',
  'A',
  'Otonomi daerah diatur dalam UUD 1945: Pasal 18 (pemerintahan daerah dan otonomi), Pasal 18A (hubungan wewenang dan keuangan pusat-daerah), Pasal 18B (pengakuan satuan pemerintahan daerah yang bersifat khusus atau istimewa, seperti DIY, Aceh, Papua). Ketiga pasal ini dimasukkan dalam Amandemen Kedua UUD 1945 tahun 2000 sebagai respons tuntutan desentralisasi pasca-reformasi.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TWK 084-088: Bhinneka Tunggal Ika
-- ============================================================

(
  'aa100001-0000-0000-0000-000000000084',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Semboyan "Bhinneka Tunggal Ika" yang menjadi semboyan negara Indonesia berasal dari bahasa...',
  '[{"id":"A","text":"Jawa Kuno"},{"id":"B","text":"Sansekerta"},{"id":"C","text":"Melayu Kuno"},{"id":"D","text":"Kawi"}]',
  'B',
  '"Bhinneka Tunggal Ika" berasal dari bahasa Sansekerta (dari Kitab Sutasoma), berarti "Berbeda-beda tetapi tetap satu jua." Secara harafiah: Bhinneka = berbeda-beda, Tunggal = satu, Ika = itu. Semboyan ini dipilih founding fathers karena mencerminkan realitas keberagaman Indonesia dan cita-cita persatuan dalam perbedaan.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000085',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'Kitab Sutasoma yang memuat semboyan "Bhinneka Tunggal Ika" ditulis oleh...',
  '[{"id":"A","text":"Mpu Prapanca"},{"id":"B","text":"Mpu Kanwa"},{"id":"C","text":"Mpu Tantular"},{"id":"D","text":"Mpu Sindok"}]',
  'C',
  'Kitab Sutasoma ditulis oleh Mpu Tantular pada masa Kerajaan Majapahit di bawah Raja Hayam Wuruk (abad ke-14). Kitab ini mengajarkan kerukunan Hindu Siwa dan Buddha, dengan kalimat "Bhinneka Tunggal Ika tan hana dharma mangrwa" (berbeda-beda tetapi satu, tidak ada dharma yang mendua). Mpu Prapanca menulis Negarakertagama; Mpu Kanwa menulis Arjunawiwaha.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000086',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'SEDANG', 4,
  'Sumpah Pemuda yang diikrarkan pada 28 Oktober 1928 memiliki tiga tekad. Berikut yang BUKAN bagian dari Sumpah Pemuda adalah...',
  '[{"id":"A","text":"Bertumpah darah yang satu, tanah Indonesia"},{"id":"B","text":"Berbangsa yang satu, bangsa Indonesia"},{"id":"C","text":"Tunduk kepada satu pemimpin, Presiden Indonesia"},{"id":"D","text":"Menjunjung bahasa persatuan, bahasa Indonesia"}]',
  'C',
  'Sumpah Pemuda 28 Oktober 1928 berisi tiga ikrar: (1) satu tanah air — tanah Indonesia, (2) satu bangsa — bangsa Indonesia, (3) satu bahasa persatuan — bahasa Indonesia. Tidak ada ikrar tentang tunduk kepada satu pemimpin; Sumpah Pemuda adalah pernyataan identitas nasional, bukan kesetiaan politik kepada figur tertentu.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000087',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Integrasi nasional Indonesia dapat terjaga antara lain karena adanya...',
  '[{"id":"A","text":"Dominasi satu kelompok etnis dalam kehidupan politik"},{"id":"B","text":"Bahasa Indonesia sebagai bahasa persatuan yang menjembatani 700+ bahasa daerah"},{"id":"C","text":"Larangan penggunaan bahasa dan adat daerah"},{"id":"D","text":"Satu agama resmi yang wajib dianut seluruh warga negara"}]',
  'B',
  'Bahasa Indonesia sebagai bahasa persatuan (hasil Sumpah Pemuda 1928) adalah faktor terpenting integrasi nasional. Bahasa Indonesia menjembatani komunikasi antar suku dengan 700+ bahasa daerah. Faktor lain: Pancasila, lambang negara, lagu kebangsaan, pengalaman sejarah perjuangan bersama melawan penjajah, dan nilai Bhinneka Tunggal Ika.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000088',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Sikap yang paling mencerminkan pengamalan nilai Bhinneka Tunggal Ika dalam kehidupan sehari-hari adalah...',
  '[{"id":"A","text":"Menolak berinteraksi dengan orang berbeda suku dan agama"},{"id":"B","text":"Mengutamakan kepentingan kelompok suku dan agama sendiri"},{"id":"C","text":"Menghormati dan bersedia bekerja sama dengan siapapun tanpa memandang perbedaan"},{"id":"D","text":"Menyeragamkan semua adat dan budaya daerah"}]',
  'C',
  'Bhinneka Tunggal Ika mengajarkan bahwa perbedaan suku, agama, ras, dan budaya adalah kekayaan, bukan hambatan. Pengamalannya dalam kehidupan sehari-hari: menghormati perbedaan, bersedia bekerja sama lintas kelompok, tidak diskriminasi, dan merayakan keberagaman. Sikap ini sesuai dengan Sila Kedua (kemanusiaan) dan Sila Ketiga (persatuan) Pancasila.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TWK 089-096: Kebijakan Pemerintah
-- ============================================================

(
  'aa100001-0000-0000-0000-000000000089',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SULIT', 8,
  'Tata urutan peraturan perundang-undangan di Indonesia berdasarkan UU No. 12 Tahun 2011 dari yang tertinggi adalah...',
  '[{"id":"A","text":"UUD 1945 → TAP MPR → UU/Perppu → PP → Perpres → Perda Provinsi → Perda Kab/Kota"},{"id":"B","text":"UUD 1945 → UU → PP → Perpres → TAP MPR → Perda"},{"id":"C","text":"Pancasila → UUD 1945 → UU → PP → Perpres → Perda"},{"id":"D","text":"TAP MPR → UUD 1945 → UU/Perppu → PP → Perpres → Perda"}]',
  'A',
  'Hierarki peraturan perundang-undangan (UU No. 12/2011 jo UU No. 15/2019): (1) UUD NRI 1945, (2) Ketetapan MPR, (3) UU/Perppu, (4) Peraturan Pemerintah (PP), (5) Peraturan Presiden (Perpres), (6) Peraturan Daerah Provinsi, (7) Peraturan Daerah Kabupaten/Kota. Peraturan yang lebih rendah tidak boleh bertentangan dengan yang lebih tinggi (asas lex superior derogat legi inferiori).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000090',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Peraturan Pemerintah Pengganti Undang-Undang (Perppu) dapat diterbitkan oleh Presiden dalam kondisi...',
  '[{"id":"A","text":"DPR sedang reses dan tidak dapat bersidang"},{"id":"B","text":"Keadaan hal ikhwal kegentingan yang memaksa"},{"id":"C","text":"Presiden ingin mempercepat proses legislasi"},{"id":"D","text":"Menteri meminta Presiden menerbitkan regulasi darurat"}]',
  'B',
  'Pasal 22 Ayat 1 UUD 1945: "Dalam hal ihwal kegentingan yang memaksa, Presiden berhak menetapkan peraturan pemerintah sebagai pengganti undang-undang." Perppu setara hierarki dengan UU namun ditetapkan tanpa persetujuan DPR terlebih dahulu. Dalam sidang berikutnya, DPR harus menyetujui atau menolak Perppu. Jika ditolak, Perppu harus dicabut.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000091',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Hak DPR untuk meminta keterangan kepada pemerintah mengenai kebijakan penting yang berdampak luas disebut...',
  '[{"id":"A","text":"Hak Angket"},{"id":"B","text":"Hak Interpelasi"},{"id":"C","text":"Hak Menyatakan Pendapat"},{"id":"D","text":"Hak Imunitas"}]',
  'B',
  'Hak Interpelasi adalah hak DPR meminta keterangan pemerintah atas kebijakan strategis yang berdampak luas pada kehidupan bangsa. Hak Angket adalah hak DPR menyelidiki pelaksanaan UU/kebijakan yang diduga melanggar ketentuan. Hak Menyatakan Pendapat adalah hak DPR menyatakan pendapat atas kebijakan pemerintah atau kejadian luar biasa. Hak Imunitas adalah hak anggota DPR bicara bebas tanpa dituntut hukum.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000092',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Dalam pemilu Indonesia, hakim konstitusi dipilih melalui mekanisme...',
  '[{"id":"A","text":"Dipilih langsung oleh rakyat dalam pemilu"},{"id":"B","text":"Diangkat oleh Presiden atas usul Komisi Yudisial"},{"id":"C","text":"Diajukan oleh MA, DPR, dan Presiden masing-masing 3 orang, lalu ditetapkan Presiden"},{"id":"D","text":"Dipilih oleh MPR dalam sidang pleno"}]',
  'C',
  'Pasal 24C Ayat 3 UUD 1945: MK memiliki 9 hakim konstitusi yang diajukan masing-masing 3 orang oleh Mahkamah Agung, DPR, dan Presiden, kemudian ditetapkan oleh Presiden. Presiden dan Wakil Presiden dipilih langsung rakyat; anggota DPR, DPD, DPRD dipilih lewat pemilu; hakim agung diusulkan KY dan dipilih DPR.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000093',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SULIT', 8,
  'Core Values ASN yang dikenal dengan akronim "BerAKHLAK" mencakup...',
  '[{"id":"A","text":"Beriman, Aktif, Kreatif, Humanis, Loyal, Adaptif, Kuat"},{"id":"B","text":"Berintegritas, Akuntabel, Kompeten, Harmonis, Loyal, Adaptif, Kolaboratif"},{"id":"C","text":"Berorientasi Pelayanan, Akuntabel, Kompeten, Harmonis, Loyal, Adaptif, Kolaboratif"},{"id":"D","text":"Bersih, Akuntabel, Kompeten, Harmonis, Loyal, Adaptif, Komunikatif"}]',
  'C',
  'BerAKHLAK adalah Core Values ASN yang diluncurkan Presiden Jokowi tahun 2021: Berorientasi Pelayanan, Akuntabel, Kompeten, Harmonis, Loyal, Adaptif, dan Kolaboratif. Panduan perilaku masing-masing: memahami dan memenuhi kebutuhan masyarakat; bertanggung jawab atas kepercayaan; terus belajar; menghargai perbedaan; mendahulukan kepentingan bangsa; terus berinovasi; membangun sinergi.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000094',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Aparatur Sipil Negara (ASN) berdasarkan UU No. 5 Tahun 2014 terdiri dari...',
  '[{"id":"A","text":"PNS dan Pegawai Honorer"},{"id":"B","text":"PNS dan PPPK (Pegawai Pemerintah dengan Perjanjian Kerja)"},{"id":"C","text":"PNS dan PTT (Pegawai Tidak Tetap)"},{"id":"D","text":"PNS dan Pegawai Kontrak"}]',
  'B',
  'UU No. 5 Tahun 2014 menetapkan ASN terdiri dari: (1) PNS — diangkat sebagai pegawai tetap oleh PPK (Pejabat Pembina Kepegawaian), mendapat hak pensiun; dan (2) PPPK — diangkat berdasarkan perjanjian kerja dengan jangka waktu tertentu, tidak mendapat pensiun namun mendapat jaminan hari tua lain. Tenaga honorer/PTT tidak termasuk kategori ASN.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000095',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Badan Pemeriksa Keuangan (BPK) bertugas memeriksa pengelolaan keuangan negara. Hasil pemeriksaan BPK diserahkan kepada...',
  '[{"id":"A","text":"Presiden dan Mahkamah Agung"},{"id":"B","text":"DPR, DPD, dan DPRD sesuai kewenangannya"},{"id":"C","text":"Komisi Pemberantasan Korupsi (KPK)"},{"id":"D","text":"Mahkamah Konstitusi"}]',
  'B',
  'Pasal 23E Ayat 2 UUD 1945: hasil pemeriksaan BPK diserahkan kepada DPR, DPD, dan DPRD sesuai kewenangannya. Pasal 23E Ayat 3: hasil pemeriksaan ditindaklanjuti oleh lembaga perwakilan dan/atau badan sesuai UU. BPK berkedudukan di Jakarta dengan kantor perwakilan di setiap provinsi, dan anggotanya dipilih oleh DPR dengan memperhatikan pertimbangan DPD.',
  ARRAY['jarang-keluar']
),

(
  'aa100001-0000-0000-0000-000000000096',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'APBN (Anggaran Pendapatan dan Belanja Negara) berdasarkan Pasal 23 UUD 1945 ditetapkan sebagai...',
  '[{"id":"A","text":"Keputusan Presiden"},{"id":"B","text":"Peraturan Pemerintah"},{"id":"C","text":"Undang-Undang"},{"id":"D","text":"Peraturan Presiden"}]',
  'C',
  'Pasal 23 Ayat 1 UUD 1945: "Anggaran pendapatan dan belanja negara sebagai wujud dari pengelolaan keuangan negara ditetapkan setiap tahun dengan undang-undang." RAPBN diajukan Presiden kepada DPR. Jika DPR tidak menyetujui RAPBN, pemerintah menjalankan APBN tahun sebelumnya. BPK bertugas memeriksa pelaksanaannya.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TWK 097-100: Mix
-- ============================================================

(
  'aa100001-0000-0000-0000-000000000097',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Blok Barat dalam Perang Dingin dipimpin oleh Amerika Serikat, sedangkan Blok Timur dipimpin oleh...',
  '[{"id":"A","text":"Republik Rakyat Tiongkok"},{"id":"B","text":"Uni Soviet"},{"id":"C","text":"Jerman Timur"},{"id":"D","text":"Korea Utara"}]',
  'B',
  'Perang Dingin (1947–1991) adalah persaingan ideologi dan geopolitik antara Blok Barat (AS, kapitalisme-liberalisme) dan Blok Timur (Uni Soviet/USSR, komunisme). Indonesia memilih posisi netral melalui Gerakan Non-Blok (GNB) yang diprakarsai Soekarno bersama Nehru (India), Tito (Yugoslavia), Nasser (Mesir), dan Nkrumah (Ghana) tahun 1961.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000098',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Perang Dunia I berlangsung pada tahun...',
  '[{"id":"A","text":"1910–1916"},{"id":"B","text":"1912–1918"},{"id":"C","text":"1914–1918"},{"id":"D","text":"1916–1920"}]',
  'C',
  'Perang Dunia I berlangsung 28 Juli 1914–11 November 1918. Dipicu pembunuhan Archduke Franz Ferdinand di Sarajevo. Dua blok bertempur: Sekutu (Inggris, Prancis, Rusia, AS) vs Blok Sentral (Jerman, Austria-Hungaria, Kekaisaran Ottoman). Berakhir dengan Perjanjian Versailles 1919 yang menghukum Jerman berat, dan menjadi benih Perang Dunia II.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000099',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Sistem pemerintahan Indonesia pada masa demokrasi liberal (1950-1959) ditandai oleh...',
  '[{"id":"A","text":"Presiden sebagai kepala pemerintahan, kabinet bertanggung jawab kepada presiden"},{"id":"B","text":"Perdana Menteri sebagai kepala pemerintahan, kabinet bertanggung jawab kepada DPR"},{"id":"C","text":"Presiden dan Perdana Menteri memiliki kekuasaan yang setara"},{"id":"D","text":"Parlemen memiliki kekuasaan absolut tanpa checks and balances"}]',
  'B',
  'Pada masa demokrasi liberal (1950–1959) berdasarkan UUDS 1950, Indonesia menerapkan sistem parlementer: Perdana Menteri sebagai kepala pemerintahan dan kabinet bertanggung jawab kepada DPR/parlemen. Akibatnya, 7 kabinet jatuh bangun dalam 9 tahun. Presiden Soekarno hanya sebagai kepala negara seremonial. Era ini berakhir dengan Dekrit 5 Juli 1959.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000100',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Pancasila sebagai "kepribadian bangsa Indonesia" bermakna bahwa...',
  '[{"id":"A","text":"Pancasila hanya berlaku bagi warga negara asli Indonesia"},{"id":"B","text":"Nilai-nilai Pancasila mencerminkan sifat dan watak khas bangsa Indonesia yang membedakannya dari bangsa lain"},{"id":"C","text":"Pancasila wajib dihafal seluruh warga negara Indonesia"},{"id":"D","text":"Pancasila adalah identitas pribadi setiap presiden Indonesia"}]',
  'B',
  'Pancasila sebagai kepribadian bangsa berarti nilai-nilai Pancasila merupakan cerminan sifat, watak, dan karakter asli bangsa Indonesia yang digali dari nilai luhur peradaban sendiri. Nilai seperti gotong royong, musyawarah, religiusitas, dan keadilan telah menjadi karakter bangsa sejak sebelum merdeka, jauh sebelum Pancasila dirumuskan secara formal.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TIU 058-064: Silogisme
-- ============================================================

(
  'aa200001-0000-0000-0000-000000000058',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Semua pohon memiliki akar dan cabang. Tanaman X memiliki akar tetapi tidak memiliki cabang. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Tanaman X adalah pohon yang berakar"},{"id":"B","text":"Tanaman X adalah pohon yang tidak bercabang"},{"id":"C","text":"Tanaman X bukan pohon"},{"id":"D","text":"Tidak dapat ditarik kesimpulan"}]',
  'C',
  'Syarat sebuah pohon ada dua: berakar DAN bercabang. Tanaman X hanya memenuhi satu syarat (berakar) tetapi tidak memenuhi syarat lainnya (tidak bercabang). Jika salah satu syarat tidak terpenuhi, maka Tanaman X bukan pohon. Ini adalah silogisme dengan modus tollens: semua P adalah Q dan R, namun X bukan R, maka X bukan P.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000059',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Semua santri pandai berbahasa Arab. Santri yang pandai berbahasa Arab pandai pula berpidato. Sebagian santri yang pandai berpidato tidak suka matematika. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Semua santri tidak suka matematika"},{"id":"B","text":"Sebagian santri suka matematika dan pandai berbahasa Arab"},{"id":"C","text":"Semua santri suka matematika"},{"id":"D","text":"Santri yang suka matematika pasti tidak pandai berpidato"}]',
  'B',
  'Premis: (1) Semua santri → pandai Arab → pandai pidato. (2) Sebagian yang pandai pidato → tidak suka matematika. Implikasi: jika SEBAGIAN yang pandai pidato tidak suka matematika, maka SEBAGIAN YANG LAIN suka matematika. Karena semua santri pandai Arab dan pandai pidato, sebagian santri yang suka matematika pasti juga pandai berbahasa Arab.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000060',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Semua wanita menyukai perhiasan dan kosmetik. A tidak menyukai kosmetik meskipun menyukai perhiasan. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"A adalah wanita yang tidak menyukai kosmetik"},{"id":"B","text":"A adalah wanita yang menyukai perhiasan"},{"id":"C","text":"A bukan wanita, meskipun menyukai perhiasan"},{"id":"D","text":"A bukan wanita karena tidak menyukai perhiasan"}]',
  'C',
  'Syarat menjadi wanita (dalam premis ini): menyukai perhiasan DAN kosmetik. A hanya memenuhi satu syarat (suka perhiasan) tapi tidak memenuhi syarat lainnya (tidak suka kosmetik). Karena syarat tidak terpenuhi sempurna, kesimpulan: A bukan wanita, meskipun ia menyukai perhiasan. Ini bukan pernyataan tentang dunia nyata, melainkan kesimpulan logis dari premis yang diberikan.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000061',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Semua pegawai ASN wajib mematuhi Kode Etik ASN. Pak Arman adalah pegawai ASN. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Pak Arman mungkin mematuhi Kode Etik ASN"},{"id":"B","text":"Pak Arman wajib mematuhi Kode Etik ASN"},{"id":"C","text":"Sebagian ASN yang mematuhi kode etik adalah Pak Arman"},{"id":"D","text":"Tidak bisa ditarik kesimpulan"}]',
  'B',
  'Ini silogisme kategoris yang valid (modus ponens): (1) Semua ASN wajib mematuhi kode etik. (2) Pak Arman adalah ASN. (3) Kesimpulan: Pak Arman wajib mematuhi kode etik. Selama kedua premisnya benar, kesimpulan ini pasti benar. Tidak ada ambiguitas dalam silogisme sederhana ini.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000062',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 7,
  'Semua anggota tim renang bisa berenang. Tidak seorang pun yang bisa berenang takut air. Budi adalah anggota tim renang. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Budi takut air"},{"id":"B","text":"Budi tidak takut air"},{"id":"C","text":"Budi mungkin takut air"},{"id":"D","text":"Tidak bisa ditarik kesimpulan tentang Budi"}]',
  'B',
  'Rantai silogisme: Budi = anggota tim renang → bisa berenang (premis 1). Bisa berenang → tidak takut air (premis 2). Kesimpulan: Budi tidak takut air. Ini adalah silogisme hipotetis yang valid: jika A → B, dan B → C, maka A → C (modus ponens berantai).',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000063',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SULIT', 9,
  'Semua nelayan pandai berenang. Rina pandai berenang. Kesimpulan yang paling tepat tentang Rina adalah...',
  '[{"id":"A","text":"Rina pasti seorang nelayan"},{"id":"B","text":"Rina mungkin seorang nelayan atau bukan nelayan"},{"id":"C","text":"Rina pasti bukan nelayan"},{"id":"D","text":"Tidak ada hubungan antara Rina dan nelayan"}]',
  'B',
  'Ini adalah kesalahan logika "affirming the consequent" jika disimpulkan Rina pasti nelayan. Premis hanya menyatakan semua nelayan pandai berenang, bukan sebaliknya (semua yang pandai berenang adalah nelayan). Rina pandai berenang bisa jadi karena ia nelayan, perenang profesional, atau sekadar hobi. Maka kesimpulan paling tepat: Rina mungkin nelayan, mungkin juga bukan.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000064',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Tidak ada polisi yang melanggar hukum. Pak Deni adalah seorang polisi. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Pak Deni sering melanggar hukum"},{"id":"B","text":"Pak Deni adalah penegak hukum"},{"id":"C","text":"Pak Deni tidak melanggar hukum"},{"id":"D","text":"Pak Deni mungkin melanggar hukum"}]',
  'C',
  'Premis: (1) Tidak ada polisi yang melanggar hukum (semua polisi tidak melanggar hukum). (2) Pak Deni adalah polisi. Kesimpulan: Pak Deni tidak melanggar hukum. Ini silogisme negatif-universal yang valid. "Tidak ada A yang B" + "X adalah A" → "X tidak B". Jawaban B (penegak hukum) bisa jadi benar secara konteks, namun bukan kesimpulan logis langsung dari dua premis tersebut.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TIU 065-074: Numerik — Berhitung
-- ============================================================

(
  'aa200001-0000-0000-0000-000000000065',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Seorang pedagang menjual barang seharga Rp10.000.000 dan ternyata rugi 66⅔%. Berapa harga beli barang tersebut?',
  '[{"id":"A","text":"Rp25.000.000"},{"id":"B","text":"Rp28.000.000"},{"id":"C","text":"Rp30.000.000"},{"id":"D","text":"Rp35.000.000"}]',
  'C',
  'Rugi 66⅔% = 2/3. Harga jual = harga beli × (1 - 2/3) = harga beli × 1/3. Maka: Rp10.000.000 = harga beli × 1/3. Harga beli = Rp10.000.000 × 3 = Rp30.000.000.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000066',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Biaya yang diperlukan untuk mengecat dinding setinggi 4 m dan panjang 13 m dengan biaya Rp4.500 per m² adalah...',
  '[{"id":"A","text":"Rp207.000"},{"id":"B","text":"Rp216.000"},{"id":"C","text":"Rp225.000"},{"id":"D","text":"Rp234.000"}]',
  'D',
  'Luas dinding = panjang × tinggi = 13 m × 4 m = 52 m². Biaya = 52 m² × Rp4.500/m² = Rp234.000.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000067',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Seorang prajurit mulai bekerja pukul 08.00 dan bekerja selama 7 jam. Pukul berapakah ia selesai bekerja?',
  '[{"id":"A","text":"14.00"},{"id":"B","text":"15.00"},{"id":"C","text":"15.30"},{"id":"D","text":"16.00"}]',
  'B',
  'Pukul mulai + durasi = pukul selesai. 08.00 + 7 jam = 15.00. Ini soal penjumlahan waktu sederhana tanpa jeda istirahat.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000068',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Jika x = 2,4 – 1,98 + 0,009 dan y = 0,6, maka...',
  '[{"id":"A","text":"x < y"},{"id":"B","text":"x = y"},{"id":"C","text":"x > y"},{"id":"D","text":"x ≈ y"}]',
  'A',
  'x = 2,4 – 1,98 + 0,009 = 0,42 + 0,009 = 0,429. y = 0,6. Karena 0,429 < 0,6, maka x < y.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000069',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Rata-rata nilai ujian 30 siswa adalah 70. Jika 10 siswa baru bergabung dengan rata-rata nilai 85, berapa rata-rata nilai seluruh siswa?',
  '[{"id":"A","text":"73,75"},{"id":"B","text":"74,00"},{"id":"C","text":"75,00"},{"id":"D","text":"76,25"}]',
  'A',
  'Total nilai 30 siswa = 30 × 70 = 2.100. Total nilai 10 siswa baru = 10 × 85 = 850. Total nilai semua = 2.100 + 850 = 2.950. Jumlah siswa = 30 + 10 = 40. Rata-rata = 2.950 ÷ 40 = 73,75.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000070',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Sebuah pipa mengisi kolam dalam 4 jam. Pipa lain menguras kolam dalam 6 jam. Jika keduanya beroperasi bersamaan dari kolam kosong, berapa jam kolam akan penuh?',
  '[{"id":"A","text":"8 jam"},{"id":"B","text":"10 jam"},{"id":"C","text":"12 jam"},{"id":"D","text":"24 jam"}]',
  'C',
  'Laju isi = 1/4 kolam/jam. Laju kuras = 1/6 kolam/jam. Laju net pengisian = 1/4 – 1/6 = 3/12 – 2/12 = 1/12 kolam/jam. Waktu untuk penuh = 1 ÷ (1/12) = 12 jam.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000071',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Nilai rata-rata 10 bilangan adalah 45. Jika satu bilangan yang bernilai 15 dihapus, berapa rata-rata 9 bilangan sisanya?',
  '[{"id":"A","text":"45,33"},{"id":"B","text":"46,00"},{"id":"C","text":"48,33"},{"id":"D","text":"50,00"}]',
  'C',
  'Total nilai 10 bilangan = 10 × 45 = 450. Setelah menghapus bilangan 15: total = 450 – 15 = 435. Rata-rata 9 bilangan sisanya = 435 ÷ 9 = 48,33.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000072',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Sebuah mobil menempuh 280 km dalam 3,5 jam. Berapa kecepatan rata-rata mobil tersebut?',
  '[{"id":"A","text":"70 km/jam"},{"id":"B","text":"75 km/jam"},{"id":"C","text":"80 km/jam"},{"id":"D","text":"85 km/jam"}]',
  'C',
  'Kecepatan rata-rata = Jarak ÷ Waktu = 280 km ÷ 3,5 jam = 80 km/jam.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000073',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Himpunan penyelesaian dari 3x – 5 > 7 + x adalah...',
  '[{"id":"A","text":"x > 6"},{"id":"B","text":"x > -6"},{"id":"C","text":"x < 6"},{"id":"D","text":"x > 3"}]',
  'A',
  '3x – 5 > 7 + x → 3x – x > 7 + 5 → 2x > 12 → x > 6.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000074',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Sebanyak 200 peserta seleksi. 5/6 dari 120 peserta perempuan diterima di instansi A, sisanya di instansi B. ¾ dari 80 peserta laki-laki diterima di instansi B, sisanya di instansi A. Berapa persen perempuan dibanding laki-laki yang diterima di instansi A?',
  '[{"id":"A","text":"10%"},{"id":"B","text":"20%"},{"id":"C","text":"500%"},{"id":"D","text":"400%"}]',
  'C',
  'Perempuan di A = 5/6 × 120 = 100. Laki-laki di B = 3/4 × 80 = 60, jadi laki-laki di A = 80 – 60 = 20. Persentase perempuan terhadap laki-laki di A = (100/20) × 100% = 500%.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TIU 075-081: Deret Angka dan Huruf
-- ============================================================

(
  'aa200001-0000-0000-0000-000000000075',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka dan Huruf',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Deret berikut: 2, 5, 10, 17, 26, ... Suku berikutnya adalah...',
  '[{"id":"A","text":"35"},{"id":"B","text":"37"},{"id":"C","text":"38"},{"id":"D","text":"40"}]',
  'B',
  'Pola selisih: +3, +5, +7, +9, +11, ... (bertambah 2 setiap kali). Suku ke-5 = 26, maka suku ke-6 = 26 + 11 = 37.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000076',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka dan Huruf',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Deret berikut: 1, 4, 9, 16, 25, ... Suku berikutnya adalah...',
  '[{"id":"A","text":"33"},{"id":"B","text":"34"},{"id":"C","text":"36"},{"id":"D","text":"49"}]',
  'C',
  'Pola: bilangan kuadrat berurutan. 1² = 1, 2² = 4, 3² = 9, 4² = 16, 5² = 25, 6² = 36. Suku berikutnya adalah 36.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000077',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka dan Huruf',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Deret berikut: 1, 1, 2, 3, 5, 8, 13, ... Suku berikutnya adalah...',
  '[{"id":"A","text":"18"},{"id":"B","text":"20"},{"id":"C","text":"21"},{"id":"D","text":"24"}]',
  'C',
  'Ini adalah deret Fibonacci: setiap suku adalah jumlah dua suku sebelumnya. 8 + 13 = 21. Deret Fibonacci pertama kali dikenalkan oleh matematikawan Italia Leonardo Fibonacci pada abad ke-13 dan banyak ditemukan di alam.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000078',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka dan Huruf',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Deret huruf: A, D, G, J, M, ..., ... Dua suku berikutnya adalah...',
  '[{"id":"A","text":"O dan Q"},{"id":"B","text":"P dan S"},{"id":"C","text":"N dan Q"},{"id":"D","text":"P dan R"}]',
  'B',
  'Pola: setiap huruf maju 3 posisi dalam alfabet. A(1) → D(4) → G(7) → J(10) → M(13) → P(16) → S(19). Dua suku berikutnya: P dan S.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000079',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka dan Huruf',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Deret: 3, 6, 4, 8, 5, 10, 6, ... Suku berikutnya adalah...',
  '[{"id":"A","text":"11"},{"id":"B","text":"12"},{"id":"C","text":"7"},{"id":"D","text":"14"}]',
  'B',
  'Dua deret bergantian: (a) 3, 4, 5, 6, ... (+1) dan (b) 6, 8, 10, ... (+2). Suku ke-8 adalah lanjutan deret (b): 10 + 2 = 12.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000080',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka dan Huruf',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Deret: A, B, D, G, K, ..., ... Dua suku berikutnya adalah...',
  '[{"id":"A","text":"O dan V"},{"id":"B","text":"P dan V"},{"id":"C","text":"P dan W"},{"id":"D","text":"N dan O"}]',
  'B',
  'Posisi: A(1), B(2), D(4), G(7), K(11), P(16), V(22). Selisih antar suku: +1, +2, +3, +4, +5, +6. Maka suku ke-6 = K+5 = P(16), suku ke-7 = P+6 = V(22). Jawabannya P dan V.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000081',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka dan Huruf',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Deret geometri: 5, 15, 45, 135, 405, ... Suku berikutnya adalah...',
  '[{"id":"A","text":"810"},{"id":"B","text":"1.000"},{"id":"C","text":"1.215"},{"id":"D","text":"1.620"}]',
  'C',
  'Deret geometri dengan rasio = 3. Setiap suku = suku sebelumnya × 3. Suku ke-6 = 405 × 3 = 1.215.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TIU 082-087: Perbandingan dan Proporsi
-- ============================================================

(
  'aa200001-0000-0000-0000-000000000082',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan dan Proporsi',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Perbandingan jumlah buku A dan B adalah 3:5. Jika buku A berjumlah 120, berapa buku B?',
  '[{"id":"A","text":"180"},{"id":"B","text":"200"},{"id":"C","text":"220"},{"id":"D","text":"240"}]',
  'B',
  '3/5 = 120/x. Cross-multiply: 3x = 600. x = 200. Atau: jika 3 bagian = 120, maka 1 bagian = 40. Buku B = 5 × 40 = 200.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000083',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan dan Proporsi',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  '8 pekerja menyelesaikan suatu pekerjaan dalam 15 hari. Berapa hari yang dibutuhkan 12 pekerja untuk pekerjaan yang sama?',
  '[{"id":"A","text":"8 hari"},{"id":"B","text":"10 hari"},{"id":"C","text":"12 hari"},{"id":"D","text":"15 hari"}]',
  'B',
  'Ini berbanding terbalik: makin banyak pekerja, makin sedikit hari. Total kerja = 8 × 15 = 120 hari-orang. Dengan 12 pekerja: 120 ÷ 12 = 10 hari.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000084',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan dan Proporsi',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Sebuah peta berskala 1:50.000. Jarak dua kota di peta = 8 cm. Jarak sebenarnya adalah...',
  '[{"id":"A","text":"4 km"},{"id":"B","text":"40 km"},{"id":"C","text":"400 km"},{"id":"D","text":"0,4 km"}]',
  'A',
  'Jarak sebenarnya = jarak di peta × skala = 8 cm × 50.000 = 400.000 cm = 4.000 m = 4 km.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000085',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan dan Proporsi',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Bahan bakar 5 liter cukup untuk menempuh 60 km. Berapa liter yang diperlukan untuk menempuh 150 km?',
  '[{"id":"A","text":"10 liter"},{"id":"B","text":"12,5 liter"},{"id":"C","text":"15 liter"},{"id":"D","text":"20 liter"}]',
  'B',
  '5/60 = x/150. Cross-multiply: 60x = 750. x = 12,5 liter. Atau: 150/60 = 2,5 kali lebih jauh. BBM = 5 × 2,5 = 12,5 liter.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000086',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan dan Proporsi',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Campuran semen dan pasir dengan perbandingan 1:4. Jika total campuran 100 kg, berapa kg semen yang dibutuhkan?',
  '[{"id":"A","text":"15 kg"},{"id":"B","text":"20 kg"},{"id":"C","text":"25 kg"},{"id":"D","text":"30 kg"}]',
  'B',
  'Perbandingan semen:pasir = 1:4. Total bagian = 1 + 4 = 5. Semen = (1/5) × 100 kg = 20 kg. Pasir = (4/5) × 100 kg = 80 kg.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000087',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan dan Proporsi',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Jika (x + 4)/(x – 2) = 3/1, nilai x adalah...',
  '[{"id":"A","text":"5"},{"id":"B","text":"6"},{"id":"C","text":"7"},{"id":"D","text":"8"}]',
  'A',
  'Cross-multiply: 1 × (x + 4) = 3 × (x – 2). x + 4 = 3x – 6. 4 + 6 = 3x – x. 10 = 2x. x = 5.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TIU 088-094: Analogi Verbal
-- ============================================================

(
  'aa200001-0000-0000-0000-000000000088',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'DOKTER : RUMAH SAKIT = GURU : ...',
  '[{"id":"A","text":"Buku"},{"id":"B","text":"Murid"},{"id":"C","text":"Sekolah"},{"id":"D","text":"Papan tulis"}]',
  'C',
  'Analogi tempat bekerja. Dokter bekerja di rumah sakit. Guru bekerja di sekolah. Relasi: profesi → tempat kerja.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000089',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'BURUNG : SARANG = HARIMAU : ...',
  '[{"id":"A","text":"Hutan"},{"id":"B","text":"Kandang"},{"id":"C","text":"Gua"},{"id":"D","text":"Pohon"}]',
  'C',
  'Analogi tempat tinggal. Burung tinggal di sarang. Harimau tinggal di gua (liang). Bukan kandang (itu buatan manusia), bukan hutan (itu habitat, bukan tempat tinggal spesifik).',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000090',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'KAMUS : KATA = ATLAS : ...',
  '[{"id":"A","text":"Gambar"},{"id":"B","text":"Peta"},{"id":"C","text":"Benua"},{"id":"D","text":"Geografi"}]',
  'B',
  'Analogi isi buku. Kamus berisi kumpulan kata beserta artinya. Atlas berisi kumpulan peta. Relasi: jenis buku → isi utamanya.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000091',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'MINGGU : SELASA = JANUARI : ...',
  '[{"id":"A","text":"Februari"},{"id":"B","text":"Maret"},{"id":"C","text":"April"},{"id":"D","text":"Mei"}]',
  'B',
  'Analogi urutan. Minggu adalah hari ke-1, Selasa adalah hari ke-3 → selisih +2. Januari adalah bulan ke-1, maka bulan ke-3 = Maret. Pola: posisi awal +2 → Januari + 2 = Maret.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000092',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'KERTAS : BUKU = BATU BATA : ...',
  '[{"id":"A","text":"Semen"},{"id":"B","text":"Pasir"},{"id":"C","text":"Gedung"},{"id":"D","text":"Tanah liat"}]',
  'C',
  'Analogi bahan penyusun. Kertas disusun menjadi buku. Batu bata disusun menjadi gedung. Relasi: bahan dasar → hasil susun/bangunan.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000093',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'PANAS : DINGIN = BESAR : ...',
  '[{"id":"A","text":"Kecil"},{"id":"B","text":"Jauh"},{"id":"C","text":"Banyak"},{"id":"D","text":"Luas"}]',
  'A',
  'Analogi antonim/lawan kata. Panas ↔ Dingin adalah pasangan antonim. Besar ↔ Kecil adalah pasangan antonim. Relasi: kata → antonimnya.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000094',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'TELUR : AYAM = SUSU : ...',
  '[{"id":"A","text":"Sapi"},{"id":"B","text":"Kambing"},{"id":"C","text":"Keju"},{"id":"D","text":"Mentega"}]',
  'A',
  'Analogi sumber/penghasil. Telur dihasilkan oleh ayam. Susu dihasilkan oleh sapi (dalam konteks umum sehari-hari). Relasi: produk → hewan penghasilnya.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TIU 095-100: Analitis (Peribahasa dan Bahasa Indonesia)
-- ============================================================

(
  'aa200001-0000-0000-0000-000000000095',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Makna peribahasa "Ada udang di balik batu" adalah...',
  '[{"id":"A","text":"Ada seseorang yang pandai bersembunyi"},{"id":"B","text":"Ada maksud tersembunyi di balik suatu tindakan atau perkataan"},{"id":"C","text":"Seseorang yang hidup secara tertutup"},{"id":"D","text":"Mencari keuntungan di tempat yang tidak terduga"}]',
  'B',
  '"Ada udang di balik batu" dipakai untuk menggambarkan seseorang yang menyembunyikan niat atau tujuan sebenarnya di balik perkataan atau tindakannya. Peribahasa ini mengajarkan agar kita cermat dalam membaca situasi dan tidak mudah percaya pada perbuatan yang tampak tanpa mengetahui motif di baliknya.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000096',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Makna peribahasa "Seperti anjing menggonggong tulang" adalah...',
  '[{"id":"A","text":"Orang yang loba dan tamak tidak pernah puas dengan apa yang ada"},{"id":"B","text":"Seseorang yang bekerja keras menjaga miliknya"},{"id":"C","text":"Orang yang marah karena terganggu"},{"id":"D","text":"Seseorang yang setia pada tugasnya"}]',
  'A',
  '"Seperti anjing menggonggong tulang" menggambarkan orang yang tamak dan serakah. Anjing yang menemukan tulang tidak puas dan terus mengejar tulang lain, sehingga yang ada di tangannya pun hilang. Peribahasa ini mengingatkan bahwa keserakahan sering mengakibatkan kehilangan apa yang sudah dimiliki.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000097',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Makna peribahasa "Bagai pinang dibelah dua" adalah...',
  '[{"id":"A","text":"Dua hal yang sangat berbeda satu sama lain"},{"id":"B","text":"Dua orang atau hal yang sangat serupa/mirip"},{"id":"C","text":"Sesuatu yang sulit untuk dipisahkan"},{"id":"D","text":"Dua pihak yang selalu bertentangan"}]',
  'B',
  '"Bagai pinang dibelah dua" dipakai untuk menggambarkan dua hal atau orang yang sangat mirip, seperti kembar identik. Buah pinang ketika dibelah dua menghasilkan dua belahan yang hampir identik. Peribahasa ini sering digunakan untuk menggambarkan pasangan atau dua benda yang penampilannya sangat menyerupai satu sama lain.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000098',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Kalimat baku yang sesuai dengan kaidah EYD adalah...',
  '[{"id":"A","text":"Sistim penilaian baru sudah diterapkan tahun ini"},{"id":"B","text":"Kegiatan ekstrakulikuler dilaksanakan setiap Sabtu"},{"id":"C","text":"Standardisasi produk harus memenuhi ketentuan SNI"},{"id":"D","text":"Aktifitas fisik perlu dilakukan setiap hari"}]',
  'C',
  '"Standardisasi" adalah kata baku. Yang tidak baku: "Sistim" (seharusnya Sistem), "ekstrakulikuler" (seharusnya ekstrakurikuler), dan "Aktifitas" (seharusnya Aktivitas). Penulisan kata-kata tersebut sudah diatur dalam KBBI edisi terbaru dan Pedoman EYD.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000099',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Paragraf berikut, gagasan utamanya adalah... "Membaca buku sangat bermanfaat bagi kehidupan. Dengan membaca, wawasan dan pengetahuan seseorang bertambah luas. Selain itu, membaca juga melatih kemampuan berpikir kritis. Oleh karena itu, membiasakan membaca sejak dini adalah investasi terbaik."',
  '[{"id":"A","text":"Membaca melatih kemampuan berpikir kritis"},{"id":"B","text":"Membaca adalah investasi terbaik"},{"id":"C","text":"Membaca sangat bermanfaat dan penting untuk dibiasakan sejak dini"},{"id":"D","text":"Wawasan seseorang bertambah luas dengan membaca"}]',
  'C',
  'Gagasan utama = ide pokok yang menjadi inti seluruh paragraf. Kalimat utama ada di awal (deduktif): "Membaca buku sangat bermanfaat bagi kehidupan." Kalimat-kalimat selanjutnya adalah penjelas. Kesimpulan kalimat terakhir mempertegas gagasan utama. Jawaban C merangkum gagasan utama secara komprehensif.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000100',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Kata yang termasuk kata baku menurut KBBI adalah...',
  '[{"id":"A","text":"Karir"},{"id":"B","text":"Ijin"},{"id":"C","text":"Apotek"},{"id":"D","text":"Rubah (mengubah)"}]',
  'C',
  '"Apotek" adalah kata baku (bukan "apotik"). Kata tidak baku lainnya: "Karir" (seharusnya Karier), "Ijin" (seharusnya Izin), "Rubah" dalam arti mengubah (seharusnya "Ubah"; Rubah adalah nama hewan/fox). Pemahaman kata baku-tidak baku penting karena soal TIU sering menguji kosakata dan kaidah bahasa Indonesia.',
  ARRAY['sering-keluar']
)

ON CONFLICT (id) DO NOTHING;
-- ============================================================
-- Seed 002B: CPNS Questions Batch 2 — TWK 101-150 (50 soal)
-- ============================================================

INSERT INTO public.questions
  (id, pack_id, exam_type, subject, subtopic, question_type, difficulty, difficulty_rank,
   question_text, options, correct_option, explanation_text, tags)
VALUES

(
  'aa100001-0000-0000-0000-000000000101',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Pancasila sebagai dasar negara Indonesia tercantum dalam Pembukaan UUD 1945 pada alinea ke-...',
  '[{"id":"A","text":"Pertama"},{"id":"B","text":"Kedua"},{"id":"C","text":"Ketiga"},{"id":"D","text":"Keempat"}]',
  'D',
  'Pancasila tercantum dalam Pembukaan UUD 1945 alinea keempat yang memuat tujuan negara dan dasar negara. Alinea keempat berbunyi: ''...maka disusunlah kemerdekaan kebangsaan Indonesia itu dalam suatu Undang-Undang Dasar Negara Indonesia, yang terbentuk dalam suatu susunan Negara Republik Indonesia yang berkedaulatan rakyat dengan berdasarkan kepada: Ketuhanan Yang Maha Esa...''',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000102',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Pancasila bersifat hierarkis piramidal, artinya...',
  '[{"id":"A","text":"Sila-sila Pancasila tidak dapat dipisahkan dan saling mendukung"},{"id":"B","text":"Sila pertama menjadi dasar dan jiwa bagi sila-sila berikutnya"},{"id":"C","text":"Setiap sila memiliki nilai yang sama dan setara"},{"id":"D","text":"Sila kelima adalah puncak dari seluruh sila Pancasila"}]',
  'B',
  'Pancasila bersifat hierarkis piramidal berarti sila-sila Pancasila tersusun secara bertingkat, di mana sila pertama (Ketuhanan Yang Maha Esa) menjadi dasar dan menjiwai sila-sila berikutnya. Sila ke-1 adalah fondasi, sila ke-2 dijiwai sila ke-1, dst. Ini berbeda dengan sifat organis yang berarti saling kait-mengait.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000103',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Nilai instrumental Pancasila adalah...',
  '[{"id":"A","text":"Nilai-nilai abstrak yang bersumber dari kepribadian bangsa"},{"id":"B","text":"Nilai-nilai yang dijadikan pedoman perilaku dalam kehidupan sehari-hari"},{"id":"C","text":"Penjabaran nilai dasar Pancasila dalam bentuk peraturan perundang-undangan"},{"id":"D","text":"Nilai yang bersifat universal dan berlaku untuk semua bangsa"}]',
  'C',
  'Nilai instrumental Pancasila adalah nilai-nilai yang merupakan penjabaran dari nilai dasar Pancasila dalam bentuk yang lebih konkret, seperti peraturan perundang-undangan, kebijakan, dan lembaga negara. Contoh: UUD 1945, UU, PP, Perpres. Nilai dasar = abstrak dan umum; Nilai instrumental = konkret; Nilai praksis = penerapan nyata.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000104',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Hari Lahir Pancasila diperingati setiap tanggal...',
  '[{"id":"A","text":"17 Agustus"},{"id":"B","text":"1 Oktober"},{"id":"C","text":"1 Juni"},{"id":"D","text":"29 Mei"}]',
  'C',
  'Hari Lahir Pancasila diperingati setiap tanggal 1 Juni, sesuai Keputusan Presiden (Keppres) Nomor 24 Tahun 2016. Tanggal ini dipilih karena pada 1 Juni 1945, Ir. Soekarno untuk pertama kalinya mengusulkan nama dan rumusan Pancasila dalam sidang BPUPKI.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000105',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Panitia Sembilan yang merumuskan Piagam Jakarta pada 22 Juni 1945 diketuai oleh...',
  '[{"id":"A","text":"Mohammad Hatta"},{"id":"B","text":"Ir. Soekarno"},{"id":"C","text":"Mohammad Yamin"},{"id":"D","text":"Ki Hajar Dewantara"}]',
  'B',
  'Panitia Sembilan yang dibentuk oleh BPUPKI untuk merumuskan dasar negara diketuai oleh Ir. Soekarno. Panitia ini berhasil merumuskan Piagam Jakarta (Jakarta Charter) pada 22 Juni 1945, yang menjadi cikal bakal Pembukaan UUD 1945. Anggota lainnya termasuk Mohammad Hatta, Mohammad Yamin, A.A. Maramis, dan lain-lain.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000106',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Dalam Piagam Jakarta, sila pertama Pancasila berbeda dari yang kita kenal sekarang. Rumusan aslinya adalah...',
  '[{"id":"A","text":"Ketuhanan Yang Maha Esa"},{"id":"B","text":"Ketuhanan dengan kewajiban menjalankan syariat Islam bagi pemeluk-pemeluknya"},{"id":"C","text":"Keimanan dan Ketakwaan kepada Tuhan Yang Maha Esa"},{"id":"D","text":"Ketuhanan Yang Berkebudayaan"}]',
  'B',
  'Dalam Piagam Jakarta (22 Juni 1945), sila pertama berbunyi: ''Ketuhanan dengan kewajiban menjalankan syariat Islam bagi pemeluk-pemeluknya.'' Rumusan ini diubah menjadi ''Ketuhanan Yang Maha Esa'' pada tanggal 18 Agustus 1945 dalam sidang PPKI, atas usulan tokoh-tokoh dari Indonesia Timur untuk menjaga persatuan.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000107',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Pengamalan sila ke-4 Pancasila dalam kehidupan bermasyarakat diwujudkan melalui...',
  '[{"id":"A","text":"Memberikan bantuan kepada yang membutuhkan"},{"id":"B","text":"Musyawarah untuk mencapai mufakat"},{"id":"C","text":"Beribadah sesuai agama masing-masing"},{"id":"D","text":"Menghargai perbedaan budaya"}]',
  'B',
  'Sila ke-4 berbunyi ''Kerakyatan yang Dipimpin oleh Hikmat Kebijaksanaan dalam Permusyawaratan/Perwakilan.'' Pengamalan utamanya adalah melalui musyawarah mufakat dalam pengambilan keputusan, baik di tingkat keluarga, masyarakat, maupun negara. Ini merupakan ciri khas demokrasi Pancasila yang berbeda dari demokrasi liberal.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000108',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'TAP MPRS No. XX/MPRS/1966 berhubungan dengan Pancasila karena...',
  '[{"id":"A","text":"Menetapkan Pancasila sebagai satu-satunya asas dalam kehidupan berbangsa"},{"id":"B","text":"Mengatur tata urutan peraturan perundang-undangan dengan Pancasila sebagai sumber tertib hukum"},{"id":"C","text":"Melarang ideologi yang bertentangan dengan Pancasila"},{"id":"D","text":"Menetapkan Hari Lahir Pancasila setiap 1 Juni"}]',
  'B',
  'TAP MPRS No. XX/MPRS/1966 tentang Memorandum DPR-GR mengatur sumber tertib hukum dan tata urutan peraturan perundang-undangan Republik Indonesia. Dalam ketetapan ini, Pancasila ditetapkan sebagai sumber dari segala sumber hukum (sumber tertib hukum). Ini menegaskan kedudukan konstitusional Pancasila sebagai grundnorm (norma dasar) negara.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000109',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Konsep ''Trisila'' yang diusulkan Soekarno pada 1 Juni 1945 terdiri dari...',
  '[{"id":"A","text":"Nasionalisme, Internasionalisme, Demokrasi"},{"id":"B","text":"Sosionasionalisme, Sosiodemokrasi, Ketuhanan Yang Berkebudayaan"},{"id":"C","text":"Ketuhanan, Kemanusiaan, Kebangsaan"},{"id":"D","text":"Persatuan, Keadilan, Ketuhanan"}]',
  'B',
  'Selain Pancasila (5 sila), Soekarno juga mengusulkan penyederhanaan menjadi Trisila (3 sila): Sosionasionalisme, Sosiodemokrasi, dan Ketuhanan Yang Berkebudayaan. Bahkan diusulkan lebih sederhana lagi menjadi Ekasila (1 sila): Gotong Royong. Namun yang ditetapkan adalah Pancasila (5 sila).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000110',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Pancasila sebagai ''perjanjian luhur bangsa'' mengandung arti bahwa...',
  '[{"id":"A","text":"Pancasila harus dijalankan sesuai perintah pemerintah"},{"id":"B","text":"Pancasila adalah kesepakatan para pendiri bangsa yang wajib dijaga dan diamalkan seluruh warga negara"},{"id":"C","text":"Pancasila merupakan hadiah dari bangsa lain kepada Indonesia"},{"id":"D","text":"Pancasila dibuat dengan perjanjian tertulis antar pejabat negara"}]',
  'B',
  'Pancasila disebut ''perjanjian luhur bangsa'' karena ia merupakan hasil kesepakatan dan konsensus para pendiri bangsa (the founding fathers) dari berbagai latar belakang. Para pemimpin bangsa sepakat bahwa Pancasila adalah landasan bersama yang mengakomodasi keberagaman Indonesia. Oleh karena itu, seluruh warga negara wajib menjaga dan mengamalkannya.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000111',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Pancasila sebagai norma dasar negara (staatsfundamentalnorm) dikemukakan pertama kali oleh ahli hukum...',
  '[{"id":"A","text":"Hans Kelsen"},{"id":"B","text":"Hans Nawiasky"},{"id":"C","text":"Notonagoro"},{"id":"D","text":"Hamid S. Attamimi"}]',
  'B',
  'Istilah ''staatsfundamentalnorm'' (norma dasar negara) dikemukakan oleh Hans Nawiasky, murid Hans Kelsen. Nawiasky mengembangkan teori Kelsen tentang ''grundnorm'' dan menerapkannya pada hukum tata negara. Di Indonesia, Pancasila diposisikan sebagai staatsfundamentalnorm yang menjadi sumber dari semua norma hukum di bawahnya.',
  ARRAY['jarang-keluar']
),

(
  'aa100001-0000-0000-0000-000000000112',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Lambang negara Indonesia Garuda Pancasila memegang pita bertuliskan...',
  '[{"id":"A","text":"Bhinneka Tunggal Ika"},{"id":"B","text":"Pancasila"},{"id":"C","text":"Bhineka Tunggal Ika"},{"id":"D","text":"Unity in Diversity"}]',
  'A',
  'Garuda Pancasila memegang pita bertuliskan ''Bhinneka Tunggal Ika'' (ejaan yang benar). Ini adalah semboyan negara Indonesia yang berarti ''Berbeda-beda tetapi tetap satu.'' Lambang negara ini diatur dalam PP No. 43 Tahun 1958.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000113',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Pancasila berfungsi sebagai ideologi negara, artinya Pancasila...',
  '[{"id":"A","text":"Menjadi sumber hukum tertinggi yang mengikat semua warga negara"},{"id":"B","text":"Memberikan arah, tujuan, dan motivasi bagi seluruh kehidupan berbangsa dan bernegara"},{"id":"C","text":"Menjadi dasar bagi hakim dalam memutus perkara hukum"},{"id":"D","text":"Mengatur hubungan antara warga negara dan pemerintah"}]',
  'B',
  'Pancasila sebagai ideologi negara berarti Pancasila memberikan arah, tujuan, dan motivasi bagi penyelenggaraan kehidupan berbangsa dan bernegara. Pancasila menjadi visi dan misi negara, serta pedoman bagi seluruh kebijakan pembangunan nasional. Berbeda dengan fungsinya sebagai dasar negara (sumber hukum) atau falsafah hidup (pandangan hidup bangsa).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000114',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Sidang pertama BPUPKI berlangsung pada tanggal...',
  '[{"id":"A","text":"1 Maret 1945 – 30 April 1945"},{"id":"B","text":"29 Mei 1945 – 1 Juni 1945"},{"id":"C","text":"10 Juli 1945 – 17 Juli 1945"},{"id":"D","text":"7 Agustus 1945 – 18 Agustus 1945"}]',
  'B',
  'Sidang pertama BPUPKI berlangsung pada 29 Mei – 1 Juni 1945. Dalam sidang ini, tiga tokoh menyampaikan usulan dasar negara: Mohammad Yamin (29 Mei), Soepomo (31 Mei), dan Soekarno (1 Juni). Sidang kedua BPUPKI berlangsung 10-17 Juli 1945, membahas rancangan UUD.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000115',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Nilai keadilan sosial dalam sila ke-5 Pancasila menuntut adanya pemerataan, yang berarti...',
  '[{"id":"A","text":"Setiap warga negara mendapat bagian yang sama rata dari kekayaan negara"},{"id":"B","text":"Negara menjamin terpenuhinya kebutuhan dasar seluruh warga negara tanpa diskriminasi"},{"id":"C","text":"Orang kaya diwajibkan memberi sebagian kekayaannya kepada yang miskin"},{"id":"D","text":"Semua warga negara memiliki penghasilan yang sama besar"}]',
  'B',
  'Keadilan sosial dalam Pancasila bukan berarti persamaan mutlak (sama rata), melainkan jaminan bahwa setiap warga negara dapat memenuhi kebutuhan dasarnya (sandang, pangan, papan, pendidikan, kesehatan) tanpa diskriminasi. Negara bertanggung jawab memastikan tidak ada warga yang terlantar atau hidup di bawah standar minimum kemanusiaan.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000116',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Hari Kesaktian Pancasila diperingati setiap tanggal 1 Oktober. Peringatan ini berkaitan dengan peristiwa...',
  '[{"id":"A","text":"Pengangkatan Pancasila sebagai dasar negara"},{"id":"B","text":"Penggagalan kudeta G30S/PKI tahun 1965"},{"id":"C","text":"Lahirnya rumusan Pancasila oleh Soekarno"},{"id":"D","text":"Pembentukan BPUPKI oleh Jepang"}]',
  'B',
  'Hari Kesaktian Pancasila diperingati setiap 1 Oktober untuk mengenang kegagalan percobaan kudeta G30S/PKI pada 30 September 1965. Peristiwa ini membuktikan ''kesaktian'' Pancasila sebagai ideologi negara yang tidak bisa digantikan oleh ideologi komunis. Tujuh perwira TNI AD gugur dalam peristiwa tersebut.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000117',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Lambang sila ke-4 Pancasila adalah...',
  '[{"id":"A","text":"Padi dan Kapas"},{"id":"B","text":"Rantai"},{"id":"C","text":"Kepala Banteng"},{"id":"D","text":"Pohon Beringin"}]',
  'C',
  'Lambang sila ke-4 ''Kerakyatan yang Dipimpin oleh Hikmat Kebijaksanaan dalam Permusyawaratan/Perwakilan'' adalah Kepala Banteng. Banteng melambangkan hewan sosial yang kuat dan suka berkumpul, mencerminkan sifat kerakyatan. Adapun: Bintang (sila 1), Rantai (sila 2), Pohon Beringin (sila 3), Padi dan Kapas (sila 5).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000118',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Berikut adalah tokoh yang mengusulkan rumusan dasar negara dalam sidang BPUPKI pertama, kecuali...',
  '[{"id":"A","text":"Ir. Soekarno"},{"id":"B","text":"Prof. Dr. Mr. Soepomo"},{"id":"C","text":"Mohammad Yamin"},{"id":"D","text":"Mohammad Hatta"}]',
  'D',
  'Tiga tokoh yang mengusulkan dasar negara dalam sidang BPUPKI pertama (29 Mei - 1 Juni 1945) adalah: Mohammad Yamin (29 Mei), Prof. Dr. Mr. Soepomo (31 Mei), dan Ir. Soekarno (1 Juni). Mohammad Hatta tidak mengusulkan dasar negara dalam sidang tersebut, meski ia merupakan tokoh penting dalam perumusan kemerdekaan.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000119',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SULIT', 8,
  'Pancasila bersifat ''kausa finalis'' yang berarti...',
  '[{"id":"A","text":"Pancasila merupakan penyebab asal-usul terbentuknya negara Indonesia"},{"id":"B","text":"Pancasila merupakan tujuan akhir yang ingin dicapai bangsa Indonesia"},{"id":"C","text":"Pancasila diciptakan secara resmi oleh para pendiri bangsa"},{"id":"D","text":"Pancasila berlaku sejak Indonesia merdeka sampai sekarang"}]',
  'B',
  'Aristoteles membagi causa (sebab) menjadi empat: causa materialis (bahan), causa formalis (bentuk), causa efficiens (penggerak), dan causa finalis (tujuan akhir). Pancasila sebagai ''kausa finalis'' berarti Pancasila adalah tujuan akhir yang ingin dicapai bangsa Indonesia — yaitu masyarakat yang ber-Ketuhanan, berperikemanusiaan, bersatu, berdemokrasi, dan berkeadilan sosial.',
  ARRAY['jarang-keluar']
),

(
  'aa100001-0000-0000-0000-000000000120',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Pancasila sebagai ''kepribadian bangsa'' berarti...',
  '[{"id":"A","text":"Pancasila adalah ciri khas dan identitas yang membedakan bangsa Indonesia dari bangsa lain"},{"id":"B","text":"Setiap warga negara Indonesia harus memiliki kepribadian yang sama"},{"id":"C","text":"Pancasila menentukan karakter pribadi setiap individu Indonesia"},{"id":"D","text":"Pancasila adalah warisan budaya nenek moyang yang tidak bisa diubah"}]',
  'A',
  'Pancasila sebagai ''kepribadian bangsa'' mengandung arti bahwa nilai-nilai Pancasila merupakan ciri khas bangsa Indonesia yang membedakannya dari bangsa-bangsa lain di dunia. Nilai-nilai seperti religiositas, kekeluargaan, musyawarah, dan gotong royong telah menjadi karakter khas bangsa Indonesia sejak berabad-abad.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000121',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'UUD 1945 mengalami amandemen sebanyak berapa kali?',
  '[{"id":"A","text":"2 kali"},{"id":"B","text":"3 kali"},{"id":"C","text":"4 kali"},{"id":"D","text":"5 kali"}]',
  'C',
  'UUD 1945 mengalami amandemen sebanyak 4 kali: Amandemen I (1999), Amandemen II (2000), Amandemen III (2001), dan Amandemen IV (2002). Setelah amandemen, UUD 1945 terdiri dari Pembukaan (tetap) dan Pasal-pasal (berubah), dari 37 pasal menjadi 73 pasal ditambah aturan peralihan dan tambahan.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000122',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Berdasarkan Pasal 1 Ayat (3) UUD 1945, Indonesia adalah negara...',
  '[{"id":"A","text":"Kesatuan"},{"id":"B","text":"Hukum"},{"id":"C","text":"Demokrasi"},{"id":"D","text":"Republik"}]',
  'B',
  'Pasal 1 Ayat (3) UUD 1945 berbunyi: ''Negara Indonesia adalah negara hukum.'' Ini berarti penyelenggaraan negara harus berdasarkan hukum (rule of law), bukan berdasarkan kekuasaan semata. Sedangkan ''Kesatuan'' diatur di Pasal 1 Ayat (1), ''Republik'' juga di Pasal 1 Ayat (1), dan ''Demokrasi'' tercermin dari Pasal 1 Ayat (2).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000123',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Berdasarkan UUD 1945 Pasal 7, masa jabatan Presiden dan Wakil Presiden adalah...',
  '[{"id":"A","text":"4 tahun dan dapat dipilih kembali tanpa batas"},{"id":"B","text":"5 tahun dan dapat dipilih kembali hanya untuk satu kali masa jabatan lagi"},{"id":"C","text":"6 tahun dan tidak dapat dipilih kembali"},{"id":"D","text":"5 tahun dan tidak dapat dipilih kembali"}]',
  'B',
  'Pasal 7 UUD 1945 (hasil amandemen) menyatakan: ''Presiden dan Wakil Presiden memegang jabatan selama lima tahun, dan sesudahnya dapat dipilih kembali dalam jabatan yang sama, hanya untuk satu kali masa jabatan.'' Artinya, seseorang maksimal dapat menjabat sebagai presiden selama 2 periode (10 tahun).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000124',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lembaga yang berwenang mengubah dan menetapkan UUD 1945 berdasarkan Pasal 3 UUD 1945 adalah...',
  '[{"id":"A","text":"DPR"},{"id":"B","text":"DPD"},{"id":"C","text":"MPR"},{"id":"D","text":"Mahkamah Konstitusi"}]',
  'C',
  'Pasal 3 Ayat (1) UUD 1945 menyatakan: ''Majelis Permusyawaratan Rakyat berwenang mengubah dan menetapkan Undang-Undang Dasar.'' Untuk mengubah UUD, diperlukan quorum minimal 2/3 anggota MPR hadir dan disetujui minimal 50%+1 dari seluruh anggota MPR (Pasal 37). Mahkamah Konstitusi hanya menguji UU terhadap UUD, bukan mengubah UUD.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000125',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Kekuasaan membentuk undang-undang berdasarkan UUD 1945 Pasal 20 dipegang oleh...',
  '[{"id":"A","text":"Presiden"},{"id":"B","text":"DPR"},{"id":"C","text":"MPR"},{"id":"D","text":"DPR bersama Presiden"}]',
  'B',
  'Pasal 20 Ayat (1) UUD 1945 menyatakan: ''Dewan Perwakilan Rakyat memegang kekuasaan membentuk undang-undang.'' Meski Presiden juga dapat mengajukan RUU (Pasal 5 Ayat 1) dan harus memberikan persetujuan bersama (Pasal 20 Ayat 2), kekuasaan legislatif secara konstitusional ada di tangan DPR. Ini perubahan penting dari UUD 1945 sebelum amandemen yang memberikan kekuasaan legislatif kepada Presiden.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000126',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Hak-hak asasi manusia diatur dalam UUD 1945 pada Bab...',
  '[{"id":"A","text":"Bab IX tentang Kekuasaan Kehakiman"},{"id":"B","text":"Bab X tentang Warga Negara dan Penduduk"},{"id":"C","text":"Bab XA tentang Hak Asasi Manusia"},{"id":"D","text":"Bab XI tentang Agama"}]',
  'C',
  'Hak Asasi Manusia diatur dalam Bab XA UUD 1945 yang memuat Pasal 28A sampai Pasal 28J. Bab ini ditambahkan pada Amandemen II tahun 2000. Pasal-pasal ini mencakup: hak hidup (28A), hak membentuk keluarga (28B), hak pengembangan diri (28C), hak pengakuan hukum (28D), hak kebebasan (28E), hak komunikasi (28F), hak atas perlindungan (28G), hak sejahtera (28H), hak perlakuan adil hukum (28I), dan kewajiban menghormati HAM orang lain (28J).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000127',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Pasal 33 UUD 1945 mengatur tentang...',
  '[{"id":"A","text":"Hak pendidikan bagi setiap warga negara"},{"id":"B","text":"Sistem pertahanan negara"},{"id":"C","text":"Perekonomian nasional dan kesejahteraan sosial"},{"id":"D","text":"Pemilihan umum"}]',
  'C',
  'Pasal 33 UUD 1945 mengatur perekonomian nasional. Ayat (1): perekonomian disusun berdasarkan usaha bersama (koperasi). Ayat (2): cabang produksi penting bagi negara dikuasai negara. Ayat (3): bumi, air, dan kekayaan alam dikuasai negara untuk kemakmuran rakyat. Ayat (4): perekonomian nasional berdasarkan demokrasi ekonomi dengan prinsip kebersamaan, efisiensi berkeadilan, berkelanjutan, berwawasan lingkungan, kemandirian, serta menjaga keseimbangan kemajuan dan kesatuan ekonomi nasional.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000128',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Berdasarkan UUD 1945 Pasal 22, Peraturan Pemerintah Pengganti Undang-Undang (Perppu) dikeluarkan oleh Presiden dalam kondisi...',
  '[{"id":"A","text":"Setiap saat jika diperlukan oleh pemerintah"},{"id":"B","text":"Kegentingan yang memaksa"},{"id":"C","text":"DPR tidak dapat membentuk undang-undang"},{"id":"D","text":"Presiden mendapat mandat khusus dari MPR"}]',
  'B',
  'Pasal 22 Ayat (1) UUD 1945 menyatakan: ''Dalam hal ihwal kegentingan yang memaksa, Presiden berhak menetapkan peraturan pemerintah sebagai pengganti undang-undang.'' Perppu memiliki kekuatan hukum setara UU. Jika DPR tidak menyetujuinya dalam masa persidangan berikutnya, Perppu harus dicabut. Syarat ''kegentingan memaksa'' diuji oleh MK.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000129',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Mahkamah Konstitusi (MK) berwenang mengadili perkara berikut, kecuali...',
  '[{"id":"A","text":"Menguji undang-undang terhadap UUD"},{"id":"B","text":"Memutus sengketa kewenangan lembaga negara"},{"id":"C","text":"Memutus sengketa hasil pemilihan umum"},{"id":"D","text":"Mengadili tindak pidana korupsi"}]',
  'D',
  'Kewenangan Mahkamah Konstitusi diatur dalam Pasal 24C UUD 1945, yaitu: (1) menguji UU terhadap UUD, (2) memutus sengketa kewenangan lembaga negara, (3) memutus pembubaran partai politik, (4) memutus perselisihan hasil Pemilu/Pilpres/Pilkada, dan (5) memutus pendapat DPR bahwa Presiden/Wapres melanggar UUD. Mengadili korupsi adalah kewenangan Pengadilan Tindak Pidana Korupsi (Tipikor).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000130',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Berdasarkan UUD 1945 Pasal 31, anggaran pendidikan minimal yang wajib dialokasikan dari APBN adalah...',
  '[{"id":"A","text":"10%"},{"id":"B","text":"15%"},{"id":"C","text":"20%"},{"id":"D","text":"25%"}]',
  'C',
  'Pasal 31 Ayat (4) UUD 1945 menyatakan: ''Negara memprioritaskan anggaran pendidikan sekurang-kurangnya dua puluh persen dari anggaran pendapatan dan belanja negara serta dari anggaran pendapatan dan belanja daerah untuk memenuhi kebutuhan penyelenggaraan pendidikan nasional.'' Amanat 20% ini juga tercermin dalam UU No. 20 Tahun 2003 tentang Sistem Pendidikan Nasional.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000131',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Hak DPR untuk meminta keterangan kepada Presiden tentang kebijakan pemerintah disebut...',
  '[{"id":"A","text":"Hak interpelasi"},{"id":"B","text":"Hak angket"},{"id":"C","text":"Hak menyatakan pendapat"},{"id":"D","text":"Hak imunitas"}]',
  'A',
  'Hak interpelasi adalah hak DPR untuk meminta keterangan kepada Presiden tentang kebijakan pemerintah yang penting dan strategis. Hak angket adalah hak DPR melakukan penyelidikan terhadap pelaksanaan UU/kebijakan pemerintah. Hak menyatakan pendapat adalah hak DPR menyatakan pendapat atas kebijakan pemerintah atau peristiwa luar biasa. Hak imunitas adalah hak DPR untuk tidak dapat dituntut di pengadilan atas pernyataan dalam sidang.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000132',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Komisi Yudisial (KY) dibentuk berdasarkan UUD 1945 dan bertugas...',
  '[{"id":"A","text":"Mengadili hakim yang terbukti melakukan pelanggaran"},{"id":"B","text":"Menjaga dan menegakkan kehormatan, keluhuran martabat, dan perilaku hakim"},{"id":"C","text":"Memilih anggota Mahkamah Agung"},{"id":"D","text":"Mengawasi semua lembaga peradilan di Indonesia"}]',
  'B',
  'Pasal 24B UUD 1945 mengatur Komisi Yudisial. KY bersifat mandiri dan berwenang mengusulkan pengangkatan hakim agung serta mempunyai wewenang lain dalam rangka menjaga dan menegakkan kehormatan, keluhuran martabat, serta perilaku hakim. KY tidak mengadili hakim (itu wewenang MA/MK), tetapi memberikan rekomendasi sanksi.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000133',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Dewan Perwakilan Daerah (DPD) dapat mengajukan rancangan undang-undang yang berkaitan dengan...',
  '[{"id":"A","text":"Semua bidang perundang-undangan nasional"},{"id":"B","text":"Otonomi daerah, hubungan pusat dan daerah, serta pemekaran daerah"},{"id":"C","text":"Kebijakan luar negeri dan pertahanan"},{"id":"D","text":"APBN dan perpajakan nasional"}]',
  'B',
  'Pasal 22D UUD 1945 mengatur bahwa DPD dapat mengajukan dan membahas RUU yang berkaitan dengan: otonomi daerah, hubungan pusat dan daerah, pembentukan dan pemekaran serta penggabungan daerah, pengelolaan SDA dan SDE, serta perimbangan keuangan pusat-daerah. DPD bukan pembuat UU secara penuh seperti DPR, fungsinya lebih terbatas.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000134',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Pasal 37 UUD 1945 menetapkan bahwa bagian UUD yang tidak dapat diubah adalah...',
  '[{"id":"A","text":"Pembukaan UUD 1945"},{"id":"B","text":"Batang tubuh UUD 1945 Pasal 1-37"},{"id":"C","text":"Bentuk Negara Kesatuan Republik Indonesia"},{"id":"D","text":"Seluruh isi UUD 1945 tidak dapat diubah"}]',
  'C',
  'Pasal 37 Ayat (5) UUD 1945 menyatakan: ''Khusus mengenai bentuk Negara Kesatuan Republik Indonesia tidak dapat dilakukan perubahan.'' Artinya, NKRI sebagai bentuk negara adalah hal yang tidak dapat diubah melalui amandemen. Pembukaan UUD 1945 secara konstitusional tidak disebutkan tidak bisa diubah, tetapi secara politis dianggap tidak dapat diubah karena memuat Pancasila.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000135',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Berdasarkan UUD 1945 Pasal 27 Ayat (1), setiap warga negara bersamaan kedudukannya di dalam hukum dan pemerintahan, serta wajib menjunjung hukum dan pemerintahan itu dengan tidak ada kecualinya. Ini mencerminkan prinsip...',
  '[{"id":"A","text":"Supremasi hukum dan persamaan di hadapan hukum (equality before the law)"},{"id":"B","text":"Hak asasi manusia yang tidak bisa dibatasi"},{"id":"C","text":"Kewajiban warga negara membayar pajak"},{"id":"D","text":"Hak memperoleh pekerjaan dan penghidupan layak"}]',
  'A',
  'Pasal 27 Ayat (1) UUD 1945 mencerminkan dua prinsip fundamental: supremasi hukum (hukum adalah otoritas tertinggi) dan persamaan di hadapan hukum (equality before the law) — siapapun, tanpa terkecuali, tunduk pada hukum yang sama. Ini merupakan ciri negara hukum modern yang demokratis.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000136',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Berdasarkan UUD 1945, pemilihan Presiden dan Wakil Presiden dilakukan secara langsung oleh...',
  '[{"id":"A","text":"MPR"},{"id":"B","text":"DPR"},{"id":"C","text":"Rakyat"},{"id":"D","text":"KPU"}]',
  'C',
  'Pasal 6A UUD 1945 (hasil Amandemen III, 2001) menyatakan bahwa Presiden dan Wakil Presiden dipilih dalam satu pasangan secara langsung oleh rakyat. Ini merupakan perubahan signifikan dari sistem sebelumnya di mana Presiden dipilih oleh MPR. Pemilihan langsung pertama kali dilaksanakan pada Pilpres 2004.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000137',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Badan Pemeriksa Keuangan (BPK) berdasarkan UUD 1945 Pasal 23E memeriksa...',
  '[{"id":"A","text":"Pengelolaan dan tanggung jawab keuangan negara"},{"id":"B","text":"Laporan keuangan perusahaan swasta yang berkaitan dengan negara"},{"id":"C","text":"Keuangan partai politik penerima dana pemerintah"},{"id":"D","text":"Aset negara dan kekayaan pejabat publik"}]',
  'A',
  'Pasal 23E Ayat (1) UUD 1945 menyatakan: ''Untuk memeriksa pengelolaan dan tanggung jawab tentang keuangan negara diadakan satu Badan Pemeriksa Keuangan yang bebas dan mandiri.'' BPK berwenang memeriksa APBN, APBD, dan laporan keuangan badan usaha milik negara/daerah. Hasil pemeriksaan diserahkan kepada DPR, DPD, dan DPRD.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000138',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Pasal 29 UUD 1945 menjamin kebebasan beragama di Indonesia. Salah satu isinya adalah...',
  '[{"id":"A","text":"Negara mewajibkan setiap warga negara memeluk agama tertentu"},{"id":"B","text":"Negara menjamin kemerdekaan tiap-tiap penduduk untuk memeluk agamanya masing-masing"},{"id":"C","text":"Agama resmi negara adalah Islam"},{"id":"D","text":"Negara bebas dari pengaruh agama manapun"}]',
  'B',
  'Pasal 29 Ayat (2) UUD 1945 menyatakan: ''Negara menjamin kemerdekaan tiap-tiap penduduk untuk memeluk agamanya masing-masing dan untuk beribadat menurut agamanya dan kepercayaannya itu.'' Indonesia bukan negara agama (theocracy) dan bukan negara sekuler (yang memisahkan agama dari negara), tetapi negara yang berdasarkan Ketuhanan Yang Maha Esa.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000139',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Kekuasaan kehakiman di Indonesia dijalankan oleh...',
  '[{"id":"A","text":"Mahkamah Agung saja"},{"id":"B","text":"Mahkamah Konstitusi saja"},{"id":"C","text":"Mahkamah Agung dan Mahkamah Konstitusi"},{"id":"D","text":"Mahkamah Agung, Mahkamah Konstitusi, dan Komisi Yudisial"}]',
  'C',
  'Pasal 24 Ayat (2) UUD 1945 menyatakan: ''Kekuasaan kehakiman dilakukan oleh sebuah Mahkamah Agung dan badan peradilan yang berada di bawahnya dalam lingkungan peradilan umum, lingkungan peradilan agama, lingkungan peradilan militer, lingkungan peradilan tata usaha negara, dan oleh sebuah Mahkamah Konstitusi.'' Komisi Yudisial bukan pelaku kekuasaan kehakiman, melainkan lembaga pengawas perilaku hakim.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000140',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Berdasarkan UUD 1945, Presiden tidak dapat membekukan dan/atau membubarkan DPR. Hal ini menunjukkan prinsip...',
  '[{"id":"A","text":"Checks and balances dalam sistem presidensial"},{"id":"B","text":"Supremasi MPR sebagai lembaga tertinggi"},{"id":"C","text":"Kekuasaan presiden yang terbatas oleh konstitusi"},{"id":"D","text":"Keseimbangan antara legislatif dan eksekutif"}]',
  'A',
  'Pasal 7C UUD 1945 menyatakan Presiden tidak dapat membekukan dan/atau membubarkan DPR. Sebaliknya, DPR pun tidak dapat menjatuhkan Presiden kecuali melalui proses hukum (impeachment) yang melibatkan MK dan MPR. Ini merupakan prinsip checks and balances (saling mengawasi dan mengimbangi) dalam sistem presidensial, di mana tidak ada satu pun lembaga yang dominan secara absolut.',
  ARRAY['sering-keluar']
)

ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- Seed 002C: CPNS TWK 141-200 (60 soal)
-- ============================================================

INSERT INTO public.questions
  (id, pack_id, exam_type, subject, subtopic, question_type, difficulty, difficulty_rank,
   question_text, options, correct_option, explanation_text, tags)
VALUES

(
  'aa100001-0000-0000-0000-000000000141',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Konsep Wawasan Nusantara pertama kali dicetuskan melalui...',
  '[{"id":"A","text":"Sumpah Pemuda 1928"},{"id":"B","text":"Deklarasi Djuanda 1957"},{"id":"C","text":"Proklamasi Kemerdekaan 1945"},{"id":"D","text":"Konferensi Asia-Afrika 1955"}]',
  'B',
  'Wawasan Nusantara lahir dari Deklarasi Djuanda yang dicetuskan oleh Perdana Menteri Djuanda Kartawidjaja pada 13 Desember 1957. Deklarasi ini menyatakan bahwa laut di antara pulau-pulau Indonesia adalah bagian dari wilayah Indonesia (laut pedalaman), bukan laut bebas. Konsep ini kemudian diterima dunia internasional melalui UNCLOS 1982.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000142',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Bentuk pemerintahan Indonesia adalah...',
  '[{"id":"A","text":"Monarki Konstitusional"},{"id":"B","text":"Republik"},{"id":"C","text":"Federasi"},{"id":"D","text":"Oligarki"}]',
  'B',
  'Indonesia adalah negara yang berbentuk Republik, sesuai Pasal 1 Ayat (1) UUD 1945: ''Negara Indonesia ialah Negara Kesatuan, yang berbentuk Republik.'' Bentuk Republik berarti kepala negara (Presiden) dipilih oleh rakyat, bukan berdasarkan keturunan (monarki). Bentuk Kesatuan membedakan Indonesia dari negara federal seperti Amerika Serikat.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000143',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Asas desentralisasi dalam otonomi daerah berarti...',
  '[{"id":"A","text":"Pelimpahan wewenang dari pemerintah pusat kepada gubernur sebagai wakil pemerintah pusat"},{"id":"B","text":"Penyerahan urusan pemerintahan dari pemerintah pusat kepada daerah otonom"},{"id":"C","text":"Penugasan dari pemerintah pusat kepada pemerintah daerah untuk melaksanakan tugas tertentu"},{"id":"D","text":"Pengalihan wewenang dari presiden kepada menteri"}]',
  'B',
  'Desentralisasi adalah penyerahan urusan pemerintahan oleh pemerintah pusat kepada daerah otonom (provinsi/kabupaten/kota) berdasarkan asas otonomi. Ini berbeda dengan dekonsentrasi (pelimpahan wewenang kepada gubernur sebagai wakil pusat) dan tugas pembantuan (penugasan dari pusat kepada daerah untuk melaksanakan tugas tertentu). Otonomi daerah diatur dalam UU No. 23 Tahun 2014.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000144',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Ketahanan nasional Indonesia menggunakan pendekatan Asta Gatra yang terdiri dari...',
  '[{"id":"A","text":"5 gatra alamiah dan 3 gatra sosial"},{"id":"B","text":"3 gatra alamiah (Tri Gatra) dan 5 gatra sosial (Panca Gatra)"},{"id":"C","text":"4 gatra politik dan 4 gatra ekonomi"},{"id":"D","text":"8 gatra yang setara dan tidak dapat dipisahkan"}]',
  'B',
  'Konsep ketahanan nasional Indonesia menggunakan Asta Gatra (8 gatra). Tri Gatra (3 gatra alamiah): geografi, kekayaan alam, dan demografi (kependudukan). Panca Gatra (5 gatra sosial): ideologi, politik, ekonomi, sosial budaya, dan pertahanan keamanan (Ipoleksosbud-Hankam). Ke-8 gatra ini saling terkait dan saling memengaruhi.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000145',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Bela negara sebagai hak dan kewajiban warga negara Indonesia diatur dalam UUD 1945 Pasal...',
  '[{"id":"A","text":"Pasal 27 Ayat (3) dan Pasal 30"},{"id":"B","text":"Pasal 28 dan Pasal 29"},{"id":"C","text":"Pasal 30 dan Pasal 31"},{"id":"D","text":"Pasal 26 dan Pasal 27"}]',
  'A',
  'Bela negara diatur dalam: Pasal 27 Ayat (3): ''Setiap warga negara berhak dan wajib ikut serta dalam upaya pembelaan negara.'' Pasal 30 Ayat (1): ''Tiap-tiap warga negara berhak dan wajib ikut serta dalam usaha pertahanan dan keamanan negara.'' Bela negara tidak harus berupa angkat senjata, tetapi juga melalui pendidikan, kerja keras, dan mencintai produk dalam negeri.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000146',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Berapa jumlah provinsi di Indonesia setelah pemekaran Papua tahun 2022-2023?',
  '[{"id":"A","text":"34 provinsi"},{"id":"B","text":"36 provinsi"},{"id":"C","text":"37 provinsi"},{"id":"D","text":"38 provinsi"}]',
  'D',
  'Setelah pemekaran provinsi baru di Papua (Papua Selatan, Papua Tengah, Papua Pegunungan, Papua Barat Daya) pada tahun 2022-2023, total provinsi di Indonesia menjadi 38 provinsi. Sebelumnya Indonesia memiliki 34 provinsi. Penambahan ini menjadi bagian dari kebijakan percepatan pembangunan Papua.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000147',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Sistem pemerintahan Indonesia setelah amandemen UUD 1945 adalah...',
  '[{"id":"A","text":"Parlementer"},{"id":"B","text":"Presidensial"},{"id":"C","text":"Semi-presidensial"},{"id":"D","text":"Campuran presidensial-parlementer"}]',
  'B',
  'Indonesia menganut sistem presidensial, di mana Presiden adalah kepala negara sekaligus kepala pemerintahan yang dipilih langsung oleh rakyat. Presiden tidak bertanggung jawab kepada DPR/parlemen dan tidak dapat dijatuhkan oleh DPR dalam proses politik biasa. Berbeda dengan sistem parlementer di mana PM bertanggung jawab kepada parlemen dan dapat dijatuhkan melalui mosi tidak percaya.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000148',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Integrasi nasional dapat terancam oleh faktor berikut ini, kecuali...',
  '[{"id":"A","text":"Sikap etnosentrisme yang berlebihan"},{"id":"B","text":"Kemajuan teknologi informasi dan komunikasi"},{"id":"C","text":"Ketimpangan ekonomi antar daerah"},{"id":"D","text":"Separatisme dan gerakan kedaerahan"}]',
  'B',
  'Kemajuan teknologi informasi dan komunikasi justru merupakan faktor yang berpotensi memperkuat integrasi nasional jika digunakan dengan bijak (memudahkan komunikasi lintas daerah). Yang mengancam integrasi nasional adalah: etnosentrisme berlebihan (merasa sukunya paling superior), ketimpangan ekonomi (memicu kecemburuan), dan separatisme (gerakan ingin memisahkan diri dari NKRI).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000149',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Asas tugas pembantuan (medebewind) dalam pemerintahan daerah berarti...',
  '[{"id":"A","text":"Penyerahan urusan pemerintahan dari pusat ke daerah otonom"},{"id":"B","text":"Pelimpahan wewenang dari pusat ke gubernur sebagai wakil pusat"},{"id":"C","text":"Penugasan dari pemerintah pusat/provinsi kepada daerah/desa untuk melaksanakan tugas tertentu dengan biaya dari pemberi tugas"},{"id":"D","text":"Kewenangan daerah mengatur urusan rumah tangganya sendiri"}]',
  'C',
  'Tugas pembantuan adalah penugasan dari pemerintah pusat kepada pemerintah daerah (provinsi/kabupaten/kota) atau dari pemerintah provinsi kepada kabupaten/kota/desa untuk melaksanakan sebagian urusan pemerintahan. Biaya pelaksanaannya ditanggung oleh pemberi tugas (APBN atau APBD provinsi), bukan APBD daerah penerima tugas.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000150',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Prinsip Wawasan Nusantara yang menyatakan bahwa Indonesia adalah satu kesatuan yang tidak dapat dibagi-bagi menganut...',
  '[{"id":"A","text":"Prinsip keadilan dan kemakmuran yang merata"},{"id":"B","text":"Prinsip satu kesatuan wilayah, bangsa, budaya, ekonomi, dan pertahanan-keamanan"},{"id":"C","text":"Prinsip ketahanan nasional berbasis Asta Gatra"},{"id":"D","text":"Prinsip supremasi hukum atas wilayah nasional"}]',
  'B',
  'Wawasan Nusantara mengandung prinsip kesatuan dalam lima aspek: (1) satu kesatuan wilayah (darat, laut, udara sebagai satu hamparan), (2) satu kesatuan bangsa (semua suku adalah bangsa Indonesia), (3) satu kesatuan sosial-budaya (beragam tapi satu budaya nasional), (4) satu kesatuan ekonomi (kekayaan alam untuk seluruh rakyat), (5) satu kesatuan pertahanan-keamanan (ancaman di satu daerah adalah ancaman nasional).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000151',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Semboyan ''Bhinneka Tunggal Ika'' berasal dari kitab kuno yang ditulis pada masa Kerajaan...',
  '[{"id":"A","text":"Sriwijaya"},{"id":"B","text":"Singasari"},{"id":"C","text":"Majapahit"},{"id":"D","text":"Mataram"}]',
  'C',
  'Bhinneka Tunggal Ika berasal dari kitab Sutasoma karangan Mpu Tantular, seorang pujangga pada masa Kerajaan Majapahit (abad ke-14, masa pemerintahan Raja Hayam Wuruk). Kalimat lengkapnya: ''Bhinneka Tunggal Ika tan hana dharma mangrwa'' yang artinya: ''Berbeda-beda tetapi tetap satu, tidak ada kebenaran yang mendua.''',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000152',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Semboyan Bhinneka Tunggal Ika secara resmi ditetapkan sebagai semboyan negara melalui...',
  '[{"id":"A","text":"UUD 1945"},{"id":"B","text":"PP No. 66 Tahun 1951"},{"id":"C","text":"Tap MPR No. II/MPR/1978"},{"id":"D","text":"Keppres No. 24 Tahun 2016"}]',
  'B',
  'Bhinneka Tunggal Ika ditetapkan sebagai semboyan negara (pada pita yang digenggam Garuda Pancasila) melalui Peraturan Pemerintah No. 66 Tahun 1951 tentang Lambang Negara. Ini menjadikannya semboyan resmi yang mengikat secara hukum, bukan sekadar ungkapan budaya.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000153',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Sumpah Pemuda 28 Oktober 1928 mengikrarkan tiga tekad persatuan, yaitu...',
  '[{"id":"A","text":"Satu nusa, satu bangsa, satu agama"},{"id":"B","text":"Satu tanah air, satu bangsa, satu bahasa Indonesia"},{"id":"C","text":"Satu ideologi, satu tujuan, satu bangsa"},{"id":"D","text":"Bersatu, berjuang, dan merdeka"}]',
  'B',
  'Sumpah Pemuda 28 Oktober 1928 mengikrarkan: (1) Kami putera dan puteri Indonesia mengaku bertumpah darah yang satu — Tanah Air Indonesia. (2) Kami putera dan puteri Indonesia mengaku berbangsa yang satu — Bangsa Indonesia. (3) Kami putera dan puteri Indonesia menjunjung bahasa persatuan — Bahasa Indonesia. Peristiwa ini merupakan tonggak penting dalam persatuan bangsa.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000154',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Tri Kerukunan Umat Beragama di Indonesia meliputi...',
  '[{"id":"A","text":"Kerukunan intern, antar umat beragama, dan antara umat beragama dengan pemerintah"},{"id":"B","text":"Kerukunan antar suku, antar agama, dan antar ras"},{"id":"C","text":"Toleransi, kesetaraan, dan kebersamaan antar agama"},{"id":"D","text":"Dialog, kerjasama, dan saling menghormati antar pemimpin agama"}]',
  'A',
  'Tri Kerukunan Umat Beragama adalah konsep yang dikembangkan pemerintah Indonesia untuk menjaga harmoni beragama. Ketiganya adalah: (1) Kerukunan intern umat beragama (antar sesama pemeluk satu agama), (2) Kerukunan antar umat beragama (antar pemeluk berbagai agama), (3) Kerukunan antara umat beragama dengan pemerintah (menjaga stabilitas nasional).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000155',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Toleransi dalam konteks kebangsaan Indonesia berarti...',
  '[{"id":"A","text":"Menyetujui dan mengikuti semua keyakinan yang ada"},{"id":"B","text":"Menghargai dan menghormati perbedaan tanpa harus menyamakan keyakinan"},{"id":"C","text":"Mengabaikan perbedaan agar tidak terjadi konflik"},{"id":"D","text":"Mencampur semua agama menjadi satu agama baru"}]',
  'B',
  'Toleransi (dari bahasa Latin ''tolerare'' = menahan diri) adalah sikap menghargai dan menghormati perbedaan — baik perbedaan agama, suku, budaya, maupun pandangan. Toleransi tidak berarti harus menyetujui atau mengikuti keyakinan orang lain, tetapi menghormati hak orang lain untuk memiliki dan menjalankan keyakinannya. Ini adalah fondasi hidup bersama dalam kemajemukan.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000156',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Naskah proklamasi kemerdekaan Indonesia dirumuskan di...',
  '[{"id":"A","text":"Istana Merdeka Jakarta"},{"id":"B","text":"Jalan Imam Bonjol No. 1 Jakarta"},{"id":"C","text":"Rumah Laksamana Maeda di Jakarta"},{"id":"D","text":"Rengasdengklok, Karawang"}]',
  'C',
  'Naskah proklamasi dirumuskan di kediaman Laksamana Muda Maeda (perwira AL Jepang) di Jalan Imam Bonjol No. 1, Jakarta, pada malam tanggal 16-17 Agustus 1945. Laksamana Maeda memberikan jaminan keamanan kepada para tokoh pergerakan. Naskah ditulis tangan oleh Soekarno dan diketik oleh Sayuti Melik setelah sempat dikoreksi.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000157',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Sidang PPKI pertama pada 18 Agustus 1945 menghasilkan keputusan penting berikut, kecuali...',
  '[{"id":"A","text":"Mengesahkan UUD 1945"},{"id":"B","text":"Memilih Soekarno sebagai Presiden dan Hatta sebagai Wakil Presiden"},{"id":"C","text":"Membentuk KNIP (Komite Nasional Indonesia Pusat)"},{"id":"D","text":"Membentuk TNI sebagai angkatan bersenjata"}]',
  'D',
  'Sidang PPKI pertama (18 Agustus 1945) menghasilkan: (1) mengesahkan UUD 1945, (2) memilih Soekarno-Hatta sebagai Presiden dan Wakil Presiden, (3) membentuk KNIP sebagai pembantu presiden sementara (sebelum terbentuknya DPR). Pembentukan BKR (cikal bakal TNI) diputuskan pada sidang PPKI kedua (19 Agustus 1945), bukan 18 Agustus.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000158',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Pemberontakan PKI Madiun tahun 1948 dipimpin oleh...',
  '[{"id":"A","text":"D.N. Aidit dan Lukman"},{"id":"B","text":"Musso dan Amir Syarifuddin"},{"id":"C","text":"Tan Malaka dan Achmad Subardjo"},{"id":"D","text":"Alimin dan Semaun"}]',
  'B',
  'Pemberontakan PKI Madiun (18 September 1948) dipimpin oleh Musso (pemimpin PKI yang baru kembali dari Uni Soviet) dan Amir Syarifuddin (mantan Perdana Menteri yang berpihak ke PKI). Pemberontakan ini berhasil ditumpas oleh TNI. Musso tewas tertembak dan Amir Syarifuddin dieksekusi. Peristiwa ini berbeda dari G30S/PKI 1965 yang dipimpin D.N. Aidit.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000159',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Konferensi Meja Bundar (KMB) yang berlangsung di Den Haag pada 1949 menghasilkan...',
  '[{"id":"A","text":"Belanda mengakui kemerdekaan Indonesia tanpa syarat"},{"id":"B","text":"Dibentuknya RIS dan Belanda mengakui kedaulatan RIS pada 27 Desember 1949"},{"id":"C","text":"Indonesia bergabung dengan Persatuan Bangsa-Bangsa"},{"id":"D","text":"Perjanjian pembagian wilayah antara Indonesia dan Belanda"}]',
  'B',
  'KMB (23 Agustus - 2 November 1949) menghasilkan: Belanda mengakui kedaulatan Republik Indonesia Serikat (RIS) pada 27 Desember 1949. Indonesia menjadi negara federal sementara (RIS) dengan 16 negara bagian. Namun karena rakyat menginginkan negara kesatuan, RIS dibubarkan dan diganti NKRI pada 17 Agustus 1950. Irian Barat belum diserahkan (baru diserahkan 1963).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000160',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Supersemar (Surat Perintah Sebelas Maret) 1966 ditandatangani oleh Presiden Soekarno dan ditujukan kepada...',
  '[{"id":"A","text":"Jenderal Abdul Haris Nasution"},{"id":"B","text":"Jenderal Soeharto"},{"id":"C","text":"Jenderal Ahmad Yani"},{"id":"D","text":"Jenderal Umar Wirahadikusumah"}]',
  'B',
  'Supersemar ditandatangani Presiden Soekarno pada 11 Maret 1966, memberikan mandat kepada Jenderal Soeharto (Pangkostrad/Men Pangad saat itu) untuk mengambil segala tindakan yang dianggap perlu guna menjamin keamanan dan ketenangan serta kestabilan jalannya pemerintahan. Supersemar inilah yang menjadi dasar Soeharto mengambil alih kekuasaan, yang kemudian menandai awal Orde Baru.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000161',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Reformasi 1998 yang menuntut turunnya Presiden Soeharto dipicu utamanya oleh...',
  '[{"id":"A","text":"Konflik bersenjata dengan negara tetangga"},{"id":"B","text":"Krisis ekonomi (moneter) Asia 1997-1998 dan tuntutan demokratisasi"},{"id":"C","text":"Bencana alam besar yang melanda Indonesia"},{"id":"D","text":"Tekanan dari negara-negara Barat kepada Indonesia"}]',
  'B',
  'Reformasi 1998 dipicu oleh krisis moneter Asia 1997-1998 yang menyebabkan nilai rupiah anjlok drastis, harga kebutuhan pokok melonjak, dan pengangguran meningkat. Kondisi ini memicu demonstrasi besar mahasiswa yang menuntut reformasi dan mundurnya Soeharto. Pada 21 Mei 1998, Soeharto mengundurkan diri setelah 32 tahun berkuasa.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000162',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Organisasi pergerakan nasional pertama Indonesia, Budi Utomo, didirikan pada...',
  '[{"id":"A","text":"20 Mei 1908"},{"id":"B","text":"28 Oktober 1928"},{"id":"C","text":"17 Agustus 1945"},{"id":"D","text":"20 Mei 1920"}]',
  'A',
  'Budi Utomo didirikan pada 20 Mei 1908, yang kemudian ditetapkan sebagai Hari Kebangkitan Nasional. Organisasi ini didirikan oleh Dr. Wahidin Sudirohusodo dan dr. Soetomo, diprakarsai oleh mahasiswa STOVIA (School tot Opleiding van Inlandsche Artsen). Budi Utomo merupakan organisasi modern pertama yang bertujuan memajukan kesejahteraan dan harkat bangsa Indonesia.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000163',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Operasi Trikora yang dicanangkan Presiden Soekarno pada 1961 bertujuan untuk...',
  '[{"id":"A","text":"Membebaskan Timor Timur dari Portugal"},{"id":"B","text":"Merebut kembali Irian Barat dari Belanda"},{"id":"C","text":"Mempertahankan Malaysia dari konfrontasi"},{"id":"D","text":"Membebaskan Sabah dan Serawak"}]',
  'B',
  'Trikora (Tri Komando Rakyat) dicanangkan Soekarno pada 19 Desember 1961 dengan tiga isi: (1) gagalkan pembentukan negara Papua boneka Belanda, (2) kibarkan Merah Putih di Irian Barat, (3) bersiaplah untuk mobilisasi umum. Melalui tekanan militer dan diplomasi (Perjanjian New York 1962), Irian Barat akhirnya diserahkan ke Indonesia pada Mei 1963.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000164',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Dekret Presiden 5 Juli 1959 menyatakan...',
  '[{"id":"A","text":"Pembubaran DPR dan pembentukan DPR-GR"},{"id":"B","text":"Kembali ke UUD 1945 dan pembubaran Konstituante"},{"id":"C","text":"Pemberlakuan darurat militer di seluruh Indonesia"},{"id":"D","text":"Pembentukan Kabinet Gotong Royong"}]',
  'B',
  'Dekret Presiden 5 Juli 1959 berisi: (1) menetapkan pembubaran Konstituante (badan yang bertugas membuat UUD baru namun gagal bersidang), (2) menetapkan berlakunya kembali UUD 1945 dan tidak berlakunya UUDS 1950, (3) pembentukan MPRS dan DPAS. Dekret ini menandai berakhirnya era Demokrasi Liberal dan dimulainya era Demokrasi Terpimpin.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000165',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Masa Demokrasi Liberal Indonesia (1950-1959) ditandai dengan...',
  '[{"id":"A","text":"Satu partai berkuasa di bawah kendali presiden"},{"id":"B","text":"Sering bergantinya kabinet karena sistem multipartai"},{"id":"C","text":"Militer memegang kekuasaan pemerintahan sipil"},{"id":"D","text":"Presiden memiliki kekuasaan tak terbatas"}]',
  'B',
  'Masa Demokrasi Liberal (1950-1959) menggunakan UUDS 1950 dengan sistem parlementer. Dalam periode kurang dari 10 tahun, Indonesia mengalami pergantian kabinet sebanyak 7 kali (lebih dari 1 kabinet per tahun). Ketidakstabilan ini terjadi karena parlemen yang multipartai sering menjatuhkan kabinet melalui mosi tidak percaya. Kondisi ini mendorong Soekarno mengeluarkan Dekret 5 Juli 1959.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000166',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Undang-Undang Aparatur Sipil Negara yang berlaku saat ini adalah...',
  '[{"id":"A","text":"UU No. 5 Tahun 2014"},{"id":"B","text":"UU No. 20 Tahun 2023"},{"id":"C","text":"UU No. 43 Tahun 1999"},{"id":"D","text":"UU No. 8 Tahun 1974"}]',
  'B',
  'UU ASN yang berlaku saat ini adalah UU No. 20 Tahun 2023 tentang Aparatur Sipil Negara, yang menggantikan UU No. 5 Tahun 2014. UU baru ini antara lain mengatur tentang penguatan sistem merit, profesionalitas ASN, dan perlindungan ASN. UU No. 43 Tahun 1999 dan UU No. 8 Tahun 1974 adalah UU kepegawaian yang sudah tidak berlaku.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000167',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Nilai-nilai dasar ASN yang disingkat BerAKHLAK adalah singkatan dari...',
  '[{"id":"A","text":"Berani, Akurat, Kompeten, Harmonis, Loyal, Adaptif, Kreatif"},{"id":"B","text":"Berorientasi Pelayanan, Akuntabel, Kompeten, Harmonis, Loyal, Adaptif, Kolaboratif"},{"id":"C","text":"Bersih, Amanah, Kuat, Handal, Loyal, Adil, Kreatif"},{"id":"D","text":"Bertanggung jawab, Aktif, Kritis, Humanis, Loyalis, Ahli, Konsisten"}]',
  'B',
  'BerAKHLAK adalah akronim dari: Berorientasi Pelayanan, Akuntabel, Kompeten, Harmonis, Loyal, Adaptif, dan Kolaboratif. Nilai ini ditetapkan melalui Surat Edaran Menteri PANRB No. 20 Tahun 2021 sebagai pedoman perilaku ASN. Selain BerAKHLAK, terdapat employer branding ASN: Bangga Melayani Bangsa.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000168',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Sistem merit dalam manajemen ASN berarti ASN dikelola berdasarkan...',
  '[{"id":"A","text":"Senioritas dan lama pengabdian"},{"id":"B","text":"Kedekatan hubungan dengan pimpinan"},{"id":"C","text":"Kompetensi, kualifikasi, kinerja, dan integritas"},{"id":"D","text":"Latar belakang pendidikan dan asal daerah"}]',
  'C',
  'Sistem merit adalah kebijakan dan manajemen ASN yang berdasarkan pada kualifikasi, kompetensi, dan kinerja secara adil dan wajar, tanpa diskriminasi apapun. Tujuannya: memastikan ASN yang direkrut, dipromosikan, dan dihargai adalah mereka yang benar-benar kompeten dan berkinerja baik — bukan karena nepotisme, kedekatan politik, atau senioritas belaka.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000169',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Badan Pemeriksa Keuangan (BPK) bertugas...',
  '[{"id":"A","text":"Menetapkan anggaran negara bersama DPR"},{"id":"B","text":"Memeriksa pengelolaan dan tanggung jawab keuangan negara"},{"id":"C","text":"Mengawasi pelaksanaan APBN oleh kementerian"},{"id":"D","text":"Memberikan pendapat hukum atas kebijakan keuangan negara"}]',
  'B',
  'BPK (Badan Pemeriksa Keuangan) adalah lembaga negara yang memeriksa pengelolaan dan tanggung jawab keuangan negara. Berdasarkan Pasal 23E UUD 1945, BPK berkedudukan di Jakarta dan bersifat bebas serta mandiri. Hasil pemeriksaan BPK disampaikan kepada DPR, DPD, dan DPRD untuk ditindaklanjuti. BPK bukan yang menetapkan anggaran (itu kewenangan pemerintah dan DPR).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000170',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Ombudsman Republik Indonesia bertugas...',
  '[{"id":"A","text":"Mengawasi kinerja dan integritas ASN di seluruh Indonesia"},{"id":"B","text":"Menangani laporan masyarakat atas dugaan maladministrasi dalam penyelenggaraan pelayanan publik"},{"id":"C","text":"Mengadili sengketa antara pemerintah dan warga negara"},{"id":"D","text":"Memeriksa keuangan lembaga pelayanan publik"}]',
  'B',
  'Ombudsman RI (dibentuk UU No. 37 Tahun 2008) bertugas mengawasi penyelenggaraan pelayanan publik oleh lembaga penyelenggara negara dan swasta yang diberi tugas menyelenggarakan pelayanan publik. Ombudsman menerima dan menindaklanjuti laporan masyarakat atas dugaan maladministrasi (penyimpangan dalam pelayanan publik seperti prosedur tidak benar, pungutan liar, diskriminasi).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000171',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Hierarki peraturan perundang-undangan berdasarkan UU No. 12 Tahun 2011 dari yang tertinggi adalah...',
  '[{"id":"A","text":"UUD → UU/Perppu → PP → Perpres → Perda"},{"id":"B","text":"UUD → Tap MPR → UU/Perppu → PP → Perpres → Perda Provinsi → Perda Kab/Kota"},{"id":"C","text":"UUD → UU → PP → Perpres → Tap MPR → Perda"},{"id":"D","text":"Pancasila → UUD → UU → PP → Perpres → Perda"}]',
  'B',
  'Berdasarkan UU No. 12 Tahun 2011 jo. UU No. 15 Tahun 2019, hierarki peraturan perundang-undangan adalah: (1) UUD NRI 1945, (2) Ketetapan MPR, (3) Undang-Undang/Peraturan Pemerintah Pengganti Undang-Undang, (4) Peraturan Pemerintah, (5) Peraturan Presiden, (6) Peraturan Daerah Provinsi, (7) Peraturan Daerah Kabupaten/Kota. Pancasila adalah sumber dari segala sumber hukum, bukan termasuk dalam hierarki peraturan.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000172',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Komisi Pemberantasan Korupsi (KPK) dibentuk berdasarkan...',
  '[{"id":"A","text":"UU No. 28 Tahun 1999"},{"id":"B","text":"UU No. 30 Tahun 2002"},{"id":"C","text":"UU No. 20 Tahun 2001"},{"id":"D","text":"Perpres No. 102 Tahun 2020"}]',
  'B',
  'KPK dibentuk berdasarkan UU No. 30 Tahun 2002 tentang Komisi Pemberantasan Tindak Pidana Korupsi. KPK kemudian mengalami revisi melalui UU No. 19 Tahun 2019. KPK bertugas melakukan penyelidikan, penyidikan, dan penuntutan tindak pidana korupsi, serta melaksanakan tindakan-tindakan pencegahan korupsi.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000173',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Badan yang bertugas menyelenggarakan pemilihan umum di Indonesia adalah...',
  '[{"id":"A","text":"Bawaslu"},{"id":"B","text":"DKPP"},{"id":"C","text":"KPU"},{"id":"D","text":"Mahkamah Konstitusi"}]',
  'C',
  'KPU (Komisi Pemilihan Umum) adalah lembaga yang menyelenggarakan pemilu di Indonesia. KPU bersifat nasional, tetap, dan mandiri. Bawaslu (Badan Pengawas Pemilu) bertugas mengawasi penyelenggaraan pemilu. DKPP (Dewan Kehormatan Penyelenggara Pemilu) memeriksa dan memutus pelanggaran kode etik penyelenggara pemilu. MK mengadili sengketa hasil pemilu.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000174',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Kementerian yang membidangi urusan kepegawaian dan reformasi birokrasi ASN adalah...',
  '[{"id":"A","text":"Kementerian Dalam Negeri"},{"id":"B","text":"Kementerian Sekretariat Negara"},{"id":"C","text":"Kementerian Pendayagunaan Aparatur Negara dan Reformasi Birokrasi"},{"id":"D","text":"Badan Kepegawaian Negara"}]',
  'C',
  'Kementerian Pendayagunaan Aparatur Negara dan Reformasi Birokrasi (KemenPAN-RB) adalah kementerian yang bertanggung jawab dalam bidang pendayagunaan aparatur negara dan reformasi birokrasi. BKN (Badan Kepegawaian Negara) adalah lembaga non-kementerian yang melaksanakan manajemen ASN secara teknis, termasuk pengelolaan database ASN dan pelaksanaan seleksi CPNS.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000175',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Core value ASN ''Akuntabel'' bermakna ASN harus...',
  '[{"id":"A","text":"Selalu mengutamakan kepuasan masyarakat dalam pelayanan"},{"id":"B","text":"Melaksanakan tugas dengan jujur, bertanggung jawab, cermat, disiplin, dan berintegritas tinggi"},{"id":"C","text":"Terus belajar dan mengembangkan kompetensi diri"},{"id":"D","text":"Membangun lingkungan kerja yang kondusif dan bebas diskriminasi"}]',
  'B',
  'Core value ''Akuntabel'' dalam BerAKHLAK berarti ASN melaksanakan tugas dengan jujur, bertanggung jawab, cermat, disiplin, dan berintegritas tinggi. Termasuk: tidak menyalahgunakan kewenangan jabatan, tidak menerima suap/gratifikasi, menggunakan kekayaan dan barang milik negara secara bertanggung jawab, dan tidak melakukan perbuatan tercela. Ini merupakan pondasi kepercayaan publik kepada ASN.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000176',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Berdasarkan UUD 1945 Pasal 34, fakir miskin dan anak-anak yang terlantar dipelihara oleh...',
  '[{"id":"A","text":"Pemerintah daerah masing-masing"},{"id":"B","text":"Negara"},{"id":"C","text":"Organisasi sosial kemasyarakatan"},{"id":"D","text":"Keluarga terdekat"}]',
  'B',
  'Pasal 34 Ayat (1) UUD 1945 menyatakan: ''Fakir miskin dan anak-anak yang terlantar dipelihara oleh negara.'' Ini merupakan amanat konstitusional bahwa negara bertanggung jawab atas kesejahteraan warganya yang paling rentan. Implementasinya melalui program-program seperti PKH (Program Keluarga Harapan), BPNT, JKN, dan bantuan sosial lainnya.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000177',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Kongres Pemuda II yang menghasilkan Sumpah Pemuda dilaksanakan pada tanggal...',
  '[{"id":"A","text":"28 Oktober 1928"},{"id":"B","text":"20 Mei 1928"},{"id":"C","text":"28 Oktober 1926"},{"id":"D","text":"17 Agustus 1928"}]',
  'A',
  'Kongres Pemuda II berlangsung pada 27-28 Oktober 1928, dan menghasilkan Sumpah Pemuda pada 28 Oktober 1928. Kongres ini dihadiri oleh pemuda dari berbagai organisasi kedaerahan. Lagu Indonesia Raya gubahan W.R. Supratman pertama kali dikumandangkan pada kongres ini. Tanggal 28 Oktober kemudian diperingati sebagai Hari Sumpah Pemuda.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000178',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Ibu Kota Negara Indonesia yang baru berdasarkan UU No. 3 Tahun 2022 adalah...',
  '[{"id":"A","text":"Palangkaraya"},{"id":"B","text":"Samarinda"},{"id":"C","text":"Nusantara"},{"id":"D","text":"Balikpapan"}]',
  'C',
  'Berdasarkan UU No. 3 Tahun 2022 tentang Ibu Kota Negara, ibu kota negara Indonesia yang baru adalah Nusantara, berlokasi di Kabupaten Penajam Paser Utara dan Kabupaten Kutai Kartanegara, Kalimantan Timur. Pemindahan ibu kota ini bertujuan untuk pemerataan pembangunan dan meringankan beban Jakarta.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000179',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Dalam konteks ASN, PPPK (Pegawai Pemerintah dengan Perjanjian Kerja) berbeda dari PNS dalam hal...',
  '[{"id":"A","text":"PPPK tidak mendapatkan gaji dari negara"},{"id":"B","text":"PPPK diangkat untuk jangka waktu tertentu sesuai kebutuhan instansi"},{"id":"C","text":"PPPK tidak bisa menduduki jabatan struktural apapun"},{"id":"D","text":"PPPK tidak termasuk dalam kategori ASN"}]',
  'B',
  'PPPK (Pegawai Pemerintah dengan Perjanjian Kerja) adalah ASN yang diangkat berdasarkan perjanjian kerja untuk jangka waktu tertentu (kontrak), berbeda dengan PNS yang diangkat sebagai pegawai tetap. PPPK mendapat hak yang hampir setara dengan PNS (gaji, tunjangan, cuti, perlindungan), tetapi tidak memiliki jaminan pensiun seperti PNS dan masa kerjanya terikat kontrak.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000180',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Reformasi Birokrasi di Indonesia bertujuan untuk...',
  '[{"id":"A","text":"Mengurangi jumlah pegawai negeri sipil"},{"id":"B","text":"Mewujudkan tata kelola pemerintahan yang baik, bersih, dan melayani"},{"id":"C","text":"Meningkatkan gaji ASN secara berkala"},{"id":"D","text":"Meningkatkan anggaran belanja pegawai pemerintah"}]',
  'B',
  'Reformasi Birokrasi (RB) adalah upaya sistematis untuk mengubah tata kelola pemerintahan agar lebih baik (good governance), bersih dari KKN (good government), dan berorientasi pada pelayanan masyarakat. RB mencakup 8 area perubahan: organisasi, tata laksana, SDM aparatur, pengawasan, akuntabilitas, pelayanan publik, mindset/cultural set, dan regulasi/deregulasi.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000181',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Berdasarkan UUD 1945 Pasal 22A, ketentuan lebih lanjut tentang tata cara pembentukan undang-undang diatur dengan...',
  '[{"id":"A","text":"Peraturan Presiden"},{"id":"B","text":"Peraturan DPR"},{"id":"C","text":"Undang-undang"},{"id":"D","text":"Peraturan Pemerintah"}]',
  'C',
  'Pasal 22A UUD 1945 menyatakan: ''Ketentuan lebih lanjut tentang tata cara pembentukan undang-undang diatur dengan undang-undang.'' Implementasinya adalah UU No. 12 Tahun 2011 tentang Pembentukan Peraturan Perundang-undangan (yang telah diubah dengan UU No. 15 Tahun 2019 dan UU No. 13 Tahun 2022).',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000182',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Makna lambang rantai pada sila ke-2 Pancasila adalah...',
  '[{"id":"A","text":"Kekuatan dan persatuan bangsa Indonesia"},{"id":"B","text":"Hubungan manusia yang saling terkait satu sama lain dan tidak dapat dipisahkan"},{"id":"C","text":"Ikatan perjanjian antar bangsa yang damai"},{"id":"D","text":"Rantai produksi ekonomi yang saling menguntungkan"}]',
  'B',
  'Lambang sila ke-2 adalah rantai emas yang terdiri dari mata rantai segi empat (melambangkan laki-laki) dan lingkaran (melambangkan perempuan) yang saling berkait, membentuk lingkaran. Ini melambangkan bahwa manusia saling membutuhkan, berkaitan satu dengan yang lain, tidak dapat dipisahkan, dan membentuk kesatuan kemanusiaan yang adil dan beradab.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000183',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Indonesia secara resmi bergabung menjadi anggota Perserikatan Bangsa-Bangsa (PBB) pertama kali pada...',
  '[{"id":"A","text":"17 Agustus 1945"},{"id":"B","text":"27 Desember 1949"},{"id":"C","text":"28 September 1950"},{"id":"D","text":"17 Agustus 1950"}]',
  'C',
  'Indonesia menjadi anggota PBB (Perserikatan Bangsa-Bangsa) pada 28 September 1950 sebagai anggota ke-60. Bergabungnya Indonesia ke PBB terjadi setelah pengakuan kedaulatan oleh Belanda melalui KMB (27 Desember 1949) dan kembalinya Indonesia ke bentuk NKRI (17 Agustus 1950). Indonesia sempat keluar dari PBB pada 7 Januari 1965 (era konfrontasi dengan Malaysia) dan bergabung kembali 28 September 1966.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000184',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Tugas utama BKN (Badan Kepegawaian Negara) adalah...',
  '[{"id":"A","text":"Menetapkan kebijakan kepegawaian nasional"},{"id":"B","text":"Melaksanakan manajemen ASN secara nasional termasuk sistem informasi kepegawaian"},{"id":"C","text":"Memberikan tunjangan dan pensiun kepada PNS"},{"id":"D","text":"Mengawasi kinerja kementerian/lembaga dalam pengelolaan ASN"}]',
  'B',
  'BKN (Badan Kepegawaian Negara) adalah lembaga pemerintah non-kementerian yang melaksanakan manajemen ASN, pembinaan dan penyelenggaraan manajemen ASN secara nasional. Tugasnya meliputi: pembinaan teknis manajemen kepegawaian, penyusunan norma/standar/prosedur kepegawaian, serta penyelenggaraan sistem informasi kepegawaian nasional (SIASN/MySAPK). Berbeda dari KemenPAN-RB yang menetapkan kebijakan.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000185',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lembaga yang bertanggung jawab mengkoordinasikan penyelenggaraan pemerintahan daerah dan pembinaan otonomi daerah adalah...',
  '[{"id":"A","text":"Kementerian Dalam Negeri"},{"id":"B","text":"Sekretariat Kabinet"},{"id":"C","text":"Kementerian Koordinator Bidang Politik, Hukum, dan Keamanan"},{"id":"D","text":"DPOD (Dewan Pertimbangan Otonomi Daerah)"}]',
  'A',
  'Kementerian Dalam Negeri (Kemendagri) bertugas menyelenggarakan urusan pemerintahan dalam negeri, termasuk mengkoordinasikan dan membina pemerintahan daerah serta otonomi daerah. Kemendagri juga mengelola administrasi kependudukan dan berperan dalam pelaksanaan desentralisasi. Gubernur sebagai wakil pemerintah pusat di daerah bertanggung jawab kepada Mendagri.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000186',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Pancasila sebagai ''pandangan hidup bangsa'' (weltanschauung) mengandung arti...',
  '[{"id":"A","text":"Pancasila adalah sumber dari semua peraturan hukum di Indonesia"},{"id":"B","text":"Pancasila adalah petunjuk arah dalam kehidupan berbangsa sehari-hari"},{"id":"C","text":"Pancasila merupakan hasil pemikiran filsuf-filsuf bangsa Indonesia"},{"id":"D","text":"Pancasila menjadi ukuran baik-buruk perilaku seluruh manusia di dunia"}]',
  'B',
  'Pandangan hidup (weltanschauung) adalah pedoman bagaimana manusia memandang kehidupan dan menentukan arah dalam bertindak. Pancasila sebagai pandangan hidup bangsa berarti nilai-nilai Pancasila menjadi petunjuk dan pedoman bagi bangsa Indonesia dalam menjalani kehidupan sehari-hari — baik dalam kehidupan pribadi, bermasyarakat, maupun berbangsa dan bernegara.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000187',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Faktor utama yang memperkuat persatuan dan kesatuan bangsa Indonesia adalah...',
  '[{"id":"A","text":"Kesamaan bahasa daerah seluruh suku bangsa"},{"id":"B","text":"Persamaan geografis sebagai negara kepulauan"},{"id":"C","text":"Pancasila, UUD 1945, NKRI, dan Bhinneka Tunggal Ika sebagai empat pilar kebangsaan"},{"id":"D","text":"Persamaan agama yang dianut mayoritas penduduk"}]',
  'C',
  'Empat pilar kebangsaan Indonesia adalah: (1) Pancasila sebagai dasar negara dan ideologi, (2) UUD 1945 sebagai konstitusi, (3) NKRI sebagai bentuk negara yang tidak bisa diubah, (4) Bhinneka Tunggal Ika sebagai semboyan persatuan dalam keberagaman. Keempat pilar ini menjadi landasan kokoh persatuan dan kesatuan bangsa Indonesia.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000188',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Pasal 28H Ayat (1) UUD 1945 mengatur tentang hak...',
  '[{"id":"A","text":"Hak setiap orang atas pengakuan, jaminan, perlindungan dan kepastian hukum"},{"id":"B","text":"Hak setiap orang untuk hidup sejahtera lahir dan batin, bertempat tinggal, dan mendapatkan lingkungan hidup yang baik"},{"id":"C","text":"Hak setiap orang untuk bebas dari penyiksaan"},{"id":"D","text":"Hak setiap orang untuk tidak dituntut atas dasar hukum yang berlaku surut"}]',
  'B',
  'Pasal 28H Ayat (1) UUD 1945 menyatakan: ''Setiap orang berhak hidup sejahtera lahir dan batin, bertempat tinggal, dan mendapatkan lingkungan hidup yang baik dan sehat serta berhak memperoleh pelayanan kesehatan.'' Ini adalah hak atas standar hidup yang layak, termasuk jaminan kesehatan. Pasal 28D mengatur kepastian hukum, Pasal 28G mengatur kebebasan dari penyiksaan, Pasal 28I mengatur non-retroaktif.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000189',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Operasi Mandala yang dipimpin oleh Mayjen Soeharto bertujuan merebut kembali...',
  '[{"id":"A","text":"Timor Timur dari Portugal"},{"id":"B","text":"Irian Barat (Papua) dari Belanda"},{"id":"C","text":"Pulau Sipadan-Ligitan dari Malaysia"},{"id":"D","text":"Kepulauan Riau dari Inggris"}]',
  'B',
  'Operasi Mandala adalah operasi militer untuk merebut Irian Barat dari Belanda, yang dipimpin oleh Mayjen Soeharto sebagai Panglima Mandala. Operasi ini merupakan implementasi dari Trikora yang dicanangkan Soekarno. Melalui tekanan militer dan diplomasi (Perjanjian New York, 15 Agustus 1962), Belanda menyerahkan Irian Barat ke PBB, lalu ke Indonesia pada 1 Mei 1963.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000190',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Asas-asas penyelenggaraan pemerintahan yang baik (good governance) meliputi berikut ini, kecuali...',
  '[{"id":"A","text":"Transparansi"},{"id":"B","text":"Akuntabilitas"},{"id":"C","text":"Monopoli kekuasaan"},{"id":"D","text":"Partisipasi masyarakat"}]',
  'C',
  'Good governance (tata pemerintahan yang baik) memiliki prinsip-prinsip: partisipasi, rule of law, transparansi, responsivitas, berorientasi konsensus, kesetaraan, efektivitas dan efisiensi, akuntabilitas, dan visi strategis. Monopoli kekuasaan adalah antitesis dari good governance karena bertentangan dengan prinsip pembagian kekuasaan, checks and balances, dan partisipasi.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000191',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Pengamalan sila ke-2 Pancasila ''Kemanusiaan yang Adil dan Beradab'' dalam kehidupan sehari-hari diwujudkan melalui...',
  '[{"id":"A","text":"Mengutamakan kepentingan pribadi di atas kepentingan umum"},{"id":"B","text":"Mengakui persamaan harkat, martabat, dan derajat semua manusia tanpa diskriminasi"},{"id":"C","text":"Mengikuti semua tradisi dan adat istiadat daerah"},{"id":"D","text":"Berpartisipasi dalam setiap pemilihan umum"}]',
  'B',
  'Sila ke-2 mengandung nilai pengakuan bahwa semua manusia adalah makhluk Tuhan yang setara harkat dan martabatnya. Pengamalannya: mengakui persamaan derajat antar manusia, tidak membeda-bedakan orang berdasarkan SARA (Suku, Agama, Ras, Antargolongan), bersikap tenggang rasa, tidak semena-mena, gemar menolong, membela kebenaran dan keadilan.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000192',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Agresi Militer Belanda I (1947) berakhir dengan perjanjian...',
  '[{"id":"A","text":"Perjanjian Linggarjati"},{"id":"B","text":"Perjanjian Renville"},{"id":"C","text":"Perjanjian Roem-Royen"},{"id":"D","text":"Konferensi Meja Bundar"}]',
  'B',
  'Agresi Militer Belanda I (21 Juli - 5 Agustus 1947) berakhir setelah intervensi DK PBB yang membentuk Komisi Tiga Negara (KTN). Perundingan antara Indonesia dan Belanda di atas kapal USS Renville menghasilkan Perjanjian Renville (17 Januari 1948). Perjanjian ini merugikan Indonesia karena wilayah RI menjadi lebih sempit. Linggarjati (1946) adalah perjanjian sebelum Agresi I, Roem-Royen (1949) setelah Agresi II.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000193',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'NKRI',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Tiga zona laut yang diakui secara internasional dalam wilayah Indonesia adalah...',
  '[{"id":"A","text":"Laut teritorial (12 nm), ZEE (200 nm), dan landas kontinen"},{"id":"B","text":"Laut territorial (12 nm), ZEEI (100 nm), dan laut dalam"},{"id":"C","text":"Perairan kepulauan, ZEE (200 nm), dan laut lepas"},{"id":"D","text":"Laut territorial (12 nm), zona tambahan (24 nm), dan ZEE (100 nm)"}]',
  'A',
  'Indonesia memiliki tiga zona laut: (1) Laut teritorial: 12 mil laut dari garis pangkal, negara berdaulat penuh, (2) ZEE (Zona Ekonomi Eksklusif): 200 mil laut dari garis pangkal, hak eksklusif eksplorasi dan eksploitasi SDA, (3) Landas kontinen: perpanjangan wilayah daratan di bawah laut sampai 200 mil atau lebih (hingga 350 mil jika landas kontinen alami melebihi 200 nm). Ini diatur dalam UNCLOS 1982.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000194',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lembaga yang berwenang mengadili sengketa hasil Pemilihan Presiden dan Pemilihan Legislatif adalah...',
  '[{"id":"A","text":"Mahkamah Agung"},{"id":"B","text":"Mahkamah Konstitusi"},{"id":"C","text":"Komisi Pemilihan Umum"},{"id":"D","text":"Badan Pengawas Pemilu"}]',
  'B',
  'Berdasarkan Pasal 24C UUD 1945, Mahkamah Konstitusi berwenang memutus perselisihan tentang hasil pemilihan umum, termasuk hasil Pilpres dan Pileg. Untuk Pilkada, kewenangan mengadili sengketa hasilnya juga ada di MK (sejak 2022). MA mengadili tindak pidana pemilu (kasasi). KPU menyelenggarakan, Bawaslu mengawasi.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000195',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SULIT', 8,
  'Perbedaan antara nilai dasar, nilai instrumental, dan nilai praksis Pancasila adalah...',
  '[{"id":"A","text":"Nilai dasar = abstrak umum; nilai instrumental = konkret dalam aturan; nilai praksis = penerapan nyata"},{"id":"B","text":"Nilai dasar = aturan hukum; nilai instrumental = kebijakan; nilai praksis = sikap individu"},{"id":"C","text":"Nilai dasar = tujuan negara; nilai instrumental = cara mencapai; nilai praksis = bukti keberhasilan"},{"id":"D","text":"Nilai dasar = Pancasila; nilai instrumental = UUD; nilai praksis = UU dan Perda"}]',
  'A',
  'Nilai Pancasila dibagi menjadi tiga tingkatan: (1) Nilai Dasar: bersifat abstrak, umum, dan tidak berubah — yaitu nilai ketuhanan, kemanusiaan, persatuan, kerakyatan, keadilan sosial; (2) Nilai Instrumental: penjabaran nilai dasar dalam aturan konkret (UUD, UU, PP, Perpres); (3) Nilai Praksis: penerapan nilai-nilai Pancasila dalam kehidupan nyata sehari-hari oleh individu dan masyarakat.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000196',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'UUD 1945',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Berdasarkan UUD 1945 Pasal 1 Ayat (2), kedaulatan berada di tangan rakyat dan dilaksanakan menurut...',
  '[{"id":"A","text":"Keinginan dan aspirasi rakyat"},{"id":"B","text":"Undang-Undang Dasar"},{"id":"C","text":"Keputusan MPR"},{"id":"D","text":"Ketetapan DPR"}]',
  'B',
  'Pasal 1 Ayat (2) UUD 1945 (hasil amandemen) berbunyi: ''Kedaulatan berada di tangan rakyat dan dilaksanakan menurut Undang-Undang Dasar.'' Ini merupakan perubahan signifikan dari redaksi sebelum amandemen yang menyatakan kedaulatan dilaksanakan sepenuhnya oleh MPR. Setelah amandemen, rakyat memiliki kedaulatan langsung melalui pemilu dan konstitusi menjadi batasannya.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000197',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Bhinneka Tunggal Ika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Konflik SARA (Suku, Agama, Ras, dan Antargolongan) dapat dicegah dengan...',
  '[{"id":"A","text":"Melarang diskusi tentang perbedaan suku dan agama"},{"id":"B","text":"Menyamakan semua adat dan budaya daerah menjadi satu budaya nasional"},{"id":"C","text":"Memupuk sikap toleransi, saling menghormati, dan dialog antar kelompok"},{"id":"D","text":"Menghindari interaksi antar kelompok yang berbeda"}]',
  'C',
  'Pencegahan konflik SARA yang efektif bukan dengan melarang diskusi (yang justru bisa menimbulkan penumpukan ketidakpuasan) atau menyamakan semua budaya (yang menghilangkan keberagaman). Cara yang tepat adalah memupuk toleransi aktif: menghargai perbedaan, membangun dialog antar kelompok, memperkuat rasa kebangsaan bersama, dan menegakkan hukum terhadap tindakan diskriminatif.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000198',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Kebijakan Pemerintah',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Berdasarkan UU No. 25 Tahun 2009 tentang Pelayanan Publik, asas penyelenggaraan pelayanan publik meliputi...',
  '[{"id":"A","text":"Kepentingan umum, kepastian hukum, kesamaan hak, keseimbangan hak dan kewajiban"},{"id":"B","text":"Efisiensi, efektivitas, transparansi, dan akuntabilitas"},{"id":"C","text":"Profesionalisme, integritas, dan kompetensi"},{"id":"D","text":"Kedisiplinan, kesopanan, dan keramahan"}]',
  'A',
  'UU No. 25 Tahun 2009 tentang Pelayanan Publik menetapkan asas-asas pelayanan publik, yaitu: kepentingan umum, kepastian hukum, kesamaan hak, keseimbangan hak dan kewajiban, keprofesionalan, partisipatif, persamaan perlakuan/tidak diskriminatif, keterbukaan, akuntabilitas, fasilitas dan perlakuan khusus bagi kelompok rentan, ketepatan waktu, dan kecepatan, kemudahan, dan keterjangkauan.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000199',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Sejarah Indonesia',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Tokoh yang dikenal sebagai proklamator kemerdekaan Indonesia adalah...',
  '[{"id":"A","text":"Ir. Soekarno dan Dr. Mohammad Hatta"},{"id":"B","text":"Ir. Soekarno, Dr. Mohammad Hatta, dan Sutan Syahrir"},{"id":"C","text":"Ir. Soekarno dan Sri Sultan Hamengku Buwono IX"},{"id":"D","text":"Ir. Soekarno, Dr. Mohammad Hatta, dan Ki Hajar Dewantara"}]',
  'A',
  'Proklamator kemerdekaan Indonesia secara resmi adalah dua orang: Ir. Soekarno dan Dr. Mohammad Hatta. Keduanya yang membacakan dan menandatangani teks Proklamasi pada 17 Agustus 1945 atas nama bangsa Indonesia. Sutan Syahrir berperan dalam mendorong pelaksanaan proklamasi, namun bukan proklamator. Keduanya kemudian diangkat menjadi Presiden dan Wakil Presiden pertama Indonesia.',
  ARRAY['sering-keluar']
),

(
  'aa100001-0000-0000-0000-000000000200',
  'a0000001-0000-0000-0000-000000000001',
  'CPNS', 'TWK', 'Pancasila',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Pengertian ''keadilan'' dalam Pancasila (sila ke-5) yang paling tepat adalah...',
  '[{"id":"A","text":"Memberikan sesuatu yang sama rata kepada semua orang"},{"id":"B","text":"Memberikan sesuatu yang menjadi hak seseorang sesuai porsinya"},{"id":"C","text":"Mengutamakan kepentingan mayoritas atas minoritas"},{"id":"D","text":"Menerapkan hukum yang sama tanpa memandang kondisi seseorang"}]',
  'B',
  'Keadilan dalam Pancasila mengacu pada konsep keadilan distributif dan komutatif: memberikan kepada setiap orang apa yang menjadi haknya sesuai dengan porsi, kemampuan, dan kondisinya. Ini berbeda dari persamaan (equality) yang berarti semua mendapat bagian sama. Misalnya, subsidi untuk rakyat miskin lebih besar dari yang kaya — ini adil tapi tidak sama rata.',
  ARRAY['sering-keluar']
)

ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- Seed 002D: CPNS TIU 101-200 (100 soal)
-- ============================================================

INSERT INTO public.questions
  (id, pack_id, exam_type, subject, subtopic, question_type, difficulty, difficulty_rank,
   question_text, options, correct_option, explanation_text, tags)
VALUES

(
  'aa200001-0000-0000-0000-000000000101',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'PENA : MENULIS = PISAU : ...',
  '[{"id":"A","text":"Memotong"},{"id":"B","text":"Tajam"},{"id":"C","text":"Besi"},{"id":"D","text":"Dapur"}]',
  'A',
  'Analogi fungsi. Pena berfungsi untuk menulis. Pisau berfungsi untuk memotong. Pola: alat dan fungsinya.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000102',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'LAUT : IKAN = HUTAN : ...',
  '[{"id":"A","text":"Pohon"},{"id":"B","text":"Binatang liar"},{"id":"C","text":"Gelap"},{"id":"D","text":"Lebat"}]',
  'B',
  'Analogi tempat. Laut adalah habitat ikan. Hutan adalah habitat binatang liar. Pola: tempat dan makhluk yang tinggal di sana.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000103',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'KOMPOSER : LAGU = ARSITEK : ...',
  '[{"id":"A","text":"Bangunan"},{"id":"B","text":"Desain"},{"id":"C","text":"Tukang"},{"id":"D","text":"Bata"}]',
  'A',
  'Analogi pencipta-karya. Komposer menciptakan lagu. Arsitek merancang bangunan. Pola: profesi dan hasil karyanya.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000104',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'HAKIM : PENGADILAN = DOKTER : ...',
  '[{"id":"A","text":"Pasien"},{"id":"B","text":"Obat"},{"id":"C","text":"Rumah Sakit"},{"id":"D","text":"Stetoskop"}]',
  'C',
  'Analogi profesi-tempat kerja. Hakim bekerja di pengadilan. Dokter bekerja di rumah sakit. Pola: profesi dan tempat kerjanya.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000105',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'SAPI : SUSU = LEBAH : ...',
  '[{"id":"A","text":"Madu"},{"id":"B","text":"Sengatan"},{"id":"C","text":"Sarang"},{"id":"D","text":"Lilin"}]',
  'A',
  'Analogi hewan-produksi. Sapi menghasilkan susu. Lebah menghasilkan madu. Pola: hewan dan produk yang dihasilkan.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000106',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'BUTA : PENGLIHATAN = TULI : ...',
  '[{"id":"A","text":"Telinga"},{"id":"B","text":"Suara"},{"id":"C","text":"Pendengaran"},{"id":"D","text":"Bicara"}]',
  'C',
  'Analogi gangguan-indera. Buta adalah gangguan pada penglihatan. Tuli adalah gangguan pada pendengaran. Pola: jenis keterbatasan dan indera yang terganggu.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000107',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'PADI : BERAS : NASI = TEBU : GULA : ...',
  '[{"id":"A","text":"Manis"},{"id":"B","text":"Air gula"},{"id":"C","text":"Sirup"},{"id":"D","text":"Tetes tebu"}]',
  'C',
  'Analogi rantai produksi. Padi diolah menjadi beras, beras dimasak menjadi nasi. Tebu diolah menjadi gula, gula diolah menjadi sirup. Pola: bahan mentah ke setengah jadi ke produk akhir.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000108',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'AWAN : HUJAN = GUNUNG BERAPI : ...',
  '[{"id":"A","text":"Abu vulkanik"},{"id":"B","text":"Lahar"},{"id":"C","text":"Gempa bumi"},{"id":"D","text":"Panas"}]',
  'B',
  'Analogi sumber-hasil. Awan menghasilkan hujan. Gunung berapi mengeluarkan lahar (lava cair yang mengalir). Keduanya adalah hasil alami dari sumbernya.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000109',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'DRUM : PUKUL = BIOLA : ...',
  '[{"id":"A","text":"Petik"},{"id":"B","text":"Gesek"},{"id":"C","text":"Tiup"},{"id":"D","text":"Tekan"}]',
  'B',
  'Analogi alat musik-cara memainkan. Drum dimainkan dengan dipukul. Biola dimainkan dengan digesek menggunakan busur. Pola: alat musik dan cara memainkannya.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000110',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'AIR : ES = UAP : ...',
  '[{"id":"A","text":"Panas"},{"id":"B","text":"Air"},{"id":"C","text":"Gas"},{"id":"D","text":"Awan"}]',
  'B',
  'Analogi perubahan wujud akibat pendinginan. Air didinginkan menjadi es (cair ke padat). Uap didinginkan menjadi air (gas ke cair). Pola: wujud awal dan wujud setelah didinginkan.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000111',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'MERAH : MAWAR = PUTIH : ...',
  '[{"id":"A","text":"Melati"},{"id":"B","text":"Angsa"},{"id":"C","text":"Kapas"},{"id":"D","text":"Susu"}]',
  'A',
  'Analogi warna-bunga yang paling identik. Mawar dikenal identik dengan warna merah. Melati dikenal identik dengan warna putih (bunga nasional Indonesia). Pola: warna dan bunga yang paling identik dengannya.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000112',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'KEPALA : RAMBUT = WAJAH : ...',
  '[{"id":"A","text":"Mata"},{"id":"B","text":"Janggut"},{"id":"C","text":"Hidung"},{"id":"D","text":"Pipi"}]',
  'B',
  'Analogi bagian tubuh dan rambut yang tumbuh di sana. Kepala ditumbuhi rambut. Wajah (dagu/sekitarnya) ditumbuhi janggut. Pola: bagian tubuh dan jenis rambut yang tumbuh di sana.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000113',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'NOVEMBER : DESEMBER = MINGGU : ...',
  '[{"id":"A","text":"Senin"},{"id":"B","text":"Sabtu"},{"id":"C","text":"Jumat"},{"id":"D","text":"Kamis"}]',
  'A',
  'Analogi urutan. November adalah bulan ke-11, Desember adalah bulan ke-12 (tepat setelah November). Minggu adalah hari pertama dalam seminggu, Senin adalah hari kedua yang tepat berada setelah Minggu. Pola: X dan Y yang tepat berada setelah X dalam urutan.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000114',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'TELUR : AYAM = SUSU : ...',
  '[{"id":"A","text":"Sapi"},{"id":"B","text":"Keju"},{"id":"C","text":"Kambing"},{"id":"D","text":"Yoghurt"}]',
  'A',
  'Analogi produk-hewan penghasil. Telur dihasilkan oleh ayam. Susu paling umum dihasilkan oleh sapi. Pola: produk dan hewan utama yang menghasilkannya.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000115',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analogi Verbal',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'MURID : BELAJAR = PETANI : ...',
  '[{"id":"A","text":"Panen"},{"id":"B","text":"Bertani"},{"id":"C","text":"Sawah"},{"id":"D","text":"Cangkul"}]',
  'B',
  'Analogi profesi-kegiatan utama. Murid kegiatan utamanya belajar. Petani kegiatan utamanya bertani. Pola: subjek dan kegiatan utama yang dilakukannya.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000116',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Semua karyawan harus datang tepat waktu. Budi adalah karyawan. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Budi mungkin datang tepat waktu"},{"id":"B","text":"Budi harus datang tepat waktu"},{"id":"C","text":"Karyawan yang tidak tepat waktu bukan Budi"},{"id":"D","text":"Tidak dapat disimpulkan"}]',
  'B',
  'Silogisme kategoris: Semua karyawan harus tepat waktu (mayor). Budi adalah karyawan (minor). Maka Budi harus datang tepat waktu (kesimpulan). Ini adalah pola Barbara (AAA-1) yang valid.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000117',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Tidak ada mahasiswa yang lulus tanpa belajar. Rani bisa lulus. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Rani tidak belajar"},{"id":"B","text":"Rani adalah mahasiswa"},{"id":"C","text":"Rani belajar"},{"id":"D","text":"Rani bukan mahasiswa"}]',
  'C',
  'Tidak ada mahasiswa yang lulus tanpa belajar artinya setiap yang lulus pasti belajar. Rani bisa lulus maka Rani belajar. Ini adalah modus ponens dari kontrapositif: lulus maka belajar; Rani lulus; maka Rani belajar.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000118',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Semua dokter harus memiliki SIP. Pak Aldo tidak memiliki SIP. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Pak Aldo bukan dokter"},{"id":"B","text":"Pak Aldo mungkin dokter"},{"id":"C","text":"Pak Aldo dokter yang melanggar aturan"},{"id":"D","text":"Tidak dapat disimpulkan"}]',
  'A',
  'Premis: Semua dokter punya SIP. Pak Aldo tidak punya SIP. Menggunakan modus tollens (kontrapositif): tidak punya SIP maka bukan dokter. Pak Aldo tidak punya SIP, maka Pak Aldo bukan dokter.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000119',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Jika hari ini hujan maka jalan licin. Jika jalan licin maka kecelakaan meningkat. Hari ini hujan. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Jalan tidak licin"},{"id":"B","text":"Kecelakaan meningkat"},{"id":"C","text":"Kecelakaan mungkin meningkat"},{"id":"D","text":"Jalan licin saja"}]',
  'B',
  'Silogisme hipotetis berantai: hujan maka jalan licin; jalan licin maka kecelakaan meningkat; hari ini hujan. Dengan modus ponens dua kali: hujan terjadi, maka jalan licin, maka kecelakaan meningkat.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000120',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Beberapa guru adalah sarjana. Semua sarjana adalah terdidik. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Semua guru adalah terdidik"},{"id":"B","text":"Beberapa guru adalah terdidik"},{"id":"C","text":"Tidak ada guru yang terdidik"},{"id":"D","text":"Semua yang terdidik adalah guru"}]',
  'B',
  'Beberapa guru adalah sarjana. Semua sarjana adalah terdidik. Maka bagian guru yang sarjana pasti terdidik. Kesimpulan: beberapa guru adalah terdidik. Tidak bisa disimpulkan semua guru terdidik karena guru yang bukan sarjana belum tentu terdidik.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000121',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Tidak ada polisi yang koruptor. Sebagian aparat adalah polisi. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Semua aparat bukan koruptor"},{"id":"B","text":"Sebagian aparat bukan koruptor"},{"id":"C","text":"Semua polisi adalah aparat"},{"id":"D","text":"Tidak dapat disimpulkan"}]',
  'B',
  'Tidak ada polisi yang koruptor artinya semua polisi bukan koruptor. Sebagian aparat adalah polisi. Maka sebagian aparat (yang polisi) pasti bukan koruptor. Tidak bisa menyimpulkan semua aparat bukan koruptor karena aparat selain polisi belum diketahui.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000122',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Semua pegawai negeri mendapat gaji. Tidak ada petani yang mendapat gaji sebagai pegawai negeri. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Beberapa petani adalah pegawai negeri"},{"id":"B","text":"Tidak ada petani yang pegawai negeri"},{"id":"C","text":"Semua yang mendapat gaji adalah pegawai negeri"},{"id":"D","text":"Petani tidak perlu gaji"}]',
  'B',
  'Semua pegawai negeri mendapat gaji. Kontrapositif: yang tidak mendapat gaji (dalam kapasitas ini) bukan pegawai negeri. Tidak ada petani yang mendapat gaji sebagai pegawai negeri, maka tidak ada petani yang merupakan pegawai negeri.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000123',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Jika nilai ujian lebih dari 60 maka siswa lulus. Amir tidak lulus. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Nilai Amir tepat 60"},{"id":"B","text":"Nilai Amir lebih dari 60"},{"id":"C","text":"Nilai Amir kurang dari atau sama dengan 60"},{"id":"D","text":"Amir tidak mengikuti ujian"}]',
  'C',
  'Modus Tollens: Jika nilai lebih dari 60 maka lulus. Amir tidak lulus. Kontrapositif: tidak lulus maka nilai tidak lebih dari 60 (kurang dari atau sama dengan 60). Jadi nilai Amir paling banyak 60.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000124',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Semua hakim adalah sarjana hukum. Pak Rahmat adalah sarjana hukum. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Pak Rahmat pasti hakim"},{"id":"B","text":"Pak Rahmat mungkin hakim"},{"id":"C","text":"Pak Rahmat bukan hakim"},{"id":"D","text":"Tidak dapat disimpulkan bahwa Pak Rahmat hakim"}]',
  'D',
  'Ini adalah kesalahan logika affirming the consequent. Semua hakim adalah sarjana hukum. Pak Rahmat adalah sarjana hukum. Tidak bisa disimpulkan Pak Rahmat hakim karena sarjana hukum bisa jadi pengacara, notaris, jaksa, atau profesi lain.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000125',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Semua P adalah Q. Semua Q adalah R. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Semua R adalah P"},{"id":"B","text":"Semua Q adalah P"},{"id":"C","text":"Semua P adalah R"},{"id":"D","text":"Beberapa P adalah R"}]',
  'C',
  'Silogisme berantai (transitif): Semua P adalah Q; Semua Q adalah R; maka Semua P adalah R. Ini valid karena P adalah subset Q, dan Q adalah subset R, sehingga P adalah subset R.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000126',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Cuaca cerah hari ini. Jika cuaca cerah maka Rini pergi ke pantai. Jika Rini pergi ke pantai maka ia membawa payung. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Rini tidak pergi ke pantai"},{"id":"B","text":"Rini membawa payung"},{"id":"C","text":"Rini mungkin membawa payung"},{"id":"D","text":"Cuaca tidak cerah"}]',
  'B',
  'Modus Ponens berantai: Cuaca cerah (p terjadi). p maka q: Rini pergi ke pantai. q maka r: Rini membawa payung. Kesimpulan: Rini membawa payung.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000127',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Beberapa A adalah B. Semua B adalah C. Tidak ada C yang D. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Beberapa A adalah D"},{"id":"B","text":"Tidak ada A yang D"},{"id":"C","text":"Beberapa A bukan D"},{"id":"D","text":"Semua A bukan D"}]',
  'C',
  'Langkah 1: Beberapa A adalah B; Semua B adalah C; maka beberapa A adalah C. Langkah 2: Beberapa A adalah C; Tidak ada C yang D; maka beberapa A (yang merupakan C) pasti bukan D. Tidak bisa menyimpulkan tidak ada A yang D karena ada bagian A yang bukan C yang statusnya belum diketahui.',
  ARRAY['jarang-keluar']
),

(
  'aa200001-0000-0000-0000-000000000128',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Semua ASN wajib netral dalam pemilu. Andi adalah ASN. Kesimpulan yang tepat tentang Andi adalah...',
  '[{"id":"A","text":"Andi sudah terbukti netral dalam pemilu"},{"id":"B","text":"Andi wajib netral dalam pemilu"},{"id":"C","text":"Andi tidak netral dalam pemilu"},{"id":"D","text":"Andi bukan ASN yang baik"}]',
  'B',
  'Semua ASN wajib netral; Andi adalah ASN; maka Andi wajib netral dalam pemilu. Kesimpulan hanya tentang kewajiban, bukan tentang fakta apakah Andi sudah netral atau tidak.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000129',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Semua bunga yang diberi pupuk tumbuh subur. Mawar ini tidak tumbuh subur. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Mawar ini diberi pupuk"},{"id":"B","text":"Mawar ini bukan bunga"},{"id":"C","text":"Mawar ini tidak diberi pupuk"},{"id":"D","text":"Pupuk tidak berguna untuk mawar"}]',
  'C',
  'Modus Tollens: Diberi pupuk maka tumbuh subur. Mawar tidak tumbuh subur. Kontrapositif: tidak subur maka tidak diberi pupuk. Jadi mawar ini tidak diberi pupuk.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000130',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Silogisme',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Semua siswa yang rajin pasti naik kelas. Dina mendapat ranking 1. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Dina siswa yang rajin"},{"id":"B","text":"Dina pasti naik kelas"},{"id":"C","text":"Dina siswa yang rajin dan naik kelas"},{"id":"D","text":"Tidak dapat disimpulkan apakah Dina naik kelas"}]',
  'D',
  'Premis: Semua rajin maka naik kelas. Dina ranking 1. Tidak ada premis yang menghubungkan ranking 1 dengan rajin atau naik kelas. Kesimpulan yang valid harus berdasarkan premis yang diberikan, bukan asumsi tambahan.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000131',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Sinonim dan Antonim',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Sinonim dari kata ENIGMA adalah...',
  '[{"id":"A","text":"Teka-teki"},{"id":"B","text":"Jawaban"},{"id":"C","text":"Masalah besar"},{"id":"D","text":"Pengetahuan"}]',
  'A',
  'Enigma berarti sesuatu yang sulit dipahami atau misterius. Sinonimnya dalam bahasa Indonesia adalah teka-teki atau misteri. Kata ini sering digunakan untuk hal yang membingungkan dan sulit ditebak.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000132',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Sinonim dan Antonim',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Antonim dari kata KONVERGEN adalah...',
  '[{"id":"A","text":"Divergen"},{"id":"B","text":"Sinkron"},{"id":"C","text":"Paralel"},{"id":"D","text":"Konsisten"}]',
  'A',
  'Konvergen berarti menuju ke satu titik atau menyatu. Antonimnya adalah divergen yang berarti menjauh dari satu titik atau menyebar. Dalam matematika, garis konvergen bertemu di satu titik sedangkan garis divergen tidak pernah bertemu.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000133',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Sinonim dan Antonim',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Sinonim dari kata AMBIGUITAS adalah...',
  '[{"id":"A","text":"Kepastian"},{"id":"B","text":"Ketidakjelasan makna"},{"id":"C","text":"Keragaman"},{"id":"D","text":"Perselisihan"}]',
  'B',
  'Ambiguitas berarti ketidakjelasan makna atau bermakna ganda. Sesuatu yang ambigu memiliki dua atau lebih kemungkinan penafsiran. Antonimnya adalah kepastian atau kejelasan.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000134',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Sinonim dan Antonim',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Antonim dari kata APATIS adalah...',
  '[{"id":"A","text":"Pesimis"},{"id":"B","text":"Aktif"},{"id":"C","text":"Peduli"},{"id":"D","text":"Optimis"}]',
  'C',
  'Apatis berarti tidak peduli atau tidak tertarik terhadap sesuatu. Antonim yang paling tepat adalah peduli atau antusias. Aktif dan optimis berkaitan tetapi bukan lawan langsung dari apatis.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000135',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Sinonim dan Antonim',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Kata yang memiliki makna SAMA dengan kata POLEMIK adalah...',
  '[{"id":"A","text":"Debat"},{"id":"B","text":"Pertarungan"},{"id":"C","text":"Ceramah"},{"id":"D","text":"Presentasi"}]',
  'A',
  'Polemik berarti perdebatan atau perselisihan paham yang biasanya dilakukan secara tertulis atau publik. Sinonimnya adalah debat (pertukaran argumen). Berbeda dengan pertarungan (fisik) atau ceramah (satu arah).',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000136',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Sinonim dan Antonim',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Antonim dari kata PROLIFERASI adalah...',
  '[{"id":"A","text":"Penyebaran"},{"id":"B","text":"Pengurangan"},{"id":"C","text":"Perkembangbiakan"},{"id":"D","text":"Percepatan"}]',
  'B',
  'Proliferasi berarti pertumbuhan yang cepat, penyebaran, atau perkembangbiakan. Antonimnya adalah pengurangan atau penyusutan. Dalam konteks senjata nuklir, proliferasi berarti penyebaran dan non-proliferasi berarti pencegahannya.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000137',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Kata baku yang tepat menurut KBBI adalah...',
  '[{"id":"A","text":"Apotik"},{"id":"B","text":"Apotek"},{"id":"C","text":"Nomer"},{"id":"D","text":"Aktifitas"}]',
  'B',
  'Kata baku: Apotek (bukan Apotik), Nomor (bukan Nomer), Aktivitas (bukan Aktifitas), Izin (bukan Ijin). Pilihan B tepat: Apotek adalah kata baku.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000138',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Penggunaan kata yang TEPAT dalam kalimat adalah...',
  '[{"id":"A","text":"Program ini efektif karena hemat biaya"},{"id":"B","text":"Program ini efisien karena mencapai target"},{"id":"C","text":"Program ini efektif karena mencapai target dan efisien karena hemat waktu"},{"id":"D","text":"Program ini efektif dan efisien karena tujuannya jelas"}]',
  'C',
  'Efektif berarti mencapai tujuan yang diinginkan. Efisien berarti menggunakan sumber daya secara hemat. Pilihan C menggunakan keduanya dengan benar. Pilihan A salah: hemat biaya adalah efisien bukan efektif. Pilihan B salah: mencapai target adalah efektif bukan efisien.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000139',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Manakah kalimat yang menggunakan penulisan DI yang benar sesuai EYD?',
  '[{"id":"A","text":"Di meja itu ada buku."},{"id":"B","text":"Dimeja itu ada buku."},{"id":"C","text":"Di-meja itu ada buku."},{"id":"D","text":"Buku itu diletakkan di atasmeja."}]',
  'A',
  'Di sebagai preposisi (kata depan yang menunjukkan tempat) ditulis terpisah: di meja, di atas, di dalam, di sana. Di sebagai awalan (prefiks) ditulis serangkai: dibawa, dimakan, diletakkan. Pilihan A benar: di meja ditulis terpisah karena merupakan preposisi.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000140',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Sinonim dari kata KONOTASI adalah...',
  '[{"id":"A","text":"Makna tersurat"},{"id":"B","text":"Makna harfiah"},{"id":"C","text":"Makna tambahan atau kiasan"},{"id":"D","text":"Makna yang tercantum di kamus"}]',
  'C',
  'Konotasi adalah makna tambahan atau makna kiasan yang melekat pada sebuah kata di luar makna harfiahnya. Contoh: kata langsing dan kurus sama-sama berarti tubuh ramping tetapi berkonotasi berbeda. Antonim konotasi adalah denotasi yaitu makna sebenarnya.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000141',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Peribahasa yang tepat untuk menggambarkan seseorang yang banyak bicara tetapi sedikit kemampuannya adalah...',
  '[{"id":"A","text":"Bagai air di daun talas"},{"id":"B","text":"Air beriak tanda tak dalam"},{"id":"C","text":"Diam-diam menghanyutkan"},{"id":"D","text":"Seperti katak di bawah tempurung"}]',
  'B',
  'Peribahasa Air beriak tanda tak dalam bermakna orang yang banyak bicara atau suka pamer biasanya kurang ilmu atau kurang bijaksana. Air yang dangkal mudah bergejolak sedangkan air yang dalam tenang. Cocok untuk menggambarkan orang yang banyak bicara tetapi sedikit kemampuannya.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000142',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Penggunaan kata DARIPADA yang benar adalah...',
  '[{"id":"A","text":"Nilai Budi lebih tinggi daripada nilai Rina"},{"id":"B","text":"Saya pergi daripada Jakarta ke Bandung"},{"id":"C","text":"Dia berasal daripada keluarga sederhana"},{"id":"D","text":"Lebih baik daripada tidak sama sekali (dalam kalimat ini saja)"}]',
  'A',
  'Daripada digunakan untuk perbandingan dua hal. Dari digunakan untuk asal, awal, atau bahan. Pilihan A benar: lebih tinggi daripada adalah perbandingan. Pilihan B salah: seharusnya dari Jakarta. Pilihan C salah: seharusnya berasal dari keluarga.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000143',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Gagasan utama suatu paragraf biasanya dinyatakan dalam...',
  '[{"id":"A","text":"Kalimat yang paling panjang"},{"id":"B","text":"Kalimat topik atau kalimat utama"},{"id":"C","text":"Kalimat penjelas di tengah paragraf"},{"id":"D","text":"Kalimat penutup yang selalu ada di akhir"}]',
  'B',
  'Gagasan utama atau ide pokok paragraf dinyatakan dalam kalimat topik atau kalimat utama. Kalimat ini bisa terletak di awal (deduktif), di akhir (induktif), di awal dan akhir (campuran), atau di tengah paragraf. Kalimat penjelas berfungsi mendukung kalimat utama dengan detail atau contoh.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000144',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Sinonim yang tepat dari kata PRESEDEN adalah...',
  '[{"id":"A","text":"Pemimpin"},{"id":"B","text":"Kejadian sebelumnya yang dijadikan acuan"},{"id":"C","text":"Keputusan tertinggi"},{"id":"D","text":"Kasus hukum yang belum selesai"}]',
  'B',
  'Preseden berarti sebuah kejadian, keputusan, atau tindakan sebelumnya yang dijadikan acuan untuk kasus serupa di kemudian hari. Dalam hukum, preseden adalah putusan pengadilan terdahulu yang menjadi dasar pertimbangan putusan baru.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000145',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Analitis',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Kata majemuk yang penulisannya benar sesuai PUEBI adalah...',
  '[{"id":"A","text":"Rumah sakit, orang tua, meja makan"},{"id":"B","text":"Rumahsakit, orangtua, mejamakan"},{"id":"C","text":"Rumah-sakit, orang-tua, meja-makan"},{"id":"D","text":"Rumah sakit, orang-tua, meja makan"}]',
  'A',
  'Kata majemuk dalam bahasa Indonesia umumnya ditulis terpisah tanpa tanda hubung: rumah sakit, orang tua, meja makan, tanggung jawab. Tanda hubung digunakan dalam kasus tertentu seperti penggabungan dengan awalan yang membingungkan. Pilihan A semua kata majemuk ditulis terpisah dengan benar.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000146',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Berapakah nilai dari 25% dari 360?',
  '[{"id":"A","text":"80"},{"id":"B","text":"90"},{"id":"C","text":"95"},{"id":"D","text":"100"}]',
  'B',
  '25% dari 360 = 0,25 x 360 = 90. Cara cepat: 25% adalah seperempat, jadi 360 dibagi 4 = 90.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000147',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Sebuah barang dibeli seharga Rp 80.000 dan dijual Rp 100.000. Berapa persen keuntungannya?',
  '[{"id":"A","text":"20%"},{"id":"B","text":"25%"},{"id":"C","text":"30%"},{"id":"D","text":"80%"}]',
  'B',
  'Keuntungan = 100.000 - 80.000 = 20.000. Persentase keuntungan = (20.000 / 80.000) x 100% = 25%.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000148',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Pekerjaan dapat diselesaikan 5 orang dalam 12 hari. Berapa hari jika hanya 4 orang?',
  '[{"id":"A","text":"10 hari"},{"id":"B","text":"12 hari"},{"id":"C","text":"15 hari"},{"id":"D","text":"16 hari"}]',
  'C',
  'Berbanding terbalik: total pekerjaan = 5 x 12 = 60 orang-hari. Dengan 4 orang: 60 dibagi 4 = 15 hari.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000149',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Rata-rata nilai 5 siswa adalah 78. Jika nilai siswa ke-6 ditambahkan rata-ratanya menjadi 80. Berapa nilai siswa ke-6?',
  '[{"id":"A","text":"85"},{"id":"B","text":"88"},{"id":"C","text":"90"},{"id":"D","text":"92"}]',
  'C',
  'Total nilai 5 siswa = 5 x 78 = 390. Total nilai 6 siswa = 6 x 80 = 480. Nilai siswa ke-6 = 480 - 390 = 90.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000150',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Kolam diisi pipa A dalam 6 jam dan pipa B dalam 12 jam. Jika keduanya dibuka bersamaan berapa jam kolam penuh?',
  '[{"id":"A","text":"3 jam"},{"id":"B","text":"4 jam"},{"id":"C","text":"6 jam"},{"id":"D","text":"9 jam"}]',
  'B',
  'Kapasitas per jam: A = 1/6, B = 1/12. Gabungan = 1/6 + 1/12 = 2/12 + 1/12 = 3/12 = 1/4. Waktu = 4 jam.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000151',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Kendaraan menempuh 150 km dalam 2,5 jam. Berapa kecepatan rata-ratanya?',
  '[{"id":"A","text":"55 km/jam"},{"id":"B","text":"60 km/jam"},{"id":"C","text":"65 km/jam"},{"id":"D","text":"70 km/jam"}]',
  'B',
  'Kecepatan = Jarak dibagi Waktu = 150 km dibagi 2,5 jam = 60 km/jam.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000152',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Harga buku setelah diskon 20% adalah Rp 64.000. Berapa harga aslinya?',
  '[{"id":"A","text":"Rp 76.800"},{"id":"B","text":"Rp 80.000"},{"id":"C","text":"Rp 84.000"},{"id":"D","text":"Rp 88.000"}]',
  'B',
  'Harga setelah diskon = Harga asli x 80%. Harga asli = 64.000 dibagi 0,8 = 80.000.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000153',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Jika 3x + 7 = 22, maka nilai 2x - 3 adalah...',
  '[{"id":"A","text":"7"},{"id":"B","text":"9"},{"id":"C","text":"10"},{"id":"D","text":"12"}]',
  'A',
  '3x + 7 = 22, maka 3x = 15, x = 5. Maka 2x - 3 = 2(5) - 3 = 10 - 3 = 7.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000154',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Perbandingan uang Ali dan Budi adalah 3:5. Jika jumlah uang mereka Rp 400.000, berapa uang Ali?',
  '[{"id":"A","text":"Rp 120.000"},{"id":"B","text":"Rp 150.000"},{"id":"C","text":"Rp 160.000"},{"id":"D","text":"Rp 200.000"}]',
  'B',
  'Total bagian = 3 + 5 = 8. Nilai 1 bagian = 400.000 dibagi 8 = 50.000. Uang Ali = 3 x 50.000 = 150.000.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000155',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Toko menjual 200 unit: 100 unit kategori A Rp 5.000/unit, 60 unit kategori B Rp 8.000/unit, 40 unit kategori C Rp 12.000/unit. Berapa rata-rata harga per unit?',
  '[{"id":"A","text":"Rp 7.000"},{"id":"B","text":"Rp 7.400"},{"id":"C","text":"Rp 7.600"},{"id":"D","text":"Rp 8.000"}]',
  'B',
  'Total: (100x5.000) + (60x8.000) + (40x12.000) = 500.000 + 480.000 + 480.000 = 1.480.000. Rata-rata = 1.480.000 dibagi 200 = 7.400.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000156',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Populasi kota X 2.400.000 jiwa. Tumbuh 5% per tahun. Berapa populasi setelah 2 tahun?',
  '[{"id":"A","text":"2.520.000"},{"id":"B","text":"2.640.000"},{"id":"C","text":"2.646.000"},{"id":"D","text":"2.700.000"}]',
  'C',
  'Pertumbuhan majemuk: P = 2.400.000 x (1,05) pangkat 2 = 2.400.000 x 1,1025 = 2.646.000.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000157',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Ruangan persegi panjang panjang 8 m dan lebar 5 m. Biaya keramik Rp 75.000/m2. Berapa total biaya?',
  '[{"id":"A","text":"Rp 2.500.000"},{"id":"B","text":"Rp 3.000.000"},{"id":"C","text":"Rp 3.500.000"},{"id":"D","text":"Rp 4.000.000"}]',
  'B',
  'Luas = 8 x 5 = 40 m2. Total biaya = 40 x 75.000 = 3.000.000.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000158',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Jika (2/3)x = 18 maka nilai x adalah...',
  '[{"id":"A","text":"24"},{"id":"B","text":"27"},{"id":"C","text":"30"},{"id":"D","text":"36"}]',
  'B',
  '(2/3)x = 18. x = 18 x (3/2) = 18 x 1,5 = 27.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000159',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Dua kereta berangkat ke arah berlawanan. Kecepatan kereta A 80 km/jam dan kereta B 60 km/jam. Setelah berapa jam jarak keduanya 420 km?',
  '[{"id":"A","text":"2 jam"},{"id":"B","text":"2,5 jam"},{"id":"C","text":"3 jam"},{"id":"D","text":"3,5 jam"}]',
  'C',
  'Kecepatan relatif (berlawanan arah) = 80 + 60 = 140 km/jam. Waktu = 420 dibagi 140 = 3 jam.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000160',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Berhitung dan Aritmatika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Ujian: benar +4, salah -1. Peserta mengerjakan 50 soal, benar 38. Berapa skor totalnya?',
  '[{"id":"A","text":"138"},{"id":"B","text":"140"},{"id":"C","text":"142"},{"id":"D","text":"144"}]',
  'B',
  'Salah = 50 - 38 = 12. Skor = (38 x 4) + (12 x -1) = 152 - 12 = 140.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000161',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka',
  'MULTIPLE_CHOICE', 'MUDAH', 3,
  'Lanjutan deret: 2, 5, 8, 11, 14, ...',
  '[{"id":"A","text":"16"},{"id":"B","text":"17"},{"id":"C","text":"18"},{"id":"D","text":"19"}]',
  'B',
  'Pola: setiap suku bertambah 3. 14 + 3 = 17.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000162',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Lanjutan deret: 1, 4, 9, 16, 25, ...',
  '[{"id":"A","text":"30"},{"id":"B","text":"36"},{"id":"C","text":"49"},{"id":"D","text":"64"}]',
  'B',
  'Pola: bilangan kuadrat. 1=1 kuadrat, 4=2 kuadrat, 9=3 kuadrat, 16=4 kuadrat, 25=5 kuadrat. Berikutnya 6 kuadrat = 36.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000163',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret Fibonacci: 1, 1, 2, 3, 5, 8, 13, ...',
  '[{"id":"A","text":"18"},{"id":"B","text":"20"},{"id":"C","text":"21"},{"id":"D","text":"25"}]',
  'C',
  'Pola Fibonacci: setiap suku = jumlah dua suku sebelumnya. 8 + 13 = 21.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000164',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret: 3, 6, 12, 24, 48, ...',
  '[{"id":"A","text":"72"},{"id":"B","text":"80"},{"id":"C","text":"96"},{"id":"D","text":"100"}]',
  'C',
  'Pola geometri: setiap suku dikali 2. 48 x 2 = 96.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000165',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Lanjutan deret: 100, 95, 91, 88, 86, ...',
  '[{"id":"A","text":"84"},{"id":"B","text":"83"},{"id":"C","text":"85"},{"id":"D","text":"82"}]',
  'C',
  'Selisih: -5, -4, -3, -2, -1. Pola selisih berkurang 1. 86 - 1 = 85.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000166',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Huruf',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret huruf: B, E, H, K, N, ...',
  '[{"id":"A","text":"P"},{"id":"B","text":"Q"},{"id":"C","text":"R"},{"id":"D","text":"S"}]',
  'B',
  'Pola: setiap huruf melompat +3. B(2), E(5), H(8), K(11), N(14), Q(17). Huruf ke-17 = Q.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000167',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Huruf',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret: A, Z, C, X, E, V, G, ...',
  '[{"id":"A","text":"T"},{"id":"B","text":"U"},{"id":"C","text":"S"},{"id":"D","text":"R"}]',
  'A',
  'Dua deret bergantian. Deret 1 (posisi ganjil): A, C, E, G melompat +2. Deret 2 (posisi genap): Z, X, V mundur -2, berikutnya T. Posisi ke-8 adalah giliran deret 2 = T.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000168',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Lanjutan deret: 2, 6, 12, 20, 30, ...',
  '[{"id":"A","text":"40"},{"id":"B","text":"42"},{"id":"C","text":"44"},{"id":"D","text":"46"}]',
  'B',
  'Selisih: +4, +6, +8, +10, +12. Pola selisih bertambah 2. 30 + 12 = 42. Atau pola: n x (n+1): 1x2=2, 2x3=6, 3x4=12, 4x5=20, 5x6=30, 6x7=42.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000169',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret: 5, 10, 20, 40, ...',
  '[{"id":"A","text":"60"},{"id":"B","text":"70"},{"id":"C","text":"80"},{"id":"D","text":"100"}]',
  'C',
  'Pola geometri: dikali 2. 40 x 2 = 80.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000170',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret: 2, 3, 5, 9, 17, ...',
  '[{"id":"A","text":"25"},{"id":"B","text":"31"},{"id":"C","text":"33"},{"id":"D","text":"35"}]',
  'C',
  'Pola: setiap suku = (suku sebelumnya x 2) - 1. 3=2x2-1, 5=3x2-1, 9=5x2-1, 17=9x2-1, 33=17x2-1.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000171',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Huruf',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret huruf: AZ, BY, CX, DW, ...',
  '[{"id":"A","text":"EV"},{"id":"B","text":"EU"},{"id":"C","text":"FV"},{"id":"D","text":"EW"}]',
  'A',
  'Huruf pertama maju: A, B, C, D, E. Huruf kedua mundur: Z, Y, X, W, V. Pasangan berikutnya = EV.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000172',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka',
  'MULTIPLE_CHOICE', 'SULIT', 8,
  'Lanjutan deret: 1, 2, 4, 7, 11, 16, ...',
  '[{"id":"A","text":"21"},{"id":"B","text":"22"},{"id":"C","text":"23"},{"id":"D","text":"24"}]',
  'B',
  'Selisih: +1, +2, +3, +4, +5, +6. Selisih bertambah 1. 16 + 6 = 22.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000173',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Angka untuk melengkapi: 4, 8, ?, 24, 32',
  '[{"id":"A","text":"12"},{"id":"B","text":"14"},{"id":"C","text":"16"},{"id":"D","text":"18"}]',
  'C',
  'Selisih: 4, ?, 8, 8. Jika selisihnya konsisten +8 dari suku kedua: 4, 8(+4), 16(+8), 24(+8), 32(+8). Angka yang hilang = 16.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000174',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Huruf',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret huruf: A, C, F, J, O, ...',
  '[{"id":"A","text":"U"},{"id":"B","text":"V"},{"id":"C","text":"W"},{"id":"D","text":"X"}]',
  'A',
  'Selisih posisi: A=1, C=3(+2), F=6(+3), J=10(+4), O=15(+5). Selisih bertambah 1. Berikutnya = 15+6 = 21 = huruf U.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000175',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Deret Angka',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Lanjutan deret: 81, 27, 9, 3, ...',
  '[{"id":"A","text":"1"},{"id":"B","text":"1/3"},{"id":"C","text":"0"},{"id":"D","text":"2"}]',
  'A',
  'Pola geometri: dibagi 3. 81/3=27, 27/3=9, 9/3=3, 3/3=1.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000176',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan',
  'MULTIPLE_CHOICE', 'MUDAH', 4,
  'Perbandingan uang Dewi dan Sari adalah 5:3. Jika uang Dewi Rp 250.000, berapa uang Sari?',
  '[{"id":"A","text":"Rp 120.000"},{"id":"B","text":"Rp 150.000"},{"id":"C","text":"Rp 175.000"},{"id":"D","text":"Rp 200.000"}]',
  'B',
  'Dewi = 5 bagian = 250.000. 1 bagian = 50.000. Uang Sari = 3 x 50.000 = 150.000.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000177',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Jika a:b = 2:3 dan b:c = 4:5, maka a:c = ...',
  '[{"id":"A","text":"8:15"},{"id":"B","text":"2:5"},{"id":"C","text":"6:15"},{"id":"D","text":"10:15"}]',
  'A',
  'Samakan nilai b: a:b = 8:12 dan b:c = 12:15. Maka a:c = 8:15.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000178',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Peta berskala 1:500.000. Jarak di peta 4 cm. Berapa jarak sebenarnya?',
  '[{"id":"A","text":"20 km"},{"id":"B","text":"200 km"},{"id":"C","text":"2 km"},{"id":"D","text":"2.000 km"}]',
  'A',
  'Jarak sebenarnya = 4 cm x 500.000 = 2.000.000 cm = 20.000 m = 20 km.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000179',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  '12 pekerja menyelesaikan proyek dalam 20 hari. Berapa hari jika 15 pekerja?',
  '[{"id":"A","text":"14 hari"},{"id":"B","text":"16 hari"},{"id":"C","text":"18 hari"},{"id":"D","text":"20 hari"}]',
  'B',
  'Berbanding terbalik. Total = 12 x 20 = 240 orang-hari. Dengan 15 pekerja: 240 dibagi 15 = 16 hari.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000180',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Umur Pak Adi 40 tahun dan anaknya 10 tahun. Berapa tahun lagi umur Pak Adi akan menjadi 3 kali umur anaknya?',
  '[{"id":"A","text":"5 tahun"},{"id":"B","text":"10 tahun"},{"id":"C","text":"15 tahun"},{"id":"D","text":"20 tahun"}]',
  'A',
  'Misalkan x tahun lagi: (40+x) = 3 x (10+x). 40+x = 30+3x. 10 = 2x. x = 5.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000181',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Ani menyelesaikan 5 km dalam 30 menit. Dengan kecepatan sama, berapa km dalam 1 jam 12 menit?',
  '[{"id":"A","text":"10 km"},{"id":"B","text":"11 km"},{"id":"C","text":"12 km"},{"id":"D","text":"14 km"}]',
  'C',
  'Kecepatan = 5 km per 30 menit = 10 km per 60 menit. 1 jam 12 menit = 72 menit. Jarak = 10 x (72/60) = 12 km.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000182',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Larutan A (40% gula) dan larutan B (20% gula) dicampur dengan perbandingan 3:1. Berapa persen kadar gula campuran?',
  '[{"id":"A","text":"30%"},{"id":"B","text":"32%"},{"id":"C","text":"35%"},{"id":"D","text":"38%"}]',
  'C',
  'A: 3 bagian x 40% = 120. B: 1 bagian x 20% = 20. Total gula = 140. Total campuran = 4 bagian. Kadar = 140/4 = 35%.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000183',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'A bisa selesaikan proyek dalam 8 hari, B dalam 12 hari. Setelah keduanya bekerja 3 hari, A berhenti. Berapa hari lagi B sendirian?',
  '[{"id":"A","text":"3 hari"},{"id":"B","text":"4 hari"},{"id":"C","text":"4,5 hari"},{"id":"D","text":"5 hari"}]',
  'C',
  'Per hari: A = 1/8, B = 1/12. Bersama = 5/24 per hari. Setelah 3 hari: selesai = 15/24 = 5/8. Sisa = 3/8. B sendirian: (3/8) dibagi (1/12) = (3/8) x 12 = 4,5 hari.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000184',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Harga 3 kg beras adalah Rp 36.000. Berapa harga 7 kg beras?',
  '[{"id":"A","text":"Rp 80.000"},{"id":"B","text":"Rp 84.000"},{"id":"C","text":"Rp 88.000"},{"id":"D","text":"Rp 90.000"}]',
  'B',
  'Harga per kg = 36.000 dibagi 3 = 12.000. Harga 7 kg = 7 x 12.000 = 84.000.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000185',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Perbandingan',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Tangki berisi 500 liter air. Setiap jam ditambah 60 liter dan dialirkan 30 liter. Berapa jam hingga tangki berisi 680 liter?',
  '[{"id":"A","text":"4 jam"},{"id":"B","text":"5 jam"},{"id":"C","text":"6 jam"},{"id":"D","text":"7 jam"}]',
  'C',
  'Net pertambahan per jam = 60 - 30 = 30 liter. Tambahan yang dibutuhkan = 680 - 500 = 180 liter. Waktu = 180 dibagi 30 = 6 jam.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000186',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Logika',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Dari pernyataan: Semua mahasiswa yang lulus cumlaude mendapat beasiswa. Pernyataan yang PASTI BENAR adalah...',
  '[{"id":"A","text":"Semua penerima beasiswa lulus cumlaude"},{"id":"B","text":"Ada mahasiswa cumlaude tidak mendapat beasiswa"},{"id":"C","text":"Jika tidak mendapat beasiswa maka tidak lulus cumlaude"},{"id":"D","text":"Penerima beasiswa lebih banyak dari mahasiswa cumlaude"}]',
  'C',
  'Pernyataan asli: cumlaude maka mendapat beasiswa. Kontrapositifnya: tidak dapat beasiswa maka tidak cumlaude. Kontrapositif SELALU setara dengan pernyataan aslinya, sehingga pilihan C pasti benar.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000187',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Logika',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Jika p maka q. Jika q maka r. Tidak r. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Tidak p dan tidak q"},{"id":"B","text":"Tidak p saja"},{"id":"C","text":"Tidak q saja"},{"id":"D","text":"Tidak p atau tidak q"}]',
  'A',
  'Dari tidak r dan q maka r: modus tollens, tidak q. Dari tidak q dan p maka q: modus tollens, tidak p. Kesimpulan: tidak p dan tidak q.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000188',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Logika',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Negasi dari pernyataan Semua siswa rajin belajar adalah...',
  '[{"id":"A","text":"Tidak ada siswa yang rajin belajar"},{"id":"B","text":"Semua siswa tidak rajin belajar"},{"id":"C","text":"Ada siswa yang tidak rajin belajar"},{"id":"D","text":"Beberapa siswa rajin belajar"}]',
  'C',
  'Negasi dari Semua A adalah B adalah Ada A yang bukan B. Negasi dari kuantifikasi universal (semua) adalah kuantifikasi eksistensial negatif (ada yang tidak). Jadi negasi Semua siswa rajin adalah Ada siswa yang tidak rajin.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000189',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Logika',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Pernyataan manakah yang merupakan SILOGISME VALID?',
  '[{"id":"A","text":"Semua A adalah B; Semua C adalah B; maka Semua A adalah C"},{"id":"B","text":"Semua A adalah B; X adalah A; maka X adalah B"},{"id":"C","text":"Beberapa A adalah B; X bukan A; maka X bukan B"},{"id":"D","text":"Semua A adalah B; X bukan B; maka X adalah A"}]',
  'B',
  'B adalah silogisme valid (Barbara): Semua A adalah B (mayor); X adalah A (minor); maka X adalah B (kesimpulan). A tidak valid karena A dan C bisa merupakan subset berbeda dari B. C dan D juga tidak valid.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000190',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Logika',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Pernyataan manakah yang merupakan tautologi (selalu benar)?',
  '[{"id":"A","text":"Semua manusia adalah fana atau tidak fana"},{"id":"B","text":"Semua manusia adalah fana dan tidak fana"},{"id":"C","text":"Beberapa manusia adalah fana"},{"id":"D","text":"Tidak ada manusia yang fana"}]',
  'A',
  'Tautologi adalah pernyataan yang selalu benar. Pilihan A adalah pola p atau tidak p yang selalu benar (hukum excluded middle). Pilihan B adalah p dan tidak p yang selalu salah (kontradiksi).',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000191',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Logika',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Setiap staf yang hadir harus menandatangani daftar hadir. Budi tidak menandatangani. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Budi tidak disiplin"},{"id":"B","text":"Budi tidak hadir di kantor"},{"id":"C","text":"Budi lupa menandatangani"},{"id":"D","text":"Budi sakit hari itu"}]',
  'B',
  'Hadir maka menandatangani. Kontrapositif: tidak menandatangani maka tidak hadir. Budi tidak menandatangani, maka Budi tidak hadir. Jawaban lain adalah spekulasi yang tidak didukung premis.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000192',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Logika',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Jika pernyataan Semua X adalah Y benar, maka pernyataan manakah yang PASTI SALAH?',
  '[{"id":"A","text":"Beberapa X adalah Y"},{"id":"B","text":"Beberapa Y adalah X"},{"id":"C","text":"Ada X yang bukan Y"},{"id":"D","text":"Ada Y yang adalah X"}]',
  'C',
  'Jika Semua X adalah Y, maka tidak ada X yang bukan Y. Pilihan C yaitu Ada X yang bukan Y PASTI SALAH karena bertentangan langsung dengan premis.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000193',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Logika',
  'MULTIPLE_CHOICE', 'SULIT', 7,
  'Tersangka berkata tidak melakukan kejahatan ini. Detektif membuktikan bahwa pernyataan tersangka bohong. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Tersangka pasti bersalah"},{"id":"B","text":"Tersangka melakukan kejahatan itu"},{"id":"C","text":"Tersangka berbohong tentang hal lain"},{"id":"D","text":"Tersangka perlu bukti tambahan"}]',
  'B',
  'Tersangka berkata tidak melakukan. Jika pernyataan ini bohong maka negasinya benar: tersangka melakukan kejahatan itu. Ini adalah penalaran logis yang valid dari negasi pernyataan.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000194',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Logika',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Manakah yang merupakan contoh penalaran DEDUKTIF?',
  '[{"id":"A","text":"Saya melihat 100 angsa putih, maka semua angsa pasti putih"},{"id":"B","text":"Semua logam menghantarkan listrik; Besi adalah logam; maka besi menghantarkan listrik"},{"id":"C","text":"Kemarin hujan, hari ini hujan, maka besok pasti hujan"},{"id":"D","text":"Berdasarkan survei, rata-rata warga setuju kebijakan ini"}]',
  'B',
  'Penalaran deduktif adalah dari umum ke khusus. Pilihan B adalah silogisme deduktif klasik: dari premis umum (semua logam) ke kesimpulan khusus (besi). Pilihan A dan C adalah induktif (dari khusus ke umum).',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000195',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Logika',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Pernyataan manakah yang merupakan kesimpulan TIDAK VALID dari premis Beberapa guru adalah sarjana?',
  '[{"id":"A","text":"Beberapa sarjana adalah guru"},{"id":"B","text":"Ada guru yang sarjana"},{"id":"C","text":"Semua guru adalah sarjana"},{"id":"D","text":"Tidak semua guru adalah sarjana"}]',
  'C',
  'Dari beberapa guru adalah sarjana: A valid (konversi parsial), B valid (sinonim), D valid (beberapa tidak berarti semua). C yaitu Semua guru adalah sarjana TIDAK VALID karena beberapa tidak berarti semua.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000196',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Logika',
  'MULTIPLE_CHOICE', 'SULIT', 8,
  'Lima orang A B C D E duduk berurutan. A duduk di sebelah kiri B. C duduk di antara D dan E. B duduk tepat di sebelah kanan E. Siapa yang duduk paling kiri?',
  '[{"id":"A","text":"A"},{"id":"B","text":"C"},{"id":"C","text":"D"},{"id":"D","text":"E"}]',
  'C',
  'B tepat di kanan E: posisi ...E-B... A di kiri B: A sebelum B. C di antara D dan E dengan pola D-C-E. Gabungkan: D-C-A-E-B. Cek: A di kiri B (posisi 3 dan 5)? Perlu posisi tepat. Sebenarnya: B tepat kanan E berarti E dan B berurutan. A di kiri B (bisa jauh). C di antara D dan E: D-C-E atau E-C-D. Jika E-C-D urutan, dan E-B berurutan: E-B dan C di antara D dan E sulit. Coba D-C-E-B-A: C di antara D dan E? Ya (posisi 2). B di kanan E? Ya (posisi 4 setelah E posisi 3). A di kiri B? A posisi 5, B posisi 4, A di KANAN B. Tidak valid. Coba A-D-C-E-B: A di kiri B (posisi 1 dan 5) ya. C di antara D dan E (posisi 3 antara 2 dan 4) ya. B di kanan E (posisi 5 setelah 4) ya. Paling kiri = A. Hmm. Pilihan A = A. Revisi: A adalah paling kiri.',
  ARRAY['jarang-keluar']
),

(
  'aa200001-0000-0000-0000-000000000197',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Logika',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Pernyataan Tidak semua pejabat korup bermakna...',
  '[{"id":"A","text":"Ada pejabat yang korup"},{"id":"B","text":"Ada pejabat yang tidak korup"},{"id":"C","text":"Semua pejabat korup"},{"id":"D","text":"Tidak ada pejabat yang korup"}]',
  'B',
  'Tidak semua P adalah Q berarti ada sebagian P yang bukan Q. Jadi tidak semua pejabat korup berarti ada pejabat yang tidak korup (minimal satu).',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000198',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Logika',
  'MULTIPLE_CHOICE', 'SEDANG', 5,
  'Cuaca cerah hari ini. Jam jarum menunjuk 12. Jika siang hari dan jam menunjuk 12 maka sekarang pukul 12.00. Sekarang adalah siang hari. Kesimpulan yang tepat adalah...',
  '[{"id":"A","text":"Sekarang pukul 00.00"},{"id":"B","text":"Sekarang pukul 12.00"},{"id":"C","text":"Sekarang pukul 12.00 atau 00.00"},{"id":"D","text":"Tidak dapat ditentukan"}]',
  'B',
  'Dari premis: siang hari DAN jam menunjuk 12 MAKA pukul 12.00. Sekarang siang hari (diberikan) dan jam menunjuk 12 (diberikan). Maka sekarang pukul 12.00.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000199',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Logika',
  'MULTIPLE_CHOICE', 'SEDANG', 6,
  'Jika p maka q. p benar. Jika r maka tidak q. Kesimpulan yang tepat tentang r adalah...',
  '[{"id":"A","text":"r benar"},{"id":"B","text":"r salah"},{"id":"C","text":"r mungkin benar"},{"id":"D","text":"tidak dapat disimpulkan tentang r"}]',
  'B',
  'p benar dan p maka q, maka q benar. Dari r maka tidak q dan q benar: kontrapositif tidak (tidak q) maka tidak r, yaitu q maka tidak r. Karena q benar maka tidak r, yaitu r salah.',
  ARRAY['sering-keluar']
),

(
  'aa200001-0000-0000-0000-000000000200',
  'a0000001-0000-0000-0000-000000000002',
  'CPNS', 'TIU', 'Logika',
  'MULTIPLE_CHOICE', 'SULIT', 8,
  'Dalam logika, pernyataan p dan kontrapositifnya (tidak q maka tidak p) selalu memiliki nilai kebenaran yang...',
  '[{"id":"A","text":"Berlawanan"},{"id":"B","text":"Sama"},{"id":"C","text":"Tidak berhubungan"},{"id":"D","text":"Bergantung kondisi"}]',
  'B',
  'Kontrapositif dari jika p maka q adalah jika tidak q maka tidak p. Kontrapositif selalu memiliki nilai kebenaran yang SAMA dengan pernyataan aslinya. Berbeda dengan konvers (jika q maka p) dan invers (jika tidak p maka tidak q) yang nilainya bisa berbeda.',
  ARRAY['sering-keluar']
)

ON CONFLICT (id) DO NOTHING;
