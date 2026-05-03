# Claude Prompt: Generate Citadel Governance Core Slides

## Objective

Generate a single-file HTML presentation containing slides 2.1 (Introducing the Citadel Governance Hub), 2.2 (Layer 1: APIM Gateway), 2.3 (The 4-Layer Interlock), and 2.4 (Governance in Action: The Audit Trail) for the AI+ HUB Factory presentation deck.

## Output File

Save the generated HTML to:
```
./presentation/slides/section-2-citadel-governance.html
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
| **Accent Blue** | `#188CE5` | Layer 1 - Governance Hub |
| **Accent Orange** | `#FF6D00` | Layer 2 - AI Control Plane |
| **Accent Teal** | `#27ACAA` | Layer 3 - Agent Identity |
| **Accent Purple** | `#750E5C` | Layer 4 - Security Fabric |
| **Accent Green** | `#2DB757` | Success states, audit trail |

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

## Slide 2.1 — Introducing the Citadel Governance Hub

### Layout Requirements

1. Full-screen slide (1920x1080) with `#1A1A24` background
2. 5px `#FFE600` accent bar at top (animate width 0→100% over 800ms)
3. Title: "The Heart: Citadel Governance Hub" (Inter Black, 48px, `#FFFFFF`)
4. Subtitle: "4-layer architecture for enterprise AI trust" (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
5. Main graphic: Vertical stack of 4 full-width horizontal layers (each 140px tall, spanning ~800px wide, centered):
   - **Layer 1 (bottom)**: `#188CE5` — "Governance Hub" with Lucide `shield` icon
   - **Layer 2**: `#FF6D00` — "AI Control Plane" with Lucide `bar-chart-3` icon
   - **Layer 3**: `#27ACAA` — "Agent Identity" with Lucide `fingerprint` icon
   - **Layer 4 (top)**: `#750E5C` — "Security Fabric" with Lucide `shield-check` icon
6. Layer cake style with subtle drop shadow between layers:
   ```css
   .layer {
     box-shadow: 0 4px 20px rgba(0,0,0,0.3);
     border-radius: 8px;
     margin-bottom: 8px;
   }
   ```
7. Each layer has left padding 40px, icon + label centered vertically
8. Layer label: Inter Bold, 24px, `#FFFFFF`
9. Stat bottom-right:
   - "80%" in `#FFE600` (Inter Black, 96px)
   - "reduction in shadow AI data breach risk" below (Inter Regular, 16px, `rgba(255,255,255,0.65)`)

### Animation Sequence (GSAP Timeline)

```
Timeline:
- 0ms: Accent bar draws (width 0→100%, 800ms)
- 200ms: Title fades in (opacity 0→1, translateY(20px)→0, 500ms)
- 400ms: Subtitle fades in (opacity 0→1, 400ms)
- 800ms: Layer 1 (Blue) slides in from bottom (translateY(50px)→0, opacity 0→1, 400ms, ease: cubic-bezier(0.34, 1.56, 0.64, 1))
- 900ms: Layer 2 (Orange) slides in from bottom (translateY(50px)→0, opacity 0→1, 400ms, same bounce ease)
- 1000ms: Layer 3 (Teal) slides in from bottom (translateY(50px)→0, opacity 0→1, 400ms, same bounce ease)
- 1100ms: Layer 4 (Purple) slides in from bottom (translateY(50px)→0, opacity 0→1, 400ms, same bounce ease)
- 1500ms: Icons pop in with scale (scale 0→1, opacity 0→1, 300ms, stagger 100ms per layer)
- 2000ms: Stat number counts up from 0 to 80 (1000ms, GSAP counter)
- 2200ms: Stat label fades in (opacity 0→1, 400ms)
```

---

## Slide 2.2 — Layer 1: APIM Gateway

### Layout Requirements

1. Title: "Layer 1: The Unified AI Gateway" (Inter Black, 48px, `#FFFFFF`)
2. Subtitle: "Every AI request flows through here" (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
3. Radial gradient background from center (`#2E2E38`) to edges (`#1A1A24`):
   ```css
   background: radial-gradient(circle at center, #2E2E38 0%, #1A1A24 70%);
   ```
4. Central gateway icon: Shield with doorway in `#FFE600` (large, ~200px, centered)
   - Use Lucide `shield` icon at 120px with a smaller `door-open` icon overlaid
   - Or create SVG shield shape with cutout doorway
5. 6 orbiting hexagons around gateway (positioned in circle, radius ~300px):
   - **Authentication** — `#188CE5` — Lucide `key` icon
   - **Rate Limiting** — `#FF6D00` — Lucide `gauge` icon
   - **Content Safety** — `#2DB757` — Lucide `shield-check` icon
   - **PII Masking** — `#750E5C` — Lucide `eye-off` icon
   - **Smart Routing** — `#27ACAA` — Lucide `git-branch` icon
   - **Audit Logging** — `#FFE600` — Lucide `clipboard-list` icon
6. Hexagon style:
   ```css
   .hexagon {
     width: 120px;
     height: 120px;
     background: currentColor;
     clip-path: polygon(50% 0%, 100% 25%, 100% 75%, 50% 100%, 0% 75%, 0% 25%);
     display: flex;
     align-items: center;
     justify-content: center;
   }
   ```
7. Connection lines from each hexagon to center gateway (SVG lines, 2px, `rgba(255,255,255,0.3)`)
8. Bottom flow diagram: "Request → Auth → Rate Limit → Safety → Route → Log → Response"
   - Each step is a rounded pill shape (40px tall, ~120px wide)
   - Connected by arrows
   - Pills use Surface color `#2E2E38` with 1px border `rgba(255,255,255,0.1)`

### CSS Orbiting Animation

```css
@keyframes orbit {
  from { transform: rotate(0deg) translateX(300px) rotate(0deg); }
  to { transform: rotate(360deg) translateX(300px) rotate(-360deg); }
}

.hexagon {
  animation: orbit 20s linear infinite;
}
/* Stagger start positions using animation-delay or individual transform rotations */
```

### Animation Sequence (GSAP Timeline + CSS)

```
Timeline:
- 0ms: Title and subtitle fade in (opacity 0→1, 400ms)
- 400ms: Gateway icon scales in (scale 0.5→1, opacity 0→1, 600ms, ease: cubic-bezier(0.34, 1.56, 0.64, 1))
- 800ms: Gateway starts pulsing (continuous: scale 1→1.05→1, 2s loop, GSAP yoyo)
- 1000ms: Connection lines draw from center outward (stroke-dashoffset, 800ms)
- 1200ms: Hexagons appear at their positions (scale 0→1, opacity 0→1, 400ms, stagger 100ms)
- 1600ms: Orbiting animation starts (CSS animation, 20s continuous)
- 1800ms: Data packet dots appear on connection lines traveling toward center (continuous loop, 2s per traversal)
- 2000ms: Flow diagram pills fade in sequentially (opacity 0→1, 300ms each, 200ms stagger)
- 2400ms: Arrow connections between pills draw themselves (stroke-dashoffset, 400ms each)
```

---

## Slide 2.3 — The 4-Layer Interlock

### Layout Requirements

1. Title: "Layers in Motion" (Inter Black, 48px, `#FFFFFF`)
2. Subtitle: "Separation of concerns with unified oversight" (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
3. Vertical flow diagram centered on slide:
   - **Layer 4** (Purple `#750E5C`) at top — rounded rectangle, ~500px wide × 100px tall
   - **Arrow down** — animated gradient arrow, ~60px tall
   - **Layer 3** (Teal `#27ACAA`) — same dimensions
   - **Arrow down** — animated gradient arrow
   - **Layer 2** (Orange `#FF6D00`) — same dimensions
   - **Arrow down** — animated gradient arrow
   - **Layer 1** (Blue `#188CE5`) — same dimensions
   - **Arrow down** — animated gradient arrow
   - **"AI Agents"** (Yellow `#FFE600`) — rounded rectangle, same width, labeled with Lucide `bot` icon
4. Side annotations:
   - **Left** (positioned midway, left margin): "Security Fabric protects all layers" (Inter Regular, 16px, `rgba(255,255,255,0.45)`)
   - **Right** (positioned midway, right margin): "Governance Hub enforces at runtime" (Inter Regular, 16px, `rgba(255,255,255,0.45)`)
5. Each layer has subtle glow matching accent color:
   ```css
   .layer-glow {
     box-shadow: 0 0 30px currentColor, 0 0 60px currentColor;
     opacity: 0.5;
   }
   ```
6. Layer labels: Inter Bold, 20px, `#FFFFFF`, with small description text below in caption style

### SVG Arrow Requirements

```css
.arrow-line {
  stroke: url(#arrowGradient);
  stroke-width: 4;
  stroke-linecap: round;
  fill: none;
}

/* Gradient definition */
linearGradient#arrowGradient {
  stop-color: currentLayerColor; /* Changes per arrow */
  stop-color: nextLayerColor;
}
```

### Animation Sequence (GSAP + CSS)

```
Timeline:
- 0ms: Title and subtitle fade in (opacity 0→1, 400ms)
- 400ms: Layer 4 (Purple) fades in (opacity 0→1, translateY(-20px)→0, 500ms)
- 600ms: Arrow 1 draws downward (stroke-dashoffset, 400ms)
- 800ms: Layer 3 (Teal) fades in (opacity 0→1, translateY(-20px)→0, 500ms)
- 1000ms: Arrow 2 draws downward (stroke-dashoffset, 400ms)
- 1200ms: Layer 2 (Orange) fades in (opacity 0→1, translateY(-20px)→0, 500ms)
- 1400ms: Arrow 3 draws downward (stroke-dashoffset, 400ms)
- 1600ms: Layer 1 (Blue) fades in (opacity 0→1, translateY(-20px)→0, 500ms)
- 1800ms: Arrow 4 draws downward (stroke-dashoffset, 400ms)
- 2000ms: "AI Agents" (Yellow) fades in (opacity 0→1, scale 0.9→1, 500ms, ease: bounce)
- 2200ms: Side annotations fade in (opacity 0→1, 400ms, stagger 200ms)
- 2500ms: Layer glows start pulsing (CSS animation: opacity 0.5→1→0.5, 3s loop)
- 2500ms: Arrow gradient flow starts (CSS animation: gradient offset moves down, 3s loop, linear)
- 2800ms: AI Agents icon pulses yellow when flow reaches bottom (scale 1→1.1→1, 1s, then continuous 3s loop)
```

---

## Slide 2.4 — Governance in Action: The Audit Trail

### Layout Requirements

1. Title: "Every Interaction is Traceable" (Inter Black, 48px, `#FFFFFF`)
2. Subtitle: "Complete auditability across the AI factory" (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
3. Horizontal flow with 6 checkpoint nodes (arranged left-to-right, centered):
   - **Who** — Lucide `user` icon — `#188CE5`
   - **What** — Lucide `settings` icon — `#FF6D00`
   - **When** — Lucide `clock` icon — `#2DB757`
   - **Where** — Lucide `map-pin` icon — `#27ACAA`
   - **Why** — Lucide `help-circle` icon — `#750E5C`
   - **How** — Lucide `activity` icon — `#FFE600`
4. Each checkpoint: circle (80px diameter) with icon inside, label below (Inter Bold, 14px)
5. Connecting line between checkpoints: 2px solid `rgba(255,255,255,0.2)`, ~100px wide
6. Final checkpoint: "Governed Response" with green checkmark (Lucide `check-circle` in `#2DB757`)
7. Retention table below flow diagram:
   | Log Type | Retention |
   |----------|-----------|
   | Access Logs | 90 days |
   | Policy Logs | 1 year |
   | Audit Trail | 7 years |
   | Security Logs | 7 years |
8. Table style: `#2E2E38` background, 1px border `rgba(255,255,255,0.1)`, header row in `#FFE600`
9. Traveling dot: Small circle (16px) in `#FFE600` with glow effect that moves along the checkpoint line

### Animation Sequence (GSAP Timeline)

```
Timeline:
- 0ms: Title and subtitle fade in (opacity 0→1, 400ms)
- 400ms: Checkpoint 1 (Who) fades in (scale 0.8→1, opacity 0→1, 300ms)
- 500ms: Traveling dot starts moving left-to-right along connecting line (2s total, ease: linear)
- 600ms: Checkpoint 2 (What) lights up as dot arrives (scale 0.8→1, opacity 0→1, 300ms)
- 800ms: Checkpoint 3 (When) lights up (scale 0.8→1, opacity 0→1, 300ms)
- 1000ms: Checkpoint 4 (Where) lights up (scale 0.8→1, opacity 0→1, 300ms)
- 1200ms: Checkpoint 5 (Why) lights up (scale 0.8→1, opacity 0→1, 300ms)
- 1400ms: Checkpoint 6 (How) lights up (scale 0.8→1, opacity 0→1, 300ms)
- 1600ms: "Governed Response" checkmark appears (scale 0→1, opacity 0→1, 400ms)
- 1700ms: Green checkmark draws itself (SVG stroke-dashoffset animation, 600ms)
- 2000ms: Retention table rows fade in with stagger (opacity 0→1, translateY(10px)→0, 300ms each, 150ms stagger)
- 2600ms: Table header highlights with brief glow (box-shadow pulse, 400ms)
```

---

## Global Requirements

### Slide Navigation
- Arrow keys (Left/Right) to switch between slides
- Slide container uses `transform: translateX()` for transitions
- Transition duration: 500ms with `cubic-bezier(0.4, 0, 0.2, 1)` easing
- This is Section 2 — slides should be reachable from Section 1 (Landing Zone) and Section 3 (Data)

### CSS Animation Patterns

```css
/* Bounce easing for layer arrivals */
.bounce-in {
  animation-timing-function: cubic-bezier(0.34, 1.56, 0.64, 1);
}

/* Continuous pulse */
@keyframes pulse {
  0%, 100% { transform: scale(1); opacity: 1; }
  50% { transform: scale(1.05); opacity: 0.8; }
}

/* Glow pulse */
@keyframes glow-pulse {
  0%, 100% { opacity: 0.5; }
  50% { opacity: 1; }
}

/* Gradient flow */
@keyframes gradient-flow {
  0% { stroke-dashoffset: 100; }
  100% { stroke-dashoffset: 0; }
}
```

### Accessibility
- Respect `prefers-reduced-motion`: disable all animations
- All icons have aria-labels
- Color contrast ratios meet WCAG AA

### Performance
- Use `transform` and `opacity` for animations (GPU-accelerated)
- Lazy-load Lucide icons per slide
- Use `will-change` sparingly on animated elements

---

## Notes

- Citadel is the heart of the presentation. The 4-layer visualization should feel authoritative and trustworthy.
- The APIM gateway slide (2.2) is the most visually complex — ensure the orbiting hexagons don't overwhelm the central message.
- Layer colors: Blue (#188CE5) → Orange (#FF6D00) → Teal (#27ACAA) → Purple (#750E5C) — maintain this order consistently.
- The 80% stat on slide 2.1 should feel impactful — use a counter animation to build drama.
- The audit trail on slide 2.4 should convey completeness and trust — the traveling dot creates a sense of journey.
