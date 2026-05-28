-- ============================================================
-- Seed 002: CPNS TKP (Tes Karakteristik Pribadi)
-- pack_id : a0000001-0000-0000-0000-000000000003
-- UUID    : aa300001-0000-0000-0000-{12-digit nomor}
-- 50 soal, tipe TKP_SCALE, difficulty SEDANG
-- Distribusi subtopik:
--   Pelayanan Publik   : 10 soal (001-010)
--   Profesionalisme    : 10 soal (011-020)
--   Anti Radikalisme   :  8 soal (021-028)
--   Jejaring Kerja     :  8 soal (029-036)
--   Sosial Budaya      :  7 soal (037-043)
--   Teknologi Informasi:  7 soal (044-050)
-- ============================================================

INSERT INTO public.questions
  (id, pack_id, exam_type, subject, subtopic, question_type, difficulty, difficulty_rank,
   question_text, options, correct_option, tkp_scores, explanation_text, tags)
VALUES

-- ============================================================
-- PELAYANAN PUBLIK (001-010)
-- ============================================================

(
  'aa300001-0000-0000-0000-000000000001',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 4,
  'Anda bekerja di loket pelayanan publik. Seorang warga datang dengan dokumen yang tidak lengkap dan marah-marah karena sudah bolak-balik mengurus berkas. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menjelaskan dengan tenang persyaratan yang kurang dan menawarkan bantuan agar warga memahami prosedur selanjutnya"},{"id":"B","text":"Mengarahkan warga ke atasan untuk menangani komplain tersebut"},{"id":"C","text":"Memberikan formulir daftar persyaratan yang harus dilengkapi tanpa penjelasan tambahan"},{"id":"D","text":"Meminta warga mengantri kembali setelah seluruh dokumen sudah dilengkapi"},{"id":"E","text":"Menolak melayani warga dan menyuruhnya kembali besok hari"}]',
  'A',
  '{"A":5,"B":4,"C":3,"D":2,"E":1}',
  'Opsi A mendapat nilai tertinggi karena mencerminkan prinsip Berorientasi Pelayanan dalam nilai BerAKHLAK: memberikan pelayanan prima dengan empati, menjelaskan prosedur secara jelas, dan membantu warga memahami langkah berikutnya. Mengarahkan ke atasan (B) masih konstruktif namun kurang proaktif. Memberikan formulir tanpa penjelasan (C) kurang empatik. Meminta antri ulang (D) menambah beban warga. Menolak melayani (E) bertentangan dengan kewajiban ASN sebagai pelayan publik.',
  ARRAY['sering-keluar','pelayanan-publik','berorientasi-pelayanan']
),

(
  'aa300001-0000-0000-0000-000000000002',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 4,
  'Pada hari Jumat sore, 30 menit sebelum kantor tutup, datang seorang lansia yang ingin mengurus surat keterangan domisili. Proses pengurusan diperkirakan memakan waktu 45 menit. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menolak dengan sopan karena jam pelayanan hampir habis dan meminta warga datang kembali hari Senin"},{"id":"B","text":"Menerima berkas dan tetap memproses sampai selesai meskipun melewati jam kantor"},{"id":"C","text":"Meminta warga menunggu sambil menghubungi rekan untuk membantu mempercepat proses"},{"id":"D","text":"Menerima berkas, memulai proses, dan menjelaskan bahwa penyelesaiannya dilanjutkan hari Senin"},{"id":"E","text":"Menyarankan warga menghubungi kepala desa untuk mendapatkan surat pengantar terlebih dahulu"}]',
  'B',
  '{"A":1,"B":5,"C":4,"D":3,"E":2}',
  'Opsi B mendapat nilai tertinggi karena ASN yang berorientasi pelayanan mengutamakan kepentingan masyarakat, terutama warga lansia yang rentan. Menyelesaikan layanan meskipun melewati jam kerja adalah wujud komitmen dan dedikasi. Meminta bantuan rekan (C) menunjukkan kolaborasi dan solusi proaktif. Menerima berkas untuk dilanjutkan Senin (D) memberikan solusi meski kurang ideal. Menyarankan prosedur lain (E) mempersulit warga. Menolak karena jam hampir habis (A) tidak berorientasi pelayanan dan tidak berempati pada kondisi warga lansia.',
  ARRAY['sering-keluar','pelayanan-publik','komitmen','empati']
),

(
  'aa300001-0000-0000-0000-000000000003',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 4,
  'Anda menerima pengaduan dari warga bahwa pelayanan di instansi Anda lambat dan berbelit. Anda sendiri menyadari hal tersebut memang terjadi karena prosedur yang kurang efisien. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Membela prosedur yang ada dengan menjelaskan bahwa setiap tahap memiliki alasan hukum tersendiri"},{"id":"B","text":"Mendokumentasikan pengaduan dan menyampaikan ke atasan agar prosedur dievaluasi"},{"id":"C","text":"Mengabaikan pengaduan karena perubahan prosedur bukan kewenangan Anda"},{"id":"D","text":"Berempati kepada warga dan berjanji akan menyampaikan masukan tersebut ke pihak terkait, lalu benar-benar menindaklanjutinya"},{"id":"E","text":"Meminta warga menyampaikan pengaduan secara tertulis melalui kotak saran yang tersedia"}]',
  'D',
  '{"A":2,"B":4,"C":1,"D":5,"E":3}',
  'Opsi D mendapat nilai tertinggi karena menunjukkan empati sekaligus akuntabilitas: berempati pada warga, berkomitmen menindaklanjuti, dan benar-benar melaksanakan komitmen tersebut. Mendokumentasikan ke atasan (B) juga baik namun kurang menunjukkan inisiatif personal. Mengarahkan ke kotak saran (E) merupakan langkah prosedural yang sah. Membela prosedur tanpa refleksi (A) bersikap defensif. Mengabaikan pengaduan (C) adalah tindakan paling buruk karena ASN wajib responsif terhadap masukan publik sesuai UU Pelayanan Publik No. 25 Tahun 2009.',
  ARRAY['sering-keluar','pelayanan-publik','akuntabel','responsiveness']
),

(
  'aa300001-0000-0000-0000-000000000004',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 4,
  'Seorang warga menawarkan sejumlah uang kepada Anda sebagai bentuk terima kasih karena urusan berkasnya sudah selesai dengan cepat. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menerima uang tersebut karena nilainya kecil dan dianggap sebagai tanda terima kasih yang wajar"},{"id":"B","text":"Menolak dengan sopan, menjelaskan bahwa pelayanan cepat adalah standar yang harusnya diterima semua warga"},{"id":"C","text":"Menolak dan melaporkan kejadian ini kepada atasan sebagai bentuk transparansi"},{"id":"D","text":"Menolak dengan tegas dan mengingatkan warga bahwa tindakan itu termasuk kategori gratifikasi"},{"id":"E","text":"Menerima uang tersebut dan menggunakannya untuk keperluan operasional kantor"}]',
  'D',
  '{"A":1,"B":3,"C":4,"D":5,"E":2}',
  'Menolak dengan tegas sambil mengedukasi warga bahwa pemberian itu termasuk gratifikasi (D) adalah respons terbaik karena langsung menutup celah dan mencerminkan nilai Akuntabel dalam BerAKHLAK serta UU No. 20 Tahun 2001 tentang Pemberantasan Korupsi. Menolak dan melaporkan ke atasan (C) juga sangat baik namun lebih reaktif. Menolak dengan sopan tanpa edukasi (B) sudah benar tetapi kurang maksimal. Menerima untuk operasional kantor (E) tetap penyalahgunaan. Menerima karena nilainya kecil (A) adalah tindakan terburuk — gratifikasi sekecil apapun tetap melanggar hukum.',
  ARRAY['sering-keluar','pelayanan-publik','akuntabel','anti-korupsi','gratifikasi']
),

(
  'aa300001-0000-0000-0000-000000000005',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 4,
  'Antrian di loket pelayanan sangat panjang. Seorang warga yang Anda kenal meminta Anda untuk mendahulukan urusannya agar tidak perlu mengantri lama. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Mendahulukan warga tersebut karena hanya membutuhkan waktu sebentar dan tidak merugikan orang lain"},{"id":"B","text":"Menolak dengan sopan dan menjelaskan bahwa semua warga diperlakukan sama sesuai antrian"},{"id":"C","text":"Menyarankan warga mengambil nomor antrian prioritas jika memenuhi syarat (lansia/difabel), jika tidak maka harus mengikuti antrian"},{"id":"D","text":"Meminta warga menunggu hingga antrian sepi dan melayaninya di waktu jeda"},{"id":"E","text":"Meminta rekan kerja yang loketnya lebih sepi untuk melayani warga tersebut"}]',
  'B',
  '{"A":1,"B":5,"C":4,"D":2,"E":3}',
  'Opsi B mendapat nilai tertinggi karena prinsip keadilan dan non-diskriminasi adalah fondasi pelayanan publik. Memperlakukan semua warga setara tanpa memandang kedekatan personal mencerminkan integritas dan profesionalisme ASN. Menyarankan jalur prioritas yang sah (C) masih mengutamakan keadilan. Meminta rekan loket lain (E) adalah solusi kreatif namun berpotensi menimbulkan ketidakadilan. Melayani di waktu jeda (D) berpotensi tidak transparan. Mendahulukan karena kenalan (A) merupakan diskriminasi yang melanggar prinsip persamaan dalam pelayanan publik.',
  ARRAY['sering-keluar','pelayanan-publik','keadilan','non-diskriminasi','integritas']
),

(
  'aa300001-0000-0000-0000-000000000006',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 4,
  'Anda mendapati bahwa sistem online pelayanan di instansi Anda sering mengalami gangguan sehingga warga kesulitan mengakses layanan. Anda bukan dari bidang IT. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Melaporkan gangguan tersebut secara rinci kepada tim IT dan atasan, serta menyarankan solusi sementara bagi warga yang datang langsung"},{"id":"B","text":"Menunggu tim IT mengetahui dan menyelesaikan masalah sendiri"},{"id":"C","text":"Membantu warga yang datang langsung untuk mengisi formulir manual sebagai solusi sementara"},{"id":"D","text":"Menyarankan warga untuk mencoba kembali mengakses sistem di lain waktu"},{"id":"E","text":"Mencoba memperbaiki sistem sendiri meskipun tidak memiliki keahlian IT"}]',
  'A',
  '{"A":5,"B":1,"C":4,"D":2,"E":3}',
  'Opsi A mendapat nilai tertinggi karena menunjukkan inisiatif proaktif: melaporkan masalah kepada pihak yang berwenang (tim IT dan atasan) sekaligus memberikan solusi sementara kepada warga. Ini mencerminkan nilai Adaptif dan Kolaboratif dalam BerAKHLAK. Membantu pengisian manual (C) adalah solusi parsial yang baik. Mencoba memperbaiki sendiri tanpa keahlian (E) berisiko memperburuk masalah. Menyarankan coba lagi (D) tidak responsif. Menunggu tim IT sendiri (B) menunjukkan sikap pasif yang tidak berorientasi pelayanan.',
  ARRAY['sering-keluar','pelayanan-publik','adaptif','kolaboratif','inisiatif']
),

(
  'aa300001-0000-0000-0000-000000000007',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 4,
  'Warga menyampaikan keluhan bahwa petugas di instansi Anda tidak ramah dan sering terlihat mengobrol saat jam pelayanan. Anda menyaksikan hal ini terjadi pada rekan kerja Anda. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menegur rekan kerja secara langsung di depan warga agar memberikan efek jera"},{"id":"B","text":"Tidak ikut campur karena itu adalah urusan atasan dan bukan tanggung jawab Anda"},{"id":"C","text":"Menyampaikan dengan baik kepada rekan kerja bahwa perilakunya berdampak pada citra instansi, dan mendorong rekan untuk lebih fokus melayani"},{"id":"D","text":"Melaporkan perilaku rekan kepada atasan secara langsung tanpa menegur rekan terlebih dahulu"},{"id":"E","text":"Menutupi perilaku rekan tersebut dari atasan agar tidak menimbulkan masalah dalam tim"}]',
  'C',
  '{"A":2,"B":1,"C":5,"D":4,"E":3}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan pendekatan yang harmonis dan konstruktif: menegur rekan secara pribadi dengan cara yang menghormati martabat, bukan mempermalukannya. Ini mencerminkan nilai Harmonis dan Loyal dalam BerAKHLAK — saling menjaga dan mengingatkan sesama ASN. Melaporkan ke atasan (D) juga konstruktif jika pendekatan personal gagal. Menegur di depan warga (A) mempermalukan rekan dan berpotensi memperburuk suasana. Menutupi (E) tidak akuntabel. Tidak ikut campur (B) adalah sikap pasif yang membiarkan kualitas pelayanan menurun.',
  ARRAY['sering-keluar','pelayanan-publik','harmonis','loyal','kode-etik']
),

(
  'aa300001-0000-0000-0000-000000000008',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 4,
  'Anda mendapat keluhan dari warga yang mengalami kesulitan memahami prosedur online karena tidak melek digital. Anda sedang sibuk, namun antrian tidak terlalu panjang. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Meminta warga menunggu dan memberikan nomor antrian, lalu melayaninya seperti warga lain"},{"id":"B","text":"Mendampingi warga secara langsung langkah demi langkah menggunakan perangkat yang tersedia di kantor"},{"id":"C","text":"Memberikan panduan tertulis tentang cara menggunakan sistem online dan meminta warga mempelajarinya di rumah"},{"id":"D","text":"Meminta rekan kerja yang sedang tidak sibuk untuk mendampingi warga tersebut"},{"id":"E","text":"Mengerjakan proses online tersebut secara langsung untuk warga agar cepat selesai"}]',
  'B',
  '{"A":3,"B":5,"C":2,"D":4,"E":1}',
  'Opsi B mendapat nilai tertinggi karena mendampingi warga langkah demi langkah menunjukkan empati mendalam dan komitmen terhadap inklusi digital — memastikan warga yang tidak melek teknologi tetap dapat mengakses layanan publik. Meminta rekan mendampingi (D) adalah alternatif kolaboratif yang baik. Memberikan panduan tertulis (C) kurang efektif untuk warga yang tidak melek digital. Melayani seperti biasa tanpa bantuan ekstra (A) memadai namun kurang empatik. Mengerjakan semuanya untuk warga (E) tidak mendidik dan berpotensi disalahgunakan.',
  ARRAY['sering-keluar','pelayanan-publik','empati','inklusi','berorientasi-pelayanan']
),

(
  'aa300001-0000-0000-0000-000000000009',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 4,
  'Anda menemukan bahwa persyaratan dokumen untuk suatu layanan di instansi Anda ternyata sudah tidak berlaku berdasarkan regulasi terbaru, namun rekan-rekan Anda masih meminta persyaratan lama tersebut kepada warga. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menyesuaikan sendiri pelayanan Anda dengan regulasi baru, tanpa memberitahu rekan agar tidak menimbulkan konflik"},{"id":"B","text":"Menginformasikan kepada rekan dan atasan tentang perubahan regulasi, serta mengusulkan sosialisasi internal dan pembaruan SOP"},{"id":"C","text":"Mengikuti prosedur lama seperti rekan-rekan karena lebih aman jika ada masalah di kemudian hari"},{"id":"D","text":"Melaporkan langsung ke inspektorat bahwa rekan-rekan melanggar regulasi"},{"id":"E","text":"Memberitahu warga secara diam-diam tentang persyaratan yang sebenarnya tidak diperlukan"}]',
  'B',
  '{"A":3,"B":5,"C":1,"D":2,"E":4}',
  'Opsi B mendapat nilai tertinggi karena menunjukkan nilai Kompeten (update pengetahuan regulasi) dan Kolaboratif (berbagi informasi untuk perbaikan sistemik). Menginformasikan ke rekan dan atasan serta mengusulkan pembaruan SOP adalah respons yang paling konstruktif dan berdampak luas. Memberitahu warga tentang persyaratan yang benar (E) menolong warga namun tidak menyelesaikan masalah sistemik. Menyesuaikan sendiri tanpa memberitahu (A) parsial dan tidak kolaboratif. Melaporkan ke inspektorat (D) terlalu drastis untuk masalah miskomunikasi regulasi. Mengikuti prosedur lama (C) adalah tindakan terburuk karena merugikan warga.',
  ARRAY['sering-keluar','pelayanan-publik','kompeten','kolaboratif','regulasi']
),

(
  'aa300001-0000-0000-0000-000000000010',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 4,
  'Di instansi Anda belum ada mekanisme resmi untuk mengukur kepuasan warga terhadap pelayanan. Anda memiliki ide untuk membuat sistem survei sederhana. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Membuat sistem survei sendiri dan langsung menerapkannya di loket pelayanan tanpa izin atasan"},{"id":"B","text":"Menyampaikan ide kepada atasan lengkap dengan konsep dan manfaatnya, lalu menawarkan diri untuk membantu implementasi jika disetujui"},{"id":"C","text":"Menunggu atasan atau bagian perencanaan mengambil inisiatif untuk membuat sistem survei"},{"id":"D","text":"Menyampaikan ide kepada rekan kerja untuk mendapatkan dukungan sebelum mengajukan ke atasan"},{"id":"E","text":"Mencari tahu apakah instansi lain sudah memiliki sistem serupa dan mengadopsinya langsung"}]',
  'B',
  '{"A":3,"B":5,"C":1,"D":4,"E":2}',
  'Opsi B mendapat nilai tertinggi karena menunjukkan inisiatif yang disertai respek terhadap hierarki dan prosedur organisasi. Menyampaikan ide ke atasan dengan konsep matang adalah cara yang tepat untuk mendorong inovasi dalam sistem pemerintahan. Ini mencerminkan nilai Adaptif (inovatif) dan Loyal (menghormati hierarki). Mencari dukungan rekan dulu (D) juga baik sebagai langkah membangun konsensus. Menerapkan langsung tanpa izin (A) melanggar otoritas. Mengadopsi dari instansi lain tanpa persetujuan (E) tidak prosedural. Menunggu tanpa inisiatif (C) adalah sikap pasif yang tidak adaptif.',
  ARRAY['sering-keluar','pelayanan-publik','adaptif','inovatif','inisiatif']
),

-- ============================================================
-- PROFESIONALISME (011-020)
-- ============================================================

(
  'aa300001-0000-0000-0000-000000000011',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Anda diminta atasan untuk menyelesaikan laporan penting yang harus diserahkan besok pagi. Namun, ada undangan keluarga yang sudah lama direncanakan malam ini. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menyelesaikan laporan terlebih dahulu karena merupakan kewajiban kerja, kemudian menyusul ke acara keluarga jika waktu memungkinkan"},{"id":"B","text":"Hadir ke acara keluarga karena sudah direncanakan lama, dan menyelesaikan laporan besok pagi lebih awal sebelum diserahkan"},{"id":"C","text":"Mendelegasikan pekerjaan laporan kepada rekan kerja tanpa pemberitahuan kepada atasan"},{"id":"D","text":"Menghubungi atasan, menjelaskan situasi, dan meminta perpanjangan batas waktu atau bantuan rekan"},{"id":"E","text":"Mengerjakan laporan seadanya malam ini agar bisa segera pergi ke acara keluarga"}]',
  'D',
  '{"A":4,"B":3,"C":1,"D":5,"E":2}',
  'Opsi D mendapat nilai tertinggi karena menunjukkan komunikasi yang transparan dan profesional. Menghubungi atasan untuk menjelaskan situasi dan mencari solusi bersama (perpanjangan waktu atau bantuan) adalah tindakan yang akuntabel dan kolaboratif. Menyelesaikan laporan dulu lalu menyusul (A) juga profesional namun tidak mengomunikasikan situasinya ke atasan. Hadir ke acara dan menyerahkan besok tanpa komunikasi (B) berisiko. Mengerjakan seadanya (E) mengorbankan kualitas. Mendelegasikan tanpa izin (C) tidak etis dan melanggar kepercayaan atasan.',
  ARRAY['sering-keluar','profesionalisme','akuntabel','komunikasi','manajemen-waktu']
),

(
  'aa300001-0000-0000-0000-000000000012',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Anda baru saja dipromosikan menjadi kepala seksi. Beberapa rekan lama Anda yang tidak dipromosikan tampak tidak senang dan mengurangi kerjasama. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Mengabaikan sikap rekan-rekan dan fokus pada pekerjaan Anda sendiri"},{"id":"B","text":"Melaporkan sikap rekan-rekan tersebut kepada atasan agar ada tindakan disiplin"},{"id":"C","text":"Mendekati rekan-rekan secara personal, mengakui kontribusi mereka, mendengarkan kekhawatiran, dan mengajak mereka berkolaborasi membangun tim yang solid"},{"id":"D","text":"Menggunakan wewenang baru untuk menegaskan otoritas dan meminta rekan-rekan bekerja sesuai arahan"},{"id":"E","text":"Meminta mediasi HRD untuk menyelesaikan konflik interpersonal dalam tim"}]',
  'C',
  '{"A":2,"B":3,"C":5,"D":1,"E":4}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan kepemimpinan yang harmonis dan empatik. Mendekati rekan secara personal untuk mendengarkan dan mengajak kolaborasi mencerminkan nilai Harmonis (membangun lingkungan kerja kondusif) dan Kolaboratif dalam BerAKHLAK. Meminta mediasi HRD (E) juga konstruktif untuk konflik yang berkelanjutan. Melaporkan ke atasan (B) lebih tepat jika upaya personal gagal. Mengabaikan sikap rekan (A) membiarkan masalah memburuk. Menggunakan wewenang untuk menegaskan otoritas (D) memperburuk hubungan dan tidak membangun kepercayaan tim.',
  ARRAY['sering-keluar','profesionalisme','kepemimpinan','harmonis','kolaboratif']
),

(
  'aa300001-0000-0000-0000-000000000013',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Anda menemukan kesalahan dalam laporan yang sudah Anda serahkan ke atasan. Laporan tersebut akan dipresentasikan besok kepada pimpinan tinggi. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Segera menghubungi atasan, menginformasikan kesalahan, menyampaikan koreksi, dan meminta izin untuk memperbaiki laporan"},{"id":"B","text":"Diam karena mungkin atasan tidak akan menyadari kesalahan tersebut"},{"id":"C","text":"Menunggu setelah presentasi selesai dan kemudian baru melaporkan kesalahan"},{"id":"D","text":"Meminta rekan kerja yang menyusun data untuk bertanggung jawab atas kesalahan tersebut"},{"id":"E","text":"Memperbaiki laporan sendiri dan menyerahkan versi baru tanpa memberitahu atasan tentang kesalahan sebelumnya"}]',
  'A',
  '{"A":5,"B":1,"C":2,"D":3,"E":4}',
  'Opsi A mendapat nilai tertinggi karena menunjukkan integritas dan akuntabilitas penuh — segera mengakui kesalahan dan mengambil langkah korektif sebelum menimbulkan dampak lebih besar. Ini mencerminkan nilai Akuntabel dalam BerAKHLAK: bertanggung jawab atas setiap tindakan. Memperbaiki dan menyerahkan versi baru tanpa menjelaskan (E) kurang transparan. Menyalahkan rekan (D) tidak bertanggung jawab. Menunggu setelah presentasi (C) membiarkan kesalahan berpotensi merusak kepercayaan pimpinan. Diam berharap tidak ketahuan (B) adalah tindakan terburuk yang melanggar prinsip akuntabilitas.',
  ARRAY['sering-keluar','profesionalisme','akuntabel','integritas','tanggung-jawab']
),

(
  'aa300001-0000-0000-0000-000000000014',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Atasan Anda memberikan instruksi yang menurut Anda kurang tepat secara teknis dan berpotensi menghasilkan output yang tidak optimal. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Mengikuti instruksi atasan tanpa bertanya karena atasan pasti lebih berpengalaman"},{"id":"B","text":"Menolak mengerjakan instruksi tersebut dan menjelaskan secara detail mengapa instruksi itu salah"},{"id":"C","text":"Menyampaikan pendapat teknis Anda kepada atasan secara santun dengan data pendukung, mendengarkan respons atasan, dan mengikuti keputusan akhir atasan"},{"id":"D","text":"Mengerjakan sesuai pendapat Anda sendiri tanpa memberitahu atasan"},{"id":"E","text":"Mendiskusikan kekhawatiran Anda dengan rekan kerja dan membiarkan rekan yang menyampaikannya ke atasan"}]',
  'C',
  '{"A":3,"B":2,"C":5,"D":1,"E":4}',
  'Opsi C mendapat nilai tertinggi karena mencerminkan profesionalisme sejati: menyampaikan pendapat teknis dengan data yang obyektif dan santun (nilai Kompeten), namun tetap menghormati otoritas dan keputusan atasan (nilai Loyal). Ini adalah keseimbangan antara kompetensi dan kepatuhan yang sehat. Membiarkan rekan yang menyampaikan (E) masih konstruktif namun kurang langsung. Mengikuti tanpa pertanyaan (A) bisa menghasilkan output suboptimal. Menolak instruksi (B) bersikap konfrontatif. Mengerjakan sesuai pendapat sendiri tanpa sepengetahuan atasan (D) melanggar kepercayaan dan hirarki.',
  ARRAY['sering-keluar','profesionalisme','kompeten','loyal','komunikasi-konstruktif']
),

(
  'aa300001-0000-0000-0000-000000000015',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Anda mengetahui bahwa rekan kerja Anda secara rutin mengisi absensi untuk rekan lain yang tidak hadir (titip absen). Apa yang Anda lakukan?',
  '[{"id":"A","text":"Ikut melakukan hal yang sama karena semua orang sudah melakukannya"},{"id":"B","text":"Menegur rekan yang bersangkutan secara pribadi dan mengingatkan bahwa tindakannya melanggar integritas"},{"id":"C","text":"Melaporkan langsung kepada inspektorat atau satuan pengawas intern tanpa memberikan kesempatan rekan untuk berubah"},{"id":"D","text":"Pura-pura tidak tahu karena tidak ingin terlibat konflik dengan rekan kerja"},{"id":"E","text":"Mengingatkan rekan secara pribadi terlebih dahulu; jika berlanjut, melaporkan kepada atasan"}]',
  'E',
  '{"A":1,"B":4,"C":3,"D":2,"E":5}',
  'Opsi E mendapat nilai tertinggi karena menunjukkan pendekatan yang bertahap dan proporsional: memberi kesempatan rekan untuk memperbaiki diri, namun tidak membiarkan pelanggaran berlanjut jika tidak ada perubahan. Ini mencerminkan nilai Harmonis (menjaga hubungan) sekaligus Akuntabel (tidak membiarkan pelanggaran). Menegur secara pribadi (B) baik namun tanpa eskalasi jika berlanjut. Melaporkan langsung ke inspektorat (C) terlalu drastis tanpa mencoba pendekatan personal. Pura-pura tidak tahu (D) membiarkan ketidakjujuran. Ikut melakukan hal yang sama (A) adalah tindakan terburuk — membuatnya menjadi bagian dari pelanggaran.',
  ARRAY['sering-keluar','profesionalisme','integritas','akuntabel','kode-etik']
),

(
  'aa300001-0000-0000-0000-000000000016',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Anda merasa kemampuan kerja Anda sudah stagnan dan tidak berkembang sejak beberapa tahun terakhir. Tugas rutin Anda dapat Anda kerjakan dengan baik, namun tidak ada tantangan baru. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menerima kondisi ini karena stabilitas pekerjaan adalah hal yang penting"},{"id":"B","text":"Mengajukan permohonan mutasi ke unit lain yang memiliki tantangan lebih besar"},{"id":"C","text":"Mencari pelatihan mandiri, mengikuti webinar atau kursus yang relevan, dan aktif mengusulkan program pengembangan kepada atasan"},{"id":"D","text":"Meminta atasan untuk memberikan tugas-tugas yang lebih menantang"},{"id":"E","text":"Mencari pekerjaan lain yang memberikan lebih banyak kesempatan berkembang"}]',
  'C',
  '{"A":1,"B":3,"C":5,"D":4,"E":2}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan nilai Kompeten dalam BerAKHLAK: terus meningkatkan kompetensi secara proaktif dan mendorong organisasi untuk berkembang. Mengambil inisiatif belajar mandiri sekaligus mengusulkan program pengembangan adalah pendekatan yang paling konstruktif dan berdampak ganda (untuk diri sendiri dan organisasi). Meminta tugas menantang (D) juga baik dan menunjukkan motivasi. Meminta mutasi (B) adalah opsi yang sah namun reaktif. Mencari pekerjaan lain (E) tidak menyelesaikan masalah. Menerima stagnansi (A) bertentangan dengan semangat pengembangan kompetensi ASN.',
  ARRAY['sering-keluar','profesionalisme','kompeten','pengembangan-diri','inisiatif']
),

(
  'aa300001-0000-0000-0000-000000000017',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Anda ditugaskan mengerjakan proyek bersama rekan dari divisi lain. Rekan tersebut sering terlambat menyerahkan bagiannya sehingga mengancam tenggat waktu keseluruhan proyek. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Mengerjakan bagian rekan tersebut sendiri agar proyek tetap selesai tepat waktu"},{"id":"B","text":"Melaporkan keterlambatan rekan kepada atasan masing-masing agar ada tindakan"},{"id":"C","text":"Berkomunikasi langsung dengan rekan untuk memahami kendalanya, menawarkan bantuan jika diperlukan, dan bersama-sama membuat jadwal yang lebih realistis"},{"id":"D","text":"Menyerahkan bagian Anda sendiri tepat waktu dan membiarkan rekan bertanggung jawab atas bagiannya"},{"id":"E","text":"Meminta kepada koordinator proyek untuk mengganti rekan tersebut dengan anggota lain"}]',
  'C',
  '{"A":3,"B":4,"C":5,"D":2,"E":1}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan pendekatan kolaboratif yang empatis: memahami kendala rekan, menawarkan bantuan, dan bersama menyusun solusi. Ini mencerminkan nilai Kolaboratif dan Harmonis dalam BerAKHLAK — bekerja sama untuk hasil terbaik tanpa mengorbankan hubungan kerja. Melaporkan ke atasan (B) bisa menjadi langkah berikutnya jika komunikasi langsung gagal. Mengerjakan bagian rekan (A) tidak mendidik dan membangun ketergantungan. Hanya menyerahkan bagian sendiri (D) tidak kolaboratif. Meminta penggantian rekan (E) terlalu drastis sebelum mencoba komunikasi.',
  ARRAY['sering-keluar','profesionalisme','kolaboratif','komunikasi','manajemen-proyek']
),

(
  'aa300001-0000-0000-0000-000000000018',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Anda sedang dalam rapat penting ketika ponsel Anda berdering. Ternyata telepon dari anggota keluarga yang mengabarkan ada situasi darurat di rumah. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Mengangkat telepon di dalam ruang rapat dan berbicara selama yang diperlukan"},{"id":"B","text":"Menolak telepon dan mengikuti rapat sampai selesai tanpa mengecek situasi keluarga"},{"id":"C","text":"Keluar sebentar dari ruang rapat, memastikan kondisi darurat dan menilai tingkat urgensinya, lalu kembali ke rapat atau memohon izin meninggalkan rapat kepada pimpinan rapat jika situasi benar-benar darurat"},{"id":"D","text":"Langsung keluar dari rapat tanpa permisi untuk mengurus urusan keluarga"},{"id":"E","text":"Meminta rekan untuk mewakili dan menutup ponsel untuk sisa rapat"}]',
  'C',
  '{"A":2,"B":1,"C":5,"D":3,"E":4}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan keseimbangan antara profesionalisme dan tanggung jawab keluarga. Keluar sebentar untuk memastikan tingkat kegawatan, kemudian membuat keputusan yang proporsional (kembali atau izin) mencerminkan kecerdasan situasional dan penghormatan pada kedua belah pihak. Meminta rekan mewakili (E) juga merupakan solusi yang profesional jika situasi memungkinkan. Keluar tanpa permisi (D) kurang menghormati forum. Mengangkat telepon di dalam rapat (A) mengganggu jalannya rapat. Mengabaikan telepon keluarga dalam situasi darurat (B) terlalu kaku dan tidak berempati.',
  ARRAY['sering-keluar','profesionalisme','keseimbangan-kerja','etika-rapat','kecerdasan-situasional']
),

(
  'aa300001-0000-0000-0000-000000000019',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Anda baru menyelesaikan pelatihan tentang metode kerja terbaru yang belum diterapkan di instansi Anda. Anda yakin metode ini akan meningkatkan efisiensi kerja. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Langsung menerapkan metode baru tersebut di pekerjaan Anda sendiri tanpa memberi tahu rekan atau atasan"},{"id":"B","text":"Mendokumentasikan hasil pelatihan, menyusun proposal implementasi, dan mempresentasikannya kepada atasan beserta data manfaat dan risikonya"},{"id":"C","text":"Menunggu ada kebijakan resmi dari pimpinan untuk menerapkan metode baru tersebut"},{"id":"D","text":"Berbagi pengetahuan dengan rekan-rekan melalui sesi berbagi informal dan mendorong mereka untuk mencobanya"},{"id":"E","text":"Melaporkan hasil pelatihan kepada atasan dan menunggu instruksi selanjutnya"}]',
  'B',
  '{"A":3,"B":5,"C":1,"D":4,"E":2}',
  'Opsi B mendapat nilai tertinggi karena menunjukkan nilai Adaptif (inovatif dan bersedia berubah) sekaligus Akuntabel (menyusun proposal dengan data dan meminta persetujuan formal). Mengajukan proposal terstruktur kepada atasan adalah cara yang tepat untuk mendorong inovasi dalam birokrasi sambil menghormati prosedur. Berbagi pengetahuan dengan rekan (D) juga baik untuk membangun kapasitas tim. Melaporkan dan menunggu instruksi (E) terlalu pasif. Menerapkan sendiri tanpa pemberitahuan (A) bisa menimbulkan inkonsistensi kerja. Menunggu kebijakan resmi tanpa inisiatif apapun (C) menghambat inovasi.',
  ARRAY['sering-keluar','profesionalisme','adaptif','inovatif','kompeten']
),

(
  'aa300001-0000-0000-0000-000000000020',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Anda mendapat tugas mendadak dari pimpinan yang harus diselesaikan hari ini, padahal Anda sudah memiliki beberapa pekerjaan dengan deadline yang sama. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menerima tugas baru dan menyelesaikan semua pekerjaan dengan kualitas seadanya agar semuanya selesai hari ini"},{"id":"B","text":"Menolak tugas baru dengan alasan sudah terlalu banyak pekerjaan"},{"id":"C","text":"Menyampaikan kepada pimpinan daftar pekerjaan yang sudah ada, meminta panduan prioritas, dan menawarkan opsi solusi seperti meminta bantuan rekan atau penjadwalan ulang"},{"id":"D","text":"Menerima tugas baru, mengerjakan semuanya, dan meminta rekan membantu tanpa koordinasi dengan atasan"},{"id":"E","text":"Menerima tugas baru dan menyelesaikannya terlebih dahulu karena berasal dari pimpinan, lalu mengerjakan tugas sebelumnya"}]',
  'C',
  '{"A":2,"B":1,"C":5,"D":3,"E":4}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan komunikasi yang transparan dan manajemen kerja yang cerdas: menginformasikan situasi kepada pimpinan, meminta panduan prioritas, dan menawarkan solusi. Ini mencerminkan nilai Akuntabel (transparan tentang kapasitas) dan Kolaboratif (mencari solusi bersama). Mengerjakan tugas pimpinan dulu (E) memiliki logika hierarki namun mengabaikan komitmen sebelumnya. Meminta bantuan rekan tanpa koordinasi atasan (D) kurang transparan. Mengerjakan semua dengan kualitas rendah (A) mengorbankan mutu output. Menolak tugas pimpinan (B) bersikap konfrontatif dan tidak profesional.',
  ARRAY['sering-keluar','profesionalisme','manajemen-waktu','komunikasi','akuntabel']
),

-- ============================================================
-- ANTI RADIKALISME (021-028)
-- ============================================================

(
  'aa300001-0000-0000-0000-000000000021',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Anti Radikalisme', 'TKP_SCALE', 'SEDANG', 8,
  'Seorang rekan kerja Anda kerap menyebarkan konten di grup WhatsApp kantor yang berisi ujaran kebencian terhadap kelompok agama tertentu. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Mengabaikan konten tersebut karena itu urusan pribadi rekan dan bukan tanggung jawab Anda"},{"id":"B","text":"Ikut membagikan konten tersebut jika sesuai dengan keyakinan pribadi Anda"},{"id":"C","text":"Secara pribadi mengingatkan rekan bahwa konten tersebut tidak pantas dan berpotensi memecah belah, serta melaporkan kepada atasan jika berlanjut"},{"id":"D","text":"Langsung melaporkan rekan kepada pihak berwajib tanpa memberi kesempatan untuk klarifikasi"},{"id":"E","text":"Meninggalkan grup WhatsApp tersebut agar tidak terlibat"}]',
  'C',
  '{"A":2,"B":1,"C":5,"D":3,"E":4}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan sikap proaktif dan bertahap dalam mencegah radikalisme di lingkungan kerja. Mengingatkan rekan secara personal terlebih dahulu mencerminkan nilai Harmonis (menjaga persatuan) dan Loyal (terhadap NKRI dan Pancasila). ASN memiliki kewajiban untuk menjaga netralitas dan mempromosikan persatuan bangsa sesuai Pasal 9 UU ASN. Meninggalkan grup (E) menghindari keterlibatan namun tidak menyelesaikan masalah. Melaporkan langsung ke polisi (D) proporsional jika sudah ada tindak pidana yang jelas. Mengabaikan (A) membiarkan intoleransi berkembang. Ikut menyebarkan (B) adalah tindakan paling berbahaya.',
  ARRAY['sering-keluar','anti-radikalisme','toleransi','pancasila','bhinneka']
),

(
  'aa300001-0000-0000-0000-000000000022',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Anti Radikalisme', 'TKP_SCALE', 'SEDANG', 8,
  'Anda mendapati bahwa ada warga yang mengajukan permohonan layanan di instansi Anda sambil mengungkapkan pandangan yang tampak ekstrem dan anti-Pancasila dalam percakapan. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menolak melayani warga tersebut dan mengusirnya dari kantor"},{"id":"B","text":"Melayani kebutuhan administrasi warga dengan profesional, namun juga menyisipkan pesan tentang pentingnya nilai persatuan dengan cara santun"},{"id":"C","text":"Mendebat pandangan ekstrem warga tersebut secara langsung di loket untuk meluruskannya"},{"id":"D","text":"Melayani warga seperti biasa dan melaporkan pernyataan yang terindikasi mengancam persatuan kepada atasan atau pihak yang berwenang sesuai prosedur"},{"id":"E","text":"Merekam percakapan dengan warga dan mempostingnya di media sosial sebagai peringatan publik"}]',
  'D',
  '{"A":1,"B":4,"C":2,"D":5,"E":3}',
  'Opsi D mendapat nilai tertinggi karena ASN harus memisahkan antara kewajiban melayani (tanpa diskriminasi) dan kewajiban menjaga keamanan negara. Melayani warga secara profesional sambil melaporkan pernyataan yang mengancam persatuan melalui jalur yang tepat adalah tindakan yang paling akuntabel dan sesuai prosedur. Menyisipkan pesan persatuan (B) adalah niat yang baik namun berisiko memicu konflik. Merekam dan memposting (E) melanggar privasi dan berpotensi kontraproduktif. Mendebat di loket (C) tidak profesional. Menolak melayani (A) merupakan diskriminasi yang melanggar hak warga.',
  ARRAY['sering-keluar','anti-radikalisme','netralitas','pelayanan-publik','keamanan-negara']
),

(
  'aa300001-0000-0000-0000-000000000023',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Anti Radikalisme', 'TKP_SCALE', 'SEDANG', 8,
  'Anda menerima undangan dari sebuah organisasi untuk menghadiri seminar yang ternyata berisi materi yang bertentangan dengan Pancasila dan NKRI. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menghadiri seminar tersebut karena ingin tahu isi materinya secara langsung"},{"id":"B","text":"Menolak undangan, melaporkan keberadaan seminar tersebut kepada atasan atau pihak berwenang"},{"id":"C","text":"Menghadiri seminar dan berdebat dengan pembicara untuk membantah materi yang menyimpang"},{"id":"D","text":"Menghadiri sebagian saja dan meninggalkan seminar jika materi mulai menyimpang"},{"id":"E","text":"Menolak undangan tanpa melakukan tindakan apapun karena dianggap bukan urusan Anda"}]',
  'B',
  '{"A":2,"B":5,"C":3,"D":1,"E":4}',
  'Opsi B mendapat nilai tertinggi karena ASN memiliki kewajiban untuk tidak terlibat dalam kegiatan yang bertentangan dengan Pancasila dan NKRI sesuai UU ASN, sekaligus memiliki tanggung jawab untuk melaporkan potensi ancaman persatuan kepada pihak berwenang. Menolak dan melaporkan adalah tindakan yang paling tepat dan berimplikasi positif pada keamanan negara. Menolak tanpa tindak lanjut (E) kurang bertanggung jawab. Hadir dan berdebat (C) berisiko. Menghadiri untuk mengetahui isinya (A) berisiko memberikan dukungan tidak langsung. Menghadiri sebagian (D) adalah tindakan paling tidak konsisten dan berisiko.',
  ARRAY['sering-keluar','anti-radikalisme','pancasila','nkri','kewaspadaan']
),

(
  'aa300001-0000-0000-0000-000000000024',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Anti Radikalisme', 'TKP_SCALE', 'SEDANG', 8,
  'Di media sosial, Anda melihat berita yang mengklaim bahwa sistem pemerintahan Indonesia perlu diganti dengan sistem yang berdasarkan ideologi tertentu di luar Pancasila. Beberapa teman Anda menyetujui dan membagikan berita ini. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Ikut membagikan berita tersebut karena banyak teman yang setuju dan mungkin ada benarnya"},{"id":"B","text":"Tidak membagikan berita tersebut dan membiarkan teman-teman yang lain memutuskan sendiri"},{"id":"C","text":"Memverifikasi kebenaran berita, kemudian merespons dengan informasi yang akurat tentang sistem pemerintahan dan nilai Pancasila secara santun"},{"id":"D","text":"Langsung memblokir teman-teman yang membagikan berita tersebut"},{"id":"E","text":"Melapor ke Kominfo agar berita tersebut segera diturunkan"}]',
  'C',
  '{"A":1,"B":3,"C":5,"D":2,"E":4}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan peran aktif ASN sebagai agen perubahan dan penjaga nilai Pancasila di ruang digital. Memverifikasi berita dan merespons dengan informasi akurat secara santun adalah tindakan yang mencerminkan literasi digital yang baik sekaligus komitmen terhadap NKRI. Melaporkan ke Kominfo (E) juga tepat untuk konten yang melanggar hukum. Tidak membagikan namun diam (B) kurang aktif. Memblokir teman (D) tidak menyelesaikan masalah dan bisa meningkatkan polarisasi. Ikut membagikan (A) adalah tindakan terburuk yang menyebarkan konten anti-Pancasila.',
  ARRAY['sering-keluar','anti-radikalisme','literasi-digital','pancasila','media-sosial']
),

(
  'aa300001-0000-0000-0000-000000000025',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Anti Radikalisme', 'TKP_SCALE', 'SEDANG', 8,
  'Seorang anggota keluarga dekat Anda mulai menunjukkan gejala terpapar paham radikal, sering berbicara tentang kebencian terhadap pemerintah dan kelompok tertentu. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Memutus hubungan dengan anggota keluarga tersebut agar tidak ikut terpengaruh"},{"id":"B","text":"Mengajak anggota keluarga berdialog, mendengarkan kekhawatirannya, meluruskan persepsi yang keliru, dan jika diperlukan mencari bantuan profesional atau BNPT"},{"id":"C","text":"Melaporkan langsung anggota keluarga kepada polisi karena berpotensi berbahaya"},{"id":"D","text":"Mengabaikan karena itu hanyalah ekspresi kebebasan berpendapat"},{"id":"E","text":"Membicarakan hal ini kepada teman-teman agar mereka juga menjauh dari anggota keluarga tersebut"}]',
  'B',
  '{"A":2,"B":5,"C":3,"D":1,"E":4}',
  'Opsi B mendapat nilai tertinggi karena menunjukkan pendekatan yang paling manusiawi dan efektif dalam mencegah radikalisasi: dialog, mendengarkan, meluruskan, dan mencari bantuan profesional jika perlu. BNPT (Badan Nasional Penanggulangan Terorisme) memiliki program deradikalisasi yang dapat membantu. Melaporkan ke polisi (C) mungkin diperlukan jika sudah ada rencana tindakan nyata, namun untuk keluarga lebih tepat pendekatan dialog dulu. Memutus hubungan (A) melepaskan kesempatan untuk mencegah radikalisasi lebih jauh. Membicarakan kepada teman (E) tidak konstruktif. Mengabaikan (D) membiarkan radikalisasi berkembang.',
  ARRAY['sering-keluar','anti-radikalisme','deradikalisasi','keluarga','BNPT']
),

(
  'aa300001-0000-0000-0000-000000000026',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Anti Radikalisme', 'TKP_SCALE', 'SEDANG', 8,
  'Anda mengetahui bahwa salah satu staf di unit Anda aktif di organisasi yang diduga menyebarkan paham intoleransi, meskipun prestasinya di kantor baik. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Tidak melakukan apa-apa karena prestasinya di kantor baik dan urusan di luar kantor adalah urusan pribadi"},{"id":"B","text":"Menegur staf tersebut dan memintanya keluar dari organisasi tersebut segera"},{"id":"C","text":"Mengumpulkan informasi yang memadai tentang organisasi tersebut, kemudian melaporkan kepada atasan atau bagian kepegawaian dengan data yang valid"},{"id":"D","text":"Mendekati staf tersebut secara personal untuk berdiskusi tentang pandangan-pandangannya dan dampaknya bagi citra instansi"},{"id":"E","text":"Langsung melaporkan kepada BIN atau Polri tanpa koordinasi internal terlebih dahulu"}]',
  'C',
  '{"A":1,"B":3,"C":5,"D":4,"E":2}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan pendekatan yang terukur dan berbasis bukti. Mengumpulkan informasi yang valid sebelum melaporkan melalui jalur internal (atasan atau kepegawaian) adalah tindakan yang akuntabel, profesional, dan menghindari fitnah. Mendekati staf secara personal untuk berdiskusi (D) juga konstruktif sebagai langkah awal. Menegur dan meminta keluar (B) melampaui kewenangan tanpa prosedur. Langsung ke BIN/Polri (E) melompati prosedur internal. Mengabaikan karena prestasi baik (A) adalah tindakan terburuk — prestasi kerja tidak menghapus kewajiban menjaga integritas dan keamanan negara.',
  ARRAY['sering-keluar','anti-radikalisme','integritas','pelaporan','prosedur']
),

(
  'aa300001-0000-0000-0000-000000000027',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Anti Radikalisme', 'TKP_SCALE', 'SEDANG', 8,
  'Dalam perjalanan tugas ke daerah, Anda melihat beberapa pemuda setempat sedang mendengarkan ceramah yang berisi hasutan untuk tidak taat kepada pemerintah dan membenci kelompok lain. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Bergabung dan mendengarkan ceramah tersebut untuk mengetahui isi lengkapnya"},{"id":"B","text":"Mengintervensi ceramah tersebut secara langsung dan berdebat dengan penceramah di depan umum"},{"id":"C","text":"Memotret atau merekam situasi tersebut dan segera melaporkan kepada pihak berwenang setempat dengan deskripsi yang jelas"},{"id":"D","text":"Mengabaikan karena itu bukan wilayah tanggung jawab Anda"},{"id":"E","text":"Mendekati beberapa pemuda setelah ceramah selesai untuk memberikan perspektif lain tentang persatuan dan nilai Pancasila"}]',
  'C',
  '{"A":2,"B":3,"C":5,"D":1,"E":4}',
  'Opsi C mendapat nilai tertinggi karena tindakan melaporkan kepada pihak berwenang setempat dengan bukti yang jelas adalah respons yang paling tepat, aman, dan efektif dalam situasi potensi ancaman ketertiban. ASN memiliki kewajiban melaporkan ancaman terhadap persatuan bangsa kepada pihak yang berwenang. Mendekati pemuda untuk berbagi perspektif (E) adalah niat mulia namun berisiko dalam konteks ceramah langsung. Mengintervensi ceramah secara langsung (B) dapat memancing konflik. Bergabung mendengarkan (A) dapat dianggap sebagai pembenaran. Mengabaikan (D) adalah tindakan terburuk yang membiarkan potensi ancaman berkembang.',
  ARRAY['sering-keluar','anti-radikalisme','kewarganegaraan','pelaporan','keamanan-negara']
),

(
  'aa300001-0000-0000-0000-000000000028',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Anti Radikalisme', 'TKP_SCALE', 'SEDANG', 8,
  'Instansi Anda akan mengadakan peringatan hari besar nasional. Seorang rekan mengusulkan agar tidak mengundang salah satu kelompok masyarakat dengan alasan perbedaan pandangan politik. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menyetujui usulan rekan karena perbedaan pandangan politik memang sebaiknya dihindari"},{"id":"B","text":"Diam dan mengikuti keputusan yang diambil oleh mayoritas dalam rapat"},{"id":"C","text":"Menolak usulan tersebut dan menjelaskan bahwa peringatan hari nasional harus inklusif untuk semua elemen masyarakat tanpa memandang perbedaan"},{"id":"D","text":"Mengusulkan agar undangan dikirim kepada semua kelompok masyarakat sesuai prinsip kesetaraan dan bhinneka tunggal ika"},{"id":"E","text":"Meminta atasan untuk memutuskan dan tidak ingin terlibat dalam perdebatan"}]',
  'D',
  '{"A":1,"B":2,"C":4,"D":5,"E":3}',
  'Opsi D mendapat nilai tertinggi karena tidak hanya menolak diskriminasi (seperti C), tetapi juga langsung menawarkan solusi konkret yang sesuai dengan prinsip Bhinneka Tunggal Ika dan Pancasila Sila ke-5 (Keadilan Sosial). Mengusulkan undangan untuk semua kelompok adalah tindakan yang paling konstruktif dan inklusif. Menolak dan menjelaskan (C) juga baik namun kurang memberikan solusi konkret. Meminta atasan memutuskan (E) menghindari tanggung jawab. Diam mengikuti mayoritas (B) tidak menunjukkan nilai-nilai kebangsaan. Menyetujui diskriminasi (A) bertentangan dengan Pancasila dan UUD 1945.',
  ARRAY['sering-keluar','anti-radikalisme','bhinneka','inklusivitas','pancasila']
),

-- ============================================================
-- JEJARING KERJA (029-036)
-- ============================================================

(
  'aa300001-0000-0000-0000-000000000029',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Jejaring Kerja', 'TKP_SCALE', 'SEDANG', 5,
  'Anda baru bergabung di instansi baru. Untuk memperlancar pekerjaan, Anda perlu membangun hubungan dengan rekan dari divisi lain. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menunggu rekan dari divisi lain yang lebih dulu menyapa dan mengajak berkenalan"},{"id":"B","text":"Aktif memperkenalkan diri kepada rekan dari divisi lain, menunjukkan ketertarikan pada pekerjaan mereka, dan mencari titik temu kolaborasi"},{"id":"C","text":"Fokus pada pekerjaan di divisi sendiri terlebih dahulu sampai benar-benar menguasai tugas"},{"id":"D","text":"Membangun hubungan hanya dengan rekan yang diperkirakan dapat membantu pekerjaan Anda"},{"id":"E","text":"Meminta atasan untuk memperkenalkan Anda kepada rekan di divisi lain secara resmi"}]',
  'B',
  '{"A":2,"B":5,"C":3,"D":1,"E":4}',
  'Opsi B mendapat nilai tertinggi karena proaktif dalam membangun jejaring, menunjukkan ketertarikan tulus pada pekerjaan orang lain, dan berorientasi pada kolaborasi yang saling menguntungkan. Ini mencerminkan nilai Kolaboratif dalam BerAKHLAK — membangun kerja sama lintas unit untuk tujuan yang lebih besar. Meminta atasan memperkenalkan (E) adalah cara yang sopan dan terstruktur. Fokus pada pekerjaan sendiri dulu (C) cukup pragmatis. Menunggu disapa (A) kurang inisiatif. Membangun hubungan hanya dengan yang bermanfaat (D) bersifat oportunistik dan tidak membangun ekosistem kerja yang sehat.',
  ARRAY['sering-keluar','jejaring-kerja','kolaboratif','inisiatif','komunikasi']
),

(
  'aa300001-0000-0000-0000-000000000030',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Jejaring Kerja', 'TKP_SCALE', 'SEDANG', 5,
  'Anda sedang mengerjakan proyek penting dan membutuhkan data dari unit lain. Namun, rekan di unit tersebut tidak merespons email Anda sudah beberapa hari. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menunggu respons email sambil terus bekerja pada bagian lain yang tidak membutuhkan data tersebut"},{"id":"B","text":"Langsung melapor ke atasan bahwa rekan di unit lain tidak kooperatif"},{"id":"C","text":"Menghubungi rekan melalui telepon atau tatap muka untuk menanyakan status data, sambil menjelaskan urgensi kebutuhan data tersebut"},{"id":"D","text":"Mencari data dari sumber lain yang tersedia sebagai alternatif"},{"id":"E","text":"Mengajukan permintaan formal melalui surat resmi antar unit kepada kepala unit terkait"}]',
  'C',
  '{"A":3,"B":2,"C":5,"D":4,"E":1}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan komunikasi proaktif dan efektif. Menghubungi langsung via telepon atau tatap muka dengan menjelaskan urgensi adalah cara yang paling cepat dan membangun hubungan positif. Email bisa tidak terbaca karena berbagai alasan, sehingga tindak lanjut langsung menunjukkan inisiatif. Mencari alternatif (D) juga pragmatis jika komunikasi gagal. Menunggu saja (A) berisiko menghambat proyek. Melaporkan sebagai tidak kooperatif (B) terlalu dini sebelum mencoba komunikasi langsung. Surat resmi antar unit (E) terlalu birokratis untuk kebutuhan yang urgen.',
  ARRAY['sering-keluar','jejaring-kerja','komunikasi','kolaboratif','proaktif']
),

(
  'aa300001-0000-0000-0000-000000000031',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Jejaring Kerja', 'TKP_SCALE', 'SEDANG', 5,
  'Anda memiliki keahlian khusus yang tidak dimiliki rekan-rekan di unit lain. Rekan dari unit lain sering meminta bantuan Anda sehingga mengganggu pekerjaan utama Anda. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menolak semua permintaan bantuan dari unit lain untuk menjaga fokus pada pekerjaan sendiri"},{"id":"B","text":"Selalu membantu kapanpun diminta meskipun pekerjaan utama Anda terbengkalai"},{"id":"C","text":"Menyampaikan kepada atasan tentang situasi ini dan mengusulkan agar keahlian Anda diformalkan dalam bentuk pelatihan atau SOP yang dapat digunakan semua unit"},{"id":"D","text":"Membantu rekan hanya di luar jam kerja utama atau saat jeda, sambil menetapkan batasan yang jelas"},{"id":"E","text":"Mengembangkan panduan atau modul sederhana tentang keahlian tersebut agar rekan dapat belajar mandiri"}]',
  'C',
  '{"A":1,"B":2,"C":5,"D":4,"E":3}',
  'Opsi C mendapat nilai tertinggi karena memberikan solusi sistemik, bukan hanya solusi individual. Melaporkan situasi kepada atasan dan mengusulkan formalisasi keahlian melalui pelatihan atau SOP adalah tindakan yang paling berdampak: menyelesaikan masalah jangka panjang, mengembangkan kapasitas organisasi, dan menjaga produktivitas pribadi. Membantu di luar jam kerja utama dengan batasan (D) adalah solusi pragmatis. Membuat panduan mandiri (E) adalah langkah yang baik namun tidak menyelesaikan masalah secara sistemik. Selalu membantu tanpa batas (B) mengorbankan produktivitas. Menolak semua (A) tidak kolaboratif.',
  ARRAY['sering-keluar','jejaring-kerja','kolaboratif','kompeten','solusi-sistemik']
),

(
  'aa300001-0000-0000-0000-000000000032',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Jejaring Kerja', 'TKP_SCALE', 'SEDANG', 5,
  'Dalam rapat lintas unit, Anda menyadari ada miskomunikasi besar antara dua unit yang menyebabkan duplikasi pekerjaan dan pemborosan sumber daya. Anda bukan pemimpin rapat tersebut. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Diam dan menunggu pemimpin rapat yang menyadari dan menangani masalah tersebut"},{"id":"B","text":"Memotong pembicaraan untuk langsung menyalahkan salah satu unit yang dianggap penyebab miskomunikasi"},{"id":"C","text":"Angkat bicara dengan sopan, menjelaskan miskomunikasi yang teridentifikasi menggunakan data yang ada, dan mengusulkan mekanisme koordinasi yang lebih baik"},{"id":"D","text":"Menuliskan temuan tersebut dalam notulen rapat dan menyampaikannya kepada atasan setelah rapat selesai"},{"id":"E","text":"Berbicara secara pribadi kepada pemimpin rapat di sela-sela jeda untuk menyampaikan temuan tersebut"}]',
  'C',
  '{"A":2,"B":1,"C":5,"D":3,"E":4}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan keberanian dan inisiatif untuk berbicara dalam forum, namun dengan cara yang konstruktif: menggunakan data, berbicara dengan sopan, dan langsung menawarkan solusi. Ini mencerminkan nilai Kolaboratif (membangun kerja sama antar unit) dan Kompeten (mengidentifikasi dan menyelesaikan masalah). Berbicara pribadi ke pemimpin rapat (E) juga baik sebagai pendekatan yang tidak mengganggu. Mencatat dan melaporkan setelah rapat (D) kurang timely. Menunggu pemimpin menyadari (A) membiarkan rapat tidak efisien. Menyalahkan salah satu unit (B) menimbulkan konflik dan tidak menyelesaikan masalah.',
  ARRAY['sering-keluar','jejaring-kerja','kolaboratif','komunikasi','inisiatif']
),

(
  'aa300001-0000-0000-0000-000000000033',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Jejaring Kerja', 'TKP_SCALE', 'SEDANG', 5,
  'Anda mendapat undangan dari lembaga luar pemerintah untuk berbicara tentang program kerja instansi Anda. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menerima undangan dan mempersiapkan materi presentasi berdasarkan pengetahuan Anda tentang program instansi"},{"id":"B","text":"Menolak undangan karena tidak ingin mengekspos informasi internal instansi kepada pihak luar"},{"id":"C","text":"Melaporkan undangan kepada atasan, meminta arahan tentang informasi yang boleh disampaikan, dan jika diizinkan mempersiapkan materi yang sesuai"},{"id":"D","text":"Menerima undangan dan hanya berbicara tentang informasi yang sudah dipublikasikan secara resmi oleh instansi"},{"id":"E","text":"Meneruskan undangan kepada atasan dan menyarankan agar atasan yang mewakili"}]',
  'C',
  '{"A":2,"B":3,"C":5,"D":4,"E":1}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan akuntabilitas dan tata kelola yang baik: melaporkan kepada atasan terlebih dahulu, meminta arahan tentang batasan informasi, kemudian bertindak sesuai izin. Ini mencerminkan nilai Loyal (menghormati kebijakan instansi) dan Akuntabel (transparansi kepada pimpinan). Berbicara hanya dengan informasi publik (D) cukup aman namun tetap sebaiknya dikomunikasikan ke atasan. Menolak tanpa alasan yang proporsional (B) melewatkan kesempatan membangun jejaring dan citra positif instansi. Menerima langsung tanpa koordinasi (A) berisiko membocorkan informasi sensitif. Meneruskan sepenuhnya ke atasan (E) menghindari tanggung jawab.',
  ARRAY['sering-keluar','jejaring-kerja','akuntabel','loyal','tata-kelola']
),

(
  'aa300001-0000-0000-0000-000000000034',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Jejaring Kerja', 'TKP_SCALE', 'SEDANG', 5,
  'Anda menyadari bahwa hubungan antara instansi Anda dengan instansi mitra sangat renggang sehingga koordinasi program sering terhambat. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menganggap hal tersebut sebagai hal yang normal dalam birokrasi dan tidak perlu diubah"},{"id":"B","text":"Mengusulkan kepada atasan untuk mengadakan pertemuan informal atau kegiatan bersama dengan instansi mitra guna mempererat hubungan"},{"id":"C","text":"Secara personal membangun hubungan baik dengan staf instansi mitra dan berbagi informasi yang bermanfaat untuk kedua belah pihak"},{"id":"D","text":"Menunggu pimpinan untuk mengambil inisiatif memerbaiki hubungan antar instansi"},{"id":"E","text":"Melaporkan kepada atasan bahwa koordinasi dengan instansi mitra bermasalah dan meminta solusi"}]',
  'B',
  '{"A":1,"B":5,"C":4,"D":2,"E":3}',
  'Opsi B mendapat nilai tertinggi karena mengusulkan solusi sistemik yang melibatkan otoritas yang tepat (atasan), yaitu pertemuan atau kegiatan bersama yang secara formal mempererat hubungan antar instansi. Ini mencerminkan nilai Kolaboratif dan Adaptif: mendorong perubahan positif melalui jalur yang tepat. Membangun hubungan personal dengan staf mitra (C) juga efektif pada level operasional. Melaporkan masalah ke atasan (E) informatif namun kurang proaktif. Menunggu pimpinan (D) pasif. Menganggap hal tersebut normal (A) adalah penerimaan buta atas status quo yang merugikan kinerja organisasi.',
  ARRAY['sering-keluar','jejaring-kerja','kolaboratif','adaptif','koordinasi-antar-instansi']
),

(
  'aa300001-0000-0000-0000-000000000035',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Jejaring Kerja', 'TKP_SCALE', 'SEDANG', 5,
  'Anda menerima informasi dari rekan di instansi lain tentang kebijakan baru yang akan segera diberlakukan dan relevan dengan pekerjaan Anda. Informasi ini belum resmi diumumkan. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Langsung menyebarkan informasi tersebut kepada seluruh staf di unit Anda agar mereka bersiap"},{"id":"B","text":"Menyimpan informasi tersebut untuk diri sendiri sebagai keunggulan kompetitif"},{"id":"C","text":"Menyampaikan informasi tersebut kepada atasan, menjelaskan sumbernya, dan mendiskusikan persiapan apa yang perlu dilakukan"},{"id":"D","text":"Memverifikasi kebenaran informasi tersebut melalui saluran resmi sebelum mengambil tindakan apapun"},{"id":"E","text":"Meminta konfirmasi dari rekan instansi lain apakah informasi tersebut sudah boleh disebarkan"}]',
  'C',
  '{"A":3,"B":1,"C":5,"D":4,"E":2}',
  'Opsi C mendapat nilai tertinggi karena menyampaikan informasi kepada atasan dengan menyebutkan sumber dan mendiskusikan implikasinya adalah tindakan yang paling akuntabel dan strategis. Atasan dapat menentukan langkah yang tepat: memverifikasi secara resmi, mempersiapkan tim, atau menunggu. Memverifikasi melalui saluran resmi (D) juga baik sebagai langkah kehati-hatian. Menyebarkan langsung ke staf (A) berisiko menyebarkan informasi belum terverifikasi. Meminta konfirmasi ke rekan saja (E) melewati hirarki yang seharusnya mengetahui lebih dulu. Menyimpan untuk keunggulan sendiri (B) tidak kolaboratif dan merugikan organisasi.',
  ARRAY['sering-keluar','jejaring-kerja','akuntabel','informasi','transparansi']
),

(
  'aa300001-0000-0000-0000-000000000036',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Jejaring Kerja', 'TKP_SCALE', 'SEDANG', 5,
  'Anda diminta menjadi perwakilan instansi dalam forum koordinasi lintas kementerian. Ini adalah pertama kalinya Anda hadir dalam forum tersebut. Apa yang Anda lakukan sebelum dan saat forum berlangsung?',
  '[{"id":"A","text":"Hadir ke forum tanpa persiapan khusus karena hanya perlu menyampaikan kondisi terkini instansi"},{"id":"B","text":"Mempelajari latar belakang forum, mengumpulkan data dan posisi instansi terkait agenda yang akan dibahas, mempersiapkan diri untuk berkontribusi aktif, dan membawa catatan terstruktur"},{"id":"C","text":"Meminta atasan yang lebih berpengalaman untuk menggantikan Anda di forum tersebut"},{"id":"D","text":"Hadir dan lebih banyak mendengarkan tanpa banyak berbicara karena masih baru"},{"id":"E","text":"Mempelajari agenda forum dan menyiapkan satu-dua poin penting yang akan Anda sampaikan"}]',
  'B',
  '{"A":1,"B":5,"C":2,"D":3,"E":4}',
  'Opsi B mendapat nilai tertinggi karena persiapan yang komprehensif menunjukkan profesionalisme dan komitmen terhadap kepentingan instansi. Memahami konteks, mengumpulkan data, dan bersiap berkontribusi aktif memastikan bahwa instansi terwakili dengan baik dan forum berjalan produktif. Menyiapkan beberapa poin penting (E) juga cukup baik sebagai persiapan minimal. Hadir dan lebih banyak mendengarkan (D) aman namun melewatkan kesempatan berkontribusi. Meminta digantikan (C) menghindari tanggung jawab. Hadir tanpa persiapan (A) berisiko merugikan kepentingan instansi dalam forum koordinasi penting.',
  ARRAY['sering-keluar','jejaring-kerja','profesionalisme','persiapan','representasi']
),

-- ============================================================
-- SOSIAL BUDAYA (037-043)
-- ============================================================

(
  'aa300001-0000-0000-0000-000000000037',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Sosial Budaya', 'TKP_SCALE', 'SEDANG', 5,
  'Anda ditugaskan bekerja di daerah dengan budaya dan adat yang sangat berbeda dari daerah asal Anda. Beberapa kebiasaan setempat terasa asing bagi Anda. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Tetap mempertahankan kebiasaan dari daerah asal karena itu adalah identitas Anda"},{"id":"B","text":"Mempelajari budaya dan adat setempat, menghormatinya dalam interaksi sehari-hari, dan beradaptasi sejauh tidak bertentangan dengan nilai-nilai yang Anda pegang"},{"id":"C","text":"Bergaul hanya dengan rekan yang berasal dari daerah yang sama untuk merasa lebih nyaman"},{"id":"D","text":"Menghindari semua adat setempat karena khawatir melakukan kesalahan"},{"id":"E","text":"Mengikuti semua kebiasaan setempat sepenuhnya meskipun bertentangan dengan keyakinan Anda"}]',
  'B',
  '{"A":2,"B":5,"C":1,"D":3,"E":4}',
  'Opsi B mendapat nilai tertinggi karena menunjukkan sikap adaptif yang seimbang: mempelajari dan menghormati budaya setempat sambil tetap mempertahankan integritas nilai-nilai personal. Ini mencerminkan nilai Harmonis dalam BerAKHLAK — menghargai perbedaan dan membangun lingkungan yang inklusif — serta semangat Bhinneka Tunggal Ika. Mengikuti semua kebiasaan (E) menunjukkan sikap akomodatif namun tanpa filterisasi nilai. Menghindari semua adat (D) terlalu kaku dan tidak adaptif. Mempertahankan kebiasaan asal (A) kurang adaptif. Bergaul hanya dengan sesama daerah (C) adalah tindakan terburuk yang mempersempit wawasan dan menghambat integrasi.',
  ARRAY['sering-keluar','sosial-budaya','adaptif','harmonis','bhinneka','multikulturalisme']
),

(
  'aa300001-0000-0000-0000-000000000038',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Sosial Budaya', 'TKP_SCALE', 'SEDANG', 5,
  'Di kantor Anda bekerja orang-orang dari berbagai latar belakang agama dan suku. Ada rekan yang sering membuat komentar yang meskipun tidak sengaja, terkesan merendahkan suku tertentu. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Tertawa bersama karena itu hanya candaan yang tidak perlu ditanggapi serius"},{"id":"B","text":"Diam karena tidak ingin membuat suasana canggung dengan merespons komentar tersebut"},{"id":"C","text":"Menegur rekan secara langsung di depan semua orang agar tidak mengulangi komentar tersebut"},{"id":"D","text":"Berbicara secara pribadi dengan rekan tersebut, menjelaskan bahwa komentar tersebut dapat menyakiti rekan lain meskipun tidak disengaja"},{"id":"E","text":"Melaporkan langsung kepada bagian kepegawaian atau HRD tanpa mencoba pendekatan personal terlebih dahulu"}]',
  'D',
  '{"A":1,"B":2,"C":3,"D":5,"E":4}',
  'Opsi D mendapat nilai tertinggi karena menunjukkan pendekatan yang paling efektif dan menghormati martabat semua pihak. Berbicara secara pribadi dengan rekan menjelaskan dampak komentar tanpa mempermalukan di depan umum mencerminkan nilai Harmonis dalam BerAKHLAK. Pendekatan ini lebih mungkin mengubah perilaku jangka panjang dibandingkan teguran publik. Melaporkan ke HRD (E) tepat jika pendekatan personal gagal. Menegur di depan umum (C) mungkin efektif mencegah pengulangan namun mempermalukan rekan. Diam (B) membiarkan lingkungan kerja yang tidak nyaman. Tertawa bersama (A) memberi kesan menyetujui komentar diskriminatif.',
  ARRAY['sering-keluar','sosial-budaya','harmonis','toleransi','keberagaman','komunikasi']
),

(
  'aa300001-0000-0000-0000-000000000039',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Sosial Budaya', 'TKP_SCALE', 'SEDANG', 5,
  'Anda mendapat tugas sosialisasi program pemerintah kepada masyarakat di daerah terpencil yang mayoritas penduduknya menggunakan bahasa daerah dan tingkat pendidikannya rendah. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menyampaikan materi sosialisasi dalam bahasa Indonesia yang baku dan formal sesuai standar resmi pemerintah"},{"id":"B","text":"Mempelajari dasar-dasar bahasa daerah setempat, menggunakan alat peraga visual, dan berkoordinasi dengan tokoh masyarakat lokal untuk membantu proses sosialisasi"},{"id":"C","text":"Meminta warga yang bisa berbahasa Indonesia untuk menerjemahkan materi kepada yang lain"},{"id":"D","text":"Menyerahkan brosur materi sosialisasi dan meminta warga membacanya sendiri"},{"id":"E","text":"Meminta atasan untuk menugaskan orang lain yang lebih paham bahasa daerah setempat"}]',
  'B',
  '{"A":2,"B":5,"C":3,"D":1,"E":4}',
  'Opsi B mendapat nilai tertinggi karena menunjukkan adaptasi komunikasi yang komprehensif dan inklusif. Mempelajari dasar bahasa daerah menunjukkan respek kepada masyarakat, alat peraga visual mengatasi hambatan literasi, dan melibatkan tokoh masyarakat lokal meningkatkan kepercayaan dan efektivitas sosialisasi. Ini mencerminkan nilai Berorientasi Pelayanan (memahami kebutuhan masyarakat) dan Adaptif (menyesuaikan pendekatan). Memanfaatkan penerjemah lokal (C) juga cukup efektif. Meminta orang yang lebih paham (E) menghindari tanggung jawab. Bahasa baku tanpa adaptasi (A) kurang efektif. Menyerahkan brosur tanpa pendampingan (D) tidak responsif.',
  ARRAY['sering-keluar','sosial-budaya','komunikasi','adaptif','inklusi','sosialisasi']
),

(
  'aa300001-0000-0000-0000-000000000040',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Sosial Budaya', 'TKP_SCALE', 'SEDANG', 5,
  'Instansi Anda merencanakan acara perayaan tahunan. Ada usulan untuk mengadakan pertunjukan seni budaya dari berbagai daerah. Namun, beberapa rekan menolak dengan alasan memakan biaya dan waktu. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Mendukung penolakan rekan karena efisiensi anggaran lebih penting dari acara budaya"},{"id":"B","text":"Diam dan mengikuti keputusan yang diambil mayoritas tanpa memberikan pendapat"},{"id":"C","text":"Mendukung usulan pertunjukan seni budaya dan menawarkan solusi efisiensi seperti melibatkan pegawai dari berbagai daerah untuk tampil atau bermitra dengan sanggar budaya setempat"},{"id":"D","text":"Mengusulkan agar acara budaya tersebut diganti dengan kegiatan yang lebih relevan dengan pekerjaan seperti seminar atau workshop"},{"id":"E","text":"Menyampaikan kepada atasan bahwa pertunjukan seni budaya penting untuk mempererat kebersamaan dan mencerminkan nilai kebangsaan"}]',
  'C',
  '{"A":2,"B":1,"C":5,"D":3,"E":4}',
  'Opsi C mendapat nilai tertinggi karena tidak hanya mendukung nilai keberagaman budaya, tetapi juga secara proaktif menawarkan solusi inovatif yang mengatasi kekhawatiran biaya. Melibatkan pegawai dari berbagai daerah atau bermitra dengan sanggar setempat adalah solusi yang efisien sekaligus memperkuat rasa kebersamaan. Menyampaikan pentingnya acara budaya ke atasan (E) juga baik sebagai advokasi. Mengusulkan penggantian dengan seminar (D) kurang menghargai nilai keberagaman. Mendukung penolakan (A) mengorbankan nilai kebangsaan. Diam tanpa berpendapat (B) adalah sikap paling pasif yang tidak berkontribusi.',
  ARRAY['sering-keluar','sosial-budaya','harmonis','keberagaman','inovatif','kebangsaan']
),

(
  'aa300001-0000-0000-0000-000000000041',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Sosial Budaya', 'TKP_SCALE', 'SEDANG', 5,
  'Anda mendapati bahwa program pemerintah yang Anda jalankan mendapat penolakan dari komunitas adat setempat karena dianggap bertentangan dengan nilai-nilai adat mereka. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Tetap menjalankan program sesuai perencanaan karena program tersebut sudah mendapat persetujuan dari pejabat berwenang"},{"id":"B","text":"Menghentikan program sampai ada instruksi baru dari pusat"},{"id":"C","text":"Melaporkan situasi kepada atasan dan mengusulkan dilakukannya dialog dengan tokoh adat untuk mencari titik temu antara tujuan program dengan nilai-nilai adat"},{"id":"D","text":"Mengubah sendiri program tersebut agar sesuai dengan nilai adat setempat tanpa koordinasi ke atas"},{"id":"E","text":"Meminta tokoh adat untuk berkomunikasi langsung dengan pimpinan instansi terkait keberatan mereka"}]',
  'C',
  '{"A":2,"B":3,"C":5,"D":1,"E":4}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan pendekatan yang paling konstruktif dan sesuai prosedur: melaporkan situasi kepada atasan sambil mengusulkan dialog partisipatif dengan tokoh adat. Pendekatan ini menghormati nilai-nilai lokal (Harmonis), berorientasi pada solusi (Adaptif), dan menghormati hierarki (Loyal). Meminta tokoh adat berbicara langsung ke pimpinan (E) juga membuka jalur komunikasi yang tepat. Menghentikan program tanpa koordinasi (B) melampaui kewenangan. Tetap menjalankan tanpa dialog (A) dapat memperburuk konflik. Mengubah program sendiri (D) melampaui wewenang dan tidak akuntabel.',
  ARRAY['sering-keluar','sosial-budaya','harmonis','adaptif','kearifan-lokal','partisipatif']
),

(
  'aa300001-0000-0000-0000-000000000042',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Sosial Budaya', 'TKP_SCALE', 'SEDANG', 5,
  'Di lingkungan kerja Anda terjadi ketegangan antara dua kelompok pegawai yang berbeda latar belakang suku. Ketegangan ini mulai mempengaruhi produktivitas kerja. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Memihak salah satu kelompok yang lebih banyak anggotanya karena lebih aman"},{"id":"B","text":"Tidak terlibat dan fokus pada pekerjaan sendiri agar tidak terseret konflik"},{"id":"C","text":"Melaporkan situasi tersebut kepada atasan atau HRD agar dapat dilakukan mediasi formal"},{"id":"D","text":"Menjadi jembatan antara kedua kelompok dengan menginisiasi dialog informal dan kegiatan bersama yang dapat mencairkan ketegangan"},{"id":"E","text":"Mendatangi atasan dan meminta kedua kelompok yang berkonflik untuk mendapat sanksi"}]',
  'D',
  '{"A":1,"B":2,"C":4,"D":5,"E":3}',
  'Opsi D mendapat nilai tertinggi karena menunjukkan peran mediator yang aktif dan konstruktif: menjadi jembatan, menginisiasi dialog, dan menciptakan kesempatan interaksi positif. Ini mencerminkan nilai Harmonis dalam BerAKHLAK — membangun lingkungan kerja yang kondusif dan saling menghormati perbedaan. Melaporkan untuk mediasi formal (C) juga tepat, terutama jika inisiatif informal tidak berhasil. Meminta sanksi tanpa proses (E) terlalu punitif. Tidak terlibat (B) membiarkan produktivitas terus menurun. Memihak salah satu kelompok (A) memperburuk perpecahan dan paling berbahaya.',
  ARRAY['sering-keluar','sosial-budaya','harmonis','konflik','mediasi','keberagaman']
),

(
  'aa300001-0000-0000-0000-000000000043',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Sosial Budaya', 'TKP_SCALE', 'SEDANG', 5,
  'Anda mendapat informasi bahwa ada warga dari kelompok minoritas yang merasa didiskriminasi dalam mendapatkan layanan publik di instansi Anda. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menganggap informasi tersebut berlebihan dan tidak perlu ditindaklanjuti karena layanan sudah diberikan kepada semua warga"},{"id":"B","text":"Melakukan observasi mandiri untuk memverifikasi apakah diskriminasi benar terjadi, kemudian melaporkan temuan kepada atasan beserta rekomendasi perbaikan"},{"id":"C","text":"Langsung membuat pengumuman kepada semua staf bahwa diskriminasi tidak diperbolehkan"},{"id":"D","text":"Menyampaikan informasi tersebut kepada atasan agar ditindaklanjuti sesuai kewenangannya"},{"id":"E","text":"Menghubungi warga yang merasa didiskriminasi untuk mendengarkan pengalamannya secara langsung, kemudian melaporkan kepada atasan"}]',
  'B',
  '{"A":1,"B":5,"C":3,"D":4,"E":2}',
  'Opsi B mendapat nilai tertinggi karena menunjukkan pendekatan yang berbasis bukti dan berorientasi solusi: memverifikasi sendiri terlebih dahulu, kemudian melaporkan dengan data dan rekomendasi konkret. Ini mencerminkan nilai Akuntabel (bertanggung jawab memastikan tidak ada diskriminasi) dan Berorientasi Pelayanan (memastikan semua warga dilayani dengan setara). Menyampaikan kepada atasan (D) juga konstruktif. Membuat pengumuman langsung (C) baik namun kurang spesifik dan tidak berbasis bukti. Menghubungi warga (E) niatnya baik namun tanpa verifikasi faktual terlebih dahulu. Mengabaikan (A) membiarkan diskriminasi berlanjut yang melanggar UU Pelayanan Publik.',
  ARRAY['sering-keluar','sosial-budaya','non-diskriminasi','akuntabel','inklusivitas']
),

-- ============================================================
-- TEKNOLOGI INFORMASI (044-050)
-- ============================================================

(
  'aa300001-0000-0000-0000-000000000044',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 6,
  'Instansi Anda baru mengimplementasikan sistem informasi manajemen yang baru. Banyak rekan yang masih belum paham cara menggunakannya dan lebih suka menggunakan cara manual. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menggunakan sistem baru karena sudah jadi kewajiban, namun tetap menyimpan rekaman manual sebagai cadangan"},{"id":"B","text":"Mempelajari sistem baru dengan seksama, membantu rekan yang kesulitan, dan mengusulkan sesi pelatihan bersama kepada atasan"},{"id":"C","text":"Menunggu pelatihan resmi dari instansi sebelum mulai menggunakan sistem baru"},{"id":"D","text":"Terus menggunakan cara manual karena lebih familiar dan lebih bisa diandalkan"},{"id":"E","text":"Meminta vendor sistem untuk datang memberikan pelatihan langsung kepada semua staf"}]',
  'B',
  '{"A":3,"B":5,"C":2,"D":1,"E":4}',
  'Opsi B mendapat nilai tertinggi karena menunjukkan nilai Adaptif (cepat menyesuaikan diri dengan teknologi baru), Kompeten (terus belajar), dan Kolaboratif (membantu rekan dan mengusulkan pelatihan). Ini adalah respons yang paling proaktif dan berdampak positif bagi seluruh tim. Meminta vendor memberikan pelatihan (E) juga konstruktif namun menunggu orang lain untuk menggerakkan. Menggunakan sistem baru dengan cadangan manual (A) adalah langkah awal yang aman. Menunggu pelatihan resmi (C) terlalu pasif. Terus menggunakan cara manual (D) menghambat transformasi digital dan efisiensi organisasi.',
  ARRAY['sering-keluar','teknologi-informasi','adaptif','kompeten','transformasi-digital']
),

(
  'aa300001-0000-0000-0000-000000000045',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 6,
  'Anda menemukan celah keamanan (security vulnerability) pada sistem informasi instansi Anda yang berpotensi mengekspos data warga. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Segera melaporkan temuan tersebut kepada atasan dan tim IT dengan deskripsi teknis yang jelas agar dapat segera ditangani"},{"id":"B","text":"Mencoba memperbaiki celah keamanan tersebut sendiri agar tidak mengganggu operasional"},{"id":"C","text":"Memposting temuan celah keamanan tersebut di media sosial untuk meningkatkan kesadaran publik tentang pentingnya keamanan siber"},{"id":"D","text":"Mengabaikan celah keamanan tersebut karena bukan tanggung jawab Anda langsung"},{"id":"E","text":"Mendokumentasikan celah keamanan tersebut secara mandiri sambil menunggu kesempatan yang tepat untuk melaporkannya"}]',
  'A',
  '{"A":5,"B":3,"C":1,"D":2,"E":4}',
  'Opsi A mendapat nilai tertinggi karena segera melaporkan celah keamanan kepada pihak yang berwenang (atasan dan tim IT) adalah tindakan yang paling akuntabel dan bertanggung jawab untuk melindungi data warga. Kecepatan pelaporan sangat krusial dalam keamanan siber. Mendokumentasikan sambil menunggu (E) berisiko jika celah dieksploitasi selama periode menunggu. Mencoba memperbaiki sendiri (B) berisiko memperburuk masalah tanpa keahlian yang tepat. Mengabaikan (D) membiarkan risiko keamanan data publik. Memposting di media sosial (C) dapat dieksploitasi oleh pihak jahat sebelum diperbaiki — ini tindakan terburuk.',
  ARRAY['sering-keluar','teknologi-informasi','keamanan-siber','akuntabel','data-protection']
),

(
  'aa300001-0000-0000-0000-000000000046',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 6,
  'Anda diminta untuk membuat laporan yang membutuhkan analisis data dari sistem yang Anda kuasai, namun deadline-nya sangat ketat yaitu besok pagi. Anda baru menguasai 70% fitur yang diperlukan. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Mengerjakan laporan menggunakan 70% fitur yang sudah dikuasai dan mengakui keterbatasan ini dalam laporan"},{"id":"B","text":"Meminta atasan untuk memperpanjang deadline karena tidak cukup waktu untuk mempelajari semua fitur"},{"id":"C","text":"Bekerja keras malam ini untuk mempelajari 30% fitur yang belum dikuasai, mengerjakan laporan, dan menginformasikan kepada atasan jika ada bagian yang perlu validasi"},{"id":"D","text":"Meminta bantuan rekan yang lebih menguasai sistem untuk mengerjakan bagian yang belum dikuasai"},{"id":"E","text":"Menyerahkan laporan besok dengan menggunakan cara manual untuk bagian yang tidak dikuasai fiturnya"}]',
  'C',
  '{"A":3,"B":2,"C":5,"D":4,"E":1}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan etos kerja yang kuat, keinginan untuk terus belajar, dan transparansi kepada atasan. Berupaya keras untuk menguasai fitur yang diperlukan dalam waktu singkat mencerminkan nilai Kompeten dan Adaptif, sementara menginformasikan kepada atasan jika perlu validasi menunjukkan Akuntabel. Meminta bantuan rekan (D) juga kolaboratif dan pragmatis. Menggunakan 70% yang dikuasai dengan catatan keterbatasan (A) jujur namun kurang optimal. Meminta perpanjangan deadline (B) menghindari upaya ekstra. Menggunakan cara manual (E) mengabaikan nilai transformasi digital.',
  ARRAY['sering-keluar','teknologi-informasi','kompeten','adaptif','etos-kerja']
),

(
  'aa300001-0000-0000-0000-000000000047',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 6,
  'Anda menerima email yang mencurigakan mengatasnamakan instansi lain dan meminta Anda untuk mengklik tautan dan memasukkan kredensial login sistem instansi Anda. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Mengklik tautan tersebut karena tampaknya berasal dari instansi yang dikenal"},{"id":"B","text":"Tidak mengklik tautan, segera melaporkan email tersebut kepada tim IT dan atasan sebagai potensi serangan phishing"},{"id":"C","text":"Memforward email tersebut kepada rekan untuk meminta pendapat mereka tentang keaslian email tersebut"},{"id":"D","text":"Menghapus email tersebut dan tidak melakukan apa-apa"},{"id":"E","text":"Membalas email tersebut untuk meminta klarifikasi tentang keperluan kredensial login"}]',
  'B',
  '{"A":1,"B":5,"C":3,"D":4,"E":2}',
  'Opsi B mendapat nilai tertinggi karena menunjukkan literasi keamanan siber yang baik: tidak mengklik tautan mencurigakan dan segera melaporkan kepada tim IT dan atasan. Pelaporan segera memungkinkan tim IT mengambil tindakan pencegahan untuk melindungi sistem secara menyeluruh. Menghapus tanpa melaporkan (D) aman secara personal namun melewatkan kesempatan melindungi sistem instansi. Meneruskan ke rekan (C) menyebarkan risiko. Membalas untuk klarifikasi (E) dapat mengkonfirmasi email aktif kepada peretas. Mengklik tautan (A) adalah tindakan terburuk yang langsung mengekspos sistem instansi kepada ancaman siber.',
  ARRAY['sering-keluar','teknologi-informasi','keamanan-siber','phishing','literasi-digital']
),

(
  'aa300001-0000-0000-0000-000000000048',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 6,
  'Anda melihat rekan Anda menggunakan komputer kantor untuk keperluan pribadi (browsing belanja online, media sosial) secara berlebihan selama jam kerja. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Mengabaikannya karena itu urusan rekan dan tidak langsung merugikan Anda"},{"id":"B","text":"Ikut menggunakan komputer untuk keperluan pribadi karena rekan pun melakukannya"},{"id":"C","text":"Mengingatkan rekan dengan cara yang baik bahwa penggunaan fasilitas kantor untuk keperluan pribadi selama jam kerja dapat merugikan produktivitas dan melanggar kebijakan"},{"id":"D","text":"Langsung melaporkan rekan kepada atasan agar ditindak sesuai peraturan"},{"id":"E","text":"Mendokumentasikan perilaku rekan sebagai bukti jika suatu saat dibutuhkan"}]',
  'C',
  '{"A":2,"B":1,"C":5,"D":4,"E":3}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan pendekatan kolaboratif dan etis: mengingatkan rekan dengan cara yang baik tentang dampak perilakunya terhadap produktivitas dan kebijakan instansi. Ini mencerminkan nilai Harmonis (menjaga hubungan baik) dan Loyal (kepada kepentingan instansi). Melaporkan kepada atasan (D) tepat jika peringatan personal tidak berhasil. Mendokumentasikan (E) kurang proporsional untuk situasi ini. Mengabaikan (A) membiarkan pelanggaran kebijakan dan mengurangi produktivitas tim. Ikut melakukan hal yang sama (B) adalah tindakan terburuk yang memperparah pelanggaran.',
  ARRAY['sering-keluar','teknologi-informasi','etika-digital','produktivitas','kode-etik']
),

(
  'aa300001-0000-0000-0000-000000000049',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 6,
  'Atasan meminta Anda untuk mempelajari dan mengimplementasikan teknologi baru untuk meningkatkan efisiensi pelayanan, namun tidak ada anggaran untuk pelatihan eksternal. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Menyampaikan kepada atasan bahwa implementasi tidak dapat dilakukan tanpa pelatihan yang memadai"},{"id":"B","text":"Memanfaatkan sumber belajar gratis seperti dokumentasi resmi, tutorial online, dan komunitas pengguna untuk mempelajari teknologi tersebut secara mandiri"},{"id":"C","text":"Mencari rekan di instansi lain yang sudah menggunakan teknologi tersebut untuk berbagi pengalaman dan belajar langsung"},{"id":"D","text":"Mengimplementasikan teknologi tersebut sesuai pemahaman yang ada tanpa mempelajarinya lebih dalam"},{"id":"E","text":"Mengusulkan agar instansi menganggarkan dana untuk pelatihan terlebih dahulu sebelum implementasi"}]',
  'B',
  '{"A":2,"B":5,"C":4,"D":1,"E":3}',
  'Opsi B mendapat nilai tertinggi karena menunjukkan nilai Kompeten (inisiatif belajar mandiri) dan Adaptif (memanfaatkan sumber daya yang tersedia secara kreatif). Era digital menyediakan banyak sumber belajar gratis berkualitas tinggi. Belajar mandiri adalah sikap yang paling konstruktif ketika keterbatasan anggaran menjadi hambatan. Belajar dari rekan di instansi lain (C) juga sangat efektif dan membangun jejaring. Mengusulkan anggaran pelatihan (E) adalah inisiatif yang baik untuk jangka panjang. Menyatakan tidak bisa tanpa pelatihan formal (A) kurang proaktif. Mengimplementasikan tanpa belajar lebih dalam (D) berisiko menghasilkan implementasi yang buruk.',
  ARRAY['sering-keluar','teknologi-informasi','kompeten','adaptif','belajar-mandiri']
),

(
  'aa300001-0000-0000-0000-000000000050',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 6,
  'Anda menemukan bahwa data warga yang tersimpan di sistem instansi Anda tidak diperbarui secara berkala sehingga banyak data yang sudah kedaluwarsa. Hal ini berpotensi menyebabkan kesalahan dalam pengambilan kebijakan. Apa yang Anda lakukan?',
  '[{"id":"A","text":"Membiarkan kondisi data tersebut karena pembaruan data bukan tanggung jawab Anda"},{"id":"B","text":"Memperbarui sendiri data yang Anda ketahui sudah kedaluwarsa berdasarkan informasi yang ada"},{"id":"C","text":"Melaporkan temuan kepada atasan dengan data konkret tentang dampak data kedaluwarsa, mengusulkan pembentukan prosedur pembaruan data yang rutin dan terstruktur"},{"id":"D","text":"Menginformasikan kepada rekan kerja agar mereka berhati-hati dalam menggunakan data yang ada"},{"id":"E","text":"Mengusulkan kepada atasan agar instansi berlangganan layanan data pihak ketiga yang lebih mutakhir"}]',
  'C',
  '{"A":1,"B":3,"C":5,"D":4,"E":2}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan pendekatan yang sistemik dan berbasis data: melaporkan masalah kepada atasan dengan bukti konkret tentang dampaknya dan mengusulkan solusi prosedural yang berkelanjutan. Ini mencerminkan nilai Akuntabel (melaporkan masalah yang berpotensi mempengaruhi kualitas kebijakan), Kompeten (mengidentifikasi akar masalah), dan Adaptif (mendorong perbaikan sistem). Menginformasikan ke rekan untuk berhati-hati (D) adalah langkah sementara yang berguna. Memperbarui sendiri data yang diketahui (B) parsial. Mengusulkan layanan pihak ketiga (E) mungkin tidak perlu dan mahal. Membiarkan data kedaluwarsa (A) membiarkan risiko kualitas kebijakan.',
  ARRAY['sering-keluar','teknologi-informasi','data-governance','akuntabel','kompeten','tata-kelola-data']
)

ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- TKP — Batch 2 (051-100) — 50 soal lanjutan
-- Distribusi: Pelayanan Publik (9), Profesionalisme (9),
-- Anti Radikalisme (8), Jejaring Kerja (8),
-- Sosial Budaya (8), Teknologi Informasi (8)
-- Skenario diadaptasi dari pola soal SKD CPNS klasik.
-- ============================================================

INSERT INTO public.questions
  (id, pack_id, exam_type, subject, subtopic, question_type, difficulty, difficulty_rank,
   question_text, options, correct_option, tkp_scores, explanation_text, tags)
VALUES

-- ============================================================
-- PELAYANAN PUBLIK (051-059)
-- ============================================================

(
  'aa300001-0000-0000-0000-000000000051',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 4,
  'Ketika saya mengalami kegagalan dalam tugas pelayanan, saya cenderung...',
  '[{"id":"A","text":"Merasa bodoh dan putus asa"},{"id":"B","text":"Merasa sedih dan marah kepada diri sendiri"},{"id":"C","text":"Menganalisis sumber kegagalan dan mencari cara perbaikan"},{"id":"D","text":"Melupakan kegagalan itu dan melanjutkan tugas seperti biasa"},{"id":"E","text":"Melaporkan kegagalan kepada atasan dan meminta instruksi lanjutan"}]',
  'C',
  '{"A":1,"B":2,"C":5,"D":3,"E":4}',
  'Opsi C mendapat nilai tertinggi karena mencerminkan sikap growth mindset yang konstruktif: menganalisis akar masalah kegagalan adalah langkah pertama untuk tidak mengulangi kesalahan yang sama. Melaporkan ke atasan (E) menunjukkan akuntabilitas yang baik. Melanjutkan seperti biasa (D) cukup, namun tanpa refleksi. Sedih dan marah (B) manusiawi tapi tidak produktif. Putus asa (A) adalah respons paling merusak bagi pelayanan publik.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000052',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 4,
  'Teman-teman di kantor sering menceritakan masalah pekerjaan kepada saya karena mereka menganggap saya...',
  '[{"id":"A","text":"Mampu menjaga rahasia dengan baik"},{"id":"B","text":"Pendengar yang baik dan empatik"},{"id":"C","text":"Selalu memberikan solusi terbaik"},{"id":"D","text":"Mampu melihat masalah dari berbagai sudut pandang"},{"id":"E","text":"Mampu membangkitkan semangat mereka kembali"}]',
  'B',
  '{"A":3,"B":5,"C":4,"D":4,"E":3}',
  'Opsi B mendapat nilai tertinggi karena menjadi pendengar yang baik dan empatik adalah fondasi dari kemampuan membantu orang lain. Mendengar aktif mencerminkan nilai Harmonis (menghargai orang lain) dan Kolaboratif (membangun kepercayaan). Memberikan solusi terbaik (C) dan melihat berbagai sudut pandang (D) sama-sama bernilai tinggi karena keduanya konstruktif. Menjaga rahasia (A) dan membangkitkan semangat (E) adalah nilai tambah yang positif namun lebih situasional.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000053',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 4,
  'Di kantor saya ditugaskan di bagian pelayanan. Suatu hari ada seorang tamu yang sangat rewel dan emosional. Saya akan...',
  '[{"id":"A","text":"Melayani dengan sabar meski terasa berat"},{"id":"B","text":"Meminta rekan lain untuk mengambil alih pelayanan"},{"id":"C","text":"Melayani seperti biasa dengan memberikan yang terbaik dan tetap profesional"},{"id":"D","text":"Segera melaporkan kepada atasan agar situasi ditangani"},{"id":"E","text":"Melakukan apa yang bisa saya lakukan, namun tidak melayani hal di luar kemampuan saya"}]',
  'C',
  '{"A":4,"B":2,"C":5,"D":3,"E":4}',
  'Opsi C adalah yang terbaik karena ASN yang berorientasi pelayanan harus mampu tetap profesional dan memberikan yang terbaik dalam situasi sulit sekalipun. Kesabaran dan profesionalisme adalah nilai inti pelayanan publik. Melayani dengan sabar (A) hampir sama baiknya. Melaporkan ke atasan (D) tepat jika situasi sudah di luar kendali. Minta bantuan rekan (B) adalah opsi terlemah karena menghindari tanggung jawab.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000054',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 4,
  'Pimpinan di kantor saya sangat otoriter dan kurang disenangi karyawan karena gaya kepemimpinannya. Sikap saya...',
  '[{"id":"A","text":"Mengajak teman-teman berdemonstrasi menuntut pergantian pimpinan"},{"id":"B","text":"Tetap bekerja seperti biasa, itu bukan urusan saya"},{"id":"C","text":"Mengajukan surat protes resmi atas gaya kepemimpinan tersebut"},{"id":"D","text":"Berusaha berkomunikasi secara santun kepada pimpinan dan menjelaskan situasi yang terjadi"},{"id":"E","text":"Mengajak rekan untuk tidak mematuhi perintah pimpinan"}]',
  'D',
  '{"A":2,"B":3,"C":3,"D":5,"E":1}',
  'Opsi D mendapat nilai tertinggi karena menunjukkan sikap dewasa: komunikasi langsung secara santun adalah cara terbaik untuk menyelesaikan konflik dengan atasan. Ini mencerminkan nilai Harmonis dan Kolaboratif. Tetap bekerja seperti biasa (B) menghindari konflik namun tidak membantu perbaikan. Surat protes resmi (C) bisa menjadi langkah selanjutnya jika komunikasi langsung gagal. Demonstrasi (A) tidak tepat dalam konteks ASN. Provokasi tidak patuh (E) adalah yang terburuk.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000055',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 5,
  'Dalam melaksanakan pekerjaan yang dipercayakan kepada saya, saya...',
  '[{"id":"A","text":"Selalu menunggu perintah dan petunjuk detail dari atasan"},{"id":"B","text":"Tidak berani mengambil keputusan sendiri dalam kondisi apapun"},{"id":"C","text":"Berani mengambil keputusan sendiri karena tugas itu sudah menjadi tanggung jawab saya"},{"id":"D","text":"Selalu meminta pendapat rekan yang lebih berpengalaman sebelum memutuskan"},{"id":"E","text":"Mengambil keputusan sendiri, namun melaporkannya kepada atasan setelahnya"}]',
  'C',
  '{"A":2,"B":1,"C":5,"D":3,"E":4}',
  'Opsi C mencerminkan nilai Akuntabel dan profesionalisme: ketika suatu tugas sudah dipercayakan, ASN yang kompeten berani mengambil keputusan secara mandiri dalam batas kewenangannya. Melaporkan ke atasan setelah ambil keputusan (E) juga baik karena menjaga transparansi. Selalu minta pendapat rekan (D) menunjukkan kolaborasi. Menunggu perintah detail (A) kurang inisiatif. Tidak berani memutuskan apapun (B) adalah yang paling tidak produktif.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000056',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 4,
  'Ketika sedang memimpin rapat ada seorang peserta yang terus-menerus membuat gaduh. Yang saya lakukan...',
  '[{"id":"A","text":"Marah dan menegurnya dengan keras di depan semua peserta"},{"id":"B","text":"Dengan tenang memintanya untuk menjaga sikap dan fokus pada rapat"},{"id":"C","text":"Marah dan langsung meninggalkan ruangan rapat"},{"id":"D","text":"Mengeluarkannya dari rapat tanpa negosiasi"},{"id":"E","text":"Tetap melanjutkan rapat tanpa menegur, menganggap hal itu normal"}]',
  'B',
  '{"A":2,"B":5,"C":1,"D":3,"E":3}',
  'Opsi B adalah yang terbaik karena menegur secara tenang dan santun menjaga wibawa pemimpin sekaligus menghormati martabat peserta. Ini mencerminkan nilai Harmonis (menjaga suasana kondusif) dan kepemimpinan yang efektif. Mengeluarkan dari rapat (D) bisa menjadi opsi terakhir jika teguran tidak diindahkan. Marah keras (A) merusak suasana. Meninggalkan rapat (C) adalah yang paling tidak profesional.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000057',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 5,
  'Atasan meminta saya mengerjakan pekerjaan yang cukup berat dan menantang. Saya akan...',
  '[{"id":"A","text":"Menolak pekerjaan tersebut karena di luar kapasitas saya"},{"id":"B","text":"Menerima dengan terpaksa namun dalam hati keberatan"},{"id":"C","text":"Meminta waktu untuk mempertimbangkan apakah mampu atau tidak"},{"id":"D","text":"Menerima dengan antusias dan berusaha menyelesaikannya sebaik mungkin"},{"id":"E","text":"Menerima namun kemudian mendelegasikan ke bawahan"}]',
  'D',
  '{"A":1,"B":2,"C":3,"D":5,"E":2}',
  'Opsi D mencerminkan nilai Kompeten (terus berkembang) dan Loyal (mendahulukan kepentingan organisasi). Pekerjaan yang berat adalah kesempatan untuk berkembang. ASN yang adaptif menyambut tantangan baru. Meminta waktu pertimbangan (C) menunjukkan kehati-hatian yang wajar. Mendelegasikan ke bawahan (E) kurang tepat jika bukan kewenangan yang memang seharusnya didelegasikan. Menolak (A) adalah respons paling merugikan pengembangan diri.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000058',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 5,
  'Saya baru saja menerima penghargaan dari instansi atas kinerja saya yang baik. Saya akan...',
  '[{"id":"A","text":"Memamerkan penghargaan itu kepada rekan-rekan"},{"id":"B","text":"Bekerja seperti biasa tanpa ada perubahan"},{"id":"C","text":"Meningkatkan kinerja agar mendapat penghargaan lagi"},{"id":"D","text":"Meningkatkan kinerja sekaligus memotivasi rekan-rekan untuk ikut berprestasi"},{"id":"E","text":"Meningkatkan kinerja sebagai wujud tanggung jawab atas kepercayaan yang diberikan"}]',
  'D',
  '{"A":1,"B":2,"C":4,"D":5,"E":4}',
  'Opsi D mendapat nilai tertinggi karena menggabungkan dua nilai BerAKHLAK: Kompeten (terus meningkatkan kinerja) dan Kolaboratif (berbagi semangat dengan rekan). Seorang ASN yang baik tidak hanya fokus pada prestasi pribadi tetapi juga berkontribusi pada peningkatan kinerja tim. Meningkatkan kinerja sebagai rasa tanggung jawab (E) juga sangat baik. Bekerja biasa saja (B) menyia-nyiakan momentum. Memamerkan penghargaan (A) tidak mencerminkan nilai harmonis.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000059',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Pelayanan Publik', 'TKP_SCALE', 'SEDANG', 4,
  'Atasan tiba-tiba memberi tugas lembur padahal saya sudah berjanji mengantar anak ke acara ulang tahun temannya. Yang terbaik adalah...',
  '[{"id":"A","text":"Menolak tugas dari atasan karena sudah ada janji dengan anak"},{"id":"B","text":"Menerima tugas dan membatalkan janji dengan anak, menjelaskan situasinya"},{"id":"C","text":"Menyarankan agar tugas diberikan kepada pegawai lain"},{"id":"D","text":"Menerima tugas dan meminta bantuan rekan untuk mengerjakannya agar bisa tetap ke acara anak"},{"id":"E","text":"Menerima tugas, meminta izin singkat mengantar anak dulu, lalu kembali menyelesaikan tugas"}]',
  'E',
  '{"A":1,"B":4,"C":2,"D":3,"E":5}',
  'Opsi E mendapat nilai tertinggi karena menunjukkan keseimbangan antara tanggung jawab profesional dan keluarga secara elegan: menyelesaikan kewajiban kepada anak (yang sudah dijanjikan) sekaligus menghormati tugas dari atasan dengan berkomitmen menyelesaikannya. Ini mencerminkan nilai Loyal dan Akuntabel sekaligus karakter manusia yang utuh. Menerima dan membatalkan janji (B) juga dapat diterima. Menolak tugas (A) tidak menunjukkan loyalitas kepada organisasi.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- PROFESIONALISME (060-068)
-- ============================================================

(
  'aa300001-0000-0000-0000-000000000060',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 6,
  'Saya sudah bekerja lama namun belum mendapat promosi. Seorang rekan yang baru beberapa bulan bekerja tiba-tiba dipromosikan. Saya...',
  '[{"id":"A","text":"Yakin ada persekongkolan yang tidak adil"},{"id":"B","text":"Yakin giliran saya akan datang pada waktunya"},{"id":"C","text":"Meningkatkan kinerja agar mendapat kesempatan promosi berikutnya"},{"id":"D","text":"Tetap bekerja seperti biasa tanpa terpengaruh"},{"id":"E","text":"Tidak terima dan mempertimbangkan untuk keluar dari instansi"}]',
  'C',
  '{"A":2,"B":4,"C":5,"D":3,"E":1}',
  'Opsi C adalah yang terbaik karena menunjukkan respons konstruktif: alih-alih meratapi situasi, ASN yang kompeten menggunakan kejadian ini sebagai motivasi untuk meningkatkan diri. Ini mencerminkan nilai Kompeten dan Adaptif. Optimis menunggu giliran (B) positif namun pasif. Tetap bekerja biasa (D) netral. Menduga ada persekongkolan (A) bersifat negatif tanpa dasar. Mempertimbangkan keluar (E) adalah respons paling tidak dewasa.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000061',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 6,
  'Saya sangat senang dengan atasan yang...',
  '[{"id":"A","text":"Selalu akrab dan dekat dengan anak buah"},{"id":"B","text":"Disiplin dan memiliki etos kerja tinggi"},{"id":"C","text":"Bertanggung jawab atas semua keputusan"},{"id":"D","text":"Mau mendengarkan masukan dari bawahan"},{"id":"E","text":"Memberikan petunjuk jelas tentang apa yang harus dikerjakan"}]',
  'D',
  '{"A":2,"B":4,"C":3,"D":5,"E":4}',
  'Opsi D mendapat nilai tertinggi karena atasan yang mau mendengarkan masukan bawahan mencerminkan kepemimpinan yang demokratis, menghargai kontribusi tim, dan mendorong inovasi dari bawah. Ini sesuai nilai Kolaboratif dan Harmonis. Disiplin dan etos kerja tinggi (B) juga penting sebagai keteladanan. Memberikan petunjuk jelas (E) mendukung efektivitas kerja. Terlalu akrab tanpa batas (A) dapat mengurangi wibawa pemimpin.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000062',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 6,
  'Saya senang melakukan pekerjaan yang...',
  '[{"id":"A","text":"Saya benar-benar senangi dan kuasai"},{"id":"B","text":"Penuh tantangan dan mendorong saya berkembang"},{"id":"C","text":"Sesuai dengan kemampuan saya saat ini"},{"id":"D","text":"Sudah menjadi rutinitas yang nyaman"},{"id":"E","text":"Tidak memiliki risiko kegagalan"}]',
  'B',
  '{"A":4,"B":5,"C":3,"D":2,"E":1}',
  'Opsi B mendapat nilai tertinggi karena ASN yang adaptif dan kompeten justru mencari pekerjaan yang menantang sebagai sarana pengembangan diri. Nilai Adaptif dan Kompeten dalam BerAKHLAK mendorong ASN untuk terus berinovasi dan meningkatkan kapabilitas. Mengerjakan yang disenangi dan dikuasai (A) juga baik tapi bisa menghambat pertumbuhan. Menghindari risiko kegagalan (E) adalah sikap yang paling kontraproduktif.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000063',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 6,
  'Sebagai pegawai, hal terpenting yang harus saya lakukan adalah...',
  '[{"id":"A","text":"Melakukan pekerjaan dengan standar kinerja yang baik"},{"id":"B","text":"Menciptakan hubungan yang baik dengan semua orang di kantor"},{"id":"C","text":"Patuh dan loyal kepada atasan dalam segala hal"},{"id":"D","text":"Melakukan pekerjaan sesuai tugas pokok dan fungsi"},{"id":"E","text":"Menciptakan terobosan-terobosan inovatif untuk kemajuan instansi"}]',
  'E',
  '{"A":4,"B":3,"C":2,"D":3,"E":5}',
  'Opsi E mendapat nilai tertinggi karena nilai Adaptif dalam BerAKHLAK mendorong ASN untuk terus berinovasi demi kemajuan organisasi—melampaui sekadar menjalankan tugas rutin. Melakukan pekerjaan dengan standar baik (A) adalah fondasi yang kuat. Patuh kepada atasan (C) bernilai lebih rendah karena kepatuhan tanpa batas bisa bermasalah. Terobosan inovatif (E) adalah kontribusi tertinggi seorang ASN.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000064',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Ketika suasana hati saya sedang tidak baik akibat masalah pribadi, biasanya saya...',
  '[{"id":"A","text":"Menjadi mudah tersinggung dan marah kepada rekan"},{"id":"B","text":"Menjadi malas dan sulit berkonsentrasi bekerja"},{"id":"C","text":"Tetap bekerja profesional seperti biasa"},{"id":"D","text":"Banyak melamun dan sulit fokus"},{"id":"E","text":"Bercerita kepada teman dekat untuk meringankan beban"}]',
  'C',
  '{"A":1,"B":2,"C":5,"D":2,"E":4}',
  'Opsi C mencerminkan profesionalisme tinggi: kemampuan memisahkan masalah pribadi dari tanggung jawab pekerjaan adalah tanda kedewasaan dan komitmen. Bercerita kepada teman dekat (E) adalah cara sehat mengelola emosi dan dapat dilakukan di luar jam kerja. Malas bekerja (B) atau banyak melamun (D) merugikan kinerja. Mudah marah (A) menciptakan lingkungan kerja yang tidak harmonis.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000065',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 6,
  'Orang tua saya menyarankan untuk pindah ke instansi lain yang bergaji lebih tinggi. Padahal saya nyaman di tempat kerja saat ini. Saya akan...',
  '[{"id":"A","text":"Langsung mengikuti saran orang tua dan mencari pekerjaan lain"},{"id":"B","text":"Menolak saran orang tua dan tetap bekerja tanpa penjelasan"},{"id":"C","text":"Tetap bekerja dan memberikan penjelasan kepada orang tua tentang keputusan saya"},{"id":"D","text":"Meminta pendapat dari teman-teman sebelum memutuskan"},{"id":"E","text":"Meminta pertimbangan dari atasan di tempat kerja"}]',
  'C',
  '{"A":2,"B":2,"C":5,"D":3,"E":4}',
  'Opsi C mendapat nilai tertinggi karena menunjukkan kedewasaan dalam pengambilan keputusan: mempertahankan pilihan sendiri yang sudah dipertimbangkan matang, sekaligus menghormati orang tua dengan memberikan penjelasan yang baik. Ini mencerminkan nilai Loyal (pada komitmen), Harmonis (menjaga hubungan keluarga), dan karakter dewasa. Meminta pertimbangan atasan (E) menunjukkan keterbukaan. Mengikuti saran tanpa refleksi (A) tidak mandiri.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000066',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 6,
  'Saat menerima pekerjaan besar dan kompleks, saya biasanya...',
  '[{"id":"A","text":"Senang dan berusaha menyelesaikannya dengan hasil sebaik mungkin"},{"id":"B","text":"Merasa malas dan mengerjakannya asal-asalan asal selesai"},{"id":"C","text":"Takut tidak bisa menyelesaikan dan merasa tidak percaya diri"},{"id":"D","text":"Meminta bantuan rekan untuk membantu mengerjakan"},{"id":"E","text":"Menganggap itu sebagai pekerjaan biasa dan mengerjakannya normal"}]',
  'A',
  '{"A":5,"B":1,"C":2,"D":4,"E":3}',
  'Opsi A mendapat nilai tertinggi karena menunjukkan sikap positif dan berkomitmen: menyambut tantangan dengan antusias dan berupaya memberikan hasil terbaik adalah ciri ASN yang kompeten dan adaptif. Meminta bantuan rekan (D) menunjukkan nilai Kolaboratif yang baik. Menganggap biasa saja (E) netral. Takut tidak percaya diri (C) bisa menghambat kinerja. Asal-asalan (B) mencerminkan ketidakprofesionalan.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000067',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Saat menerima kabar darurat (anak sakit) di tengah presentasi penting, saya akan...',
  '[{"id":"A","text":"Tetap melanjutkan presentasi sampai selesai tanpa terganggu"},{"id":"B","text":"Mencari informasi lebih lanjut kondisi anak, lalu memutuskan melanjutkan atau pergi"},{"id":"C","text":"Langsung menghentikan presentasi dan pergi ke rumah sakit"},{"id":"D","text":"Menghentikan presentasi, mendelegasikan kepada rekan, lalu pergi"},{"id":"E","text":"Menelepon keluarga untuk memastikan kondisi anak sambil tetap melanjutkan presentasi"}]',
  'E',
  '{"A":2,"B":4,"C":3,"D":4,"E":5}',
  'Opsi E mendapat nilai tertinggi karena merupakan respons paling seimbang: memastikan kondisi anak (tanggung jawab keluarga) tanpa sepenuhnya meninggalkan tanggung jawab profesional yang sedang berlangsung. Mencari informasi dulu (B) juga baik. Mendelegasikan ke rekan (D) menunjukkan kemampuan manajemen. Tetap presentasi tanpa peduli (A) mengabaikan tanggung jawab keluarga. Langsung pergi (C) meninggalkan tanggung jawab profesional tanpa transisi.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000068',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Profesionalisme', 'TKP_SCALE', 'SEDANG', 6,
  'Cara yang paling tepat untuk mencapai kesuksesan dalam bekerja menurut saya adalah...',
  '[{"id":"A","text":"Bekerja dengan sepenuh hati dan penuh dedikasi"},{"id":"B","text":"Mematuhi semua perintah atasan tanpa kecuali"},{"id":"C","text":"Bekerja giat dan berusaha memberikan kontribusi terbaik"},{"id":"D","text":"Menyingkirkan orang lain yang dianggap menghalangi karir"},{"id":"E","text":"Bekerja tanpa mengenal waktu, selalu lembur"}]',
  'C',
  '{"A":4,"B":3,"C":5,"D":1,"E":2}',
  'Opsi C paling komprehensif: kerja keras ditambah komitmen memberikan kontribusi terbaik untuk organisasi—bukan sekadar untuk kepentingan pribadi. Ini mencerminkan nilai Kompeten dan Akuntabel. Bekerja sepenuh hati (A) hampir setara. Kepatuhan mutlak pada atasan (B) mengurangi inisiatif. Lembur tanpa henti (E) tidak selalu produktif dan dapat merusak kesehatan. Menyingkirkan orang lain (D) bertentangan dengan nilai Harmonis.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- ANTI RADIKALISME (069-076)
-- ============================================================

(
  'aa300001-0000-0000-0000-000000000069',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Anti Radikalisme', 'TKP_SCALE', 'SULIT', 8,
  'Seorang rekan kerja mengajak saya bergabung ke sebuah kelompok yang mengklaim berjuang untuk keadilan, namun cara-caranya cenderung tidak sesuai aturan dan berpotensi memecah belah. Saya akan...',
  '[{"id":"A","text":"Bergabung jika memang tujuannya mulia meski caranya sedikit menyimpang"},{"id":"B","text":"Menolak bergabung dan menjelaskan kekhawatiran saya kepada rekan tersebut"},{"id":"C","text":"Tidak bergabung tapi juga tidak berkomentar untuk menjaga hubungan baik"},{"id":"D","text":"Melaporkan kepada atasan atau aparat yang berwenang"},{"id":"E","text":"Menolak bergabung, menjelaskan risiko kepada rekan, dan melaporkan kepada pihak berwenang jika ada indikasi nyata"}]',
  'E',
  '{"A":1,"B":4,"C":2,"D":4,"E":5}',
  'Opsi E adalah yang paling komprehensif: menolak bergabung (melindungi diri), menjelaskan kepada rekan (upaya preventif), dan melaporkan kepada pihak berwenang jika ada indikasi serius. Ini mencerminkan nilai Loyal (setia kepada NKRI dan Pancasila) dan tanggung jawab warga negara dalam mencegah radikalisme. Hanya menolak tanpa tindak lanjut (B atau C) kurang responsif terhadap ancaman. Bergabung dengan kelompok berpotensi radikal (A) sangat berbahaya.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000070',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Anti Radikalisme', 'TKP_SCALE', 'SULIT', 8,
  'Di media sosial saya menemukan konten yang menyebarkan ujaran kebencian terhadap kelompok agama tertentu. Sikap saya...',
  '[{"id":"A","text":"Menyukai dan membagikan konten tersebut jika sesuai dengan pandangan saya"},{"id":"B","text":"Mengabaikan konten tersebut karena bukan urusan saya"},{"id":"C","text":"Melaporkan konten tersebut ke platform media sosial"},{"id":"D","text":"Membalas dengan ujaran kebencian balasan untuk membela kelompok yang diserang"},{"id":"E","text":"Melaporkan ke platform, dan jika diperlukan juga kepada pihak berwenang, serta mengedukasi lingkungan sekitar"}]',
  'E',
  '{"A":1,"B":2,"C":4,"D":1,"E":5}',
  'Opsi E paling komprehensif dalam melawan intoleransi digital: melaporkan konten (tindakan aktif), menginformasikan ke pihak berwenang jika serius, dan mengedukasi lingkungan. Ini mencerminkan nilai Loyal kepada NKRI dan Pancasila, serta Harmonis (menghargai keberagaman). Sekadar melaporkan ke platform (C) sudah baik. Mengabaikan (B) membiarkan konten menyebar. Membalas ujaran (D) memperkeruh situasi. Menyebarkan (A) adalah tindakan melanggar hukum (ITE).',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000071',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Anti Radikalisme', 'TKP_SCALE', 'SULIT', 7,
  'Seorang kerabat mengajak saya menghadiri kajian yang pengisinya diketahui sering menyampaikan pandangan yang menolak Pancasila sebagai dasar negara. Saya akan...',
  '[{"id":"A","text":"Menghadiri karena ingin mendengar sendiri dan bisa saja pandangan saya salah tentang pengisi kajian"},{"id":"B","text":"Menolak menghadiri dan menjelaskan kekhawatiran kepada kerabat"},{"id":"C","text":"Menghadiri dan jika ada penyimpangan, saya akan membantah langsung di forum"},{"id":"D","text":"Menolak, menjelaskan risiko kepada kerabat, dan mencari kajian alternatif yang lebih moderat"},{"id":"E","text":"Langsung melaporkan kajian tersebut kepada aparat tanpa menghadirinya"}]',
  'D',
  '{"A":2,"B":4,"C":3,"D":5,"E":3}',
  'Opsi D adalah respons paling bijak: menolak dengan alasan jelas (proteksi diri), mengedukasi kerabat tentang risiko, dan menawarkan alternatif yang lebih baik (konstruktif). Ini mencerminkan nilai Harmonis (menjaga kerukunan keluarga) dan Loyal (kepada Pancasila). Sekadar menolak tanpa penjelasan (B) melewatkan kesempatan edukasi. Membantah di forum (C) bisa memancing konflik. Melaporkan tanpa verifikasi (E) bisa berlebihan.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000072',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Anti Radikalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Di lingkungan kerja, saya mendengar rekan menyebarkan hoaks tentang salah satu kelompok suku yang diklaim memiliki sifat buruk. Saya akan...',
  '[{"id":"A","text":"Percaya karena informasi tersebut banyak beredar di media sosial"},{"id":"B","text":"Diam saja agar tidak menimbulkan konflik"},{"id":"C","text":"Meluruskan informasi dengan data dan fakta yang benar kepada rekan tersebut"},{"id":"D","text":"Melaporkan kepada atasan agar rekan tersebut mendapat teguran"},{"id":"E","text":"Meluruskan informasi kepada rekan, dan jika diperlukan membicarakannya dengan atasan untuk tindak lanjut"}]',
  'E',
  '{"A":1,"B":2,"C":4,"D":3,"E":5}',
  'Opsi E menggabungkan pendekatan langsung (meluruskan hoaks) dengan eskalasi yang tepat jika dibutuhkan. Memerangi hoaks dengan fakta adalah bentuk nyata dari nilai Harmonis (menolak diskriminasi suku) dan Akuntabel (bertanggung jawab terhadap lingkungan kerja). Sekadar meluruskan (C) sudah sangat baik. Diam saja (B) membiarkan hoaks menyebar. Percaya hoaks (A) memperparah masalah.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000073',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Anti Radikalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Menurut saya, cara paling efektif untuk mencegah radikalisme di masyarakat adalah...',
  '[{"id":"A","text":"Memberikan hukuman berat kepada pelaku radikalisme"},{"id":"B","text":"Menutup semua platform media sosial yang berpotensi menyebarkan konten radikal"},{"id":"C","text":"Memperkuat pendidikan karakter, nilai Pancasila, dan literasi digital sejak dini"},{"id":"D","text":"Melarang semua kegiatan keagamaan yang tidak diawasi pemerintah"},{"id":"E","text":"Memperbanyak aparat keamanan di lingkungan masyarakat"}]',
  'C',
  '{"A":3,"B":1,"C":5,"D":1,"E":2}',
  'Opsi C adalah pendekatan preventif yang paling efektif jangka panjang: membangun karakter yang kuat, pemahaman Pancasila yang mendalam, dan kemampuan literasi digital untuk mengenali konten radikal. Pendekatan pendidikan jauh lebih berkelanjutan dibanding pendekatan represif. Hukuman berat (A) perlu namun bukan pencegahan utama. Menutup semua medsos (B) atau melarang semua kegiatan agama (D) tidak realistis dan melanggar hak asasi.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000074',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Anti Radikalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Saya diundang menjadi pembicara di seminar kepemudaan. Materi yang paling tepat saya sampaikan untuk memperkuat wawasan kebangsaan adalah...',
  '[{"id":"A","text":"Cara menghasilkan uang di era digital"},{"id":"B","text":"Nilai-nilai Pancasila sebagai solusi terhadap tantangan radikalisme dan intoleransi"},{"id":"C","text":"Teknik orasi yang efektif untuk menyampaikan aspirasi"},{"id":"D","text":"Cara memenangkan persaingan dalam dunia kerja"},{"id":"E","text":"Tips sukses membangun bisnis startup"}]',
  'B',
  '{"A":2,"B":5,"C":3,"D":2,"E":2}',
  'Opsi B paling relevan dengan konteks seminar kepemudaan dan penguatan wawasan kebangsaan: menyampaikan Pancasila sebagai solusi aktual terhadap tantangan radikalisme dan intoleransi yang mengancam generasi muda. Ini mencerminkan nilai Loyal dan Harmonis. Teknik orasi (C) relevan namun tidak langsung memperkuat wawasan kebangsaan. Topik ekonomi (A, D, E) tidak relevan dengan wawasan kebangsaan.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000075',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Anti Radikalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Sebagai ASN, saya diminta tanda tangan petisi menentang kebijakan pemerintah yang saya tidak setuju di media sosial. Sikap saya...',
  '[{"id":"A","text":"Langsung menandatangani karena memang tidak setuju dengan kebijakan tersebut"},{"id":"B","text":"Menandatangani namun tanpa menyebarkan agar tidak terlalu mencolok"},{"id":"C","text":"Menolak karena ASN harus netral dan tidak boleh berpolitik secara terbuka"},{"id":"D","text":"Mempelajari terlebih dahulu substansi kebijakan sebelum memutuskan"},{"id":"E","text":"Menolak menandatangani, namun menyampaikan pandangan konstruktif melalui jalur internal yang sesuai"}]',
  'E',
  '{"A":1,"B":2,"C":4,"D":3,"E":5}',
  'Opsi E paling bijak: menghormati netralitas ASN (tidak tanda tangan petisi publik) sekaligus menggunakan jalur yang sah untuk menyampaikan pandangan (melalui forum internal, masukan ke atasan, dll.). ASN dilarang berpolitik praktis (UU ASN), namun tetap bisa berkontribusi pada perbaikan kebijakan melalui jalur formal. Sekadar menolak (C) sudah benar tapi kurang konstruktif. Menandatangani (A, B) melanggar netralitas ASN.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000076',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Anti Radikalisme', 'TKP_SCALE', 'SEDANG', 7,
  'Seorang teman mengajak saya mengikuti demonstrasi yang berpotensi anarkis untuk menentang kebijakan pemerintah yang dianggap tidak adil. Saya...',
  '[{"id":"A","text":"Mengikuti demonstrasi karena kebijakan itu memang tidak adil dan perlu dilawan"},{"id":"B","text":"Menolak ikut dan menjelaskan bahwa ada cara yang lebih konstruktif menyampaikan aspirasi"},{"id":"C","text":"Menolak karena demonstrasi itu membuang waktu dan tidak efektif"},{"id":"D","text":"Menolak dan melaporkan kepada pihak berwenang"},{"id":"E","text":"Diam saja dan tidak berkomentar untuk menghindari konflik dengan teman"}]',
  'B',
  '{"A":1,"B":5,"C":3,"D":4,"E":2}',
  'Opsi B adalah yang paling bijak: menolak ikut demonstrasi anarkis (melindungi diri dan tidak melanggar hukum) sekaligus memberi penjelasan yang konstruktif kepada teman tentang cara aspirasi yang sah (petisi resmi, dialog, surat ke wakil rakyat, dll.). Ini mencerminkan nilai Harmonis dan Loyal. Melaporkan ke pihak berwenang (D) tepat jika sudah ada indikasi tindak pidana nyata. Diam saja (E) tidak konstruktif.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- JEJARING KERJA (077-084)
-- ============================================================

(
  'aa300001-0000-0000-0000-000000000077',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Jejaring Kerja', 'TKP_SCALE', 'SEDANG', 5,
  'Teman saya mengingkari janjinya mengembalikan uang yang dipinjamnya. Saya akan...',
  '[{"id":"A","text":"Mendatangi dan menagihnya dengan marah-marah"},{"id":"B","text":"Menunggu dengan sabar, mungkin dia sedang kesulitan keuangan"},{"id":"C","text":"Tidak akan meminjamkan uang kepadanya lagi di masa depan"},{"id":"D","text":"Langsung tidak mau berteman dengannya"},{"id":"E","text":"Mendatangi dan meminta penjelasan dengan sopan tentang janjinya"}]',
  'E',
  '{"A":2,"B":3,"C":3,"D":1,"E":5}',
  'Opsi E adalah yang paling dewasa: meminta klarifikasi secara langsung dan sopan membuka ruang dialog untuk menyelesaikan masalah. Ini mencerminkan nilai Harmonis (menjaga hubungan baik) dan Akuntabel (menyelesaikan komitmen). Menunggu dengan sabar (B) baik tapi pasif. Menagih dengan marah (A) merusak hubungan. Memutuskan pertemanan (D) adalah reaksi berlebihan.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000078',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Jejaring Kerja', 'TKP_SCALE', 'SEDANG', 5,
  'Di kantor saya dikenal sebagai orang yang...',
  '[{"id":"A","text":"Supel dan mudah akrab dengan siapa saja"},{"id":"B","text":"Disiplin dan pekerja keras yang jarang bersosialisasi"},{"id":"C","text":"Ulet dan pantang menyerah namun lebih suka bekerja sendiri"},{"id":"D","text":"Pintar dan penuh ide segar yang selalu mendominasi diskusi"},{"id":"E","text":"Bertanggung jawab, dapat diandalkan, dan mudah bekerja sama"}]',
  'E',
  '{"A":4,"B":3,"C":3,"D":3,"E":5}',
  'Opsi E menggabungkan beberapa kualitas unggul: akuntabel (bertanggung jawab), reliabel (dapat diandalkan), dan kolaboratif (mudah bekerja sama). Kombinasi ini adalah profil ASN ideal yang mencerminkan nilai Akuntabel dan Kolaboratif. Supel dan akrab (A) sangat penting untuk Harmonis. Ulet pantang menyerah (C) mencerminkan Kompeten. Mendominasi diskusi (D) bisa menghambat kolaborasi.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000079',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Jejaring Kerja', 'TKP_SCALE', 'SEDANG', 5,
  'Atasan saya memindahkan saya ke bagian lain di mana saya belum mengenal siapapun. Sikap saya...',
  '[{"id":"A","text":"Langsung mengerjakan tugas tanpa peduli lingkungan baru"},{"id":"B","text":"Menolak pemindahan karena sudah nyaman di bagian lama"},{"id":"C","text":"Menerima dengan kecewa dan bekerja malas-malasan"},{"id":"D","text":"Aktif berkenalan dan membangun hubungan baik dengan rekan baru sambil menyesuaikan diri"},{"id":"E","text":"Menerima pemindahan namun langsung mengajukan permintaan pindah balik"}]',
  'D',
  '{"A":3,"B":1,"C":1,"D":5,"E":2}',
  'Opsi D mencerminkan nilai Adaptif (menyesuaikan diri dengan perubahan) dan Kolaboratif (membangun jejaring baru). Proaktif mengenal lingkungan baru adalah kunci adaptasi yang sehat dan cepat. Ini juga menunjukkan keterbukaan dan kematangan profesional. Sekadar mengerjakan tugas tanpa peduli orang sekitar (A) menghambat kolaborasi. Menolak (B) dan malas-malasan (C) mencerminkan ketidakmatangan.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000080',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Jejaring Kerja', 'TKP_SCALE', 'SEDANG', 5,
  'Tempat kerja saya mengalami pergantian kepala kantor baru. Padahal saya sangat dekat dengan kepala kantor lama. Saya...',
  '[{"id":"A","text":"Berusaha cepat mendekat dan membangun relasi baik dengan kepala kantor baru"},{"id":"B","text":"Tidak mau dekat dengan kepala baru karena loyalitas kepada yang lama"},{"id":"C","text":"Tidak semangat bekerja karena kepala yang saya sukai sudah pergi"},{"id":"D","text":"Segera menyesuaikan diri dengan gaya kerja dan ekspektasi kepemimpinan baru"},{"id":"E","text":"Tidak terpengaruh dengan pergantian dan tetap bekerja profesional dengan siapapun pemimpinnya"}]',
  'E',
  '{"A":4,"B":1,"C":1,"D":4,"E":5}',
  'Opsi E mencerminkan profesionalisme tertinggi: seorang ASN yang matang tidak membiarkan hubungan personal dengan kepala lama memengaruhi kinerjanya dengan kepala baru. Loyal kepada institusi (bukan personal) adalah nilai ASN yang sejati. Menyesuaikan diri dengan kepemimpinan baru (D) juga sangat baik. Tidak mau dekat dengan kepala baru (B) dan tidak semangat (C) mencerminkan kurangnya profesionalisme.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000081',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Jejaring Kerja', 'TKP_SCALE', 'SEDANG', 5,
  'Dalam bekerja, saya paling bersemangat jika...',
  '[{"id":"A","text":"Tempat kerja memiliki kondisi yang nyaman dan kondusif"},{"id":"B","text":"Kontribusi saya mendapat pengakuan dan penghargaan"},{"id":"C","text":"Memiliki rekan kerja yang bisa diajak bekerja sama"},{"id":"D","text":"Memiliki pimpinan yang pengertian dan mendukung"},{"id":"E","text":"Pekerjaan yang saya lakukan memberikan dampak nyata bagi masyarakat"}]',
  'E',
  '{"A":3,"B":3,"C":4,"D":3,"E":5}',
  'Opsi E mencerminkan motivasi intrinsik yang paling tinggi nilainya bagi seorang ASN: bersemangat karena pekerjaan berdampak nyata kepada masyarakat. Ini adalah esensi pelayanan publik dan nilai Berorientasi Pelayanan. Rekan yang kolaboratif (C) juga penting untuk sinergi. Kondisi kerja nyaman (A) dan pimpinan yang mendukung (D) adalah faktor ekstrinsik yang menunjang namun bukan motivasi tertinggi.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000082',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Jejaring Kerja', 'TKP_SCALE', 'SEDANG', 5,
  'Menghadapi masalah di tempat kerja, saya cenderung...',
  '[{"id":"A","text":"Tidak bersemangat dan menjadi lesu"},{"id":"B","text":"Mudah marah kepada rekan yang dianggap bersalah"},{"id":"C","text":"Bercerita kepada rekan untuk mencari solusi bersama"},{"id":"D","text":"Bingung dan cemas memikirkan masalah tersebut"},{"id":"E","text":"Tetap tenang dan menganalisis situasi untuk menemukan solusi"}]',
  'E',
  '{"A":1,"B":2,"C":4,"D":2,"E":5}',
  'Opsi E mencerminkan kematangan emosional dan profesional: menghadapi masalah dengan tenang dan analitis adalah sikap yang paling produktif. Ini sesuai nilai Akuntabel (tidak lari dari masalah) dan Kompeten (menyelesaikan masalah dengan sistematis). Berdiskusi dengan rekan (C) adalah pendekatan kolaboratif yang baik. Tidak bersemangat (A) dan bingung (D) mengurangi efektivitas. Mudah marah (B) merusak hubungan.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000083',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Jejaring Kerja', 'TKP_SCALE', 'SEDANG', 5,
  'Saya mendapatkan keberhasilan dalam pekerjaan karena...',
  '[{"id":"A","text":"Tidak pernah menyerah menghadapi kegagalan dan terus belajar"},{"id":"B","text":"Saya cukup beruntung dan keadaan mendukung"},{"id":"C","text":"Saya berani mengambil risiko yang terukur"},{"id":"D","text":"Lingkungan kerja dan rekan-rekan yang baik mendukung saya"},{"id":"E","text":"Saya menghindari hal-hal yang berisiko gagal"}]',
  'A',
  '{"A":5,"B":2,"C":4,"D":3,"E":1}',
  'Opsi A mencerminkan growth mindset yang paling murni: keberhasilan bukan karena keberuntungan atau kondisi eksternal, melainkan karena ketangguhan dan kemauan belajar dari kegagalan. Ini sesuai nilai Kompeten dan Adaptif. Berani ambil risiko terukur (C) juga menunjukkan keberanian yang positif. Bergantung pada keberuntungan (B) adalah atribusi eksternal yang pasif. Menghindari risiko (E) menghambat inovasi.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- SOSIAL BUDAYA (084-091)
-- ============================================================

(
  'aa300001-0000-0000-0000-000000000084',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Sosial Budaya', 'TKP_SCALE', 'SEDANG', 5,
  'Diminta membantu membersihkan tempat ibadah agama lain oleh tetangga dalam kegiatan gotong royong. Saya...',
  '[{"id":"A","text":"Menolak dengan sopan karena itu adalah tempat ibadah yang berbeda agama dengan saya"},{"id":"B","text":"Mempertimbangkan dulu apakah hal itu dibolehkan agama saya sebelum memutuskan"},{"id":"C","text":"Bersedia membantu karena kegiatan bersih-bersih adalah bentuk gotong royong, bukan beribadah"},{"id":"D","text":"Hanya membantu bagian luar tempat ibadah saja, tidak masuk ke dalam"},{"id":"E","text":"Bersedia sepenuhnya membantu tanpa keberatan apapun sebagai wujud toleransi"}]',
  'E',
  '{"A":1,"B":3,"C":4,"D":3,"E":5}',
  'Opsi E mencerminkan toleransi yang paling tulus: membantu bersih-bersih tempat ibadah agama lain adalah tindakan gotong royong sosial, bukan tindakan ibadah. Ini sesuai nilai Harmonis (menghargai perbedaan dan saling membantu). Bersedia dengan catatan (C dan D) sudah baik namun menunjukkan keraguan. Menolak (A) tidak mencerminkan semangat Bhinneka Tunggal Ika. Nilai ini penting karena ASN melayani semua golongan tanpa diskriminasi.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000085',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Sosial Budaya', 'TKP_SCALE', 'SEDANG', 5,
  'Seorang sahabat lama datang menginap di rumah saya yang sangat sederhana. Saya...',
  '[{"id":"A","text":"Menolak dengan alasan rumah terlalu kecil dan tidak layak"},{"id":"B","text":"Mengizinkan namun merasa malu dan canggung"},{"id":"C","text":"Menjelaskan kondisi rumah dan menyarankan ia menginap di hotel saja"},{"id":"D","text":"Menyewa kamar hotel terbaik untuk sahabat sebagai wujud penghormatan"},{"id":"E","text":"Menerimanya dengan tulus dan memberikan pelayanan terbaik yang bisa saya berikan"}]',
  'E',
  '{"A":1,"B":3,"C":3,"D":2,"E":5}',
  'Opsi E mencerminkan ketulusan dan nilai Harmonis yang paling otentik: menerima tamu dengan sepenuh hati apa adanya jauh lebih bermakna dari kemewahan. Ini juga mencerminkan kearifan budaya Indonesia yang menghargai keikhlasan. Merasa malu (B) membuat tamu tidak nyaman. Menyewa hotel (D) mungkin di luar kemampuan. Menolak (A) adalah keputusan terburuk.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000086',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Sosial Budaya', 'TKP_SCALE', 'SEDANG', 5,
  'Menurut saya, orang yang baik adalah seseorang yang...',
  '[{"id":"A","text":"Selalu menepati janjinya kepada siapapun"},{"id":"B","text":"Selalu menolong orang lain yang membutuhkan"},{"id":"C","text":"Bisa memaafkan kesalahan orang lain"},{"id":"D","text":"Tidak pernah berbuat jahat sepanjang hidupnya"},{"id":"E","text":"Mampu mengemban amanat yang dipercayakan kepadanya"}]',
  'E',
  '{"A":4,"B":4,"C":4,"D":3,"E":5}',
  'Opsi E mendapat nilai tertinggi karena kemampuan mengemban amanat adalah kualitas yang paling komprehensif bagi seorang ASN: menggabungkan integritas, komitmen, dan akuntabilitas. Ini langsung berkaitan dengan nilai Akuntabel dalam BerAKHLAK. Menepati janji (A), menolong (B), dan memaafkan (C) juga merupakan kualitas mulia yang mencerminkan berbagai nilai BerAKHLAK.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000087',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Sosial Budaya', 'TKP_SCALE', 'SEDANG', 5,
  'Keadaan yang sering terjadi dalam pekerjaan kelompok adalah...',
  '[{"id":"A","text":"Semua anggota terlibat aktif dan berkontribusi merata"},{"id":"B","text":"Tidak semua orang mau mengerjakan bagian tugasnya"},{"id":"C","text":"Akhirnya saya yang harus membereskan semua pekerjaan"},{"id":"D","text":"Saling menunggu siapa yang akan memulai"},{"id":"E","text":"Pekerjaan akan selesai jika ada yang mengambil inisiatif memulai"}]',
  'E',
  '{"A":5,"B":2,"C":3,"D":2,"E":4}',
  'Opsi A adalah kondisi ideal (semua aktif berkontribusi). Namun karena ini menggambarkan apa yang "sering terjadi," opsi E lebih realistis sekaligus positif: menunjukkan kesadaran bahwa kepemimpinan dan inisiatif adalah kunci kelompok bergerak. Ini mencerminkan nilai Kolaboratif dan kesadaran untuk menjadi inisiator. Akhirnya saya sendiri yang beresin (C) bisa menunjukkan rasa tanggung jawab tinggi. Saling menunggu (D) adalah kondisi yang kontraproduktif.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000088',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Sosial Budaya', 'TKP_SCALE', 'SEDANG', 5,
  'Istri rekan kerja saya baru melahirkan. Saya ingin mengunjungi tapi tidak punya uang untuk membeli kado. Saya...',
  '[{"id":"A","text":"Menunda kunjungan sampai ada uang untuk membeli kado"},{"id":"B","text":"Tetap mengunjungi tanpa membawa kado namun dengan doa dan ucapan selamat"},{"id":"C","text":"Mengunjungi dan berjanji akan menyusulkan kadonya di lain waktu"},{"id":"D","text":"Tidak jadi mengunjungi karena tidak enak datang tanpa bawa kado"},{"id":"E","text":"Meminjam uang ke teman untuk membeli kado"}]',
  'B',
  '{"A":2,"B":5,"C":4,"D":1,"E":3}',
  'Opsi B mencerminkan nilai kemanusiaan yang tulus: kehadiran dan doa jauh lebih bermakna dari kado. Ini menunjukkan prioritas yang tepat—hubungan dan kepedulian lebih penting dari simbol material. Berjanji menyusulkan kado (C) juga menunjukkan niat baik. Menunda kunjungan atau tidak jadi datang (A, D) karena tidak punya kado adalah prioritas yang keliru. Meminjam uang paksa (E) bisa membebani diri sendiri.',
  ARRAY['sering-keluar']
),

-- ============================================================
-- TEKNOLOGI INFORMASI (092-100)
-- ============================================================

(
  'aa300001-0000-0000-0000-000000000089',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 6,
  'Saya sangat membutuhkan sebuah buku mahal yang berguna untuk meningkatkan kompetensi kerja, namun keuangan saya sedang menipis. Saya...',
  '[{"id":"A","text":"Menabung dulu sampai terkumpul uang yang cukup"},{"id":"B","text":"Meminta kantor untuk membelikannya"},{"id":"C","text":"Menunggu sampai ada uang lebih"},{"id":"D","text":"Meminjam uang ke teman untuk membeli buku itu"},{"id":"E","text":"Mencari versi digital, pinjam dari perpustakaan, atau mencari alternatif bahan belajar gratis lainnya"}]',
  'E',
  '{"A":4,"B":3,"C":2,"D":2,"E":5}',
  'Opsi E mencerminkan nilai Kompeten dan Adaptif tertinggi: era digital menyediakan banyak alternatif belajar gratis (e-book, jurnal, MOOC, perpustakaan digital nasional). Kreativitas mencari alternatif adalah kunci ASN yang adaptif di era digital. Menabung (A) juga menunjukkan kedisiplinan keuangan yang baik. Meminta kantor (B) wajar jika ada anggaran pengembangan SDM. Meminjam uang paksa (D) tidak perlu jika ada alternatif yang lebih baik.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000090',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 6,
  'Kantor saya mulai menerapkan sistem e-government yang membutuhkan semua pegawai melek digital. Namun, sebagian besar rekan saya masih kesulitan menggunakannya. Saya...',
  '[{"id":"A","text":"Diam saja dan hanya mengurus keperluan saya sendiri"},{"id":"B","text":"Melaporkan kepada atasan bahwa sebagian besar pegawai belum siap"},{"id":"C","text":"Membantu rekan-rekan yang kesulitan dengan cara yang sabar dan mudah dipahami"},{"id":"D","text":"Menyarankan penundaan implementasi sampai semua siap"},{"id":"E","text":"Membantu rekan, sekaligus mengusulkan program pelatihan formal agar transformasi digital berjalan menyeluruh"}]',
  'E',
  '{"A":1,"B":3,"C":4,"D":2,"E":5}',
  'Opsi E menggabungkan tindakan langsung (membantu rekan) dengan inisiatif sistemik (mengusulkan pelatihan). Ini mencerminkan nilai Kolaboratif, Kompeten, dan Adaptif sekaligus. Sekadar membantu rekan (C) sudah sangat baik. Melaporkan saja ke atasan (B) tanpa mengambil inisiatif kurang proaktif. Diam saja (A) adalah yang terburuk. Menyarankan penundaan (D) menghambat kemajuan.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000091',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 6,
  'Saya menemukan ada aplikasi/sistem digital baru yang bisa meningkatkan efisiensi pelayanan di kantor secara signifikan. Saya...',
  '[{"id":"A","text":"Menggunakannya untuk keperluan saya sendiri saja"},{"id":"B","text":"Menunggu sampai ada instruksi dari atasan untuk menggunakannya"},{"id":"C","text":"Mencoba sendiri terlebih dahulu, lalu merekomendasikan kepada atasan jika terbukti efektif"},{"id":"D","text":"Langsung menerapkannya di seluruh unit tanpa koordinasi"},{"id":"E","text":"Mempresentasikan temuannya kepada atasan dengan data manfaat yang konkret, mengusulkan pilot project"}]',
  'E',
  '{"A":2,"B":2,"C":4,"D":1,"E":5}',
  'Opsi E mencerminkan inovasi yang sistematis dan bertanggung jawab: menyampaikan ide dengan data kepada atasan dan mengusulkan pilot project sebelum penerapan luas. Ini mencerminkan nilai Adaptif (berinovasi) dan Kolaboratif (melibatkan atasan). Mencoba sendiri dulu (C) juga merupakan inisiatif yang baik. Menunggu instruksi (B) terlalu pasif. Menerapkan langsung tanpa koordinasi (D) melampaui wewenang dan berisiko.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000092',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 6,
  'Saya menemukan bahwa sistem informasi manajemen di kantor saya memiliki celah keamanan yang berpotensi disalahgunakan. Saya akan...',
  '[{"id":"A","text":"Diam saja karena menambal celah keamanan bukan tanggung jawab saya"},{"id":"B","text":"Memanfaatkan celah tersebut untuk kepentingan pribadi karena tidak ada yang tahu"},{"id":"C","text":"Segera melaporkan temuan ini kepada tim IT dan atasan terkait"},{"id":"D","text":"Melaporkan hanya kepada tim IT tanpa memberitahu atasan"},{"id":"E","text":"Mendokumentasikan temuan secara detail dan melaporkannya secara resmi kepada atasan dan tim IT dengan usulan solusi"}]',
  'E',
  '{"A":2,"B":1,"C":4,"D":3,"E":5}',
  'Opsi E adalah respons paling profesional dan komprehensif: mendokumentasikan (teliti), melaporkan secara resmi (akuntabel), dan menyertakan usulan solusi (proaktif dan kompeten). Ini mencerminkan nilai Akuntabel dan Loyal (melindungi aset dan data negara). Sekadar melaporkan (C) sudah sangat baik. Memanfaatkan celah (B) adalah tindakan tidak etis dan berpotensi pidana. Diam saja (A) membiarkan risiko keamanan data negara.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000093',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 5,
  'Rekan kerja saya menyebarkan informasi yang belum terverifikasi (hoaks) melalui grup WhatsApp kantor. Saya akan...',
  '[{"id":"A","text":"Ikut menyebarkan karena informasi tersebut terdengar menarik"},{"id":"B","text":"Diam saja dan mengabaikan informasi tersebut"},{"id":"C","text":"Membalas di grup dengan klarifikasi dan sumber informasi yang valid"},{"id":"D","text":"Menghubungi rekan secara pribadi untuk memberi tahu bahwa informasi tersebut hoaks"},{"id":"E","text":"Membalas di grup dengan klarifikasi berbasis fakta dan secara pribadi mengingatkan rekan untuk lebih berhati-hati"}]',
  'E',
  '{"A":1,"B":2,"C":4,"D":4,"E":5}',
  'Opsi E menggabungkan koreksi publik (mencegah hoaks menyebar lebih luas di grup) dan teguran personal (menjaga martabat rekan). Kedua pendekatan ini saling melengkapi. Klarifikasi di grup (C) sudah baik untuk mencegah penyebaran. Teguran personal (D) menjaga hubungan. Diam saja (B) membiarkan hoaks menyebar. Ikut menyebarkan (A) adalah tindakan paling tidak bertanggung jawab.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000094',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 5,
  'Jajaran direksi/pimpinan di instansi saya mengalami perombakan besar-besaran. Sikap saya...',
  '[{"id":"A","text":"Tidak memikirkannya, saya hanya pegawai biasa yang tidak terkena dampak langsung"},{"id":"B","text":"Perubahan pimpinan adalah hal biasa dalam organisasi"},{"id":"C","text":"Meningkatkan kinerja dengan harapan diperhatikan pimpinan baru"},{"id":"D","text":"Segera mendekati pimpinan baru untuk membangun relasi yang menguntungkan"},{"id":"E","text":"Tetap fokus bekerja dengan profesional dan terbuka menyesuaikan diri dengan arah kebijakan baru"}]',
  'E',
  '{"A":2,"B":3,"C":4,"D":2,"E":5}',
  'Opsi E mencerminkan profesionalisme dan nilai Adaptif yang paling matang: perubahan pimpinan tidak boleh mengganggu kinerja; sebaliknya, ASN yang adaptif menyambut perubahan dengan keterbukaan dan kemauan menyesuaikan diri. Meningkatkan kinerja (C) juga positif. Mendekati pimpinan baru untuk kepentingan pribadi (D) bukan motivasi yang tepat. Acuh tak acuh (A) melewatkan kesempatan menyesuaikan arah kerja.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000095',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 6,
  'Kantor saya memberlakukan kebijakan pembatasan media sosial selama jam kerja. Namun, saya sering mendapat informasi kerja penting melalui WhatsApp. Saya...',
  '[{"id":"A","text":"Mengabaikan kebijakan karena WA untuk urusan pekerjaan"},{"id":"B","text":"Mematuhi kebijakan sepenuhnya dan tidak membuka WA sama sekali"},{"id":"C","text":"Meminta atasan untuk mengecualikan WhatsApp dari kebijakan pembatasan"},{"id":"D","text":"Menggunakan WA hanya untuk keperluan pekerjaan, mematuhi spirit kebijakan, dan mengusulkan aturan yang lebih jelas"},{"id":"E","text":"Melaporkan kepada pimpinan bahwa kebijakan ini menghambat komunikasi kerja"}]',
  'D',
  '{"A":2,"B":3,"C":4,"D":5,"E":3}',
  'Opsi D adalah yang paling bijak: mematuhi spirit kebijakan (tidak menggunakan medsos untuk urusan pribadi), menggunakan WA hanya untuk keperluan kerja (pragmatis), sekaligus mengusulkan penyempurnaan aturan agar lebih jelas. Ini mencerminkan nilai Akuntabel (patuh pada aturan), Adaptif (solusi inovatif), dan Kolaboratif (mengusulkan perbaikan). Mengabaikan kebijakan sepenuhnya (A) tidak dapat dibenarkan meski alasannya kerja.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000096',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 6,
  'Saya diminta membuat laporan data kinerja menggunakan aplikasi baru yang belum saya kuasai dan batas waktunya besok. Saya...',
  '[{"id":"A","text":"Menunda pekerjaan dan meminta perpanjangan waktu"},{"id":"B","text":"Membuat laporan dengan aplikasi lama yang sudah saya kuasai"},{"id":"C","text":"Mempelajari aplikasi baru secara mandiri dan segera menggunakannya"},{"id":"D","text":"Meminta bantuan rekan yang sudah menguasai aplikasi tersebut sambil belajar"},{"id":"E","text":"Mempelajari sendiri secepat mungkin, dan meminta bantuan rekan jika ada bagian yang sulit, agar laporan selesai tepat waktu"}]',
  'E',
  '{"A":1,"B":2,"C":4,"D":4,"E":5}',
  'Opsi E menggabungkan inisiatif belajar mandiri (nilai Kompeten) dengan kecerdasan kolaborasi (nilai Kolaboratif) untuk memastikan laporan selesai tepat waktu (nilai Akuntabel). Ini adalah pendekatan paling realistis dan efisien menghadapi tenggat waktu yang ketat. Belajar mandiri (C) bagus tapi mungkin kurang efisien untuk deadline besok. Menggunakan aplikasi lama (B) tidak sesuai permintaan. Minta perpanjangan (A) tidak menunjukkan inisiatif.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000097',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 5,
  'Saya menemukan bahwa beberapa prosedur kerja di kantor sangat tidak efisien dan bisa didigitalisasi. Namun, perubahan ini memerlukan persetujuan dari banyak pihak. Saya...',
  '[{"id":"A","text":"Langsung melakukan perubahan sendiri tanpa menunggu persetujuan"},{"id":"B","text":"Membiarkan saja karena terlalu sulit mengubah kebiasaan yang sudah ada"},{"id":"C","text":"Menyusun proposal perubahan yang detail dengan analisis manfaat dan risiko, lalu mengajukannya secara formal"},{"id":"D","text":"Mengeluh kepada rekan-rekan tentang ketidakefisienan ini"},{"id":"E","text":"Membicarakan ide perbaikan dengan rekan terlebih dahulu untuk mendapat dukungan, lalu mengajukan ke pimpinan"}]',
  'C',
  '{"A":2,"B":1,"C":5,"D":1,"E":4}',
  'Opsi C mencerminkan inovasi yang sistematis dan profesional: menyusun proposal terstruktur dengan analisis manfaat-risiko menunjukkan kematangan dan kompetensi. Ini mencerminkan nilai Adaptif (berinovasi) dan Akuntabel (melalui jalur formal). Membangun dukungan dari rekan dulu (E) juga strategis. Mengubah sendiri tanpa izin (A) melampaui wewenang. Membiarkan saja (B) dan mengeluh (D) tidak konstruktif.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000098',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Teknologi Informasi', 'TKP_SCALE', 'SEDANG', 5,
  'Menerima tugas dari atasan yang memerlukan penggunaan teknologi baru yang belum saya pelajari. Saya...',
  '[{"id":"A","text":"Menyampaikan kepada atasan bahwa saya tidak bisa mengerjakan tanpa pelatihan terlebih dahulu"},{"id":"B","text":"Belajar secara mandiri menggunakan sumber daya yang tersedia (tutorial, dokumentasi, komunitas online)"},{"id":"C","text":"Mencari rekan yang sudah ahli di bidang itu untuk berbagi ilmu"},{"id":"D","text":"Mengerjakan sesuai pemahaman yang ada meski hasilnya mungkin kurang optimal"},{"id":"E","text":"Menolak tugas tersebut karena di luar kemampuan saya saat ini"}]',
  'B',
  '{"A":2,"B":5,"C":4,"D":1,"E":1}',
  'Opsi B mendapat nilai tertinggi karena menunjukkan nilai Kompeten dan Adaptif: belajar mandiri menggunakan sumber daya yang tersedia (dokumentasi resmi, tutorial, komunitas) adalah respons proaktif yang paling ideal. Era digital menyediakan akses belajar yang hampir tak terbatas. Belajar dari rekan yang ahli (C) adalah alternatif kolaboratif yang juga sangat efektif. Menyatakan tidak bisa (A) tanpa mencoba belajar sendiri kurang inisiatif. Menolak tugas (E) adalah opsi terburuk.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000099',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Sosial Budaya', 'TKP_SCALE', 'SEDANG', 5,
  'Di kantor hari libur, handphone saya berdering dan terlihat panggilan dari atasan. Saya...',
  '[{"id":"A","text":"Membiarkan panggilan tersebut tidak diangkat"},{"id":"B","text":"Mengangkat panggilan karena mungkin ada hal penting yang mendesak"},{"id":"C","text":"Membiarkan panggilan dan menelpon balik setelah acara pribadi selesai"},{"id":"D","text":"Menyuruh orang lain untuk mengangkat panggilan"},{"id":"E","text":"Mengangkat panggilan, mendengarkan keperluan atasan, dan memutuskan tindakan terbaik berdasarkan situasi"}]',
  'E',
  '{"A":1,"B":4,"C":3,"D":1,"E":5}',
  'Opsi E adalah yang paling bijak: mengangkat panggilan untuk mengetahui urgensinya, lalu memutuskan tindakan yang tepat berdasarkan situasi konkret. Mungkin saja hal itu tidak mendesak (dan bisa ditangani kemudian) atau sangat kritis (dan perlu respons segera). Fleksibilitas dan penilaian situasional mencerminkan kematangan profesional. Langsung mengangkat tanpa evaluasi (B) baik namun kurang nuansanya. Mengabaikan (A) dan menyuruh orang lain (D) tidak profesional.',
  ARRAY['sering-keluar']
),

(
  'aa300001-0000-0000-0000-000000000100',
  'a0000001-0000-0000-0000-000000000003',
  'CPNS', 'TKP', 'Sosial Budaya', 'TKP_SCALE', 'SEDANG', 5,
  'Atasan saya memberi informasi rahasia yang tidak semua karyawan tahu. Sikap saya...',
  '[{"id":"A","text":"Memberitahukan kepada semua rekan kerja karena mereka berhak tahu"},{"id":"B","text":"Memberitahu rekan bahwa saya diberi informasi rahasia tanpa menceritakan isinya untuk menunjukkan kepercayaan atasan"},{"id":"C","text":"Menyimpan informasi tersebut untuk diri sendiri dan menjalankan tugas sesuai informasi yang diberikan"},{"id":"D","text":"Menceritakan hanya kepada rekan dekat yang dapat dipercaya"},{"id":"E","text":"Menyimpan informasi tersebut dengan baik dan hanya menggunakannya sesuai tujuan atasan memberikannya"}]',
  'E',
  '{"A":1,"B":2,"C":3,"D":2,"E":5}',
  'Opsi E adalah yang paling tepat: menjaga kerahasiaan informasi dan menggunakannya hanya sesuai tujuan yang dimaksud atasan. Ini mencerminkan nilai Akuntabel (bertanggung jawab atas kepercayaan) dan Loyal (menjaga rahasia instansi). Menyimpan untuk diri sendiri (C) sudah baik namun opsi E lebih eksplisit tentang penggunaan yang tepat. Memberitahu siapapun (A, B, D) melanggar kepercayaan dan bisa melanggar aturan kerahasiaan data.',
  ARRAY['sering-keluar']
)

ON CONFLICT (id) DO NOTHING;
