---
name: Patriot Edu System
colors:
  surface: '#f7f9fb'
  surface-dim: '#d8dadc'
  surface-bright: '#f7f9fb'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f2f4f6'
  surface-container: '#eceef0'
  surface-container-high: '#e6e8ea'
  surface-container-highest: '#e0e3e5'
  on-surface: '#191c1e'
  on-surface-variant: '#5d3f3c'
  inverse-surface: '#2d3133'
  inverse-on-surface: '#eff1f3'
  outline: '#926f6b'
  outline-variant: '#e7bdb8'
  surface-tint: '#c00014'
  primary: '#ba0013'
  on-primary: '#ffffff'
  primary-container: '#e31e24'
  on-primary-container: '#fffafa'
  inverse-primary: '#ffb4ab'
  secondary: '#565e74'
  on-secondary: '#ffffff'
  secondary-container: '#dae2fd'
  on-secondary-container: '#5c647a'
  tertiary: '#0050d4'
  on-tertiary: '#ffffff'
  tertiary-container: '#2f6af2'
  on-tertiary-container: '#fdfaff'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#ffdad6'
  primary-fixed-dim: '#ffb4ab'
  on-primary-fixed: '#410002'
  on-primary-fixed-variant: '#93000d'
  secondary-fixed: '#dae2fd'
  secondary-fixed-dim: '#bec6e0'
  on-secondary-fixed: '#131b2e'
  on-secondary-fixed-variant: '#3f465c'
  tertiary-fixed: '#dbe1ff'
  tertiary-fixed-dim: '#b4c5ff'
  on-tertiary-fixed: '#00174b'
  on-tertiary-fixed-variant: '#003ea8'
  background: '#f7f9fb'
  on-background: '#191c1e'
  surface-variant: '#e0e3e5'
typography:
  headline-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
  headline-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 20px
    fontWeight: '700'
    lineHeight: 28px
  headline-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
  body-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
    letterSpacing: 0.02em
  label-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
  headline-lg-mobile:
    fontFamily: Plus Jakarta Sans
    fontSize: 22px
    fontWeight: '700'
    lineHeight: 28px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  container-padding: 1.25rem
  stack-gap: 1rem
  inner-padding: 1rem
  gutter-md: 1rem
  margin-page: 1.25rem
---

## Brand & Style

The design system is engineered for the high-stakes environment of Indonesian civil service and military entrance exams (CPNS, TNI, Polri). It adopts a **Corporate Modern** aesthetic that balances institutional authority with educational accessibility. 

The brand personality is disciplined, encouraging, and patriotic. It utilizes a clean, card-based interface to organize complex information into digestible learning modules. The visual mood is designed to evoke confidence and focus, moving away from cluttered "test prep" tropes toward a refined, goal-oriented user experience.

## Colors

The palette is rooted in the Indonesian national colors, using a vibrant **Primary Red** for action and urgency. 

- **Primary Red (#E31E24):** Used for critical CTAs (Mulai), active navigation states (Latihan), and high-priority badges (CPNS).
- **Navy Blue (#0F172A):** Provides institutional stability and contrast. Used for headers and primary text to ensure readability.
- **Supportive Blue (#2563EB):** Used for secondary markers like the "TIU" category and interactive elements like pagination circles.
- **Neutral Foundation:** A stark white background paired with very light gray surfaces (`#F8FAFC`) keeps the interface feeling light and contemporary.

## Typography

The design system utilizes **Plus Jakarta Sans** for its friendly yet professional geometry. It is highly legible for long-form exam questions and clear enough for quick-scan dashboard metrics.

- **Headlines:** Use Bold (700) weight for section headers like "Pilih Paket Soal" to establish clear hierarchy.
- **Body Text:** Use Regular (400) weight for descriptions and question text to reduce eye strain during long study sessions.
- **Labels:** Use Medium (500) or Semi-Bold (600) for metadata like "5 soal" or "3 mata pelajaran" to provide secondary emphasis without competing with primary headings.

## Layout & Spacing

The layout follows a **Fluid Grid** model optimized for mobile-first consumption. 

- **Vertical Rhythm:** Content is stacked with a consistent 1rem (16px) gap.
- **Safe Areas:** A 1.25rem (20px) horizontal margin is maintained on both sides of the screen to prevent content from touching the edges.
- **Card Spacing:** Content within cards uses a 1rem internal padding to ensure touch targets (like the chevron icons) are easily accessible.
- **Reflow:** On tablets, cards may transition from a single-column stack to a 2-column grid to maximize screen real estate.

## Elevation & Depth

This design system uses **Tonal Layers** combined with **Ambient Shadows** to create a structured sense of depth:

- **Surface Level 0:** The main background, typically white or off-white.
- **Surface Level 1 (Cards):** Uses a very soft, diffused shadow (Blur 12px, Opacity 4-6%, Color #0F172A) to lift study modules from the background.
- **Active States:** Subtle 1px borders are used in primary colors to denote selection (e.g., the red border on the active CPNS category card).
- **Overlays:** High-contrast banners (Daily Challenge) use solid primary colors rather than depth to demand immediate attention.

## Shapes

The design system employs a **Rounded** shape language to make the preparation process feel less intimidating and more modern.

- **Standard Cards:** 0.75rem (12px) to 1rem (16px) corner radius.
- **Badges:** Small rectangular badges (e.g., "CPNS", "TIU") use a smaller 0.25rem (4px) radius to maintain a distinct "tag" look.
- **Interactive Elements:** Circular backgrounds for icons and pagination numbers to create a clear "tap" affordance.

## Components

### Cards
Cards are the primary container. They must include a subtle shadow and 16px corner radius. Category cards (CPNS/TNI) should utilize a color-coded left border or accent to help users distinguish between exam types.

### Buttons
- **Primary:** Solid red background with white text, 8px corner radius.
- **Secondary:** Ghost style with a 1px border and centered text.
- **Navigation:** Bottom navigation icons use the Primary Red for active states and medium gray for inactive states.

### Progress Markers
Pagination circles (1, 2, 3...) should use the Supportive Blue for active/completed states and a light neutral for pending states. These must be large enough to serve as touch targets.

### Badges & Chips
Used for categorization (e.g., "TWK", "TKP"). These should have low-contrast background fills paired with high-contrast text colors to denote category shifts without overwhelming the main content.

### Lists
ListItem components should always feature a trailing chevron icon (`>`) to indicate drill-down navigation, following the "Pilih Mata Pelajaran" pattern.