export type MotivationContext =
  | 'PERFECT_SCORE'
  | 'HIGH_SCORE'
  | 'MEDIUM_SCORE'
  | 'LOW_SCORE'
  | 'STREAK_MILESTONE'
  | 'EXAM_SOON'
  | 'RETURN_AFTER_ABSENCE'
  | 'FIRST_TRYOUT'
  | 'PASSED_THRESHOLD'
  | 'FAILED_THRESHOLD'
  | 'LEVEL_UP';

export const MOTIVATION_MESSAGES: Record<MotivationContext, string[]> = {
  PERFECT_SCORE: [
    'Luar biasa! Nilai sempurna! Kamu sudah sangat siap menghadapi ujian!',
    'Mantap sekali! Pertahankan semangat ini sampai hari H!',
    'Sempurna! Pejuang sejati tidak kenal kata menyerah!',
  ],
  HIGH_SCORE: [
    'Bagus banget! Sedikit lagi kamu akan menguasai materi ini sepenuhnya!',
    'Kerja keras kamu mulai membuahkan hasil! Terus latihan ya!',
    'Hampir sempurna! Ulangi beberapa soal yang masih salah untuk makin mantap!',
  ],
  MEDIUM_SCORE: [
    'Lumayan! Fokus latih bagian yang masih kurang, kamu pasti bisa!',
    'Ada kemajuan! Terusin latihan, hasilnya akan makin baik!',
    'Jangan putus asa, setiap latihan membawa kamu lebih dekat ke tujuan!',
  ],
  LOW_SCORE: [
    'Jangan menyerah! Setiap soal yang salah adalah pelajaran berharga.',
    'Semua orang pernah di posisi ini. Yang penting terus belajar!',
    'Pejuang sejati bangkit dari kegagalan. Coba lagi, kamu pasti bisa!',
  ],
  STREAK_MILESTONE: [
    'Konsisten adalah kunci! Streak kamu membuktikan dedikasi luar biasa!',
    'Wow, kamu tidak berhenti! Semangat juang yang mengagumkan!',
    'Setiap hari belajar = setiap hari lebih siap. Pertahankan!',
  ],
  EXAM_SOON: [
    'H-{days} menuju ujianmu! Manfaatkan waktu yang ada sebaik-baiknya!',
    'Ujian sudah dekat! Fokus, latihan, dan percaya pada kemampuanmu!',
    'Hari H hampir tiba! Kamu sudah berjuang panjang, ini waktunya buktikan!',
  ],
  RETURN_AFTER_ABSENCE: [
    'Selamat datang kembali! Tidak ada kata terlambat, yuk mulai lagi!',
    'Kamu kembali! Semangat baru untuk perjuangan yang lebih keras!',
    'Absen sebentar tidak apa-apa. Yang penting kamu kembali dan terus berjuang!',
  ],
  FIRST_TRYOUT: [
    'Selamat sudah menyelesaikan tryout pertamamu! Ini adalah langkah besar!',
    'Tryout pertama selesai! Lihat hasilnya dan jadikan patokan untuk berkembang.',
    'Berani mencoba adalah separuh dari kemenangan! Hebat!',
  ],
  PASSED_THRESHOLD: [
    'LOLOS NILAI AMBANG BATAS! Kalau ini ujian asli, kamu sudah lulus SKD!',
    'Skormu sudah melewati ambang batas! Pertahankan performa ini!',
    'Wah, nilai kamu sudah di atas passing grade! Luar biasa!',
  ],
  FAILED_THRESHOLD: [
    'Belum mencapai nilai ambang batas, tapi kamu sudah di jalan yang benar!',
    'Terus latihan, kamu semakin dekat dengan nilai yang dibutuhkan!',
    'Lihat bagian mana yang masih kurang dan fokus latih itu. Bisa!',
  ],
  LEVEL_UP: [
    'NAIK LEVEL! Kamu semakin tangguh sebagai pejuang bangsa!',
    'Level baru terbuka! Perjalananmu sebagai abdi negara makin dekat!',
    'Selamat! Kerja keras kamu diakui dengan level baru!',
  ],
};

export function getMotivationMessage(context: MotivationContext, params?: { days?: number }): string {
  const messages = MOTIVATION_MESSAGES[context];
  let msg = messages[Math.floor(Math.random() * messages.length)];
  if (params?.days) {
    msg = msg.replace('{days}', String(params.days));
  }
  return msg;
}
