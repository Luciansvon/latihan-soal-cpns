// Adapted from VARK Questionnaire v8.01 (Fleming & Mills, 1992)
// and Honey & Mumford (1982) Learning Styles Questionnaire
// for Indonesian exam preparation context

export interface LearningStyleQuestion {
  id: number;
  question: string;
  options: {
    id: 'A' | 'B' | 'C' | 'D';
    text: string;
    // VARK weights
    visual: number;
    auditory: number;
    reading: number;
    kinesthetic: number;
    // Honey & Mumford weights
    activist: number;
    reflector: number;
    theorist: number;
    pragmatist: number;
  }[];
}

export const LEARNING_STYLE_QUESTIONS: LearningStyleQuestion[] = [
  {
    id: 1,
    question: 'Saat belajar materi TWK (Wawasan Kebangsaan) yang baru, cara terbaik bagimu adalah...',
    options: [
      {
        id: 'A',
        text: 'Membuat diagram atau bagan alur untuk menghubungkan konsep-konsep penting',
        visual: 3, auditory: 0, reading: 1, kinesthetic: 0,
        activist: 0, reflector: 1, theorist: 3, pragmatist: 0,
      },
      {
        id: 'B',
        text: 'Mendengarkan penjelasan dari guru atau video YouTube sambil mencatat poin penting',
        visual: 0, auditory: 3, reading: 1, kinesthetic: 0,
        activist: 1, reflector: 1, theorist: 1, pragmatist: 0,
      },
      {
        id: 'C',
        text: 'Membaca UUD 1945, buku teks, atau ringkasan materi secara menyeluruh',
        visual: 0, auditory: 0, reading: 3, kinesthetic: 0,
        activist: 0, reflector: 2, theorist: 2, pragmatist: 0,
      },
      {
        id: 'D',
        text: 'Langsung mengerjakan soal-soal latihan dan belajar dari kesalahan',
        visual: 0, auditory: 0, reading: 0, kinesthetic: 3,
        activist: 3, reflector: 0, theorist: 0, pragmatist: 2,
      },
    ],
  },
  {
    id: 2,
    question: 'Ketika kamu mendapat soal TIU yang sulit, hal pertama yang kamu lakukan adalah...',
    options: [
      {
        id: 'A',
        text: 'Visualisasikan soal dengan gambar atau sketsa di kertas corat-coret',
        visual: 3, auditory: 0, reading: 0, kinesthetic: 1,
        activist: 0, reflector: 1, theorist: 1, pragmatist: 1,
      },
      {
        id: 'B',
        text: 'Mengulang pertanyaan dalam hati dan "mendiskusikan" pilihan jawaban sendiri',
        visual: 0, auditory: 3, reading: 0, kinesthetic: 0,
        activist: 1, reflector: 2, theorist: 1, pragmatist: 0,
      },
      {
        id: 'C',
        text: 'Membaca soal berulang kali dengan cermat, mencari kata kunci',
        visual: 0, auditory: 0, reading: 3, kinesthetic: 0,
        activist: 0, reflector: 3, theorist: 1, pragmatist: 0,
      },
      {
        id: 'D',
        text: 'Langsung coba pilih jawaban yang paling masuk akal, lanjut ke soal berikutnya',
        visual: 0, auditory: 0, reading: 0, kinesthetic: 3,
        activist: 3, reflector: 0, theorist: 0, pragmatist: 3,
      },
    ],
  },
  {
    id: 3,
    question: 'Setelah mengerjakan tryout dan melihat hasilnya, kamu biasanya...',
    options: [
      {
        id: 'A',
        text: 'Membuat grafik atau tabel perbandingan skor per kategori untuk melihat pola',
        visual: 3, auditory: 0, reading: 1, kinesthetic: 0,
        activist: 0, reflector: 2, theorist: 2, pragmatist: 1,
      },
      {
        id: 'B',
        text: 'Menceritakan hasilnya ke teman atau keluarga untuk mendapat perspektif lain',
        visual: 0, auditory: 3, reading: 0, kinesthetic: 0,
        activist: 2, reflector: 1, theorist: 0, pragmatist: 0,
      },
      {
        id: 'C',
        text: 'Membaca detail pembahasan setiap soal yang salah dengan teliti',
        visual: 0, auditory: 0, reading: 3, kinesthetic: 0,
        activist: 0, reflector: 3, theorist: 2, pragmatist: 0,
      },
      {
        id: 'D',
        text: 'Segera latihan soal lagi di topik yang paling banyak salahnya',
        visual: 0, auditory: 0, reading: 0, kinesthetic: 3,
        activist: 3, reflector: 0, theorist: 0, pragmatist: 3,
      },
    ],
  },
  {
    id: 4,
    question: 'Cara favoritmu mengingat rumus matematika atau aturan tata bahasa adalah...',
    options: [
      {
        id: 'A',
        text: 'Menulisnya dengan warna berbeda di catatan visual, membuat flashcard bergambar',
        visual: 3, auditory: 0, reading: 1, kinesthetic: 1,
        activist: 0, reflector: 1, theorist: 1, pragmatist: 1,
      },
      {
        id: 'B',
        text: 'Membuat sajak/lagu atau mengucapkannya keras-keras berulang kali',
        visual: 0, auditory: 3, reading: 0, kinesthetic: 1,
        activist: 2, reflector: 0, theorist: 0, pragmatist: 1,
      },
      {
        id: 'C',
        text: 'Menulis ulang berkali-kali sampai hafal, membuat rangkuman tertulis lengkap',
        visual: 0, auditory: 0, reading: 3, kinesthetic: 1,
        activist: 0, reflector: 2, theorist: 2, pragmatist: 0,
      },
      {
        id: 'D',
        text: 'Langsung menerapkan rumus di banyak soal latihan sampai terasa otomatis',
        visual: 0, auditory: 0, reading: 0, kinesthetic: 3,
        activist: 3, reflector: 0, theorist: 0, pragmatist: 3,
      },
    ],
  },
  {
    id: 5,
    question: 'Saat jadwal belajarmu terganggu atau kamu tidak bisa latihan sehari, responmu adalah...',
    options: [
      {
        id: 'A',
        text: 'Tidak terlalu khawatir, besok buat jadwal visual yang lebih baik untuk catch up',
        visual: 2, auditory: 0, reading: 0, kinesthetic: 0,
        activist: 1, reflector: 2, theorist: 1, pragmatist: 1,
      },
      {
        id: 'B',
        text: 'Tetap coba review materi sambil mendengarkan podcast atau video singkat',
        visual: 0, auditory: 3, reading: 0, kinesthetic: 0,
        activist: 2, reflector: 0, theorist: 0, pragmatist: 2,
      },
      {
        id: 'C',
        text: 'Membaca ringkasan materi, meski singkat, agar tidak lupa sama sekali',
        visual: 0, auditory: 0, reading: 3, kinesthetic: 0,
        activist: 0, reflector: 2, theorist: 2, pragmatist: 1,
      },
      {
        id: 'D',
        text: 'Langsung ganti dengan mengerjakan minimal 10 soal cepat di waktu luang',
        visual: 0, auditory: 0, reading: 0, kinesthetic: 3,
        activist: 3, reflector: 0, theorist: 0, pragmatist: 3,
      },
    ],
  },
  {
    id: 6,
    question: 'Menurutmu, cara paling efektif memahami struktur pemerintahan Indonesia adalah...',
    options: [
      {
        id: 'A',
        text: 'Melihat bagan/infografis struktur lembaga negara yang lengkap dan berwarna',
        visual: 3, auditory: 0, reading: 0, kinesthetic: 0,
        activist: 0, reflector: 1, theorist: 2, pragmatist: 0,
      },
      {
        id: 'B',
        text: 'Menonton video penjelasan atau mendiskusikannya dengan sesama peserta tes',
        visual: 0, auditory: 3, reading: 0, kinesthetic: 0,
        activist: 2, reflector: 0, theorist: 0, pragmatist: 1,
      },
      {
        id: 'C',
        text: 'Membaca buku teks atau artikel yang menjelaskan sejarah dan dasar hukumnya',
        visual: 0, auditory: 0, reading: 3, kinesthetic: 0,
        activist: 0, reflector: 2, theorist: 3, pragmatist: 0,
      },
      {
        id: 'D',
        text: 'Langsung mengerjakan soal TWK tentang pemerintahan sampai benar-benar paham',
        visual: 0, auditory: 0, reading: 0, kinesthetic: 3,
        activist: 3, reflector: 0, theorist: 0, pragmatist: 3,
      },
    ],
  },
  {
    id: 7,
    question: 'Jika kamu harus menjelaskan materi ke teman yang juga sedang belajar CPNS, kamu akan...',
    options: [
      {
        id: 'A',
        text: 'Menggambar diagram, mind map, atau tabel sambil menjelaskan',
        visual: 3, auditory: 1, reading: 0, kinesthetic: 1,
        activist: 1, reflector: 1, theorist: 2, pragmatist: 1,
      },
      {
        id: 'B',
        text: 'Bercerita dan menjelaskan dengan analogi serta contoh nyata secara lisan',
        visual: 0, auditory: 3, reading: 0, kinesthetic: 1,
        activist: 3, reflector: 0, theorist: 0, pragmatist: 1,
      },
      {
        id: 'C',
        text: 'Memberikan referensi buku atau artikel bagus untuk dibaca bersama',
        visual: 0, auditory: 0, reading: 3, kinesthetic: 0,
        activist: 0, reflector: 2, theorist: 3, pragmatist: 0,
      },
      {
        id: 'D',
        text: 'Mengajak langsung mengerjakan soal bareng dan bahas setiap jawaban',
        visual: 0, auditory: 1, reading: 0, kinesthetic: 3,
        activist: 3, reflector: 0, theorist: 0, pragmatist: 3,
      },
    ],
  },
  {
    id: 8,
    question: 'Ketika kamu sedang bosan dan motivasi turun, cara terbaik untuk memulai lagi adalah...',
    options: [
      {
        id: 'A',
        text: 'Melihat progress chartmu — grafik skor yang naik memberikan semangat visual',
        visual: 3, auditory: 0, reading: 0, kinesthetic: 0,
        activist: 0, reflector: 2, theorist: 1, pragmatist: 1,
      },
      {
        id: 'B',
        text: 'Mendengarkan cerita motivasi atau menghubungi teman yang juga berjuang',
        visual: 0, auditory: 3, reading: 0, kinesthetic: 0,
        activist: 2, reflector: 1, theorist: 0, pragmatist: 0,
      },
      {
        id: 'C',
        text: 'Membaca kembali cita-cita dan tujuanmu yang sudah ditulis di buku/jurnal',
        visual: 1, auditory: 0, reading: 3, kinesthetic: 0,
        activist: 0, reflector: 3, theorist: 1, pragmatist: 0,
      },
      {
        id: 'D',
        text: 'Langsung mulai dari soal yang paling mudah untuk membangun momentum',
        visual: 0, auditory: 0, reading: 0, kinesthetic: 3,
        activist: 3, reflector: 0, theorist: 0, pragmatist: 3,
      },
    ],
  },
  {
    id: 9,
    question: 'Dalam mempersiapkan simulasi tryout, pendekatan terbaikmu adalah...',
    options: [
      {
        id: 'A',
        text: 'Menyiapkan jadwal visual dengan warna berbeda per kategori soal yang akan fokus',
        visual: 3, auditory: 0, reading: 1, kinesthetic: 0,
        activist: 0, reflector: 2, theorist: 2, pragmatist: 1,
      },
      {
        id: 'B',
        text: 'Mendiskusikan strategi dengan teman atau mengikuti sesi latihan kelompok',
        visual: 0, auditory: 3, reading: 0, kinesthetic: 1,
        activist: 3, reflector: 0, theorist: 0, pragmatist: 1,
      },
      {
        id: 'C',
        text: 'Mempelajari kisi-kisi resmi BKN dan pola soal dari tryout-tryout sebelumnya',
        visual: 0, auditory: 0, reading: 3, kinesthetic: 0,
        activist: 0, reflector: 2, theorist: 3, pragmatist: 1,
      },
      {
        id: 'D',
        text: 'Langsung ikut sebanyak mungkin tryout simulasi untuk terbiasa dengan kondisi ujian',
        visual: 0, auditory: 0, reading: 0, kinesthetic: 3,
        activist: 3, reflector: 0, theorist: 0, pragmatist: 3,
      },
    ],
  },
  {
    id: 10,
    question: 'Setelah menerima hasil tryout yang tidak memuaskan, langkah pertamamu adalah...',
    options: [
      {
        id: 'A',
        text: 'Membuat peta visual kelemahan — kategori mana yang nilainya paling rendah',
        visual: 3, auditory: 0, reading: 1, kinesthetic: 0,
        activist: 0, reflector: 2, theorist: 2, pragmatist: 1,
      },
      {
        id: 'B',
        text: 'Membicarakan hasilnya dengan seseorang yang berpengalaman untuk minta saran',
        visual: 0, auditory: 3, reading: 0, kinesthetic: 0,
        activist: 1, reflector: 2, theorist: 0, pragmatist: 1,
      },
      {
        id: 'C',
        text: 'Membaca semua pembahasan soal yang salah sampai benar-benar mengerti',
        visual: 0, auditory: 0, reading: 3, kinesthetic: 0,
        activist: 0, reflector: 3, theorist: 2, pragmatist: 0,
      },
      {
        id: 'D',
        text: 'Langsung kerjakan ulang soal yang sama atau soal serupa sampai benar',
        visual: 0, auditory: 0, reading: 0, kinesthetic: 3,
        activist: 3, reflector: 0, theorist: 0, pragmatist: 3,
      },
    ],
  },
  {
    id: 11,
    question: 'Cara paling efektif bagimu dalam mengingat urutan peristiwa sejarah adalah...',
    options: [
      {
        id: 'A',
        text: 'Membuat timeline visual dengan gambar ikon di setiap tonggak penting',
        visual: 3, auditory: 0, reading: 1, kinesthetic: 0,
        activist: 0, reflector: 1, theorist: 2, pragmatist: 0,
      },
      {
        id: 'B',
        text: 'Menceritakan ulang sejarah secara kronologis seperti bercerita kepada orang lain',
        visual: 0, auditory: 3, reading: 0, kinesthetic: 1,
        activist: 2, reflector: 1, theorist: 0, pragmatist: 0,
      },
      {
        id: 'C',
        text: 'Menulis ringkasan lengkap dengan detail tanggal, tokoh, dan dampak setiap peristiwa',
        visual: 0, auditory: 0, reading: 3, kinesthetic: 0,
        activist: 0, reflector: 2, theorist: 3, pragmatist: 0,
      },
      {
        id: 'D',
        text: 'Mengerjakan soal-soal tentang sejarah dan menebak sampai menemukan pola',
        visual: 0, auditory: 0, reading: 0, kinesthetic: 3,
        activist: 3, reflector: 0, theorist: 0, pragmatist: 2,
      },
    ],
  },
  {
    id: 12,
    question: 'Saat menghadapi materi yang sangat sulit dan membingungkan, strategimu adalah...',
    options: [
      {
        id: 'A',
        text: 'Mencari infografis, video animasi, atau representasi visual dari konsep tersebut',
        visual: 3, auditory: 1, reading: 0, kinesthetic: 0,
        activist: 1, reflector: 1, theorist: 1, pragmatist: 0,
      },
      {
        id: 'B',
        text: 'Mendengarkan penjelasan dari berbagai sumber audio/video sampai ada yang "nyambung"',
        visual: 0, auditory: 3, reading: 0, kinesthetic: 0,
        activist: 1, reflector: 1, theorist: 1, pragmatist: 0,
      },
      {
        id: 'C',
        text: 'Membaca dari sumber primer (UU, perpres, buku akademik) untuk memahami akarnya',
        visual: 0, auditory: 0, reading: 3, kinesthetic: 0,
        activist: 0, reflector: 2, theorist: 3, pragmatist: 0,
      },
      {
        id: 'D',
        text: 'Skip dulu, kerjakan soal tentang topik itu sebanyak mungkin, nanti paham sendiri',
        visual: 0, auditory: 0, reading: 0, kinesthetic: 3,
        activist: 3, reflector: 0, theorist: 0, pragmatist: 3,
      },
    ],
  },
];
