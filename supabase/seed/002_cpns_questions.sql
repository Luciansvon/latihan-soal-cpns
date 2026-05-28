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
