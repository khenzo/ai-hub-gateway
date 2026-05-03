# Claude Prompt: Generate Agentic Layer Slides

## Objective

Generate a single-file HTML presentation containing slides 4.1 (The Three-Layer Agent Architecture), 4.2 (Intelligence Layers: What Agents Know), 4.3 (Agent Factory on Citadel), and 4.4 (The Agentic Web Stack) for the AI+ HUB Factory presentation deck.

## Output File

Save the generated HTML to:
```
./presentation/slides/section-4-agentic-layer.html
```

Create the directory if it doesn't exist.

---

## Design System

**Source:** `.planning/PRESENTATION.md` Section 4

### Color Palette

| Role | Hex | Usage |
|------|-----|-------|
| **Primary** | `#FFE600` | Headlines, accents, active states, CTAs |
| **Background** | `#1A1A24` | Slide backgrounds |
| **Surface** | `#2E2E38` | Cards, panels |
| **Text Primary** | `#FFFFFF` | Body text at 90-100% opacity |
| **Text Secondary** | `rgba(255,255,255,0.65)` | Descriptions, captions |
| **Text Muted** | `rgba(255,255,255,0.45)` | Labels, metadata |
| **Accent Teal** | `#27ACAA` | Agentic layer, reasoning, orchestration (PRIMARY accent for this section) |
| **Accent Orange** | `#FF6D00` | Context layer, hub-spoke connections |
| **Accent Blue** | `#188CE5` | Execution layer, infrastructure, workspace intelligence |
| **Accent Green** | `#2DB757` | Business data intelligence, success states |
| **Accent Purple** | `#750E5C` | Enterprise knowledge, governance, security |
| **Accent Red** | `#FF4136` | Warnings, risk |

### Typography

| Role | Font | Weight | Size | Usage |
|------|------|--------|------|-------|
| **Display** | Inter | 900 (Black) | 48-64px | Slide titles |
| **Heading** | Inter | 700 (Bold) | 28-36px | Section headers, card titles |
| **Subheading** | Inter | 600 | 20-24px | Card subtitles |
| **Body** | Inter | 400 (Regular) | 16-18px | Descriptions, bullet text |
| **Caption** | Inter | 300 (Light) | 12-14px | Annotations, source notes |
| **Mono** | JetBrains Mono | 400 | 13px | Code blocks |

### Layout Rules

- **Slide canvas**: 1920x1080px (16:9)
- **Safe margin**: 60px from edges
- **Accent bar**: 5px `#FFE600` top border on every slide
- **Grid**: 12-column grid, 24px gutters
- **Card radius**: 4-6px
- **Animations**: CSS transitions 400-600ms, easing `cubic-bezier(0.4, 0, 0.2, 1)`
- **Dark mode only**: All slides use `#1A1A24` background

---

## Technical Stack

- Single HTML file with embedded CSS and JavaScript
- **GSAP** (via CDN: `https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js`)
- **Lucide icons** (via CDN: `https://unpkg.com/lucide@latest`)
- Google Fonts: Inter (weights 300, 400, 600, 700, 900), JetBrains Mono (400)
- Dark mode only, no light mode toggle
- Keyboard navigation: Arrow keys to switch slides
- Print/PDF support via `@media print`
- `prefers-reduced-motion`: disable animations

---

## Slide 4.1 — The Three-Layer Agent Architecture

### Layout Requirements

1. Full-screen slide (1920x1080) with `#1A1A24` background
2. 5px `#FFE600` accent bar at top (animate width 0→100% over 800ms)
3. Title: "The Agentic Layer" (Inter Black, 48px, `#FFFFFF`)
4. Subtitle: "Reasoning · Context · Execution" (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
5. Three horizontal bands stacked vertically, filling the slide below subtitle:

   **Top band (Teal `#27ACAA`, 30% height of remaining space):**
   - Background: `#27ACAA` at 20% opacity with 1px border `#27ACAA`
   - Icon: Lucide `brain-circuit` (left side, 48px, `#27ACAA`)
   - Label: "Reasoning Layer" (Inter Bold, 28px, `#FFFFFF`)
   - Description: "LLM + Orchestration Engine" (Inter Regular, 16px, `rgba(255,255,255,0.8)`)
   - Sub-description: "Plans, reasons, selects tools" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)

   **Middle band (Orange `#FF6D00`, 40% height):**
   - Background: `#FF6D00` at 20% opacity with 1px border `#FF6D00`
   - Icon: Lucide `layers` (left side, 48px, `#FF6D00`)
   - Label: "Context Layer" (Inter Bold, 28px, `#FFFFFF`)
   - Description: "Memory, Skills, Intelligence" (Inter Regular, 16px, `rgba(255,255,255,0.8)`)
   - Sub-description: "RAG, progressive disclosure" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)

   **Bottom band (Blue `#188CE5`, 30% height):**
   - Background: `#188CE5` at 20% opacity with 1px border `#188CE5`
   - Icon: Lucide `wrench` (left side, 48px, `#188CE5`)
   - Label: "Execution Layer" (Inter Bold, 28px, `#FFFFFF`)
   - Description: "Tools, Middleware, Sandbox" (Inter Regular, 16px, `rgba(255,255,255,0.8)`)
   - Sub-description: "Tool-gated, HITL hooks" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)

6. Key principle banner (bottom of slide, 80px tall):
   - Background: `rgba(255, 230, 0, 0.1)` with 2px solid `#FFE600` border
   - Text: "The model never executes anything directly. Every action passes through a validated tool interface."
   - Inter Bold, 18px, `#FFE600`, centered, max-width: 1400px

7. Glow effects between layers:
   - Subtle horizontal glow bars between each band
   - Color: `#FFE600` at 10% opacity, height: 4px, blur: 20px
   - CSS animation: opacity pulse 0.3→0.6→0.3, 3s loop

### Animation Sequence (GSAP Timeline)

```
Timeline:
- 0ms: Accent bar draws (width 0→100%, 800ms)
- 200ms: Title fades in (opacity 0→1, translateY(20px)→0, 500ms)
- 400ms: Subtitle fades in (opacity 0→1, 400ms)
- 600ms: Top band slides in from left (translateX(-80px)→0, opacity 0→1, 500ms, ease: power3.out)
- 750ms: Middle band slides in from left (translateX(-80px)→0, opacity 0→1, 500ms, ease: power3.out)
- 900ms: Bottom band slides in from left (translateX(-80px)→0, opacity 0→1, 500ms, ease: power3.out)
- 1100ms: Brain icon pulses (scale 1→1.1→1, 2s loop, yoyo, ease: sine.inOut)
- 1200ms: Memory icon stacks up (translateY(20px)→0, opacity 0→1, 400ms)
- 1300ms: Tools icon rotates slightly (rotate -5deg→5deg, 3s loop, yoyo, ease: sine.inOut)
- 1400ms: Glow between layers fades in (opacity 0→0.3, 600ms)
- 1600ms: Glow pulse animation starts (CSS animation, 3s loop)
- 1800ms: Principle banner fades in from bottom (translateY(30px)→0, opacity 0→1, 400ms, ease: power2.out)
```

### Continuous Animations (CSS)

```css
/* Brain pulse */
@keyframes brain-pulse {
  0%, 100% { transform: scale(1); }
  50% { transform: scale(1.1); }
}

/* Tools rotation */
@keyframes tools-rotate {
  0%, 100% { transform: rotate(-5deg); }
  50% { transform: rotate(5deg); }
}

/* Glow pulse */
@keyframes glow-pulse {
  0%, 100% { opacity: 0.3; }
  50% { opacity: 0.6; }
}
```

---

## Slide 4.2 — Intelligence Layers: What Agents Know

### Layout Requirements

1. Title: "Three Intelligences" (Inter Black, 48px, `#FFFFFF`)
2. Subtitle: "Workspace · Business Data · Enterprise Knowledge" (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
3. Three vertical pillars, equal width (~300px each), centered horizontally with 60px gaps:

   **Pillar 1 — Workspace Intelligence (Blue `#188CE5`):**
   - Pillar body: `#188CE5` at 15% opacity, 1px border `#188CE5`, border-radius: 8px
   - Capital (top): SVG shape, 60px tall, `#188CE5` background
     - Lucide `users` icon centered, 32px, `#FFFFFF`
   - Content area (padding: 24px):
     - Title: "Workspace Intelligence" (Inter Bold, 22px, `#FFFFFF`)
     - Description: "How people work" (Inter Regular, 16px, `rgba(255,255,255,0.8)`)
     - Examples (Inter Regular, 14px, `rgba(255,255,255,0.65)`):
       - "Calendars, messaging, documents"
       - "Communication patterns"
   - Bottom accent: Small Lucide `message-square` icon, 20px

   **Pillar 2 — Business Data Intelligence (Green `#2DB757`):**
   - Pillar body: `#2DB757` at 15% opacity, 1px border `#2DB757`, border-radius: 8px
   - Capital (top): SVG shape, 60px tall, `#2DB757` background
     - Lucide `bar-chart-3` icon centered, 32px, `#FFFFFF`
   - Content area (padding: 24px):
     - Title: "Business Data Intelligence" (Inter Bold, 22px, `#FFFFFF`)
     - Description: "How the business operates" (Inter Regular, 16px, `rgba(255,255,255,0.8)`)
     - Examples (Inter Regular, 14px, `rgba(255,255,255,0.65)`):
       - "Metrics, KPIs, processes"
       - "Operational analytics"
   - Bottom accent: Small Lucide `database` icon, 20px

   **Pillar 3 — Enterprise Knowledge Intelligence (Purple `#750E5C`):**
   - Pillar body: `#750E5C` at 15% opacity, 1px border `#750E5C`, border-radius: 8px
   - Capital (top): SVG shape, 60px tall, `#750E5C` background
     - Lucide `book-open` icon centered, 32px, `#FFFFFF`
   - Content area (padding: 24px):
     - Title: "Enterprise Knowledge Intelligence" (Inter Bold, 22px, `#FFFFFF`)
     - Description: "All institutional knowledge" (Inter Regular, 16px, `rgba(255,255,255,0.8)`)
     - Examples (Inter Regular, 14px, `rgba(255,255,255,0.65)`):
       - "Docs, SOPs, MCP-connected systems"
       - "Knowledge graphs"
   - Bottom accent: Small Lucide `network` icon, 20px

4. Convergence area (below pillars, ~200px tall):
   - Three SVG lines converging from bottom of each pillar to center
   - Stroke: `rgba(255, 230, 0, 0.4)`, 2px
   - Arrowheads pointing toward center
   - Center node: "Agent Harness" badge
     - Background: `#FFE600`, border-radius: 24px, padding: 12px 32px
     - Text: "Agent Harness" (Inter Bold, 18px, `#1A1A24`)
     - Subtle glow: box-shadow: `0 0 30px rgba(255, 230, 0, 0.3)`

5. Bottom text (centered):
   - "Agents are only as useful as the context they can access"
   - Inter Regular, 16px, `rgba(255,255,255,0.65)`

### Animation Sequence (GSAP Timeline)

```
Timeline:
- 0ms: Title and subtitle fade in (opacity 0→1, 400ms)
- 400ms: Pillar 1 rises from bottom (translateY(100px)→0, opacity 0→1, 600ms, ease: power3.out)
- 550ms: Pillar 2 rises from bottom (translateY(100px)→0, opacity 0→1, 600ms, ease: power3.out)
- 700ms: Pillar 3 rises from bottom (translateY(100px)→0, opacity 0→1, 600ms, ease: power3.out)
- 1000ms: Pillar 1 capital slides on top (translateY(-20px)→0, opacity 0→1, 300ms)
- 1150ms: Pillar 2 capital slides on top (translateY(-20px)→0, opacity 0→1, 300ms)
- 1300ms: Pillar 3 capital slides on top (translateY(-20px)→0, opacity 0→1, 300ms)
- 1500ms: Convergence line 1 draws inward (SVG stroke-dashoffset, 500ms)
- 1600ms: Convergence line 2 draws inward (SVG stroke-dashoffset, 500ms)
- 1700ms: Convergence line 3 draws inward (SVG stroke-dashoffset, 500ms)
- 2000ms: Agent Harness badge scales in (scale 0.8→1, opacity 0→1, 400ms, ease: back.out(1.7))
- 2100ms: Agent Harness starts gentle pulse (scale 1→1.05→1, 2s loop, yoyo)
- 2200ms: Bottom text fades in (opacity 0→1, 400ms)
```

### SVG Pillar Capital

```svg
<svg viewBox="0 0 300 60" class="pillar-capital">
  <path d="M20 60 L0 0 L300 0 L280 60 Z" fill="currentColor"/>
</svg>
```

---

## Slide 4.3 — Agent Factory on Citadel

### Layout Requirements

1. Title: "Agent Factory on Citadel" (Inter Black, 48px, `#FFFFFF`)
2. Subtitle: "Build agents with any tool. Govern them with one platform." (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
3. Two-column layout:

   **Left side — Citadel Stack (~400px wide):**
   - 4-layer vertical stack, each layer ~80px tall, full width of column
   - Layer 1 (top): "APIM" — Blue `#188CE5` background
     - Lucide `shield` icon, 24px
     - Label: "APIM Gateway" (Inter Bold, 18px)
   - Layer 2: "Control Plane" — Orange `#FF6D00` background
     - Lucide `eye` icon, 24px
     - Label: "AI Control Plane" (Inter Bold, 18px)
   - Layer 3: "Identity" — Teal `#27ACAA` background
     - Lucide `fingerprint` icon, 24px
     - Label: "Agent Identity" (Inter Bold, 18px)
   - Layer 4: "Security" — Purple `#750E5C` background
     - Lucide `shield-check` icon, 24px
     - Label: "Security Fabric" (Inter Bold, 18px)
   - Layer style: border-radius: 4px, margin-bottom: 8px, padding: 16px 20px
   - Icon + text layout: flex row, align center, gap 12px

   **Right side — Builder Tools (~700px wide):**
   - Three categories, stacked vertically:

     **Category 1 — Low-Code (Teal `#27ACAA`):**
     - Header: "Low-Code" (Inter Bold, 16px, `#27ACAA`)
     - Tool icons in horizontal row (flex, gap 24px):
       - "Copilot Studio" — Lucide `bot` icon, 32px, label below (12px)
       - "Power Platform" — Lucide `blocks` icon, 32px, label below (12px)

     **Category 2 — Framework-Based (Orange `#FF6D00`):**
     - Header: "Framework-Based" (Inter Bold, 16px, `#FF6D00`)
     - Tool icons in horizontal row:
       - "LangChain" — Lucide `link` icon, 32px
       - "LangGraph" — Lucide `git-branch` icon, 32px
       - "Claude SDK" — Lucide `brain` icon, 32px
       - "OpenAI SDK" — Lucide `cpu` icon, 32px
       - "MS Agent Framework" — Lucide `box` icon, 32px

     **Category 3 — SDK-Based (Blue `#188CE5`):**
     - Header: "SDK-Based" (Inter Bold, 16px, `#188CE5`)
     - Tool icons in horizontal row:
       - "Custom Code" — Lucide `code-2` icon, 32px
       - "API Integrations" — Lucide `plug` icon, 32px

   - Tool style: Each tool is a card (80px × 80px)
     - Background: `rgba(255,255,255,0.05)`
     - Border: 1px solid `rgba(255,255,255,0.1)`
     - Border-radius: 8px
     - Centered icon + label below
     - Hover: border-color transitions to category color

4. Connection lines:
   - SVG lines from each builder tool card to Layer 1 (APIM)
   - Stroke: `rgba(255, 230, 0, 0.3)`, 2px
   - Draw animation: stroke-dashoffset

5. Stat callout (bottom center):
   - "Framework-agnostic governance"
   - Inter Bold, 20px, `#FFE600`
   - Typewriter effect (600ms)

### Animation Sequence (GSAP Timeline)

```
Timeline:
- 0ms: Title and subtitle fade in (opacity 0→1, 400ms)
- 400ms: Citadel Layer 1 draws (opacity 0→1, translateY(-10px)→0, 400ms)
- 500ms: Citadel Layer 2 draws (opacity 0→1, translateY(-10px)→0, 400ms)
- 600ms: Citadel Layer 3 draws (opacity 0→1, translateY(-10px)→0, 400ms)
- 700ms: Citadel Layer 4 draws (opacity 0→1, translateY(-10px)→0, 400ms)
- 800ms: Low-Code tools pop in (scale 0.5→1, opacity 0→1, 300ms, stagger 100ms)
- 1000ms: Framework tools pop in (scale 0.5→1, opacity 0→1, 300ms, stagger 100ms)
- 1200ms: SDK tools pop in (scale 0.5→1, opacity 0→1, 300ms, stagger 100ms)
- 1400ms: Connection line 1 draws to APIM (stroke-dashoffset, 300ms)
- 1450ms: Connection line 2 draws to APIM (stroke-dashoffset, 300ms)
- 1500ms: Connection line 3 draws to APIM (stroke-dashoffset, 300ms)
- 1550ms: Connection line 4 draws to APIM (stroke-dashoffset, 300ms)
- 1600ms: Connection line 5 draws to APIM (stroke-dashoffset, 300ms)
- 1650ms: Connection line 6 draws to APIM (stroke-dashoffset, 300ms)
- 1700ms: Connection line 7 draws to APIM (stroke-dashoffset, 300ms)
- 1750ms: Connection line 8 draws to APIM (stroke-dashoffset, 300ms)
- 1800ms: Connection line 9 draws to APIM (stroke-dashoffset, 300ms)
- 2000ms: APIM layer glows yellow (box-shadow: 0 0 30px rgba(255, 230, 0, 0.5), 600ms)
- 2200ms: Stat text types out (typewriter effect, "Framework-agnostic governance", 600ms)
```

---

## Slide 4.4 — The Agentic Web Stack

### Layout Requirements

1. Title: "8 Essential Capabilities" (Inter Black, 48px, `#FFFFFF`)
2. Subtitle: "The agentic web stack mapped to Citadel layers" (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
3. Honeycomb pattern of 8 hexagons:

   **Hexagon structure:**
   - Size: ~140px wide × ~160px tall
   - CSS clip-path for hexagon shape:
     ```css
     clip-path: polygon(50% 0%, 100% 25%, 100% 75%, 50% 100%, 0% 75%, 0% 25%);
     ```
   - Background: `rgba(255,255,255,0.05)`
   - Border: 2px solid currentColor (color varies by layer mapping)
   - Content centered: icon (32px) + label (14px Bold) + layer annotation (12px Regular)

   **Layout pattern (centered on slide):**
   ```
        [1] [2]
      [3] [0] [4]
        [5] [6]
          [7]
   ```
   Where [0] is the center hexagon.

   **Hexagon 0 — Center: "AI Agent"**
   - Color: Yellow `#FFE600`
   - Icon: Lucide `bot`
   - Label: "AI Agent"
   - Layer: "Core"

   **Hexagon 1 — Communication**
   - Color: Blue `#188CE5`
   - Icon: Lucide `message-square`
   - Label: "Communication"
   - Layer: "Layer 1"

   **Hexagon 2 — Discovery**
   - Color: Orange `#FF6D00`
   - Icon: Lucide `search`
   - Label: "Discovery"
   - Layer: "Layer 2/3"

   **Hexagon 3 — Identity**
   - Color: Teal `#27ACAA`
   - Icon: Lucide `fingerprint`
   - Label: "Identity"
   - Layer: "Layer 3"

   **Hexagon 4 — Tools**
   - Color: Blue `#188CE5`
   - Icon: Lucide `wrench`
   - Label: "Tools"
   - Layer: "Layer 1"

   **Hexagon 5 — Orchestration**
   - Color: Orange `#FF6D00`
   - Icon: Lucide `git-merge`
   - Label: "Orchestration"
   - Layer: "Layer 2"

   **Hexagon 6 — Observability**
   - Color: Orange `#FF6D00`
   - Icon: Lucide `eye`
   - Label: "Observability"
   - Layer: "Layer 2"

   **Hexagon 7 — Memory**
   - Color: Orange `#FF6D00`
   - Icon: Lucide `database`
   - Label: "Memory"
   - Layer: "Layer 2"

   **Hexagon 8 — Governance**
   - Color: Purple `#750E5C`
   - Icon: Lucide `shield`
   - Label: "Governance"
   - Layer: "All Layers"

4. Connection lines between adjacent hexagons:
   - SVG lines, 1px stroke, `rgba(255,255,255,0.15)`
   - Draw animation: stroke-dashoffset

5. Bottom text (centered):
   - "Every capability governed, every interaction traceable"
   - Inter Regular, 16px, `rgba(255,255,255,0.65)`

### Animation Sequence (GSAP Timeline)

```
Timeline:
- 0ms: Title and subtitle fade in (opacity 0→1, 400ms)
- 400ms: Center hexagon fades in (opacity 0→1, scale 0.9→1, 400ms)
- 500ms: Center hexagon starts pulse (scale 1→1.08→1, 2s loop, yoyo)
- 600ms: Hexagon 1 fades in (opacity 0→1, 400ms, ripple from center)
- 680ms: Hexagon 2 fades in (opacity 0→1, 400ms)
- 760ms: Hexagon 3 fades in (opacity 0→1, 400ms)
- 840ms: Hexagon 4 fades in (opacity 0→1, 400ms)
- 920ms: Hexagon 5 fades in (opacity 0→1, 400ms)
- 1000ms: Hexagon 6 fades in (opacity 0→1, 400ms)
- 1080ms: Hexagon 7 fades in (opacity 0→1, 400ms)
- 1160ms: Hexagon 8 fades in (opacity 0→1, 400ms)
- 1400ms: Connection lines draw between adjacent hexagons (stroke-dashoffset, 300ms, stagger 50ms)
- 1800ms: Capability labels fade in (opacity 0→1, 300ms, stagger 80ms)
- 2200ms: Layer annotations slide in from sides (translateX(±20px)→0, opacity 0→1, 200ms, stagger 80ms)
- 2600ms: Bottom text fades in (opacity 0→1, 400ms)
```

### Hexagon CSS

```css
.hexagon {
  width: 140px;
  height: 160px;
  clip-path: polygon(50% 0%, 100% 25%, 100% 75%, 50% 100%, 0% 75%, 0% 25%);
  background: rgba(255, 255, 255, 0.05);
  border: 2px solid currentColor;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 8px;
  position: relative;
}

.hexagon.center {
  color: #FFE600;
  background: rgba(255, 230, 0, 0.1);
  box-shadow: 0 0 40px rgba(255, 230, 0, 0.2);
}
```

### Honeycomb Grid Layout

```css
.honeycomb {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
}

.honeycomb-row {
  display: flex;
  gap: 16px;
}

.honeycomb-row:nth-child(2) {
  margin-top: -40px;
}

.honeycomb-row:nth-child(3) {
  margin-top: -40px;
}
```

---

## Global Requirements

### Slide Navigation

- Arrow keys (Left/Right) to switch between slides
- Slide container uses `transform: translateX()` for transitions
- Transition duration: 500ms with `cubic-bezier(0.4, 0, 0.2, 1)` easing
- This is Section 4 — slides should be reachable from Section 3 (Data Foundation) and Section 5 (Hub-Spoke Topology)

### CSS Animation Patterns

```css
/* Bounce easing for element arrivals */
.bounce-in {
  animation-timing-function: cubic-bezier(0.34, 1.56, 0.64, 1);
}

/* Band slide-in */
@keyframes band-slide {
  from { transform: translateX(-80px); opacity: 0; }
  to { transform: translateX(0); opacity: 1; }
}

/* Pillar rise */
@keyframes pillar-rise {
  from { transform: translateY(100px); opacity: 0; }
  to { transform: translateY(0); opacity: 1; }
}

/* Hexagon ripple */
@keyframes hex-fade {
  from { opacity: 0; transform: scale(0.9); }
  to { opacity: 1; transform: scale(1); }
}

/* Continuous pulse for center hexagon */
@keyframes center-pulse {
  0%, 100% { transform: scale(1); }
  50% { transform: scale(1.08); }
}

/* Glow effect for APIM */
@keyframes apim-glow {
  0%, 100% { box-shadow: 0 0 20px rgba(255, 230, 0, 0.3); }
  50% { box-shadow: 0 0 40px rgba(255, 230, 0, 0.5); }
}

/* Typewriter cursor */
@keyframes cursor-blink {
  0%, 100% { opacity: 1; }
  50% { opacity: 0; }
}
```

### SVG Stroke Animation Helper

```css
.draw-path {
  stroke-dasharray: 1000;
  stroke-dashoffset: 1000;
}

.draw-path.animated {
  animation: draw-line 600ms ease-out forwards;
}

@keyframes draw-line {
  to { stroke-dashoffset: 0; }
}
```

### Accessibility

- Respect `prefers-reduced-motion`: disable all animations
- All icons have aria-labels
- Color contrast ratios meet WCAG AA
- Focus indicators visible for keyboard navigation

### Performance

- Use `transform` and `opacity` for animations (GPU-accelerated)
- Lazy-load Lucide icons per slide
- Use `will-change` sparingly on animated elements
- For continuous loop animations, use CSS animations rather than GSAP to reduce JS overhead

---

## Notes

- Teal (#27ACAA) is the PRIMARY accent color for the Agentic Layer section. Use it consistently for the reasoning layer, agent-related elements, and as the dominant color in slides 4.1 and 4.3.
- The three horizontal bands on slide 4.1 should feel like a unified architecture diagram — the staggered slide-in creates a sense of building layers.
- The pillar capitals on slide 4.2 add an architectural/marble-column feel. Ensure they align perfectly on top of each pillar.
- Slide 4.3 should communicate "any tool, one governance layer" — the connection lines converging on APIM are the key visual metaphor.
- The honeycomb on slide 4.4 is the most complex layout. Ensure hexagons don't overlap and labels remain readable. Consider reducing hexagon size to 120px if spacing is tight.
- The center hexagon on 4.4 should feel alive — the continuous pulse draws the eye and reinforces the "agent" as the core of the architecture.
- All slides in this section should feel energetic and dynamic — this is where the presentation transitions from "foundation" to "intelligence".
