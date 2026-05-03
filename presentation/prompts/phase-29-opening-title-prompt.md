# Claude Prompt: Generate Opening & Title Sequence Slides

## Objective

Generate a single-file HTML presentation containing slides 0.1 (Title Card) and 0.2 (Agenda) for the AI+ HUB Factory presentation deck.

## Output File

Save the generated HTML to:
```
./presentation/slides/section-0-opening.html
```

Create the directory if it doesn't exist.

---

## Design System

**Source:** `.planning/PRESENTATION.md` Section 2

### Color Palette

| Role | Hex | Usage |
|------|-----|-------|
| **Primary** | `#FFE600` | Headlines, accents, active states |
| **Background** | `#1A1A24` | Slide backgrounds |
| **Surface** | `#2E2E38` | Cards, panels |
| **Text Primary** | `#FFFFFF` | Body text at 90-100% opacity |
| **Text Secondary** | `rgba(255,255,255,0.65)` | Descriptions, captions |
| **Text Muted** | `rgba(255,255,255,0.45)` | Labels, metadata |
| **Accent Blue** | `#188CE5` | Infrastructure (Chapter 01) |
| **Accent Purple** | `#750E5C` | Governance (Chapter 02) |
| **Accent Green** | `#2DB757` | Data (Chapter 03) |
| **Accent Teal** | `#27ACAA` | Intelligence (Chapter 04) |
| **Accent Orange** | `#FF6D00` | Scale (Chapter 05) |

### Typography

| Role | Font | Weight | Size | Usage |
|------|------|--------|------|-------|
| **Display** | Inter | 900 (Black) | 48-64px | Slide titles, hero numbers |
| **Heading** | Inter | 700 (Bold) | 28-36px | Section headers |
| **Subheading** | Inter | 600 | 20-24px | Card titles |
| **Body** | Inter | 400 (Regular) | 16-18px | Descriptions |
| **Caption** | Inter | 300 (Light) | 12-14px | Annotations |

### Layout Rules

- **Slide canvas**: 1920x1080px (16:9)
- **Safe margin**: 60px from edges
- **Accent bar**: 5px `#FFE600` top border on every slide
- **Animations**: CSS transitions 400-600ms, easing `cubic-bezier(0.4, 0, 0.2, 1)`
- **Dark mode only**: All slides use `#1A1A24` background

---

## Technical Stack

- Single HTML file with embedded CSS and JavaScript
- **GSAP** (via CDN: `https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js`)
- **Lucide icons** (via CDN: `https://unpkg.com/lucide@latest`)
- Google Fonts: Inter (weights 300, 400, 600, 700, 900)
- Dark mode only, no light mode toggle
- Keyboard navigation: Arrow keys to switch slides
- Print/PDF support via `@media print`
- `prefers-reduced-motion`: disable animations

---

## Slide 0.1 — Title Card: "AI+ HUB Factory"

### Layout Requirements

1. Full-screen slide (1920x1080) with `#1A1A24` background
2. Subtle animated gradient mesh background using purple/blue hues at 10% opacity (CSS animation)
3. 5px `#FFE600` accent bar at top (animate width 0→100% over 800ms)
4. Large "AI+" wordmark in `#FFE600` (Inter Black, 64px) with text-shadow glow effect
5. "HUB Factory" below in `#FFFFFF` (Inter Bold, 48px)
6. Thin `#FFE600` horizontal line separating title from subtitle
7. Subtitle: "Enterprise AI Infrastructure & Governance" (Inter Regular, 20px, rgba(255,255,255,0.65))
8. Tagline: "From Information Retrieval to Enterprise Intelligence" (Inter Light, 16px, rgba(255,255,255,0.45))
9. Version: "v1.0 | 2026" bottom-right (Inter Light, 14px)
10. EY lockup mark bottom-left (text: "EY · Ernst & Young" in caption style, Inter Light, 14px)

### Animation Sequence (GSAP Timeline)

```
Timeline:
- 0ms: Background mesh fades in (opacity 0→1, 800ms)
- 200ms: "AI+" scales from 0.8→1.0 + opacity 0→1 (600ms, ease: cubic-bezier(0.34, 1.56, 0.64, 1))
- 500ms: "HUB Factory" translateY(20px)→0 + opacity 0→1 (500ms)
- 700ms: Horizontal line draws itself (scaleX 0→1, 400ms)
- 900ms: Subtitle, tagline, version fade in (400ms stagger)
```

---

## Slide 0.2 — The Journey Ahead (Agenda)

### Layout Requirements

1. Title: "The Architecture of Intelligence" (Inter Black, 48px, `#FFFFFF`)
2. Vertical stack of 5 horizontal cards (each ~180px tall, full width minus 120px margins)
3. Left side: Chapter number 01-05 in `#FFE600` (Inter Black, 36px)
4. Center: Chapter title (Inter Bold, 24px) + description (Inter Regular, 16px, muted `rgba(255,255,255,0.65)`)
5. Right side: Minimal icon per chapter (use Lucide icons)
6. Card style: `#2E2E38` background, 1px border `rgba(255,255,255,0.06)`, left border accent color (4px)
7. Faint vertical connecting line (gradient `#FFE600`→transparent) behind cards

### Chapter Content

| # | Title | Description | Accent | Icon (Lucide) |
|---|-------|-------------|--------|---------------|
| 01 | Foundation | Azure Landing Zone — secure infrastructure substrate | `#188CE5` | `cloud` |
| 02 | Governance | Citadel & APIM Gateway — enterprise AI trust | `#750E5C` | `shield` |
| 03 | Data | Semantic Layer & OneLake — governed data access | `#2DB757` | `database` |
| 04 | Intelligence | Agentic Layer — autonomous AI operations | `#27ACAA` | `brain-circuit` |
| 05 | Scale | Hub-Spoke Topology — scaling the factory | `#FF6D00` | `network` |

### Animation Sequence

```
Timeline:
- 0ms: Title fades in (opacity 0→1, 400ms)
- 300ms: Card 1 slides in from left (translateX(-50px)→0 + opacity 0→1, 500ms)
- 450ms: Card 2 slides in from left (translateX(-50px)→0 + opacity 0→1, 500ms)
- 600ms: Card 3 slides in from left (translateX(-50px)→0 + opacity 0→1, 500ms)
- 750ms: Card 4 slides in from left (translateX(-50px)→0 + opacity 0→1, 500ms)
- 900ms: Card 5 slides in from left (translateX(-50px)→0 + opacity 0→1, 500ms)
- Per card: Left border color draws top-to-bottom (scaleY 0→1, 400ms) with 100ms delay after card appears
- 1400ms: Connecting line pulses (opacity 0.3→0.8→0.3, 800ms)
```

---

## Global Requirements

### Slide Navigation
- Arrow keys (Left/Right) to switch between slides
- Slide container uses `transform: translateX()` for transitions
- Transition duration: 500ms with `cubic-bezier(0.4, 0, 0.2, 1)` easing

### Accessibility
- `prefers-reduced-motion`: Disable all GSAP animations, show final states immediately
- `aria-label` on interactive elements
- Minimum contrast ratio: 4.5:1 for body text

### Print/PDF Support
- `@media print` styles: Remove animations, show all slides stacked vertically, hide navigation
- Background colors print correctly (`-webkit-print-color-adjust: exact`)

### File Structure

The output must be a single HTML file containing:
1. `<style>` tag with all CSS (including animations, layout, responsive rules)
2. `<body>` with two `.slide` sections
3. `<script>` tag with GSAP initialization, timeline definitions, and keyboard navigation

No external CSS or JS files. All assets embedded or loaded via CDN.

---

## Verification Checklist

Before saving the file, verify:

- [ ] Both slides render at 1920x1080 with correct background color
- [ ] Slide 0.1: All text elements present with correct fonts, sizes, and colors
- [ ] Slide 0.1: GSAP timeline plays sequentially with correct delays
- [ ] Slide 0.2: All 5 cards rendered with correct chapter data
- [ ] Slide 0.2: Lucide icons render correctly for each chapter
- [ ] Slide 0.2: Accent colors applied correctly to left borders
- [ ] Keyboard navigation works (arrow keys switch slides)
- [ ] `prefers-reduced-motion` disables animations
- [ ] Print styles render both slides without animations
- [ ] No external dependencies except GSAP and Lucide CDNs

---

## Source Context

**Design specification:** `.planning/PRESENTATION.md` (Section 2: Design System, Section 0: Opening & Title Sequence)

**Part of:** Phase 29 — Opening & Title Sequence, Plan 29-01
**Milestone:** v3.0 — AI+ HUB Factory Presentation
