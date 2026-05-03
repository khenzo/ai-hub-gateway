# Claude Prompt: Generate Landing Zone Foundation Slides

## Objective

Generate a single-file HTML presentation containing slides 1.1 (What is the Azure Landing Zone?), 1.2 (Landing Zone as Container), and 1.3 (Integration with Azure Landing Zones) for the AI+ HUB Factory presentation deck.

## Output File

Save the generated HTML to:
```
./presentation/slides/section-1-landing-zone.html
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
| **Accent Blue** | `#188CE5` | Infrastructure, Landing Zone |
| **Accent Purple** | `#750E5C` | Governance, Identity |
| **Accent Green** | `#2DB757` | Data services |
| **Accent Teal** | `#27ACAA` | Agent spokes |
| **Accent Orange** | `#FF6D00` | Hub-spoke connections |

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

## Slide 1.1 — What is the Azure Landing Zone?

### Layout Requirements

1. Full-screen slide (1920x1080) with `#1A1A24` background
2. 5px `#FFE600` accent bar at top (animate width 0→100% over 800ms)
3. Title: "The Foundation: Azure Landing Zone" (Inter Black, 48px, `#FFFFFF`)
4. Subtitle: "Enterprise-scale infrastructure substrate for AI workloads" (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
5. Main graphic: 3D isometric foundation diagram with 3 horizontal slabs:
   - **Bottom slab**: `#188CE5` (Blue) — "Network & Security" with Lucide icons: `cloud`, `shield`, `lock`
   - **Middle slab**: `#750E5C` at 70% opacity (Purple) — "Identity & Access" with Lucide icons: `fingerprint`, `users`, `key`
   - **Top slab**: `#FFE600` at 40% opacity (Yellow) — "Operations & Monitoring" with Lucide icons: `activity`, `bar-chart-3`, `bell`
6. Slabs slightly offset to show depth using `translateZ()` and `box-shadow`
7. Stat callout bottom-right:
   - "2-4 weeks" in `#FFE600` (Inter Black, 72px)
   - "to production vs. 6-12 months custom build" below (Inter Regular, 16px, `rgba(255,255,255,0.65)`)
8. Key capabilities as 3 small labels below slabs:
   - "Network Isolation — Hub-spoke VNets, private endpoints, Azure Firewall"
   - "Identity Backbone — Microsoft Entra ID, RBAC, managed identities"
   - "Operational Baseline — Monitoring, logging, backup, policy enforcement"

### CSS 3D Transform Requirements

```css
.slab {
  transform: rotateX(60deg) rotateZ(-45deg);
  transform-style: preserve-3d;
  box-shadow: 
    -20px 20px 40px rgba(0,0,0,0.4),
    -10px 10px 20px rgba(0,0,0,0.2);
}
```

Each slab is a rectangle approximately 400px wide × 120px tall, with 20px vertical spacing between them.

### Animation Sequence (GSAP Timeline)

```
Timeline:
- 0ms: Accent bar draws (width 0→100%, 800ms)
- 200ms: Title fades in (opacity 0→1, translateY(20px)→0, 500ms)
- 400ms: Subtitle fades in (opacity 0→1, 400ms)
- 800ms: Bottom slab (Blue) rises from bottom (translateY(100px)→0, opacity 0→1, 600ms, ease: cubic-bezier(0.4, 0, 0.2, 1))
- 1000ms: Middle slab (Purple) rises from bottom (translateY(100px)→0, opacity 0→1, 600ms, same ease)
- 1200ms: Top slab (Yellow) rises from bottom (translateY(100px)→0, opacity 0→1, 600ms, same ease)
- 1400ms: Icons on bottom slab pop in (scale 0.8→1, opacity 0→1, 300ms, stagger 50ms)
- 1550ms: Icons on middle slab pop in (scale 0.8→1, opacity 0→1, 300ms, stagger 50ms)
- 1700ms: Icons on top slab pop in (scale 0.8→1, opacity 0→1, 300ms, stagger 50ms)
- 2000ms: Stat number counts up from 0 to "2-4" (800ms, use GSAP SplitText or custom counter)
- 2200ms: Stat label fades in (opacity 0→1, 400ms)
- 2400ms: Key capability labels fade in with stagger (opacity 0→1, 300ms each, 100ms stagger)
```

---

## Slide 1.2 — Landing Zone as Container

### Layout Requirements

1. Title: "The Landing Zone Hosts Everything" (Inter Black, 48px, `#FFFFFF`)
2. Subtitle: "A single secure container for the entire AI factory" (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
3. Main graphic: Concentric/nested rectangle diagram centered on slide
   - **Outer box**: `#188CE5`, 2px border, labeled "Azure Landing Zone" (Inter Bold, 24px)
   - **Inner boxes** (arranged horizontally inside outer box):
     - "Citadel Hub" (Purple `#750E5C`, solid fill at 30% opacity)
     - "Agent Spokes" (Teal `#27ACAA`, solid fill at 30% opacity)
     - "Data Services" (Green `#2DB757`, solid fill at 30% opacity)
4. Dashed SVG lines showing VNet peering connections between hub and spokes
5. Callout labels with thin lines pointing to areas:
   - "Platform Subscriptions" — top-left of outer box
   - "Hub VNet" — center-top between boxes
   - "AI-Specific Extensions" — bottom-right of outer box
6. Each inner box contains 2-3 small Lucide icons:
   - Citadel Hub: `shield`, `gate`, `gavel`
   - Agent Spokes: `bot`, `brain-circuit`, `zap`
   - Data Services: `database`, `layers`, `server`

### SVG Dashed Line Requirements

```css
.connection-line {
  stroke: rgba(255, 230, 0, 0.6);
  stroke-width: 2;
  stroke-dasharray: 8, 4;
  fill: none;
}
```

### Animation Sequence (GSAP Timeline)

```
Timeline:
- 0ms: Title and subtitle fade in (opacity 0→1, 400ms)
- 400ms: Outer container expands from center (scale 0→1, 800ms, ease: cubic-bezier(0.34, 1.56, 0.64, 1))
- 1000ms: "Azure Landing Zone" label fades in (opacity 0→1, 300ms)
- 1200ms: Citadel Hub box fades in (opacity 0→1, 400ms)
- 1400ms: Agent Spokes box fades in (opacity 0→1, 400ms)
- 1600ms: Data Services box fades in (opacity 0→1, 400ms)
- 1800ms: Icons within each box pop in (scale 0.8→1, 300ms, stagger 80ms across all boxes)
- 2200ms: Dashed connection lines draw themselves (stroke-dashoffset animation, 1200ms, ease: power2.inOut)
- 2800ms: Callout labels fade in with stagger (opacity 0→1, 300ms each, 150ms stagger)
- 3500ms: Data packet dots appear and travel along dashed lines (continuous loop, 3s per traversal)
  - Small circles (8px) in `#FFE600`
  - Animate along path using GSAP MotionPathPlugin or CSS offset-path
  - Multiple packets with staggered start times
```

---

## Slide 1.3 — Integration with Azure Landing Zones

### Layout Requirements

1. Title: "Seamless Enterprise Integration" (Inter Black, 48px, `#FFFFFF`)
2. Subtitle: "Extends existing ALZ investments — no rip-and-replace" (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
3. Main graphic: Two large panels with animated bridge
   - **Left panel**: "Azure Landing Zone" block (Blue `#188CE5`, 300px wide, full height minus margins)
   - **Right panel**: "Citadel AI+" block (Yellow `#FFE600`, 300px wide, full height minus margins)
   - **Center bridge**: 5 animated connection points with flowing arrows
4. Connection points (vertical stack in center gap):
   - Network Topology → Hub-spoke + VNet peering
   - Identity & Access → Entra ID extension to AI agents
   - Security Controls → Defender + Purview for AI workloads
   - Governance → Azure Policy inheritance
   - Operations → Unified monitoring and logging
5. Table below the bridge showing alignment:
   | ALZ Design Area | Citadel Integration |
   |-----------------|---------------------|
   | Network Topology | Hub-spoke + VNet peering |
   | Identity & Access | Entra ID extension to AI agents |
   | Security Controls | Defender + Purview for AI workloads |
   | Governance | Azure Policy inheritance |
   | Operations | Unified monitoring and logging |
6. Table style: `#2E2E38` background, 1px border `rgba(255,255,255,0.1)`, header row in `#FFE600`
7. Bottom text: "Supplemental design — extends, does not replace" (Inter Light, 14px, `rgba(255,255,255,0.45)`)

### Bridge SVG Requirements

```css
.bridge-line {
  stroke: #FFE600;
  stroke-width: 3;
  stroke-linecap: round;
  fill: none;
}

.bridge-arrow {
  fill: #FFE600;
}
```

### Animation Sequence (GSAP Timeline)

```
Timeline:
- 0ms: Title and subtitle fade in (opacity 0→1, 400ms)
- 400ms: Left panel (Azure Landing Zone) slides in from left (translateX(-100px)→0, opacity 0→1, 600ms)
- 600ms: Right panel (Citadel AI+) slides in from right (translateX(100px)→0, opacity 0→1, 600ms)
- 1000ms: Bridge lines draw left-to-right (stroke-dashoffset, 1200ms, ease: power2.inOut)
- 1400ms: Connection point 1 label pops in (scale 0.8→1, opacity 0→1, 300ms)
- 1500ms: Connection point 2 label pops in (scale 0.8→1, opacity 0→1, 300ms)
- 1600ms: Connection point 3 label pops in (scale 0.8→1, opacity 0→1, 300ms)
- 1700ms: Connection point 4 label pops in (scale 0.8→1, opacity 0→1, 300ms)
- 1800ms: Connection point 5 label pops in (scale 0.8→1, opacity 0→1, 300ms)
- 2000ms: Flowing arrows animate along bridge lines (continuous pulse, 2s loop)
  - Small arrow shapes that travel from left panel to right panel
  - Fade in at start, fade out at end
- 2200ms: Table rows fade in sequentially (opacity 0→1, 300ms each, 150ms stagger)
- 2800ms: Bottom text fades in (opacity 0→1, 400ms)
```

---

## Global Requirements

### Slide Navigation
- Arrow keys (Left/Right) to switch between slides
- Slide container uses `transform: translateX()` for transitions
- Transition duration: 500ms with `cubic-bezier(0.4, 0, 0.2, 1)` easing
- This is Section 1 — slides should be reachable from Section 0 (Opening)

### Accessibility
- `prefers-reduced-motion`: Disable all GSAP animations, show final states immediately
- `aria-label` on interactive elements
- Minimum contrast ratio: 4.5:1 for body text

### Print/PDF Support
- `@media print` styles: Remove animations, show all slides stacked vertically, hide navigation
- Background colors print correctly (`-webkit-print-color-adjust: exact`)

### File Structure

The output must be a single HTML file containing:
1. `<style>` tag with all CSS (including 3D transforms, animations, layout, responsive rules)
2. `<body>` with three `.slide` sections
3. `<script>` tag with GSAP initialization, timeline definitions, and keyboard navigation

No external CSS or JS files. All assets embedded or loaded via CDN.

---

## Verification Checklist

Before saving the file, verify:

- [ ] All three slides render at 1920x1080 with correct background color
- [ ] Slide 1.1: 3D isometric slabs with correct colors (Blue, Purple, Yellow) and opacity levels
- [ ] Slide 1.1: GSAP timeline plays sequentially with correct delays and easing
- [ ] Slide 1.1: Stat number animates with count-up effect
- [ ] Slide 1.1: Lucide icons render on each slab
- [ ] Slide 1.2: Nested container expands from center with bounce easing
- [ ] Slide 1.2: Inner components (Citadel Hub, Agent Spokes, Data Services) fade in with stagger
- [ ] Slide 1.2: SVG dashed lines draw themselves with stroke-dashoffset animation
- [ ] Slide 1.2: Data packet dots travel continuously along dashed lines
- [ ] Slide 1.3: Bridge lines draw left-to-right with stroke-dashoffset
- [ ] Slide 1.3: 5 connection point labels pop in with stagger
- [ ] Slide 1.3: Table rows fade in sequentially
- [ ] Slide 1.3: Panels slide in from opposite sides
- [ ] Keyboard navigation works (arrow keys switch slides)
- [ ] `prefers-reduced-motion` disables animations
- [ ] Print styles render all slides without animations
- [ ] No external dependencies except GSAP and Lucide CDNs

---

## Source Context

**Design specification:** `.planning/PRESENTATION.md` (Section 2: Design System, Section 1: Azure Landing Zone)

**Part of:** Phase 30 — Landing Zone Foundation, Plan 30-01
**Milestone:** v3.0 — AI+ HUB Factory Presentation
**Previous section:** Phase 29 — Opening & Title Sequence (slides 0.1-0.2)
**Next section:** Phase 31 — Citadel Governance Core (slides 2.1-2.4)
