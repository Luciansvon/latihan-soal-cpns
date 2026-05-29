---
name: Hyper-Personalized Minimalism
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
  on-surface-variant: '#44474d'
  inverse-surface: '#2d3133'
  inverse-on-surface: '#eff1f3'
  outline: '#75777e'
  outline-variant: '#c5c6cd'
  surface-tint: '#515f78'
  primary: '#000000'
  on-primary: '#ffffff'
  primary-container: '#0d1c32'
  on-primary-container: '#76849f'
  inverse-primary: '#b9c7e4'
  secondary: '#003ec6'
  on-secondary: '#ffffff'
  secondary-container: '#0052fe'
  on-secondary-container: '#dfe3ff'
  tertiary: '#000000'
  on-tertiary: '#ffffff'
  tertiary-container: '#002113'
  on-tertiary-container: '#678c77'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#d6e3ff'
  primary-fixed-dim: '#b9c7e4'
  on-primary-fixed: '#0d1c32'
  on-primary-fixed-variant: '#39475f'
  secondary-fixed: '#dde1ff'
  secondary-fixed-dim: '#b7c4ff'
  on-secondary-fixed: '#001452'
  on-secondary-fixed-variant: '#0038b6'
  tertiary-fixed: '#c4ecd3'
  tertiary-fixed-dim: '#a9cfb7'
  on-tertiary-fixed: '#002113'
  on-tertiary-fixed-variant: '#2b4e3b'
  background: '#f7f9fb'
  on-background: '#191c1e'
  surface-variant: '#e0e3e5'
  deep-navy: '#0A192F'
  electric-blue: '#0052FF'
  sage-green: '#769B85'
  glass-surface: rgba(255, 255, 255, 0.7)
  border-subtle: rgba(10, 25, 47, 0.08)
typography:
  headline-xl:
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
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 36px
  headline-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
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
    letterSpacing: 0.02em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 8px
  gutter: 16px
  margin-mobile: 20px
  margin-desktop: 40px
  bento-gap: 24px
---

## Brand & Style

The design system is engineered for the high-stakes environment of Indonesian exam preparation (UTBK, CPNS, etc.). It moves away from the "loud" gamification common in EdTech to embrace a **Hyper-Personalized Minimalism**—a style that respects the student's focus and cognitive bandwidth.

The aesthetic combines **Bento Grid modularity** with **Glassmorphism**, creating a structured yet airy interface. The atmosphere is professional, calm, and premium, designed to feel like a high-end digital study suite. It prioritizes "anti-AI slop" visuals: precise alignment, generous negative space, and a typography-first hierarchy that conveys authority and clarity.

Key Principles:
- **Cognitive Calm:** Reduce visual noise to maximize focus during study sessions.
- **Precision Engineering:** Every element is aligned to a strict grid, reflecting the discipline required for exam success.
- **Modern Indonesian Ethos:** A sophisticated, clean look that appeals to the aspirational nature of modern Indonesian students.

## Colors

The palette is anchored by **Deep Navy**, providing a scholarly and grounded foundation. **Electric Blue** is reserved strictly for high-priority actions and trust-building moments (CTAs, primary buttons), while **Sage Green** is the dedicated signal for progress, success, and growth metrics.

The background uses a soft, off-white/gray (`#F8FAFC`) to prevent eye strain during long study hours. Surface colors leverage transparency for glassmorphic effects, allowing the "Electric Blue" or "Deep Navy" to subtly bleed through backdrop blurs, maintaining a sense of depth without adding visual clutter.

## Typography

This design system employs a **Typography-First** hierarchy. **Plus Jakarta Sans** is used exclusively to maintain a cohesive, modern, and Indonesian-native feel. 

Headlines use tight letter-spacing and bold weights to command attention, while body text is given generous line-height to ensure readability during dense exam passages. Micro-copy and labels use medium weights to maintain legibility at small sizes. Scale is used aggressively to differentiate sections within the Bento Grid without needing heavy borders or varied background colors.

## Layout & Spacing

The layout is governed by a **12-column Bento Grid** on desktop and a **single-column fluid stack** on mobile. 

- **Bento Logic:** Content is grouped into modular cards of varying sizes (e.g., 1x1, 2x1, 2x2). These cards house specific data points like "Streak," "XP Progress," or "Topic Weaknesses."
- **Focus Mode:** During practice exams, the layout reflows into a "No Grid" model with maximum negative space (64px+ margins) to center the user's focus on the question and the "Confidence Slider."
- **Rhythm:** An 8px base unit ensures consistent scaling of padding and margins.

## Elevation & Depth

Depth is achieved through **Tonal Layering** and **Glassmorphism** rather than traditional heavy shadows.

- **Primary Surface:** The background remains flat and neutral.
- **Modular Cards:** These use a semi-transparent white background with a `backdrop-filter: blur(12px)`. A very thin, low-contrast outline (`border-subtle`) defines the boundary.
- **Active States:** When a card is hovered or interacted with, it uses a "Subtle Card Lift"—a soft, diffused ambient shadow with a hint of Deep Navy tint to make it appear physically closer to the user.
- **Focus Layers:** Modal overlays and study-mode panels use high-intensity background blurs to obscure the underlying dashboard, signaling a change in cognitive context.

## Shapes

The design system utilizes **Rounded** (0.5rem base) geometry to balance the professional nature of exam prep with a modern, approachable feel. 

- **Cards & Containers:** Use `rounded-lg` (1rem) to create soft, distinct modules within the Bento Grid.
- **Interactive Elements:** Buttons and input fields follow the base roundedness.
- **Progress Bars:** Use fully rounded (pill-shaped) ends to denote fluid movement and growth.

## Components

### Buttons & Actions
Primary actions use a solid **Electric Blue** fill with white text. They should feel high-contrast and authoritative. Secondary actions use the glass-surface treatment with an Electric Blue outline.

### Bento Cards
The core layout element. Each card should have a consistent 24px internal padding. Content inside should be strictly aligned to the top-left, with metrics (like "XP" or "%") using `headline-xl` typography to create a clear "at-a-glance" dashboard experience.

### Sleek Progress Bars
Progress bars should be thin (8px height) using a Sage Green fill for completed portions and a very light gray or translucent navy for the track. Transitions must be smooth and linear.

### Confidence Sliders
A unique input for exam prep. A horizontal slider allowing students to rate their certainty (Low to High). The slider track should subtly transition from a neutral gray to Electric Blue as the handle moves right.

### Knowledge Heatmaps
Density-based visualizations showing study activity. Use varying opacities of **Sage Green** (for consistency with "growth") against the deep navy or light neutral background.

### Input Fields
Minimalist styling with only a bottom border that transforms into a 2px Electric Blue line on focus. No heavy boxes, keeping the interface feeling "light."