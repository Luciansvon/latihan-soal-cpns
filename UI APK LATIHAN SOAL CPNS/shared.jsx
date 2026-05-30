// shared.jsx — data + i18n + reusable phone shell
// Loaded after React. Exposes: PhoneFrame, useScreens, SOAL_BANK, I18N, fmtTime

// ───────────────────────────── i18n ─────────────────────────────
const I18N = {
  id: {
    appName: 'CPNS Cerdas',
    tagline: 'Belajar terstruktur, hasil maksimal',
    onb1Title: 'Latihan tiap hari,\nrasakan progresnya',
    onb1Body: 'Ribuan soal TWK, TIU, dan TKP dengan pembahasan lengkap.',
    onb2Title: 'Try-out seperti aslinya',
    onb2Body: 'Simulasi CAT dengan timer dan kisi-kisi resmi.',
    onb3Title: 'Pembahasan yang jelas',
    onb3Body: 'Bukan cuma kunci jawaban — tahu kenapanya.',
    skip: 'Lewati', next: 'Lanjut', start: 'Mulai',
    login: 'Masuk', register: 'Daftar', email: 'Email', password: 'Kata sandi',
    continueGuest: 'Coba dulu tanpa daftar', or: 'atau',
    welcomeBack: 'Selamat datang kembali', loginSubtitle: 'Lanjutkan persiapanmu',
    home: 'Beranda', myProgress: 'Progres kamu', stats: 'Statistik', profile: 'Profil',
    helloUser: 'Halo, Aulia', readyToday: 'Siap latihan hari ini?',
    quickPractice: 'Latihan cepat', startSession: 'Mulai sesi',
    subtest: 'Pilih subtes', mode: 'Pilih mode',
    twkName: 'TWK', twkDesc: 'Wawasan Kebangsaan',
    tiuName: 'TIU', tiuDesc: 'Intelegensi Umum',
    tkpName: 'TKP', tkpDesc: 'Karakteristik Pribadi',
    modeTryOut: 'Try-out', modeTryOutDesc: 'Tanpa feedback, hasil di akhir',
    modeLatihan: 'Latihan', modeLatihanDesc: 'Feedback langsung tiap soal',
    flag: 'Ragu', flagged: 'Ditandai',
    nav: 'Navigasi soal', soalNo: 'Soal', of: 'dari', timeLeft: 'Sisa waktu',
    prev: 'Sebelumnya', nextSoal: 'Berikutnya', finish: 'Selesai',
    confirmFinish: 'Yakin selesai?', confirmFinishBody: 'Masih ada {n} soal belum dijawab.',
    cancel: 'Batal', endSession: 'Akhiri sesi',
    yourScore: 'Skor kamu', correct: 'Benar', wrong: 'Salah', skipped: 'Kosong',
    duration: 'Durasi', avgPerSoal: 'Rata-rata per soal',
    pembahasan: 'Pembahasan', backHome: 'Kembali ke beranda',
    answerCorrect: 'Jawaban benar', answerWrong: 'Jawaban kamu salah',
    correctAns: 'Jawaban yang benar', explanation: 'Penjelasan',
    weeklyGoal: 'Target mingguan', minutesToday: 'menit hari ini',
    subtestPerformance: 'Performa per subtes', lastSession: 'Sesi terakhir',
    accuracy: 'Akurasi', totalSoal: 'Total soal dikerjakan',
    settings: 'Pengaturan', language: 'Bahasa', fontSize: 'Ukuran teks',
    darkMode: 'Mode gelap', notifications: 'Notifikasi harian',
    signOut: 'Keluar', appVersion: 'Versi 0.3.0 · Beta',
    continueLast: 'Lanjutkan sesi', continueLastBody: 'TIU · Soal 7 dari 15',
    seeAll: 'Lihat semua', recommended: 'Direkomendasikan',
    todayStreak: 'Hari ini', minutes: 'menit',
    submitting: 'Mengirim jawaban…', autoSaved: 'Tersimpan otomatis',
    pickAnswer: 'Pilih jawaban', noAnswer: 'Belum dijawab',
    privacyAndTos: 'Privasi & Ketentuan', help: 'Pusat bantuan',
    streakDay: 'hari', accDays: 'Aktif',
    showAnswer: 'Lihat jawaban',
  },
  en: {
    appName: 'CPNS Smart',
    tagline: 'Structured practice, real results',
    onb1Title: 'Practice daily,\nfeel the progress',
    onb1Body: 'Thousands of TWK, TIU, and TKP questions with full explanations.',
    onb2Title: 'Try-out, just like the real thing',
    onb2Body: 'CAT simulation with timer and official syllabus.',
    onb3Title: 'Explanations that click',
    onb3Body: 'Not just the answer key — the why behind it.',
    skip: 'Skip', next: 'Next', start: 'Start',
    login: 'Sign in', register: 'Sign up', email: 'Email', password: 'Password',
    continueGuest: 'Try without an account', or: 'or',
    welcomeBack: 'Welcome back', loginSubtitle: 'Pick up where you left off',
    home: 'Home', myProgress: 'Your progress', stats: 'Stats', profile: 'Profile',
    helloUser: 'Hi, Aulia', readyToday: 'Ready to practice today?',
    quickPractice: 'Quick practice', startSession: 'Start session',
    subtest: 'Pick a subtest', mode: 'Pick a mode',
    twkName: 'TWK', twkDesc: 'Civic Knowledge',
    tiuName: 'TIU', tiuDesc: 'General Intelligence',
    tkpName: 'TKP', tkpDesc: 'Personality',
    modeTryOut: 'Try-out', modeTryOutDesc: 'No feedback, results at the end',
    modeLatihan: 'Practice', modeLatihanDesc: 'Instant feedback per question',
    flag: 'Flag', flagged: 'Flagged',
    nav: 'Question navigator', soalNo: 'Q', of: 'of', timeLeft: 'Time left',
    prev: 'Prev', nextSoal: 'Next', finish: 'Finish',
    confirmFinish: 'Finish session?', confirmFinishBody: '{n} questions still unanswered.',
    cancel: 'Cancel', endSession: 'End session',
    yourScore: 'Your score', correct: 'Correct', wrong: 'Wrong', skipped: 'Blank',
    duration: 'Duration', avgPerSoal: 'Avg per question',
    pembahasan: 'Explanations', backHome: 'Back to home',
    answerCorrect: 'Correct!', answerWrong: 'Not quite',
    correctAns: 'Correct answer', explanation: 'Why',
    weeklyGoal: 'Weekly goal', minutesToday: 'mins today',
    subtestPerformance: 'Per subtest', lastSession: 'Last session',
    accuracy: 'Accuracy', totalSoal: 'Total questions',
    settings: 'Settings', language: 'Language', fontSize: 'Text size',
    darkMode: 'Dark mode', notifications: 'Daily reminders',
    signOut: 'Sign out', appVersion: 'Version 0.3.0 · Beta',
    continueLast: 'Continue session', continueLastBody: 'TIU · Q 7 of 15',
    seeAll: 'See all', recommended: 'Recommended',
    todayStreak: 'Today', minutes: 'min',
    submitting: 'Submitting…', autoSaved: 'Auto-saved',
    pickAnswer: 'Pick an answer', noAnswer: 'No answer',
    privacyAndTos: 'Privacy & Terms', help: 'Help center',
    streakDay: 'day', accDays: 'Active',
    showAnswer: 'Show answer',
  },
};

// ───────────────────────────── soal bank ─────────────────────────────
// Materi publik (Pancasila, UUD 1945, logika dasar). Bukan brand soal mana pun.
const SOAL_BANK = {
  twk: [
    {
      q: { id: 'Pernyataan "Bhinneka Tunggal Ika" pertama kali dikenal melalui kitab…', en: '"Bhinneka Tunggal Ika" first appeared in the kakawin…' },
      opts: [
        { id: 'Negarakertagama', en: 'Negarakertagama' },
        { id: 'Sutasoma', en: 'Sutasoma' },
        { id: 'Arjunawiwaha', en: 'Arjunawiwaha' },
        { id: 'Pararaton', en: 'Pararaton' },
        { id: 'Smaradahana', en: 'Smaradahana' },
      ],
      ans: 1,
      exp: { id: 'Kitab Sutasoma karya Mpu Tantular dari abad ke-14 memuat frasa "Bhinneka Tunggal Ika Tan Hana Dharma Mangrwa".', en: 'The 14th-century kakawin Sutasoma by Mpu Tantular contains the phrase "Bhinneka Tunggal Ika Tan Hana Dharma Mangrwa".' },
    },
    {
      q: { id: 'Nilai yang terkandung dalam sila kelima Pancasila adalah…', en: 'The value contained in the fifth principle of Pancasila is…' },
      opts: [
        { id: 'Ketuhanan', en: 'Belief in one God' },
        { id: 'Kemanusiaan yang adil', en: 'Just humanity' },
        { id: 'Persatuan Indonesia', en: 'Indonesian unity' },
        { id: 'Kerakyatan / musyawarah', en: 'Representative democracy' },
        { id: 'Keadilan sosial bagi seluruh rakyat Indonesia', en: 'Social justice for all Indonesians' },
      ],
      ans: 4,
      exp: { id: 'Sila kelima berbunyi "Keadilan sosial bagi seluruh rakyat Indonesia" dan menekankan pemerataan kesejahteraan.', en: 'The fifth principle reads "Social justice for all Indonesians" and emphasises equitable welfare.' },
    },
    {
      q: { id: 'Amandemen UUD 1945 yang pertama disahkan pada tahun…', en: 'The first amendment to the 1945 Constitution was passed in…' },
      opts: [
        { id: '1998', en: '1998' }, { id: '1999', en: '1999' },
        { id: '2000', en: '2000' }, { id: '2001', en: '2001' }, { id: '2002', en: '2002' },
      ],
      ans: 1,
      exp: { id: 'Amandemen pertama UUD 1945 disahkan dalam Sidang Umum MPR 1999.', en: 'The first amendment was passed during the 1999 MPR General Session.' },
    },
  ],
  tiu: [
    {
      q: { id: 'Jika 3, 6, 11, 18, 27, … maka bilangan berikutnya adalah…', en: 'In the sequence 3, 6, 11, 18, 27, …, the next number is…' },
      opts: [{ id: '36', en: '36' }, { id: '38', en: '38' }, { id: '40', en: '40' }, { id: '42', en: '42' }, { id: '44', en: '44' }],
      ans: 1,
      exp: { id: 'Selisih antar suku: 3, 5, 7, 9, … (bilangan ganjil). Suku berikutnya = 27 + 11 = 38.', en: 'Differences: 3, 5, 7, 9, … (odd numbers). Next term = 27 + 11 = 38.' },
    },
    {
      q: { id: 'PERNAH : SERING = …', en: 'SOMETIMES : OFTEN = …' },
      opts: [
        { id: 'sedikit : banyak', en: 'few : many' },
        { id: 'kecil : besar', en: 'small : large' },
        { id: 'gerimis : hujan deras', en: 'drizzle : downpour' },
        { id: 'sebagian : seluruh', en: 'part : whole' },
        { id: 'pelan : cepat', en: 'slow : fast' },
      ],
      ans: 2,
      exp: { id: 'Hubungannya adalah peningkatan intensitas pada konsep yang sama (frekuensi → intensitas hujan).', en: 'The relation is intensification of the same concept (frequency → rain intensity).' },
    },
  ],
  tkp: [
    {
      q: { id: 'Atasan memberi tugas mendadak menjelang jam pulang. Sikap Anda…', en: 'Your manager assigns urgent work near end of day. You…' },
      opts: [
        { id: 'Menolak karena di luar jam kerja.', en: 'Decline because it is past work hours.' },
        { id: 'Mengerjakan seadanya agar cepat pulang.', en: 'Do it quickly to leave on time.' },
        { id: 'Menyelesaikan dengan baik meski lembur.', en: 'Complete it well even if it means overtime.' },
        { id: 'Meminta rekan mengerjakan.', en: 'Ask a colleague to do it.' },
        { id: 'Mengerjakan besok pagi.', en: 'Postpone it to tomorrow morning.' },
      ],
      ans: 2,
      scores: [1, 2, 5, 3, 4],
      exp: { id: 'TKP dinilai bertingkat 1–5. Bobot tertinggi pada sikap profesional & tanggung jawab.', en: 'TKP is scored 1–5. Highest weight goes to the most professional, responsible response.' },
    },
  ],
};

// Flatten 6-item demo session
const SESSION_SOAL = [
  ...SOAL_BANK.twk.map((s) => ({ ...s, sub: 'twk' })),
  ...SOAL_BANK.tiu.map((s) => ({ ...s, sub: 'tiu' })),
  SOAL_BANK.tkp[0] && { ...SOAL_BANK.tkp[0], sub: 'tkp' },
].filter(Boolean);

// ───────────────────────────── time helpers ─────────────────────────────
function fmtTime(s) {
  const m = Math.floor(s / 60), r = s % 60;
  return `${String(m).padStart(2, '0')}:${String(r).padStart(2, '0')}`;
}

// ───────────────────────────── PhoneFrame ─────────────────────────────
// Minimal Android-ish device chrome. The variation controls colors via the
// `chromeBg`/`chromeFg` props so the status bar matches the screen behind it.
function PhoneFrame({ children, width = 412, height = 892, chromeBg = '#fff', chromeFg = '#101010', borderColor = 'rgba(0,0,0,0.18)' }) {
  return (
    <div style={{
      width, height, borderRadius: 0, overflow: 'hidden',
      background: chromeBg, color: chromeFg,
      border: `1px solid ${borderColor}`,
      display: 'flex', flexDirection: 'column', position: 'relative',
      boxSizing: 'border-box',
    }}>
      {/* Status bar */}
      <div style={{
        height: 36, padding: '0 22px', display: 'flex', alignItems: 'center',
        justifyContent: 'space-between', fontSize: 13, fontWeight: 600,
        letterSpacing: 0.2, color: chromeFg, flexShrink: 0, position: 'relative',
      }}>
        <span style={{ fontVariantNumeric: 'tabular-nums' }}>9:41</span>
        {/* notch */}
        <div style={{
          position: 'absolute', left: '50%', top: 10, transform: 'translateX(-50%)',
          width: 16, height: 16, borderRadius: 8, background: '#1a1a1a',
        }} />
        <span style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
          {/* signal */}
          <svg width="14" height="10" viewBox="0 0 14 10"><g fill={chromeFg}>
            <rect x="0" y="7" width="2" height="3" rx="0.5" />
            <rect x="3" y="5" width="2" height="5" rx="0.5" />
            <rect x="6" y="3" width="2" height="7" rx="0.5" />
            <rect x="9" y="1" width="2" height="9" rx="0.5" opacity="0.4" />
          </g></svg>
          {/* wifi */}
          <svg width="14" height="10" viewBox="0 0 14 10" fill="none" stroke={chromeFg} strokeWidth="1.4" strokeLinecap="round">
            <path d="M1.5 4.5 Q7 -0.5 12.5 4.5" />
            <path d="M3.5 6.5 Q7 3 10.5 6.5" />
            <circle cx="7" cy="8.5" r="0.7" fill={chromeFg} stroke="none" />
          </svg>
          {/* battery */}
          <svg width="22" height="10" viewBox="0 0 22 10">
            <rect x="0.5" y="0.5" width="18" height="9" rx="2" fill="none" stroke={chromeFg} strokeOpacity="0.5" />
            <rect x="19.5" y="3" width="1.5" height="4" rx="0.5" fill={chromeFg} fillOpacity="0.5" />
            <rect x="2" y="2" width="13" height="6" rx="1" fill={chromeFg} />
          </svg>
        </span>
      </div>

      {/* Screen */}
      <div style={{ flex: 1, minHeight: 0, position: 'relative', overflow: 'hidden' }}>
        {children}
      </div>

      {/* Nav pill */}
      <div style={{
        height: 24, display: 'flex', alignItems: 'center', justifyContent: 'center', flexShrink: 0,
      }}>
        <div style={{ width: 120, height: 4, borderRadius: 2, background: chromeFg, opacity: 0.35 }} />
      </div>
    </div>
  );
}

// ───────────────────────────── screen state hook ─────────────────────────────
// A tiny state-machine helper: current screen + history stack + nav.
function useScreens(initial = 'splash') {
  const [stack, setStack] = React.useState([initial]);
  const screen = stack[stack.length - 1];
  const go = React.useCallback((s) => setStack((p) => [...p, s]), []);
  const replace = React.useCallback((s) => setStack((p) => [...p.slice(0, -1), s]), []);
  const back = React.useCallback(() => setStack((p) => (p.length > 1 ? p.slice(0, -1) : p)), []);
  const reset = React.useCallback((s) => setStack([s]), []);
  return { screen, go, replace, back, reset, stack };
}

Object.assign(window, { I18N, SOAL_BANK, SESSION_SOAL, fmtTime, PhoneFrame, useScreens });
