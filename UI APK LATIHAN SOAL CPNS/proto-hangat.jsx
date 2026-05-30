// proto-hangat.jsx — Variation B "Hangat & Memotivasi"
// Aesthetic: warm, optimistic, modern. Coral/amber + cream + ink.
// Type: Manrope (display + body), heavier weights, more rounded corners.
// Tone: friendly, encouraging. Larger illustrations. More personality.
// Layout differs from Variation A — feature card on home is portrait, question screen uses chip-style answers.

(function () {
  // ── palettes ── (60/30/10 friendly · no orange/coral accents · darker bg for card lift)
  // primary: 10% accent color · tint: secondary supporting · soft: 30% neutral · bg/surface: 60% dominant
  const palettes = {
    mint:     { primary: '#2F8970', primaryDim: '#4FA08A', accent: '#1F1F1F', tint: '#D7E5DC', bg: '#E5E0CF', surface: '#FFFFFF', ink: '#1A2A24', sub: '#5C7068', soft: '#D8D3BF', border: 'rgba(15,38,32,0.08)' },
    ocean:    { primary: '#326E85', primaryDim: '#558A9F', accent: '#1F1F1F', tint: '#D3DFE5', bg: '#E4E0CF', surface: '#FFFFFF', ink: '#162831', sub: '#5C6E76', soft: '#D6D2BF', border: 'rgba(11,32,43,0.08)' },
    azure:    { primary: '#3D6BAA', primaryDim: '#6087BD', accent: '#1F1F1F', tint: '#D5DDEC', bg: '#E5E1D2', surface: '#FFFFFF', ink: '#1A2A40', sub: '#5E6878', soft: '#D7D3C3', border: 'rgba(15,29,61,0.08)' },
    burgundy: { primary: '#8E4A4A', primaryDim: '#A56363', accent: '#1F1F1F', tint: '#E6D2D2', bg: '#E8E1D0', surface: '#FFFFFF', ink: '#2A1818', sub: '#7B5E5E', soft: '#DBD3C0', border: 'rgba(42,16,9,0.08)' },
    plum:     { primary: '#724066', primaryDim: '#8A5A7D', accent: '#1F1F1F', tint: '#E2D2DC', bg: '#E5DED9', surface: '#FFFFFF', ink: '#251826', sub: '#7B6271', soft: '#D6CFC8', border: 'rgba(38,12,32,0.08)' },
    forest:   { primary: '#3D5E42', primaryDim: '#587859', accent: '#1F1F1F', tint: '#D1DDCB', bg: '#E2DEC9', surface: '#FFFFFF', ink: '#1A241C', sub: '#5E6B5C', soft: '#D5D1BC', border: 'rgba(15,31,18,0.08)' },
  };
  const darkBase = { bg: '#161412', surface: '#211E1A', ink: '#F2EEE6', sub: '#9A938A', soft: '#2A2620', border: 'rgba(255,255,255,0.07)' };
  const themeFrom = (tw) => {
    const p = palettes[tw.theme] || palettes.azure;
    if (!tw.dark) return p;
    const hex = p.primary.replace('#', '');
    const r = parseInt(hex.slice(0, 2), 16), g = parseInt(hex.slice(2, 4), 16), b = parseInt(hex.slice(4, 6), 16);
    return { ...p, bg: darkBase.bg, surface: darkBase.surface, ink: darkBase.ink, sub: darkBase.sub, soft: darkBase.soft, border: darkBase.border, tint: `rgba(${r},${g},${b},0.18)` };
  };

  // ── Icons ── (rounder, bolder strokes than variation A)
  const Ico = {
    home:  (p) => <svg width={p.s || 24} height={p.s || 24} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="m3 11 9-8 9 8v9a2 2 0 0 1-2 2h-3v-7h-8v7H5a2 2 0 0 1-2-2z"/></svg>,
    chart: (p) => <svg width={p.s || 24} height={p.s || 24} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><rect x="3" y="12" width="4" height="9" rx="1.5"/><rect x="10" y="3" width="4" height="18" rx="1.5"/><rect x="17" y="8" width="4" height="13" rx="1.5"/></svg>,
    user:  (p) => <svg width={p.s || 24} height={p.s || 24} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="8" r="4"/><path d="M4 21a8 8 0 0 1 16 0"/></svg>,
    flag:  (p) => <svg width={p.s || 18} height={p.s || 18} viewBox="0 0 24 24" fill={p.fill || 'none'} stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M5 21V4m0 0h13l-3 4 3 4H5"/></svg>,
    clock: (p) => <svg width={p.s || 18} height={p.s || 18} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg>,
    chevR: (p) => <svg width={p.s || 18} height={p.s || 18} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round"><path d="m9 6 6 6-6 6"/></svg>,
    chevL: (p) => <svg width={p.s || 18} height={p.s || 18} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round"><path d="m15 6-6 6 6 6"/></svg>,
    check: (p) => <svg width={p.s || 18} height={p.s || 18} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><path d="m5 12 5 5L20 7"/></svg>,
    x:     (p) => <svg width={p.s || 18} height={p.s || 18} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.4" strokeLinecap="round" strokeLinejoin="round"><path d="M6 6l12 12M18 6 6 18"/></svg>,
    grid:  (p) => <svg width={p.s || 18} height={p.s || 18} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><rect x="4" y="4" width="7" height="7" rx="2"/><rect x="13" y="4" width="7" height="7" rx="2"/><rect x="4" y="13" width="7" height="7" rx="2"/><rect x="13" y="13" width="7" height="7" rx="2"/></svg>,
    bolt:  (p) => <svg width={p.s || 18} height={p.s || 18} viewBox="0 0 24 24" fill="currentColor"><path d="M13 2 4 14h6l-1 8 9-12h-6z"/></svg>,
    target:(p) => <svg width={p.s || 18} height={p.s || 18} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="9"/><circle cx="12" cy="12" r="5"/><circle cx="12" cy="12" r="1.5" fill="currentColor"/></svg>,
    book:  (p) => <svg width={p.s || 18} height={p.s || 18} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M4 5a2 2 0 0 1 2-2h13v18H6a2 2 0 0 1-2-2z"/><path d="M4 19a2 2 0 0 1 2-2h13"/></svg>,
    bell:  (p) => <svg width={p.s || 18} height={p.s || 18} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M6 8a6 6 0 0 1 12 0c0 7 3 7 3 9H3c0-2 3-2 3-9z"/><path d="M10 21a2 2 0 0 0 4 0"/></svg>,
    heart: (p) => <svg width={p.s || 18} height={p.s || 18} viewBox="0 0 24 24" fill="currentColor"><path d="M12 21s-7-4.35-9.5-9C.5 7.5 4 4 7 4c2 0 3.5 1 5 3 1.5-2 3-3 5-3 3 0 6.5 3.5 4.5 8-2.5 4.65-9.5 9-9.5 9z"/></svg>,
  };

  // ── Button ──
  const Btn = ({ children, onClick, theme, variant = 'primary', size = 'md', full, style, disabled }) => {
    const c = theme;
    const sizes = { sm: { h: 40, fs: 13, px: 14 }, md: { h: 52, fs: 15, px: 22 }, lg: { h: 60, fs: 17, px: 26 } };
    const s = sizes[size];
    const variants = {
      primary: { background: c.ink, color: '#fff', boxShadow: `0 2px 8px -2px rgba(0,0,0,0.25)` },
      ghost:   { background: 'transparent', color: c.ink, border: `2px solid ${c.border}` },
      soft:    { background: c.tint, color: c.primary },
      ink:     { background: c.ink, color: c.surface },
    };
    return (
      <button onClick={onClick} disabled={disabled} className="proto-btn"
        style={{
          height: s.h, padding: `0 ${s.px}px`, borderRadius: 999, border: 'none',
          cursor: disabled ? 'default' : 'pointer', fontFamily: 'inherit',
          fontSize: s.fs, fontWeight: 700, letterSpacing: -0.1,
          width: full ? '100%' : 'auto', opacity: disabled ? 0.4 : 1,
          display: 'inline-flex', alignItems: 'center', justifyContent: 'center', gap: 8,
          ...variants[variant], ...style,
        }}>{children}</button>
    );
  };

  // ── TabBar (pill, floating) ──
  const TabBar = ({ active, onChange, t, theme }) => {
    const tabs = [
      { k: 'home', label: t.home, icon: Ico.home },
      { k: 'stats', label: t.stats, icon: Ico.chart },
      { k: 'profile', label: t.profile, icon: Ico.user },
    ];
    return (
      <div style={{
        position: 'absolute', bottom: 14, left: 18, right: 18, zIndex: 5,
        background: theme.ink, borderRadius: 999, padding: 6,
        display: 'flex', alignItems: 'center', justifyContent: 'space-between',
        boxShadow: '0 10px 30px -10px rgba(0,0,0,0.35)',
      }}>
        {tabs.map((tab) => {
          const on = active === tab.k;
          return (
            <button key={tab.k} onClick={() => onChange(tab.k)} style={{
              flex: 1, border: 'none', background: on ? theme.surface : 'transparent',
              color: on ? theme.ink : 'rgba(255,255,255,0.6)', cursor: 'pointer',
              borderRadius: 999, height: 46, fontFamily: 'inherit', fontSize: 12, fontWeight: 700,
              display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 8,
              transition: 'background .15s, color .15s',
            }}>
              <tab.icon s={18} />
              {on && <span>{tab.label}</span>}
            </button>
          );
        })}
      </div>
    );
  };

  // Onboarding
  function ScreenOnboarding({ go, t, theme }) {
    const [step, setStep] = React.useState(0);
    const slides = [
      { tag: 'progress', t: t.onb1Title, b: t.onb1Body },
      { tag: 'tryout',   t: t.onb2Title, b: t.onb2Body },
      { tag: 'why',      t: t.onb3Title, b: t.onb3Body },
    ];
    const s = slides[step];
    return (
      <div style={{ height: '100%', background: theme.bg, display: 'flex', flexDirection: 'column' }}>
        {/* Top: skip */}
        <div style={{ padding: '16px 20px', display: 'flex', justifyContent: 'space-between' }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
            <div style={{ width: 28, height: 28, borderRadius: 8, background: theme.ink, color: '#fff', display: 'flex', alignItems: 'center', justifyContent: 'center' }}><Ico.bolt s={14} /></div>
            <span style={{ fontSize: 14, fontWeight: 800, color: theme.ink, letterSpacing: -0.3 }}>{t.appName}</span>
          </div>
          <button onClick={() => go('login')} style={{ border: 'none', background: 'transparent', color: theme.sub, fontFamily: 'inherit', fontSize: 14, fontWeight: 600, cursor: 'pointer' }}>{t.skip}</button>
        </div>

        {/* Big illustration zone */}
        <div style={{ flex: 1, padding: '20px 24px 28px', display: 'flex', flexDirection: 'column' }}>
          <div style={{
            flex: 1, borderRadius: 32, background: theme.tint, position: 'relative', overflow: 'hidden',
            display: 'flex', alignItems: 'center', justifyContent: 'center',
          }}>
            {/* abstract pattern */}
            <svg width="100%" height="100%" viewBox="0 0 280 280" style={{ position: 'absolute', inset: 0 }}>
              <defs>
                <pattern id="dotPB" width="22" height="22" patternUnits="userSpaceOnUse">
                  <circle cx="2" cy="2" r="1.2" fill={theme.primary} opacity="0.18" />
                </pattern>
              </defs>
              <rect width="100%" height="100%" fill="url(#dotPB)" />
            </svg>
            {/* card stack */}
            {s.tag === 'progress' && (
              <div style={{ position: 'relative', width: 220, height: 220 }}>
                <div style={{ position: 'absolute', inset: 0, background: theme.surface, borderRadius: 22, padding: 20, boxShadow: '0 10px 24px -8px rgba(0,0,0,0.12)', transform: 'rotate(-4deg)' }}>
                  <div style={{ fontSize: 11, color: theme.sub, fontWeight: 700, letterSpacing: 0.6 }}>HARI INI</div>
                  <div style={{ fontSize: 40, fontWeight: 800, color: theme.ink, letterSpacing: -1.5, marginTop: 4, fontFamily: 'Manrope' }}>+12%</div>
                  <svg viewBox="0 0 180 60" style={{ marginTop: 10, width: '100%' }}>
                    <path d="M0,50 Q30,40 50,35 T100,18 T180,8" fill="none" stroke={theme.primary} strokeWidth="3" strokeLinecap="round" />
                    <circle cx="178" cy="9" r="5" fill={theme.primary} stroke="#fff" strokeWidth="2.5" />
                  </svg>
                  <div style={{ marginTop: 6, fontSize: 11, color: theme.sub }}>akurasi minggu ini</div>
                </div>
                <div style={{ position: 'absolute', top: 30, right: -16, background: theme.accent, borderRadius: 16, padding: '10px 12px', boxShadow: '0 6px 16px -6px rgba(0,0,0,0.15)', transform: 'rotate(6deg)' }}>
                  <div style={{ fontSize: 10, fontWeight: 700, color: '#fff', letterSpacing: 0.4, opacity: 0.75 }}>STREAK</div>
                  <div style={{ display: 'flex', alignItems: 'baseline', gap: 4 }}>
                    <div style={{ fontSize: 24, fontWeight: 800, color: '#fff', fontFamily: 'Manrope' }}>12</div>
                    <div style={{ fontSize: 11, color: '#fff', opacity: 0.7 }}>hari</div>
                  </div>
                </div>
              </div>
            )}
            {s.tag === 'tryout' && (
              <div style={{ position: 'relative', width: 220, height: 220 }}>
                <div style={{ position: 'absolute', inset: '24px 0', background: theme.surface, borderRadius: 22, padding: 20, boxShadow: '0 10px 24px -8px rgba(0,0,0,0.12)', display: 'flex', flexDirection: 'column' }}>
                  <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 14 }}>
                    <div style={{ background: theme.tint, color: theme.primary, padding: '4px 10px', borderRadius: 999, fontSize: 10, fontWeight: 700 }}>Soal 7/35</div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: 4, fontSize: 12, fontWeight: 700, color: theme.ink, fontVariantNumeric: 'tabular-nums' }}><Ico.clock s={12} /> 28:43</div>
                  </div>
                  <div style={{ fontSize: 11, color: theme.ink, lineHeight: 1.4, fontWeight: 500 }}>Sila kelima Pancasila…</div>
                  <div style={{ marginTop: 8, display: 'flex', flexDirection: 'column', gap: 4 }}>
                    {[0,1,2,3].map((i) => (
                      <div key={i} style={{ height: 18, borderRadius: 6, background: i === 2 ? theme.primary : theme.soft }} />
                    ))}
                  </div>
                </div>
              </div>
            )}
            {s.tag === 'why' && (
              <div style={{ position: 'relative', width: 230, height: 220 }}>
                <div style={{ position: 'absolute', inset: 0, background: theme.surface, borderRadius: 22, padding: 18, boxShadow: '0 10px 24px -8px rgba(0,0,0,0.12)' }}>
                  <div style={{ display: 'flex', alignItems: 'center', gap: 6, marginBottom: 8 }}>
                    <div style={{ width: 22, height: 22, borderRadius: 11, background: '#1F8A5B', color: '#fff', display: 'flex', alignItems: 'center', justifyContent: 'center' }}><Ico.check s={12} /></div>
                    <div style={{ fontSize: 12, fontWeight: 700, color: '#1F6647' }}>Jawaban benar</div>
                  </div>
                  <div style={{ fontSize: 11, color: theme.sub, lineHeight: 1.5 }}>Karena Pancasila sila ke-5 menekankan keadilan sosial bagi seluruh rakyat Indonesia, bukan sekadar kemanusiaan.</div>
                  <div style={{ marginTop: 12, padding: '8px 10px', background: theme.tint, borderRadius: 10, fontSize: 10, color: theme.primary, fontWeight: 700, display: 'inline-block' }}>+10 XP konsep</div>
                </div>
              </div>
            )}
          </div>

          <div style={{ paddingTop: 28 }}>
            <h1 style={{ margin: 0, fontSize: 28, lineHeight: 1.15, color: theme.ink, fontFamily: 'Manrope', fontWeight: 800, letterSpacing: -0.8, whiteSpace: 'pre-line' }}>{s.t}</h1>
            <p style={{ margin: '12px 0 0', color: theme.sub, fontSize: 15, lineHeight: 1.55 }}>{s.b}</p>
          </div>
        </div>

        {/* indicator + nav */}
        <div style={{ padding: '0 24px 24px', display: 'flex', alignItems: 'center', gap: 16 }}>
          <div style={{ display: 'flex', gap: 6 }}>
            {slides.map((_, i) => (
              <div key={i} style={{ height: 8, width: i === step ? 28 : 8, borderRadius: 4, background: i === step ? theme.primary : theme.border, transition: 'width .2s' }} />
            ))}
          </div>
          <Btn theme={theme} onClick={() => (step < 2 ? setStep(step + 1) : go('login'))} style={{ marginLeft: 'auto', minWidth: 130 }}>
            {step < 2 ? t.next : t.start} <Ico.chevR s={16} />
          </Btn>
        </div>
      </div>
    );
  }

  // Login
  function ScreenLogin({ go, t, theme }) {
    const [mode, setMode] = React.useState('login');
    return (
      <div style={{ height: '100%', background: theme.bg, padding: '24px 24px 24px', display: 'flex', flexDirection: 'column' }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 28 }}>
          <div style={{ width: 36, height: 36, borderRadius: 10, background: theme.ink, color: '#fff', display: 'flex', alignItems: 'center', justifyContent: 'center' }}><Ico.bolt s={18} /></div>
          <span style={{ fontSize: 16, fontWeight: 800, color: theme.ink, letterSpacing: -0.4 }}>{t.appName}</span>
        </div>

        <div style={{ marginBottom: 24 }}>
          <h1 style={{ margin: 0, fontSize: 32, color: theme.ink, fontFamily: 'Manrope', fontWeight: 800, letterSpacing: -1, lineHeight: 1.1 }}>{t.welcomeBack}</h1>
          <p style={{ margin: '8px 0 0', color: theme.sub, fontSize: 15 }}>{t.loginSubtitle}</p>
        </div>

        <div style={{ display: 'flex', padding: 5, background: theme.soft, borderRadius: 999, marginBottom: 22 }}>
          {[{ k: 'login', l: t.login }, { k: 'register', l: t.register }].map((o) => (
            <button key={o.k} onClick={() => setMode(o.k)} style={{
              flex: 1, height: 42, border: 'none', borderRadius: 999, cursor: 'pointer',
              background: mode === o.k ? theme.surface : 'transparent',
              color: mode === o.k ? theme.ink : theme.sub,
              fontFamily: 'inherit', fontSize: 14, fontWeight: 700,
              boxShadow: mode === o.k ? '0 1px 3px rgba(0,0,0,0.06)' : 'none',
            }}>{o.l}</button>
          ))}
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: 12 }}>
          <Field label={t.email} placeholder="kamu@email.com" theme={theme} />
          <Field label={t.password} placeholder="••••••••" type="password" theme={theme} />
        </div>

        <div style={{ marginTop: 'auto', display: 'flex', flexDirection: 'column', gap: 12 }}>
          <Btn theme={theme} full size="lg" onClick={() => go('home')}>{mode === 'login' ? t.login : t.register} <Ico.chevR s={16} /></Btn>
          <div style={{ display: 'flex', alignItems: 'center', gap: 10, color: theme.sub, fontSize: 12 }}>
            <div style={{ flex: 1, height: 1, background: theme.border }} /> {t.or} <div style={{ flex: 1, height: 1, background: theme.border }} />
          </div>
          <Btn theme={theme} variant="ghost" full onClick={() => go('home')}>{t.continueGuest}</Btn>
        </div>
      </div>
    );
  }
  function Field({ label, placeholder, type = 'text', theme }) {
    return (
      <label style={{ display: 'block' }}>
        <span style={{ display: 'block', fontSize: 13, color: theme.ink, fontWeight: 700, marginBottom: 8 }}>{label}</span>
        <input type={type} placeholder={placeholder} style={{
          width: '100%', height: 54, borderRadius: 16, padding: '0 18px', boxSizing: 'border-box',
          border: `1.5px solid ${theme.border}`, background: theme.surface, color: theme.ink,
          fontFamily: 'inherit', fontSize: 15, outline: 'none', fontWeight: 500,
        }} />
      </label>
    );
  }

  // Home (different layout: portrait hero card + tile grid)
  function ScreenHome({ go, t, theme }) {
    return (
      <div style={{ height: '100%', background: theme.bg, overflowY: 'auto', paddingBottom: 100 }}>
        {/* greeting */}
        <div style={{ padding: '18px 22px 18px', display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
          <div>
            <div style={{ fontSize: 13, color: theme.sub, fontWeight: 600 }}>Selamat pagi 👋</div>
            <h1 style={{ margin: '2px 0 0', fontSize: 22, color: theme.ink, fontFamily: 'Manrope', fontWeight: 800, letterSpacing: -0.6 }}>{t.helloUser}</h1>
          </div>
          <button style={{ width: 46, height: 46, borderRadius: 14, border: `1.5px solid ${theme.border}`, background: theme.surface, color: theme.ink, cursor: 'pointer', display: 'flex', alignItems: 'center', justifyContent: 'center', position: 'relative' }}>
            <Ico.bell s={20} />
            <div style={{ position: 'absolute', top: 10, right: 12, width: 8, height: 8, borderRadius: 4, background: theme.ink, border: `2px solid ${theme.surface}` }} />
          </button>
        </div>

        {/* HERO continue card — portrait */}
        <div style={{ padding: '0 22px 20px' }}>
          <button onClick={() => go('soal')} style={{
            display: 'block', width: '100%', border: 'none', cursor: 'pointer', textAlign: 'left', fontFamily: 'inherit',
            background: theme.ink, color: theme.surface, borderRadius: 26, padding: '22px 22px 20px', position: 'relative', overflow: 'hidden',
          }}>
            {/* Accent stripe — the 10% white */}
            <div style={{ position: 'absolute', top: 0, right: 0, bottom: 0, width: 3, background: 'rgba(255,255,255,0.4)' }} />
            <svg style={{ position: 'absolute', right: -40, bottom: -40, opacity: 0.07 }} width="220" height="220" viewBox="0 0 220 220">
              <circle cx="110" cy="110" r="100" fill="none" stroke={theme.surface} strokeWidth="1.5" />
              <circle cx="110" cy="110" r="60" fill="none" stroke={theme.surface} strokeWidth="1.5" />
            </svg>
            <div style={{ position: 'relative' }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: 8, fontSize: 11, fontWeight: 700, color: 'rgba(255,255,255,0.55)', letterSpacing: 0.6, textTransform: 'uppercase' }}>
                <Ico.bolt s={12} /> {t.continueLast}
              </div>
              <div style={{ marginTop: 10, fontSize: 22, fontWeight: 800, fontFamily: 'Manrope', letterSpacing: -0.6, lineHeight: 1.15 }}>{t.continueLastBody}</div>
              <div style={{ marginTop: 16, height: 4, background: 'rgba(255,255,255,0.10)', borderRadius: 2, overflow: 'hidden' }}>
                <div style={{ width: '47%', height: '100%', background: '#fff', borderRadius: 2 }} />
              </div>
              <div style={{ marginTop: 18, display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
                <div style={{ fontSize: 12, opacity: 0.65, display: 'flex', alignItems: 'center', gap: 6 }}>
                  <Ico.clock s={13} /> sisa 04:22
                </div>
                <div style={{
                  background: '#fff', color: theme.ink, padding: '10px 18px',
                  borderRadius: 999, fontSize: 13, fontWeight: 800, display: 'flex', alignItems: 'center', gap: 6,
                }}>{t.next} <Ico.chevR s={14} /></div>
              </div>
            </div>
          </button>
        </div>

        {/* Subtest tiles — chunky 3-col */}
        <div style={{ padding: '0 22px 20px' }}>
          <SectionH theme={theme} title={t.subtest} action={<button onClick={() => go('paket')} className="proto-btn" style={{ border: 'none', background: 'transparent', color: theme.ink, fontSize: 13, fontWeight: 700, cursor: 'pointer', fontFamily: 'inherit', display: 'flex', alignItems: 'center', gap: 4 }}>{t.seeAll} <Ico.chevR s={14} /></button>} />
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: 10 }}>
            {[
              { k: 'twk', n: t.twkName, d: t.twkDesc, color: '#5A7AA6', icon: Ico.heart },
              { k: 'tiu', n: t.tiuName, d: t.tiuDesc, color: '#7565A6', icon: Ico.bolt },
              { k: 'tkp', n: t.tkpName, d: t.tkpDesc, color: '#1F1F1F', icon: Ico.target },
            ].map((s) => (
              <button key={s.k} onClick={() => go('subtest')} style={{
                background: theme.surface, border: `1.5px solid ${theme.border}`, borderRadius: 18,
                padding: '14px 12px', cursor: 'pointer', fontFamily: 'inherit',
                display: 'flex', flexDirection: 'column', alignItems: 'flex-start', gap: 10, textAlign: 'left',
              }}>
                <div style={{ width: 36, height: 36, borderRadius: 10, background: s.color + '22', color: s.color, display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                  <s.icon s={18} />
                </div>
                <div>
                  <div style={{ fontSize: 14, fontWeight: 800, color: theme.ink, fontFamily: 'Manrope' }}>{s.n}</div>
                  <div style={{ fontSize: 10, color: theme.sub, marginTop: 1, lineHeight: 1.3 }}>{s.d}</div>
                </div>
              </button>
            ))}
          </div>
        </div>

        {/* Daily challenge banner */}
        <div style={{ padding: '0 22px 20px' }}>
          <div style={{
            background: theme.accent, borderRadius: 20, padding: '18px 18px',
            display: 'flex', alignItems: 'center', gap: 14, color: '#fff', position: 'relative', overflow: 'hidden',
          }}>
            <div style={{ width: 52, height: 52, borderRadius: 14, background: 'rgba(255,255,255,0.12)', display: 'flex', alignItems: 'center', justifyContent: 'center', flexShrink: 0, color: '#fff' }}>
              <Ico.target s={26} />
            </div>
            <div style={{ flex: 1, minWidth: 0 }}>
              <div style={{ fontSize: 11, fontWeight: 700, letterSpacing: 0.4, textTransform: 'uppercase', opacity: 0.6 }}>{t.recommended}</div>
              <div style={{ fontSize: 15, fontWeight: 800, marginTop: 2, fontFamily: 'Manrope' }}>Latihan singkat 10 menit</div>
            </div>
            <Ico.chevR s={20} />
          </div>
        </div>

        {/* Weekly graph */}
        <div style={{ padding: '0 22px' }}>
          <SectionH theme={theme} title={t.weeklyGoal} />
          <div style={{ background: theme.surface, border: `1.5px solid ${theme.border}`, borderRadius: 20, padding: 18 }}>
            <div style={{ display: 'flex', alignItems: 'baseline', justifyContent: 'space-between', marginBottom: 12 }}>
              <div>
                <span style={{ fontSize: 28, fontWeight: 800, color: theme.ink, fontFamily: 'Manrope', letterSpacing: -1 }}>180</span>
                <span style={{ fontSize: 14, color: theme.sub, marginLeft: 4 }}> / 240 {t.minutes}</span>
              </div>
              <div style={{ fontSize: 13, fontWeight: 700, color: theme.ink }}>75%</div>
            </div>
            <div style={{ display: 'flex', gap: 6, alignItems: 'flex-end', height: 60 }}>
              {[18, 32, 24, 0, 45, 28, 0].map((m, i) => (
                <div key={i} style={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 6 }}>
                  <div style={{ width: '80%', flex: 1, display: 'flex', alignItems: 'flex-end' }}>
                    <div style={{ width: '100%', height: `${Math.min(100, (m / 45) * 100)}%`, background: m ? (i === 4 ? theme.primary : theme.primary + '90') : theme.soft, borderRadius: 6, minHeight: 4 }} />
                  </div>
                  <div style={{ fontSize: 10, color: i === 4 ? theme.ink : theme.sub, fontWeight: i === 4 ? 800 : 600 }}>{['S','S','R','K','J','S','M'][i]}</div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    );
  }

  function SectionH({ theme, title, action }) {
    return (
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 14 }}>
        <h3 style={{ margin: 0, fontSize: 16, fontWeight: 800, color: theme.ink, fontFamily: 'Manrope', letterSpacing: -0.3 }}>{title}</h3>
        {action}
      </div>
    );
  }

  function Header({ back, title, right, theme }) {
    return (
      <div style={{ padding: '14px 14px 10px', display: 'flex', alignItems: 'center', gap: 8 }}>
        {back && (
          <button onClick={back} style={{ width: 44, height: 44, borderRadius: 14, border: `1.5px solid ${theme.border}`, background: theme.surface, cursor: 'pointer', display: 'flex', alignItems: 'center', justifyContent: 'center', color: theme.ink }}><Ico.chevL s={18} /></button>
        )}
        <div style={{ flex: 1, fontSize: 18, fontWeight: 800, color: theme.ink, fontFamily: 'Manrope', letterSpacing: -0.4, marginLeft: 4 }}>{title}</div>
        {right}
      </div>
    );
  }

  // Subtest
  function ScreenSubtest({ go, back, t, theme }) {
    const [picked, setPicked] = React.useState('twk');
    const [mode, setMode] = React.useState('latihan');
    const opts = [
      { k: 'twk', n: t.twkName, d: t.twkDesc, c: 30, min: 25, color: '#5A7AA6', icon: Ico.heart },
      { k: 'tiu', n: t.tiuName, d: t.tiuDesc, c: 35, min: 35, color: '#7565A6', icon: Ico.bolt },
      { k: 'tkp', n: t.tkpName, d: t.tkpDesc, c: 45, min: 40, color: '#1F1F1F', icon: Ico.target },
    ];
    return (
      <div style={{ height: '100%', background: theme.bg, display: 'flex', flexDirection: 'column' }}>
        <Header back={back} title={t.subtest} theme={theme} />
        <div style={{ flex: 1, overflowY: 'auto', padding: '6px 22px 22px' }}>
          <p style={{ margin: '0 0 18px 4px', color: theme.sub, fontSize: 14, lineHeight: 1.55 }}>Pilih subtes — progres tersimpan otomatis, kamu bisa lanjut nanti kapan saja.</p>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 12 }}>
            {opts.map((o) => {
              const on = picked === o.k;
              return (
                <button key={o.k} onClick={() => setPicked(o.k)} style={{
                  border: `2px solid ${on ? theme.primary : 'transparent'}`,
                  cursor: 'pointer', textAlign: 'left', fontFamily: 'inherit',
                  background: theme.surface, borderRadius: 20, padding: '16px 18px',
                  display: 'flex', alignItems: 'center', gap: 14,
                  boxShadow: on ? `0 6px 20px -6px ${theme.primary}44` : '0 1px 0 rgba(0,0,0,0.02)',
                  transition: 'border-color .15s, box-shadow .15s',
                }}>
                  <div style={{ width: 48, height: 48, borderRadius: 14, background: o.color + '22', color: o.color, display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                    <o.icon s={22} />
                  </div>
                  <div style={{ flex: 1 }}>
                    <div style={{ display: 'flex', alignItems: 'baseline', gap: 10 }}>
                      <div style={{ fontSize: 17, fontWeight: 800, color: theme.ink, fontFamily: 'Manrope' }}>{o.n}</div>
                      <div style={{ fontSize: 12, color: theme.sub }}>{o.d}</div>
                    </div>
                    <div style={{ marginTop: 4, fontSize: 12, color: theme.sub, display: 'flex', gap: 10 }}>
                      <span>📝 {o.c} soal</span><span>⏱ {o.min} min</span>
                    </div>
                  </div>
                  <div style={{
                    width: 22, height: 22, borderRadius: 11, border: `2px solid ${on ? theme.primary : theme.border}`,
                    background: on ? theme.primary : 'transparent', color: '#fff',
                    display: 'flex', alignItems: 'center', justifyContent: 'center', flexShrink: 0,
                  }}>{on && <Ico.check s={12} />}</div>
                </button>
              );
            })}
          </div>

          <SectionH theme={theme} title={t.mode} />
          <div style={{ display: 'flex', gap: 10, marginBottom: 8 }}>
            {[
              { k: 'latihan', n: t.modeLatihan, d: t.modeLatihanDesc },
              { k: 'tryout', n: t.modeTryOut, d: t.modeTryOutDesc },
            ].map((m) => {
              const on = mode === m.k;
              return (
                <button key={m.k} onClick={() => setMode(m.k)} style={{
                  flex: 1, border: `2px solid ${on ? theme.primary : 'transparent'}`, cursor: 'pointer', textAlign: 'left',
                  background: theme.surface, borderRadius: 18, padding: '14px 14px', fontFamily: 'inherit',
                  boxShadow: on ? `0 6px 20px -6px ${theme.primary}44` : '0 1px 0 rgba(0,0,0,0.02)',
                }}>
                  <div style={{ fontSize: 15, fontWeight: 800, color: theme.ink, fontFamily: 'Manrope' }}>{m.n}</div>
                  <div style={{ fontSize: 11, color: theme.sub, marginTop: 4, lineHeight: 1.4 }}>{m.d}</div>
                </button>
              );
            })}
          </div>
        </div>
        <div style={{ padding: '14px 22px 18px' }}>
          <Btn theme={theme} full size="lg" onClick={() => go('soal')}>{t.startSession} <Ico.chevR s={18} /></Btn>
        </div>
      </div>
    );
  }

  // Soal — chip style with letter on left
  function ScreenSoal({ go, back, t, theme, lang }) {
    const [idx, setIdx] = React.useState(0);
    const [answers, setAnswers] = React.useState({});
    const [flags, setFlags] = React.useState({});
    const [showNav, setShowNav] = React.useState(false);
    const [time, setTime] = React.useState(28 * 60 + 43);
    React.useEffect(() => { const id = setInterval(() => setTime((t) => Math.max(0, t - 1)), 1000); return () => clearInterval(id); }, []);
    const soal = SESSION_SOAL[idx];
    const total = SESSION_SOAL.length;
    const ans = answers[idx];
    const flagged = !!flags[idx];
    const pct = ((idx + 1) / total) * 100;

    return (
      <div style={{ height: '100%', background: theme.bg, display: 'flex', flexDirection: 'column' }}>
        {/* Top */}
        <div style={{ padding: '14px 18px 12px', display: 'flex', alignItems: 'center', gap: 10 }}>
          <button onClick={back} style={{ width: 40, height: 40, borderRadius: 12, border: `1.5px solid ${theme.border}`, background: theme.surface, cursor: 'pointer', color: theme.ink, display: 'flex', alignItems: 'center', justifyContent: 'center' }}><Ico.chevL s={18} /></button>

          {/* Timer pill big */}
          <div style={{
            flex: 1, height: 40, background: time < 300 ? '#F3DDDD' : theme.ink, color: time < 300 ? '#6E2828' : '#fff',
            borderRadius: 999, display: 'flex', alignItems: 'center', padding: '0 6px 0 14px', gap: 10,
          }}>
            <Ico.clock s={14} />
            <div style={{ flex: 1, fontSize: 14, fontWeight: 800, fontVariantNumeric: 'tabular-nums', fontFamily: 'Manrope' }}>{fmtTime(time)}</div>
            <div style={{ background: 'rgba(255,255,255,0.16)', padding: '4px 12px', borderRadius: 999, fontSize: 12, fontWeight: 700, fontVariantNumeric: 'tabular-nums' }}>{idx + 1}/{total}</div>
          </div>

          <button onClick={() => setShowNav(true)} style={{ width: 40, height: 40, borderRadius: 12, border: `1.5px solid ${theme.border}`, background: theme.surface, cursor: 'pointer', color: theme.ink, display: 'flex', alignItems: 'center', justifyContent: 'center' }}><Ico.grid s={16} /></button>
        </div>

        {/* progress dashed */}
        <div style={{ padding: '0 22px 8px', display: 'flex', gap: 3 }}>
          {Array.from({ length: total }).map((_, i) => (
            <div key={i} style={{ flex: 1, height: 4, borderRadius: 2, background: i <= idx ? theme.primary : theme.soft }} />
          ))}
        </div>

        {/* Body */}
        <div style={{ flex: 1, overflowY: 'auto', padding: '12px 22px 18px' }}>
          {/* Subtest tag + flag */}
          <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 14 }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
              <div style={{ background: theme.soft, color: theme.ink, padding: '5px 12px', borderRadius: 999, fontSize: 11, fontWeight: 800, letterSpacing: 0.4 }}>{(t[`${soal.sub}Name`] || soal.sub).toUpperCase()}</div>
            </div>
            <button onClick={() => setFlags((f) => ({ ...f, [idx]: !f[idx] }))} style={{
              height: 30, padding: '0 12px', borderRadius: 999, fontFamily: 'inherit', fontSize: 12, fontWeight: 700, cursor: 'pointer',
              border: `1.5px solid ${flagged ? theme.accent : theme.border}`,
              background: flagged ? theme.accent : 'transparent', color: flagged ? '#fff' : theme.ink,
              display: 'inline-flex', alignItems: 'center', gap: 6,
            }}>
              <Ico.flag s={13} fill={flagged ? '#fff' : 'none'} /> {flagged ? t.flagged : t.flag}
            </button>
          </div>

          <p style={{ margin: '4px 0 22px', fontSize: 20, lineHeight: 1.45, color: theme.ink, fontFamily: 'Manrope', fontWeight: 700, textWrap: 'pretty', letterSpacing: -0.3 }}>
            {soal.q[lang]}
          </p>

          <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
            {soal.opts.map((o, i) => {
              const on = ans === i;
              return (
                <button key={i} onClick={() => setAnswers((a) => ({ ...a, [idx]: i }))} style={{
                  textAlign: 'left', cursor: 'pointer', fontFamily: 'inherit',
                  background: on ? theme.soft : theme.surface, color: theme.ink,
                  border: `2px solid ${on ? theme.ink : theme.border}`,
                  borderRadius: 18, padding: '14px 16px', display: 'flex', alignItems: 'center', gap: 14,
                  transition: 'background .15s, border-color .15s',
                }}>
                  <div style={{
                    width: 32, height: 32, borderRadius: 10, flexShrink: 0,
                    background: on ? theme.ink : theme.soft, color: on ? '#fff' : theme.sub,
                    display: 'flex', alignItems: 'center', justifyContent: 'center',
                    fontSize: 13, fontWeight: 800, fontFamily: 'Manrope', transition: 'background .15s, color .15s',
                  }}>{String.fromCharCode(65 + i)}</div>
                  <div style={{ flex: 1, fontSize: 15, lineHeight: 1.45, fontWeight: 500 }}>{o[lang] || o.id}</div>
                  {on && <div style={{ color: theme.ink }}><Ico.check s={18} /></div>}
                </button>
              );
            })}
          </div>

          <div style={{ marginTop: 14, fontSize: 11, color: theme.sub, display: 'flex', alignItems: 'center', gap: 6 }}>
            <div style={{ width: 6, height: 6, borderRadius: 3, background: theme.accent }} /> {t.autoSaved}
          </div>
        </div>

        {/* Bottom */}
        <div style={{ padding: '10px 18px 18px', display: 'flex', gap: 10 }}>
          <button onClick={() => setIdx((i) => Math.max(0, i - 1))} disabled={idx === 0} style={{
            width: 52, height: 52, borderRadius: 999, border: `1.5px solid ${theme.border}`, background: theme.surface, color: theme.ink,
            cursor: idx === 0 ? 'default' : 'pointer', opacity: idx === 0 ? 0.4 : 1, display: 'flex', alignItems: 'center', justifyContent: 'center',
          }}><Ico.chevL s={20} /></button>
          {idx < total - 1 ? (
            <Btn theme={theme} full size="lg" onClick={() => setIdx((i) => Math.min(total - 1, i + 1))}>{t.nextSoal} <Ico.chevR s={18} /></Btn>
          ) : (
            <Btn theme={theme} full size="lg" onClick={() => go('result')}>{t.finish} <Ico.check s={18} /></Btn>
          )}
        </div>

        {showNav && <NavSheet theme={theme} t={t} idx={idx} total={total} answers={answers} flags={flags} go={(i) => { setIdx(i); setShowNav(false); }} close={() => setShowNav(false)} onFinish={() => go('result')} />}
      </div>
    );
  }

  function NavSheet({ theme, t, idx, total, answers, flags, go, close, onFinish }) {
    return (
      <div onClick={close} style={{ position: 'absolute', inset: 0, background: 'rgba(35,25,22,0.5)', zIndex: 30, display: 'flex', alignItems: 'flex-end' }}>
        <div onClick={(e) => e.stopPropagation()} style={{
          width: '100%', background: theme.surface, borderTopLeftRadius: 32, borderTopRightRadius: 32,
          padding: '18px 22px 26px', maxHeight: '80%', overflowY: 'auto',
        }}>
          <div style={{ width: 44, height: 5, background: theme.border, borderRadius: 3, margin: '0 auto 18px' }} />
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 16 }}>
            <h3 style={{ margin: 0, fontSize: 19, color: theme.ink, fontFamily: 'Manrope', fontWeight: 800 }}>{t.nav}</h3>
            <div style={{ fontSize: 13, color: theme.sub, fontWeight: 600 }}>{Object.keys(answers).length}/{total} dijawab</div>
          </div>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(5, 1fr)', gap: 10 }}>
            {Array.from({ length: total }).map((_, i) => {
              const answered = answers[i] != null;
              const flagged = flags[i];
              const current = i === idx;
              return (
                <button key={i} onClick={() => go(i)} style={{
                  position: 'relative', aspectRatio: '1 / 1', borderRadius: 14, cursor: 'pointer', fontFamily: 'inherit',
                  background: current ? theme.primary : answered ? theme.tint : theme.surface,
                  color: current ? '#fff' : answered ? theme.primary : theme.sub,
                  border: `2px solid ${current ? theme.primary : answered ? theme.tint : theme.border}`,
                  fontSize: 16, fontWeight: 800, fontFamily: 'Manrope',
                }}>
                  {i + 1}
                  {flagged && <div style={{ position: 'absolute', top: 6, right: 6, width: 10, height: 10, borderRadius: 5, background: theme.accent, border: `2px solid ${current ? theme.primary : theme.surface}` }} />}
                </button>
              );
            })}
          </div>
          <div style={{ marginTop: 16, padding: 14, background: theme.soft, borderRadius: 14, display: 'flex', gap: 12, fontSize: 12, color: theme.ink, flexWrap: 'wrap' }}>
            <span style={{ display: 'flex', alignItems: 'center', gap: 6 }}><span style={{ width: 12, height: 12, borderRadius: 3, background: theme.tint }} /> Dijawab</span>
            <span style={{ display: 'flex', alignItems: 'center', gap: 6 }}><span style={{ width: 12, height: 12, borderRadius: 3, background: theme.surface, border: `1.5px solid ${theme.border}` }} /> Kosong</span>
            <span style={{ display: 'flex', alignItems: 'center', gap: 6 }}><span style={{ width: 12, height: 12, borderRadius: 3, background: theme.accent }} /> Ditandai</span>
          </div>
          <div style={{ marginTop: 18 }}>
            <Btn theme={theme} full size="lg" onClick={onFinish}>{t.finish} <Ico.check s={18} /></Btn>
          </div>
        </div>
      </div>
    );
  }

  // Result
  function ScreenResult({ go, t, theme }) {
    return (
      <div style={{ height: '100%', background: theme.bg, display: 'flex', flexDirection: 'column', overflowY: 'auto' }}>
        <Header back={() => go('home')} title="" theme={theme} />
        <div style={{ padding: '4px 22px 18px' }}>
          {/* Hero score card — ink dominant, primary as accent ring */}
          <div style={{
            background: theme.ink, borderRadius: 28, padding: '28px 22px 24px', color: theme.surface,
            position: 'relative', overflow: 'hidden', textAlign: 'center',
          }}>
            <svg style={{ position: 'absolute', inset: 0 }} width="100%" height="100%" viewBox="0 0 320 280" preserveAspectRatio="xMidYMid slice">
              <circle cx="160" cy="140" r="118" fill="none" stroke="rgba(255,255,255,0.25)" strokeWidth="1" strokeDasharray="4 8" />
              <circle cx="160" cy="140" r="80" fill="none" stroke="rgba(255,255,255,0.06)" strokeWidth="1" />
            </svg>
            <div style={{ position: 'relative' }}>
              <div style={{ display: 'inline-block', padding: '5px 14px', background: 'rgba(255,255,255,0.14)', color: 'rgba(255,255,255,0.85)', borderRadius: 999, fontSize: 11, fontWeight: 700, letterSpacing: 0.5 }}>SESI SELESAI</div>
              <div style={{ marginTop: 16, fontSize: 13, opacity: 0.6, fontWeight: 600 }}>{t.yourScore}</div>
              <div className="proto-pop" style={{ fontSize: 76, fontWeight: 800, letterSpacing: -3, lineHeight: 1, marginTop: 4, fontFamily: 'Manrope', fontVariantNumeric: 'tabular-nums' }}>358</div>
              <div style={{ marginTop: 6, fontSize: 12, opacity: 0.65 }}>dari 500 · <span style={{ color: '#fff', fontWeight: 700, opacity: 0.95 }}>ambang batas terlampaui</span></div>
            </div>
          </div>

          {/* Stat strip */}
          <div style={{ marginTop: 14, display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: 8 }}>
            {[
              { v: '4', l: t.correct, dot: '#1F1F1F' },
              { v: '1', l: t.wrong, dot: '#A14040' },
              { v: '1', l: t.skipped, dot: theme.sub },
            ].map((s, i) => (
              <div key={i} style={{ background: theme.surface, border: `1.5px solid ${theme.border}`, borderRadius: 16, padding: '14px 12px', textAlign: 'center' }}>
                <div style={{ display: 'inline-flex', alignItems: 'center', gap: 6 }}>
                  <div style={{ width: 8, height: 8, borderRadius: 4, background: s.dot }} />
                  <div style={{ fontSize: 11, color: theme.sub, letterSpacing: 0.4, fontWeight: 700, textTransform: 'uppercase' }}>{s.l}</div>
                </div>
                <div style={{ fontSize: 28, fontWeight: 800, color: theme.ink, marginTop: 4, fontFamily: 'Manrope' }}>{s.v}</div>
              </div>
            ))}
          </div>

          {/* Duration */}
          <div style={{ marginTop: 12, background: theme.surface, border: `1.5px solid ${theme.border}`, borderRadius: 16, padding: 16, display: 'flex', justifyContent: 'space-between' }}>
            <div>
              <div style={{ fontSize: 11, color: theme.sub, fontWeight: 700, letterSpacing: 0.3, textTransform: 'uppercase' }}>{t.duration}</div>
              <div style={{ fontSize: 20, fontWeight: 800, color: theme.ink, fontFamily: 'Manrope', marginTop: 2, fontVariantNumeric: 'tabular-nums' }}>14:08</div>
            </div>
            <div style={{ textAlign: 'right' }}>
              <div style={{ fontSize: 11, color: theme.sub, fontWeight: 700, letterSpacing: 0.3, textTransform: 'uppercase' }}>{t.avgPerSoal}</div>
              <div style={{ fontSize: 20, fontWeight: 800, color: theme.ink, fontFamily: 'Manrope', marginTop: 2, fontVariantNumeric: 'tabular-nums' }}>2:21</div>
            </div>
          </div>
        </div>
        <div style={{ padding: '8px 22px 18px', display: 'flex', gap: 10 }}>
          <Btn theme={theme} variant="ghost" full onClick={() => go('home')}>{t.backHome}</Btn>
          <Btn theme={theme} full onClick={() => go('pembahasan')}>{t.pembahasan} <Ico.chevR s={16} /></Btn>
        </div>
      </div>
    );
  }

  // Pembahasan
  function ScreenPembahasan({ go, back, t, theme, lang }) {
    const [idx, setIdx] = React.useState(0);
    const soal = SESSION_SOAL[idx];
    const total = SESSION_SOAL.length;
    const fakeAns = [1, 4, 1, 1, 2, 2];
    const userAns = fakeAns[idx % fakeAns.length];
    const correct = userAns === soal.ans;
    return (
      <div style={{ height: '100%', background: theme.bg, display: 'flex', flexDirection: 'column' }}>
        <Header back={back} title={t.pembahasan} theme={theme} right={<div style={{ fontSize: 13, color: theme.sub, fontWeight: 600, marginRight: 12 }}>{idx + 1}/{total}</div>} />
        <div style={{ flex: 1, overflowY: 'auto', padding: '4px 22px 18px' }}>
          {/* Status banner */}
          <div style={{
            padding: '14px 16px', borderRadius: 18, marginBottom: 16,
            background: correct ? theme.ink : '#F3DDDD', color: correct ? theme.surface : '#6E2828',
            display: 'flex', alignItems: 'center', gap: 12,
          }}>
            <div style={{
              width: 40, height: 40, borderRadius: 12, flexShrink: 0,
              background: correct ? 'rgba(255,255,255,0.14)' : '#A14040', color: correct ? theme.surface : '#fff',
              display: 'flex', alignItems: 'center', justifyContent: 'center',
            }}>{correct ? <Ico.check s={20} /> : <Ico.x s={20} />}</div>
            <div>
              <div style={{ fontSize: 15, fontWeight: 800, fontFamily: 'Manrope' }}>{correct ? t.answerCorrect : t.answerWrong}</div>
              <div style={{ fontSize: 12, opacity: 0.7, marginTop: 1 }}>{correct ? 'Lanjutkan momentum 🔥' : 'Periksa pembahasan di bawah'}</div>
            </div>
          </div>

          <p style={{ margin: '0 0 16px', fontSize: 17, lineHeight: 1.45, color: theme.ink, fontWeight: 700, fontFamily: 'Manrope' }}>{soal.q[lang]}</p>

          <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
            {soal.opts.map((o, i) => {
              const isAns = i === soal.ans;
              const isUser = i === userAns;
              const bg = isAns ? theme.ink : isUser && !correct ? '#F3DDDD' : theme.surface;
              const bd = isAns ? theme.ink : isUser && !correct ? '#A14040' : theme.border;
              const fg = isAns ? theme.surface : theme.ink;
              const tag = isAns ? 'JAWABAN BENAR' : isUser && !correct ? 'JAWABAN KAMU' : null;
              return (
                <div key={i} style={{
                  background: bg, border: `2px solid ${bd}`, borderRadius: 14,
                  padding: '12px 14px', display: 'flex', alignItems: 'center', gap: 12,
                }}>
                  <div style={{ width: 28, height: 28, borderRadius: 8, background: isAns ? 'rgba(255,255,255,0.16)' : 'rgba(0,0,0,0.06)', color: fg, display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: 12, fontWeight: 800 }}>{String.fromCharCode(65 + i)}</div>
                  <div style={{ flex: 1, fontSize: 14, color: fg }}>{o[lang] || o.id}</div>
                  {tag && <div style={{ fontSize: 9, fontWeight: 800, letterSpacing: 0.4, color: isAns ? theme.surface : bd, opacity: isAns ? 0.7 : 1 }}>{tag}</div>}
                </div>
              );
            })}
          </div>

          <div style={{ marginTop: 20, background: theme.surface, border: `1.5px solid ${theme.border}`, borderRadius: 18, padding: 18 }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 10 }}>
              <div style={{ width: 30, height: 30, borderRadius: 8, background: theme.soft, color: theme.ink, display: 'flex', alignItems: 'center', justifyContent: 'center' }}><Ico.book s={16} /></div>
              <div style={{ fontSize: 13, color: theme.ink, fontWeight: 800, fontFamily: 'Manrope' }}>{t.explanation}</div>
            </div>
            <p style={{ margin: 0, fontSize: 14, lineHeight: 1.65, color: theme.ink }}>{soal.exp[lang]}</p>
          </div>
        </div>
        <div style={{ padding: '10px 22px 18px', display: 'flex', gap: 10 }}>
          <button onClick={() => setIdx((i) => Math.max(0, i - 1))} disabled={idx === 0} style={{
            width: 52, height: 52, borderRadius: 999, border: `1.5px solid ${theme.border}`, background: theme.surface, color: theme.ink, cursor: 'pointer',
            opacity: idx === 0 ? 0.4 : 1, display: 'flex', alignItems: 'center', justifyContent: 'center',
          }}><Ico.chevL s={20} /></button>
          {idx < total - 1 ? (
            <Btn theme={theme} full onClick={() => setIdx((i) => Math.min(total - 1, i + 1))}>{t.nextSoal} <Ico.chevR s={16} /></Btn>
          ) : (
            <Btn theme={theme} full onClick={() => go('home')}>{t.backHome}</Btn>
          )}
        </div>
      </div>
    );
  }

  // Stats — different layout: header card with hero ring + per-subtest cards w/ progress rings
  function ScreenStats({ active, setActive, t, theme }) {
    const rows = [
      { k: 'twk', n: t.twkName, acc: 78, total: 142, color: '#5A7AA6' },
      { k: 'tiu', n: t.tiuName, acc: 65, total: 98, color: '#7565A6' },
      { k: 'tkp', n: t.tkpName, acc: 84, total: 67, color: '#1F1F1F' },
    ];
    return (
      <div style={{ height: '100%', background: theme.bg, overflowY: 'auto', paddingBottom: 100 }}>
        <div style={{ padding: '18px 22px 16px' }}>
          <h1 style={{ margin: 0, fontSize: 24, color: theme.ink, fontFamily: 'Manrope', fontWeight: 800, letterSpacing: -0.6 }}>{t.myProgress}</h1>
          <p style={{ margin: '4px 0 0', fontSize: 13, color: theme.sub }}>Ringkasan 7 hari terakhir</p>
        </div>

        {/* Hero ring card */}
        <div style={{ padding: '0 22px 16px' }}>
          <div style={{ background: theme.ink, color: '#fff', borderRadius: 24, padding: 22, display: 'flex', alignItems: 'center', gap: 18, position: 'relative', overflow: 'hidden' }}>
            <div style={{ width: 110, height: 110, position: 'relative', flexShrink: 0 }}>
              <svg width="110" height="110" viewBox="0 0 110 110">
                <circle cx="55" cy="55" r="46" fill="none" stroke="rgba(255,255,255,0.15)" strokeWidth="9" />
                <circle cx="55" cy="55" r="46" fill="none" stroke="#fff" strokeWidth="9" strokeLinecap="round"
                  strokeDasharray={`${2 * Math.PI * 46 * 0.74} ${2 * Math.PI * 46}`} transform="rotate(-90 55 55)" />
              </svg>
              <div style={{ position: 'absolute', inset: 0, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center' }}>
                <div style={{ fontSize: 28, fontWeight: 800, fontFamily: 'Manrope', letterSpacing: -1, lineHeight: 1 }}>74%</div>
                <div style={{ fontSize: 9, opacity: 0.7, marginTop: 2, letterSpacing: 0.4 }}>AKURASI</div>
              </div>
            </div>
            <div style={{ flex: 1 }}>
              <div style={{ fontSize: 11, opacity: 0.7, fontWeight: 700, letterSpacing: 0.4, textTransform: 'uppercase' }}>{t.totalSoal}</div>
              <div style={{ fontSize: 30, fontWeight: 800, fontFamily: 'Manrope', letterSpacing: -1, marginTop: 2 }}>307</div>
              <div style={{ marginTop: 6, fontSize: 12, color: '#fff', fontWeight: 700, display: 'inline-flex', alignItems: 'center', gap: 4 }}>
                ↗ +6% minggu ini
              </div>
            </div>
          </div>
        </div>

        {/* Trend chart */}
        <div style={{ padding: '0 22px 20px' }}>
          <SectionH theme={theme} title="Tren akurasi" />
          <div style={{ background: theme.surface, border: `1.5px solid ${theme.border}`, borderRadius: 20, padding: 16 }}>
            <Sparkline theme={theme} />
          </div>
        </div>

        {/* Per subtest cards */}
        <div style={{ padding: '0 22px' }}>
          <SectionH theme={theme} title={t.subtestPerformance} />
          <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
            {rows.map((r) => (
              <div key={r.k} style={{ background: theme.surface, border: `1.5px solid ${theme.border}`, borderRadius: 16, padding: '14px 16px', display: 'flex', alignItems: 'center', gap: 14 }}>
                <div style={{ width: 44, height: 44, borderRadius: 12, background: r.color + '22', color: r.color, display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: 13, fontWeight: 800, fontFamily: 'Manrope' }}>{r.n}</div>
                <div style={{ flex: 1 }}>
                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 4 }}>
                    <div style={{ fontSize: 12, color: theme.sub }}>{r.total} soal</div>
                    <div style={{ fontSize: 15, fontWeight: 800, color: theme.ink, fontFamily: 'Manrope', fontVariantNumeric: 'tabular-nums' }}>{r.acc}%</div>
                  </div>
                  <div style={{ height: 6, borderRadius: 3, background: theme.soft, overflow: 'hidden' }}>
                    <div style={{ width: `${r.acc}%`, height: '100%', background: r.color, borderRadius: 3 }} />
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>

        <TabBar active={active} onChange={setActive} t={t} theme={theme} />
      </div>
    );
  }

  function Sparkline({ theme }) {
    const pts = [62, 58, 65, 70, 68, 72, 78];
    const W = 280, H = 100, pad = 6;
    const max = 85, min = 50;
    const xs = pts.map((_, i) => (i / (pts.length - 1)) * (W - pad * 2) + pad);
    const ys = pts.map((v) => H - pad - ((v - min) / (max - min)) * (H - pad * 2));
    const d = xs.map((x, i) => `${i ? 'L' : 'M'}${x},${ys[i]}`).join(' ');
    const dArea = d + ` L${xs[xs.length - 1]},${H} L${xs[0]},${H} Z`;
    return (
      <svg viewBox={`0 0 ${W} ${H + 26}`} style={{ width: '100%', height: 'auto', display: 'block' }}>
        <defs>
          <linearGradient id="spB" x1="0" x2="0" y1="0" y2="1">
            <stop offset="0%" stopColor={theme.primary} stopOpacity="0.28" />
            <stop offset="100%" stopColor={theme.primary} stopOpacity="0" />
          </linearGradient>
        </defs>
        <path d={dArea} fill="url(#spB)" />
        <path d={d} fill="none" stroke={theme.primary} strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" />
        {xs.map((x, i) => (
          <g key={i}>
            <circle cx={x} cy={ys[i]} r={i === pts.length - 1 ? 5 : 3} fill={i === pts.length - 1 ? theme.primary : theme.surface} stroke={theme.primary} strokeWidth="2" />
            <text x={x} y={H + 20} textAnchor="middle" fontSize="10" fill={theme.sub} fontWeight="700" fontFamily="Manrope">{['S','S','R','K','J','S','M'][i]}</text>
          </g>
        ))}
      </svg>
    );
  }

  // Profile
  function ScreenProfile({ active, setActive, go, t, theme }) {
    const items = [
      { icon: Ico.clock, label: 'Riwayat sesi', ctrl: 'chev', onClick: () => go('riwayat') },
      { icon: Ico.book,  label: 'Paket soal', ctrl: 'chev', onClick: () => go('paket') },
      { icon: Ico.bell,  label: t.notifications, ctrl: 'toggle' },
      { icon: Ico.book,  label: t.help, ctrl: 'chev' },
      { icon: Ico.heart, label: t.privacyAndTos, ctrl: 'chev' },
    ];
    return (
      <div style={{ height: '100%', background: theme.bg, overflowY: 'auto', paddingBottom: 100 }}>
        <div style={{ padding: '18px 22px 18px', display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
          <h1 style={{ margin: 0, fontSize: 24, color: theme.ink, fontFamily: 'Manrope', fontWeight: 800, letterSpacing: -0.6 }}>{t.profile}</h1>
        </div>

        {/* Big profile hero */}
        <div style={{ padding: '0 22px 18px' }}>
          <div style={{ background: theme.surface, border: `1.5px solid ${theme.border}`, borderRadius: 24, padding: 22, textAlign: 'center' }}>
            <div style={{ width: 76, height: 76, borderRadius: 38, background: theme.ink, color: '#fff', display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: 30, fontWeight: 800, margin: '0 auto 12px', fontFamily: 'Manrope', boxShadow: `0 6px 18px -6px rgba(0,0,0,0.3)` }}>A</div>
            <div style={{ fontSize: 17, fontWeight: 800, color: theme.ink, fontFamily: 'Manrope' }}>Aulia Rahmadhani</div>
            <div style={{ fontSize: 13, color: theme.sub, marginTop: 2 }}>aulia@email.com</div>

            {/* Stats grid */}
            <div style={{ marginTop: 18, padding: 14, background: theme.soft, borderRadius: 16, display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)' }}>
              {[
                { v: '12', l: t.streakDay },
                { v: '307', l: 'soal' },
                { v: '74%', l: t.accuracy },
              ].map((s, i) => (
                <div key={i} style={{ textAlign: 'center', borderLeft: i ? `1px solid ${theme.border}` : 'none' }}>
                  <div style={{ fontSize: 20, fontWeight: 800, color: theme.ink, fontFamily: 'Manrope', fontVariantNumeric: 'tabular-nums' }}>{s.v}</div>
                  <div style={{ fontSize: 10, color: theme.sub, marginTop: 2, fontWeight: 600 }}>{s.l}</div>
                </div>
              ))}
            </div>
          </div>
        </div>

        {/* Settings */}
        <div style={{ padding: '0 22px' }}>
          <SectionH theme={theme} title={t.settings} />
          <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
            {items.map((it, i) => (
              <button key={i} onClick={it.onClick} disabled={!it.onClick} className={it.onClick ? 'proto-card' : ''} style={{
                background: theme.surface, border: `1.5px solid ${theme.border}`, borderRadius: 16, padding: '14px 16px',
                display: 'flex', alignItems: 'center', gap: 12, fontFamily: 'inherit', textAlign: 'left',
                cursor: it.onClick ? 'pointer' : 'default', width: '100%',
              }}>
                <div style={{ width: 38, height: 38, borderRadius: 10, background: theme.soft, color: theme.ink, display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                  <it.icon s={18} />
                </div>
                <div style={{ flex: 1, fontSize: 14, color: theme.ink, fontWeight: 600 }}>{it.label}</div>
                {it.ctrl === 'toggle' ? (
                  <div style={{ width: 42, height: 26, borderRadius: 13, background: theme.ink, padding: 2, display: 'flex' }}>
                    <div style={{ marginLeft: 'auto', width: 22, height: 22, borderRadius: 11, background: '#fff' }} />
                  </div>
                ) : <Ico.chevR s={18} />}
              </button>
            ))}
          </div>
        </div>

        <div style={{ padding: '20px 22px 8px' }}>
          <Btn theme={theme} variant="ghost" full onClick={() => go('login')}>{t.signOut}</Btn>
          <div style={{ textAlign: 'center', marginTop: 14, fontSize: 11, color: theme.sub }}>{t.appVersion}</div>
        </div>

        <TabBar active={active} onChange={setActive} t={t} theme={theme} />
      </div>
    );
  }

  // ─────────────────────────────────────────────────────────────────────
  // ScreenRiwayat — past session list with subtest filter chips
  // ─────────────────────────────────────────────────────────────────────
  function ScreenRiwayat({ go, back, t, theme }) {
    const [filter, setFilter] = React.useState('all');
    const subColor = { twk: '#5A7AA6', tiu: '#7565A6', tkp: '#1F1F1F', full: theme.primary };
    const sessions = [
      { id: 1, date: 'Hari ini · 09:20', sub: 'tiu', label: 'TIU · Numerik', soal: 15, score: 78, time: '14:08', status: 'lulus' },
      { id: 2, date: '24 Mei · 21:14', sub: 'twk', label: 'TWK · Pancasila', soal: 30, score: 65, time: '22:30', status: 'lulus' },
      { id: 3, date: '23 Mei · 19:48', sub: 'tkp', label: 'TKP · Profesional', soal: 45, score: 58, time: '28:14', status: 'kurang' },
      { id: 4, date: '20 Mei · 16:02', sub: 'full', label: 'Try-out CAT Penuh', soal: 110, score: 72, time: '85:00', status: 'lulus' },
      { id: 5, date: '18 Mei · 08:34', sub: 'tiu', label: 'TIU · Verbal', soal: 15, score: 82, time: '12:22', status: 'lulus' },
      { id: 6, date: '15 Mei · 22:11', sub: 'twk', label: 'TWK · UUD 1945', soal: 20, score: 70, time: '15:43', status: 'lulus' },
    ];
    const filters = [
      { k: 'all', l: 'Semua' }, { k: 'twk', l: 'TWK' }, { k: 'tiu', l: 'TIU' }, { k: 'tkp', l: 'TKP' }, { k: 'full', l: 'Try-out' },
    ];
    const filtered = filter === 'all' ? sessions : sessions.filter((s) => s.sub === filter);

    return (
      <div style={{ height: '100%', background: theme.bg, display: 'flex', flexDirection: 'column' }}>
        <Header back={back} title="Riwayat sesi" theme={theme} />
        <div style={{ padding: '4px 22px 14px', display: 'flex', gap: 8, overflowX: 'auto', flexShrink: 0 }}>
          {filters.map((f) => {
            const on = filter === f.k;
            return (
              <button key={f.k} onClick={() => setFilter(f.k)} className="proto-btn" style={{
                height: 34, padding: '0 14px', borderRadius: 999, cursor: 'pointer', fontFamily: 'inherit',
                border: `1.5px solid ${on ? theme.ink : theme.border}`,
                background: on ? theme.ink : theme.surface, color: on ? '#fff' : theme.ink,
                fontSize: 12, fontWeight: 700, flexShrink: 0,
              }}>{f.l}</button>
            );
          })}
        </div>
        <div style={{ flex: 1, overflowY: 'auto', padding: '0 22px 24px' }}>
          {filtered.length === 0 ? (
            <div style={{ padding: '60px 20px', textAlign: 'center', color: theme.sub, fontSize: 13 }}>Belum ada sesi untuk filter ini.</div>
          ) : (
            <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
              {filtered.map((s) => (
                <button key={s.id} onClick={() => go('pembahasan')} className="proto-card" style={{
                  cursor: 'pointer', fontFamily: 'inherit', textAlign: 'left',
                  background: theme.surface, border: `1.5px solid ${theme.border}`, borderRadius: 18,
                  padding: '14px 16px', display: 'flex', alignItems: 'center', gap: 14, width: '100%',
                }}>
                  <div style={{
                    width: 56, height: 56, borderRadius: 14, background: subColor[s.sub] + '22', color: subColor[s.sub],
                    display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center',
                    fontFamily: 'Manrope', fontWeight: 800, flexShrink: 0,
                  }}>
                    <div style={{ fontSize: 10, lineHeight: 1, letterSpacing: 0.4 }}>{s.sub === 'full' ? 'FULL' : s.sub.toUpperCase()}</div>
                    <div style={{ fontSize: 20, lineHeight: 1, marginTop: 4, fontVariantNumeric: 'tabular-nums' }}>{s.score}</div>
                  </div>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div style={{ fontSize: 14, fontWeight: 800, color: theme.ink, fontFamily: 'Manrope', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>{s.label}</div>
                    <div style={{ fontSize: 11, color: theme.sub, marginTop: 3, display: 'flex', gap: 8, alignItems: 'center' }}>
                      <span>{s.date}</span>
                      <span style={{ width: 3, height: 3, borderRadius: 2, background: theme.sub, opacity: 0.5 }} />
                      <span>{s.soal} soal</span>
                      <span style={{ width: 3, height: 3, borderRadius: 2, background: theme.sub, opacity: 0.5 }} />
                      <span>{s.time}</span>
                    </div>
                  </div>
                  <div style={{
                    padding: '4px 10px', borderRadius: 999, fontSize: 9, fontWeight: 800, letterSpacing: 0.5, flexShrink: 0,
                    background: s.status === 'lulus' ? theme.ink : '#F3DDDD',
                    color: s.status === 'lulus' ? theme.surface : '#6E2828',
                  }}>{s.status === 'lulus' ? 'LULUS' : 'KURANG'}</div>
                </button>
              ))}
            </div>
          )}
        </div>
      </div>
    );
  }

  // ─────────────────────────────────────────────────────────────────────
  // ScreenPaket — package catalog with category filter
  // ─────────────────────────────────────────────────────────────────────
  function ScreenPaket({ go, back, t, theme }) {
    const [cat, setCat] = React.useState('all');
    const cats = [
      { k: 'all', l: 'Semua' }, { k: 'sub', l: 'Subtes' }, { k: 'try', l: 'Try-out' }, { k: 'bonus', l: 'Bonus' },
    ];
    const pakets = [
      { id: 'p1', title: 'Pancasila & UUD 1945', sub: 'TWK', count: 30, time: 25, color: '#5A7AA6', cat: 'sub', done: 22, badge: 'GRATIS' },
      { id: 'p2', title: 'Numerik Lengkap',       sub: 'TIU', count: 35, time: 35, color: '#7565A6', cat: 'sub', done: 12, badge: 'GRATIS' },
      { id: 'p3', title: 'Verbal & Analogi',      sub: 'TIU', count: 25, time: 25, color: '#7565A6', cat: 'sub', done: 0,  badge: 'GRATIS' },
      { id: 'p4', title: 'Kepribadian Profesional', sub: 'TKP', count: 45, time: 40, color: '#1F1F1F', cat: 'sub', done: 0, badge: 'GRATIS' },
      { id: 'p5', title: 'Simulasi CAT Penuh',    sub: 'FULL', count: 110, time: 100, color: theme.ink, cat: 'try', done: 1, badge: 'PREMIUM', desc: '3 set tryout setara CAT' },
      { id: 'p6', title: 'Try-out Mingguan #21',  sub: 'FULL', count: 110, time: 100, color: theme.ink, cat: 'try', done: 0, badge: 'PREMIUM', isNew: true },
      { id: 'p7', title: 'Tantangan Hari Ini',    sub: 'MIX', count: 10, time: 10, color: theme.accent, cat: 'bonus', done: 0, badge: 'GRATIS', isNew: true },
      { id: 'p8', title: 'Soal Sering Salah',     sub: 'MIX', count: 20, time: 18, color: '#7565A6', cat: 'bonus', done: 0, badge: 'PREMIUM' },
    ];
    const filtered = cat === 'all' ? pakets : pakets.filter((p) => p.cat === cat);

    return (
      <div style={{ height: '100%', background: theme.bg, display: 'flex', flexDirection: 'column' }}>
        <Header back={back} title="Paket soal" theme={theme} />
        <div style={{ padding: '4px 22px 14px', display: 'flex', gap: 8, overflowX: 'auto', flexShrink: 0 }}>
          {cats.map((c) => {
            const on = cat === c.k;
            return (
              <button key={c.k} onClick={() => setCat(c.k)} className="proto-btn" style={{
                height: 34, padding: '0 14px', borderRadius: 999, cursor: 'pointer', fontFamily: 'inherit',
                border: `1.5px solid ${on ? theme.ink : theme.border}`,
                background: on ? theme.ink : theme.surface, color: on ? '#fff' : theme.ink,
                fontSize: 12, fontWeight: 700, flexShrink: 0,
              }}>{c.l}</button>
            );
          })}
        </div>
        <div style={{ flex: 1, overflowY: 'auto', padding: '0 22px 24px' }}>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
            {filtered.map((p) => {
              const pct = p.count ? Math.round((p.done / p.count) * 100) : 0;
              return (
                <button key={p.id} onClick={() => go('subtest')} className="proto-card" style={{
                  cursor: 'pointer', fontFamily: 'inherit', textAlign: 'left',
                  background: theme.surface, border: `1.5px solid ${theme.border}`, borderRadius: 18,
                  padding: 14, display: 'flex', flexDirection: 'column', gap: 12, width: '100%',
                }}>
                  <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
                    <div style={{
                      width: 44, height: 44, borderRadius: 12, background: p.color + '22', color: p.color,
                      display: 'flex', alignItems: 'center', justifyContent: 'center', flexShrink: 0,
                      fontSize: 11, fontWeight: 800, fontFamily: 'Manrope', letterSpacing: 0.3,
                    }}>{p.sub}</div>
                    <div style={{ flex: 1, minWidth: 0 }}>
                      <div style={{ display: 'flex', alignItems: 'center', gap: 6, flexWrap: 'wrap' }}>
                        <div style={{ fontSize: 15, fontWeight: 800, color: theme.ink, fontFamily: 'Manrope' }}>{p.title}</div>
                        {p.isNew && <div style={{ background: theme.ink, color: '#fff', fontSize: 9, fontWeight: 800, padding: '2px 6px', borderRadius: 4, letterSpacing: 0.4 }}>BARU</div>}
                      </div>
                      <div style={{ fontSize: 11, color: theme.sub, marginTop: 3, display: 'flex', gap: 8, alignItems: 'center', flexWrap: 'wrap' }}>
                        <span>{p.count} soal</span>
                        <span style={{ width: 3, height: 3, borderRadius: 2, background: theme.sub, opacity: 0.5 }} />
                        <span>{p.time} menit</span>
                        {p.desc && (<><span style={{ width: 3, height: 3, borderRadius: 2, background: theme.sub, opacity: 0.5 }} /><span>{p.desc}</span></>)}
                      </div>
                    </div>
                    <div style={{
                      padding: '4px 9px', borderRadius: 999, fontSize: 9, fontWeight: 800, letterSpacing: 0.5, flexShrink: 0,
                      background: p.badge === 'GRATIS' ? theme.soft : theme.ink,
                      color: p.badge === 'GRATIS' ? theme.ink : '#fff',
                    }}>{p.badge}</div>
                  </div>
                  {p.done > 0 && (
                    <div>
                      <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: 10, color: theme.sub, marginBottom: 4, fontWeight: 600 }}>
                        <span>Progres · {p.done}/{p.count} soal</span><span style={{ color: p.color, fontWeight: 800, fontFamily: 'Manrope' }}>{pct}%</span>
                      </div>
                      <div style={{ height: 4, background: theme.soft, borderRadius: 2, overflow: 'hidden' }}>
                        <div style={{ width: `${pct}%`, height: '100%', background: p.color, borderRadius: 2, transition: 'width .6s cubic-bezier(.2,.7,.3,1)' }} />
                      </div>
                    </div>
                  )}
                </button>
              );
            })}
          </div>
        </div>
      </div>
    );
  }

  // ── ROOT ──
  function ProtoHangat({ tweaks, jump }) {
    const theme = themeFrom(tweaks);
    const t = I18N[tweaks.lang] || I18N.id;
    const sc = useScreens('onboarding');
    const [tab, setTab] = React.useState('home');

    React.useEffect(() => {
      if (tab === 'home' && sc.screen !== 'home') sc.reset('home');
      if (tab === 'stats' && sc.screen !== 'stats') sc.reset('stats');
      if (tab === 'profile' && sc.screen !== 'profile') sc.reset('profile');
      // eslint-disable-next-line
    }, [tab]);

    // Jump-to-screen from Tweaks panel
    React.useEffect(() => {
      if (jump && jump.screen) {
        sc.reset(jump.screen);
        if (['home', 'stats', 'profile'].includes(jump.screen)) setTab(jump.screen);
      }
      // eslint-disable-next-line
    }, [jump && jump.seq]);

    const fontSize = tweaks.fontSize || 15;

    return (
      <div style={{
        height: '100%', width: '100%',
        fontFamily: '"Manrope", -apple-system, system-ui, sans-serif',
        fontSize, color: theme.ink, background: theme.bg, position: 'relative',
        WebkitFontSmoothing: 'antialiased',
      }}>
        <style>{`
          @keyframes proto-screen-in { from { opacity: 0; transform: translateY(8px); } to { opacity: 1; transform: none; } }
          @keyframes proto-pop { 0% { transform: scale(0.7); opacity: 0; } 60% { transform: scale(1.04); opacity: 1; } 100% { transform: scale(1); opacity: 1; } }
          @keyframes proto-pulse { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.025); } }
          .proto-screen-wrap { height: 100%; animation: proto-screen-in .26s cubic-bezier(.2,.7,.3,1); }
          .proto-btn { transition: transform .12s cubic-bezier(.2,.7,.3,1), opacity .12s, background .15s, color .15s, border-color .15s; }
          .proto-btn:active:not(:disabled) { transform: scale(0.96); }
          .proto-btn:hover:not(:disabled) { opacity: 0.93; }
          .proto-card { transition: transform .15s cubic-bezier(.2,.7,.3,1), box-shadow .18s, border-color .15s; }
          .proto-card:active { transform: scale(0.985); }
          .proto-pop { animation: proto-pop .42s cubic-bezier(.2,1.4,.4,1); transform-origin: center; }
          .proto-pulse { animation: proto-pulse 1.6s ease-in-out infinite; }
        `}</style>
        <div key={sc.screen} className="proto-screen-wrap">
          {sc.screen === 'onboarding' && <ScreenOnboarding go={sc.replace} t={t} theme={theme} />}
          {sc.screen === 'login' && <ScreenLogin go={sc.replace} t={t} theme={theme} />}
          {sc.screen === 'home' && <><ScreenHome go={sc.go} t={t} theme={theme} /><TabBar active="home" onChange={setTab} t={t} theme={theme} /></>}
          {sc.screen === 'subtest' && <ScreenSubtest go={sc.go} back={sc.back} t={t} theme={theme} />}
          {sc.screen === 'soal' && <ScreenSoal go={sc.go} back={sc.back} t={t} theme={theme} lang={tweaks.lang || 'id'} />}
          {sc.screen === 'result' && <ScreenResult go={sc.replace} t={t} theme={theme} />}
          {sc.screen === 'pembahasan' && <ScreenPembahasan go={sc.replace} back={sc.back} t={t} theme={theme} lang={tweaks.lang || 'id'} />}
          {sc.screen === 'stats' && <ScreenStats active={tab} setActive={setTab} t={t} theme={theme} />}
          {sc.screen === 'profile' && <ScreenProfile active={tab} setActive={setTab} go={sc.go} t={t} theme={theme} />}
          {sc.screen === 'riwayat' && <ScreenRiwayat go={sc.go} back={sc.back} t={t} theme={theme} />}
          {sc.screen === 'paket' && <ScreenPaket go={sc.go} back={sc.back} t={t} theme={theme} />}
        </div>
      </div>
    );
  }

  window.ProtoHangat = ProtoHangat;
})();
