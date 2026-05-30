---
name: Cognitive Calm
colors:
  surface: '#fff8f6'
  surface-dim: '#f8d1cb'
  surface-bright: '#fff8f6'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#fff0ee'
  surface-container: '#ffe9e6'
  surface-container-high: '#ffe2dd'
  surface-container-highest: '#ffdad4'
  on-surface: '#2b1613'
  on-surface-variant: '#603e39'
  inverse-surface: '#422a27'
  inverse-on-surface: '#ffedea'
  outline: '#956d67'
  outline-variant: '#ebbbb4'
  surface-tint: '#c00100'
  primary: '#bc0100'
  on-primary: '#ffffff'
  primary-container: '#eb0000'
  on-primary-container: '#fffbff'
  inverse-primary: '#ffb4a8'
  secondary: '#b72114'
  on-secondary: '#ffffff'
  secondary-container: '#ff5540'
  on-secondary-container: '#5c0100'
  tertiary: '#0059ba'
  on-tertiary: '#ffffff'
  tertiary-container: '#0071e8'
  on-tertiary-container: '#fefcff'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#ffdad4'
  primary-fixed-dim: '#ffb4a8'
  on-primary-fixed: '#410000'
  on-primary-fixed-variant: '#930100'
  secondary-fixed: '#ffdad4'
  secondary-fixed-dim: '#ffb4a8'
  on-secondary-fixed: '#410100'
  on-secondary-fixed-variant: '#930300'
  tertiary-fixed: '#d7e2ff'
  tertiary-fixed-dim: '#acc7ff'
  on-tertiary-fixed: '#001a40'
  on-tertiary-fixed-variant: '#004491'
  background: '#fff8f6'
  on-background: '#2b1613'
  surface-variant: '#ffdad4'
typography:
  display-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 48px
    fontWeight: '700'
    lineHeight: 60px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.01em
  headline-lg-mobile:
    fontFamily: Plus Jakarta Sans
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
  title-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  body-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 28px
  body-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  label-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
    letterSpacing: 0.01em
  label-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  grid-margin: 24px
  grid-gutter: 16px
  container-padding: 20px
  bento-gap: 16px
  section-gap: 40px
---

## Brand & Style

The design system is built upon the philosophy of **Hyper-Personalized Minimalism**, specifically tailored for the Indonesian EdTech landscape. It aims to bridge the gap between rigorous academic authority and modern, approachable digital experiences. The brand personality is **Professional, Trusted, and Encouraging**, moving away from the over-gamified "toy-like" aesthetics of casual learning apps toward a "Cognitive Calm" environment that reduces anxiety during high-stakes exam preparation.

The visual style is **Modern Corporate with Glassmorphism**. It utilizes a "Typography-First" hierarchy to ensure that dense educational content remains legible and unintimidating. The use of a Bento Grid layout provides a modular, organized structure that feels both premium and efficient, allowing students to digest complex data—like XP, streaks, and knowledge heatmaps—without feeling overwhelmed.

## Colors

The palette has shifted to a high-energy, high-visibility scheme anchored by **Vibrant Red (#FE0000)**, which commands attention and signals importance for core educational actions. **Warm Terracotta (#DB3C2A)** acts as a secondary harmonic, providing a sophisticated bridge between the primary red and the neutral tones. **Brilliant Blue (#007BFC)** is introduced as the tertiary color, specifically reserved for deep focus tasks, knowledge expansion, and interactive growth metrics. 

The background maintains a clean, minimalist aesthetic but now leans into a **Warm Neutral (#8F706B)** foundation for subtle structural elements. Use **Surface Glass** (translucent white) for Bento containers to create a sense of depth. For data visualization, such as Knowledge Heatmaps, transition from the warm neutral base to the Brilliant Blue to represent increasing levels of mastery.

## Typography

**Plus Jakarta Sans** is the exclusive typeface for the design system. It is chosen for its modern Indonesian context—balancing geometric clarity with a warm, humanist touch.

Hierarchy is established through weight and scale rather than decorative elements. For exam questions, use `body-lg` to ensure maximum readability. Use `display-lg` sparingly for motivational headers and high-level stats. All labels and functional text should use semi-bold weights (`600`) to maintain clear signposting against the clean backgrounds.

## Layout & Spacing

The layout is governed by a **Bento Grid philosophy**, which treats information as modular, nested blocks. This allows for a flexible yet structured dashboard that can accommodate varying types of data (e.g., a large card for "Today's Goal" next to two small cards for "Streak" and "XP").

- **Desktop:** 12-column grid with a fixed maximum width of 1280px.
- **Tablet:** 6-column fluid grid.
- **Mobile:** 2-column fluid grid, with most Bento items stacking into a single column.

Generous negative space is a functional requirement. Exam content screens should switch to a **Focus Mode**, removing the Bento structure and sidebars to center a single, high-readability column of text.

## Elevation & Depth

Visual hierarchy is achieved through **Soft Layers** and glassmorphism. Surfaces do not rely on heavy shadows, but rather on subtle tonal shifts and backdrop blurs.

- **Level 0 (Base):** The main background color, utilizing the light neutral palette.
- **Level 1 (Bento Cards):** Semi-transparent white (`rgba(255, 255, 255, 0.7)`) with a `20px` backdrop blur and a very soft, `4%` opacity shadow derived from the Warm Neutral tone.
- **Level 2 (Active/Hover):** A "Subtle Card Lift" effect—when a user interacts with a module, it scales slightly (1.02x) and the shadow opacity increases to `8%`.
- **Level 3 (Modals/Overlays):** High-opacity glass with a distinct `1px` border in a lighter shade of the Primary Red to define the edges.

## Shapes

The shape language is defined by **Soft Rounding** to make the high-intensity red palette feel more approachable to students. 

All Bento modules and primary containers utilize a **16px radius** (`rounded-xl`). Smaller interactive elements like buttons, input fields, and tags use an **8px radius** (`rounded-lg`). This creates a nested visual logic where internal components feel "contained" by the softer, larger outer blocks.

## Components

### Buttons & CTAs
Primary buttons use a solid **Vibrant Red** fill with white text. Secondary buttons use a transparent background with a Warm Terracotta border and text. All buttons feature a subtle 8px rounded corner and high-internal padding for a "tactile" feel.

### Bento Modules (Cards)
These are the core of the dashboard. They must maintain a consistent **16px padding**. Use "Knowledge Heatmaps" (grid of colored squares) within these cards to visualize student progress using the Brilliant Blue palette.

### Confidence Sliders
A specialized input for self-assessment. It should feature a thick, soft track with a large, easy-to-tap handle. The track color should transition from a neutral warm gray to **Brilliant Blue** as the slider moves toward "High Confidence."

### Input Fields
Inputs are minimalist, utilizing a light neutral background and an **8px radius**. On focus, the border should glow with a soft Vibrant Red outline.

### Progress Indicators
Use circular rings or linear bars in **Brilliant Blue**. These should be accompanied by `label-md` typography to clearly state the percentage or fraction of completion.