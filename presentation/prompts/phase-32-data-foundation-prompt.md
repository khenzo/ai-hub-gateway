# Claude Prompt: Generate Data Foundation Slides

## Objective

Generate a single-file HTML presentation containing slides 3.1 (The Enterprise Data Foundation), 3.2 (The Governed Query Path), 3.3 (Semantic Layer: Author Once, Reuse Everywhere), and 3.4 (Core vs Edge Governance Model) for the AI+ HUB Factory presentation deck.

## Output File

Save the generated HTML to:
```
./presentation/slides/section-3-data-foundation.html
```

Create the directory if it doesn't exist.

---

## Design System

**Source:** `.planning/PRESENTATION.md` Section 3

### Color Palette

| Role | Hex | Usage |
|------|-----|-------|
| **Primary** | `#FFE600` | Headlines, accents, active states, metric cards |
| **Background** | `#1A1A24` | Slide backgrounds |
| **Surface** | `#2E2E38` | Cards, panels |
| **Text Primary** | `#FFFFFF` | Body text at 90-100% opacity |
| **Text Secondary** | `rgba(255,255,255,0.65)` | Descriptions, captions |
| **Text Muted** | `rgba(255,255,255,0.45)` | Labels, metadata |
| **Accent Green** | `#2DB757` | Data layer, success states, Databricks |
| **Accent Blue** | `#188CE5` | Infrastructure, OneLake, identity |
| **Accent Purple** | `#750E5C` | Governance, Unity Catalog, Core column |
| **Accent Teal** | `#27ACAA` | Agentic layer, AI Agent |
| **Accent Red** | `#FF4136` | Problem statements, warnings |
| **Accent Orange** | `#FF6D00` | Jupyter notebooks |

### Typography

| Role | Font | Weight | Size | Usage |
|------|------|--------|------|-------|
| **Display** | Inter | 900 (Black) | 48-64px | Slide titles |
| **Heading** | Inter | 700 (Bold) | 28-36px | Section headers, card titles |
| **Subheading** | Inter | 600 | 20-24px | Card subtitles |
| **Body** | Inter | 400 (Regular) | 16-18px | Descriptions, bullet text |
| **Caption** | Inter | 300 (Light) | 12-14px | Annotations, source notes |
| **Mono** | JetBrains Mono | 400 | 13px | Code blocks, metric definitions |

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

## Slide 3.1 — The Enterprise Data Foundation

### Layout Requirements

1. Full-screen slide (1920x1080) with `#1A1A24` background
2. 5px `#FFE600` accent bar at top (animate width 0→100% over 800ms)
3. Title: "The Source of Thought: Enterprise Data" (Inter Black, 48px, `#FFFFFF`)
4. Subtitle: "Governed data access for every agent, at every layer" (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
5. Problem statement (positioned center-top, below subtitle):
   - "Most enterprise AI deployments fail at the data layer" (Inter Regular, 18px, `#FF4136`)
   - This text appears first, holds for 1 second, then fades to 30% opacity
6. Three shield icons in a horizontal row (centered, ~600px total width, evenly spaced):
   - **Shield 1** (Blue `#188CE5`): Identity chain icon — "Governed Identity at Every Hop"
   - **Shield 2** (Green `#2DB757`): Lock/gear icon — "Governance-by-Construction"
   - **Shield 3** (Purple `#750E5C`): Eye icon — "Full Observability"
7. Shield SVG requirements:
   ```svg
   <svg viewBox="0 0 120 140" class="shield">
     <path d="M60 10 L110 30 L110 75 Q110 110 60 130 Q10 110 10 75 L10 30 Z" 
           fill="none" 
           stroke="currentColor" 
           stroke-width="3"
           class="shield-path"/>
   </svg>
   ```
8. Checkmark inside each shield:
   ```svg
   <svg viewBox="0 0 120 140">
     <!-- Shield path above -->
     <path d="M35 70 L50 85 L85 50" 
           fill="none" 
           stroke="#FFFFFF" 
           stroke-width="4"
           stroke-linecap="round"
           stroke-linejoin="round"
           class="checkmark-path"/>
   </svg>
   ```
9. Shield label below each icon (Inter Bold, 16px, `#FFFFFF`)
10. Shield description below label (Inter Regular, 14px, `rgba(255,255,255,0.65)`)
11. Background: Subtle grid pattern using CSS gradient
    ```css
    background-image: 
      linear-gradient(rgba(255,255,255,0.03) 1px, transparent 1px),
      linear-gradient(90deg, rgba(255,255,255,0.03) 1px, transparent 1px);
    background-size: 40px 40px;
    ```

### Animation Sequence (GSAP Timeline)

```
Timeline:
- 0ms: Accent bar draws (width 0→100%, 800ms)
- 200ms: Title fades in (opacity 0→1, translateY(20px)→0, 500ms)
- 400ms: Subtitle fades in (opacity 0→1, 400ms)
- 800ms: Problem text fades in (opacity 0→1, 400ms)
- 2000ms: Problem text fades to 30% opacity (opacity 1→0.3, 600ms)
- 2200ms: Shield 1 rises from bottom (translateY(60px)→0, opacity 0→1, 500ms)
- 2400ms: Shield 2 rises from bottom (translateY(60px)→0, opacity 0→1, 500ms)
- 2600ms: Shield 3 rises from bottom (translateY(60px)→0, opacity 0→1, 500ms)
- 2900ms: Checkmark 1 draws via SVG stroke-dashoffset (stroke-dasharray: 100, stroke-dashoffset: 100→0, 600ms)
- 3200ms: Checkmark 2 draws via SVG stroke-dashoffset (600ms)
- 3500ms: Checkmark 3 draws via SVG stroke-dashoffset (600ms)
- 3900ms: Shield 1 label fades in (opacity 0→1, 400ms)
- 4000ms: Shield 1 description fades in (opacity 0→1, 300ms)
- 4100ms: Shield 2 label fades in (opacity 0→1, 400ms)
- 4200ms: Shield 2 description fades in (opacity 0→1, 300ms)
- 4300ms: Shield 3 label fades in (opacity 0→1, 400ms)
- 4400ms: Shield 3 description fades in (opacity 0→1, 300ms)
```

---

## Slide 3.2 — The Governed Query Path

### Layout Requirements

1. Title: "The Governed Query Path" (Inter Black, 48px, `#FFFFFF`)
2. Subtitle: "From agent question to certified answer" (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
3. Vertical flow diagram (centered, top-to-bottom, ~700px tall total):
   - Each step is a rounded rectangle (~280px wide × 80px tall, radius 8px)
   - Steps stacked vertically with ~40px gaps
   - Each step has an icon (left) and label + description (right)
   
   Step 1 (top): **Agent** (Teal `#27ACAA`)
   - Lucide `bot` icon
   - Label: "Agent"
   - Description: "What is ARR by region for Q1?"
   
   Step 2: **APIM Gateway** (Yellow `#FFE600`)
   - Lucide `shield` icon
   - Label: "APIM Gateway"
   - Description: "Validates identity, enforces rate limit"
   
   Step 3: **Databricks SQL** (Green `#2DB757`)
   - Lucide `database` icon
   - Label: "Databricks SQL"
   - Description: "Resolves metric via MetricFlow"
   
   Step 4: **Unity Catalog** (Purple `#750E5C`)
   - Lucide `lock` icon
   - Label: "Unity Catalog"
   - Description: "Applies row filter + column mask"
   
   Step 5: **OneLake** (Blue `#188CE5`)
   - Lucide `hard-drive` icon
   - Label: "OneLake"
   - Description: "Returns governed data"
   
   Step 6 (bottom): **Response** (Teal `#27ACAA`)
   - Lucide `check-circle` icon
   - Label: "Response"
   - Description: "Certified result, masked PII, filtered by identity"

4. Connecting arrows between each step:
   - SVG arrows, 3px stroke, `rgba(255,255,255,0.3)`
   - Arrowhead at bottom of each connection
   - Total 5 arrows between 6 steps

5. Data packet (glowing dot):
   - 12px circle with glow effect
   - Color: `#FFE600` with box-shadow: `0 0 20px #FFE600, 0 0 40px #FFE600`
   - Travels along the arrow paths from top to bottom

6. Side annotation (right side, vertically centered):
   - "No secrets in the data path. No PATs. Every hop is Entra identity."
   - Inter Regular, 14px, `rgba(255,255,255,0.45)`
   - Max-width: 200px, text wraps

7. Step style:
   ```css
   .flow-step {
     background: rgba(255,255,255,0.05);
     border: 2px solid currentColor;
     border-radius: 8px;
     padding: 16px 24px;
     display: flex;
     align-items: center;
     gap: 16px;
   }
   .flow-step.active {
     background: rgba(255,255,255,0.1);
     box-shadow: 0 0 30px currentColor;
   }
   ```

### Animation Sequence (GSAP + CSS Continuous Loop)

```
Timeline (initial entrance):
- 0ms: Title and subtitle fade in (opacity 0→1, 400ms)
- 400ms: All flow steps fade in together (opacity 0→1, translateY(20px)→0, 500ms, stagger 100ms)
- 800ms: Arrow lines draw themselves (stroke-dashoffset, 600ms, stagger 100ms)
- 1200ms: Side annotation fades in (opacity 0→1, 400ms)

Continuous Loop (starts after entrance completes):
- Step 1 glows bright (box-shadow pulse, 400ms)
- Data packet appears at top, travels down arrow 1 (500ms)
- Step 2 glows bright as packet arrives
- Data packet travels down arrow 2 (500ms)
- Step 3 glows bright as packet arrives
- Data packet travels down arrow 3 (500ms)
- Step 4 glows bright as packet arrives
- Data packet travels down arrow 4 (500ms)
- Step 5 glows bright as packet arrives
- Data packet travels down arrow 5 (500ms)
- Step 6 glows bright as packet arrives
- Pause 500ms, then loop restarts
- Total loop duration: ~3 seconds
- Side annotation fades in after first full cycle completes
```

---

## Slide 3.3 — Semantic Layer: Author Once, Reuse Everywhere

### Layout Requirements

1. Title: "Semantic Layer: One Definition, Every Consumer" (Inter Black, 48px, `#FFFFFF`)
2. Subtitle: "Platform-native semantics via MetricFlow + Unity Catalog" (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
3. Problem text (centered, below subtitle):
   - "Two agents asking the same question may produce different SQL"
   - Inter Regular, 18px, `#FF4136`
   - Fades in, holds 2 seconds, then fades out

4. Central "Metric Definition" card:
   - Position: Center of slide
   - Size: ~400px wide × ~280px tall
   - Border: 2px solid `#FFE600`
   - Background: `#2E2E38`
   - Border-radius: 8px
   - Padding: 24px
   - Content (JetBrains Mono, 13px, `#FFFFFF`):
     ```
     Metric: ARR Run-Rate
     Formula: SUM(mrr) * 12 / active_count
     Dimensions: Region, Segment, Fiscal Period
     Row Filter: region = current_user_region()
     Synonyms: "ARR", "annual recurring revenue"
     ```

5. Three consumer icons radiating from the metric card (hub-and-spoke layout):
   - **Power BI** (Blue `#188CE5`): Positioned top-right, ~200px from center
     - Lucide `bar-chart-3` icon at 48px
     - Label: "Power BI" (Inter Bold, 14px)
     - Result: "ARR Run-Rate" (typewriter effect)
   
   - **Jupyter** (Orange `#FF6D00`): Positioned bottom-right, ~200px from center
     - Lucide `book-open` icon at 48px
     - Label: "Jupyter" (Inter Bold, 14px)
     - Result: "ARR Run-Rate" (typewriter effect)
   
   - **AI Agent** (Teal `#27ACAA`): Positioned left, ~200px from center
     - Lucide `bot` icon at 48px
     - Label: "AI Agent" (Inter Bold, 14px)
     - Result: "ARR Run-Rate" (typewriter effect)

6. Connection lines:
   - SVG lines from metric card to each consumer icon
   - Stroke: `rgba(255,255,255,0.2)`, 2px
   - Draw outward from center

7. Bottom text (centered, below all elements):
   - "Identical output · Identical governance · Single lineage source"
   - Inter Regular, 16px, `rgba(255,255,255,0.65)`

### Animation Sequence (GSAP Timeline)

```
Timeline:
- 0ms: Title and subtitle fade in (opacity 0→1, 400ms)
- 400ms: Problem text fades in (opacity 0→1, 400ms)
- 2400ms: Problem text fades out (opacity 1→0, 600ms)
- 2600ms: Metric card scales up from center (scale 0.8→1, opacity 0→1, 600ms, ease: cubic-bezier(0.34, 1.56, 0.64, 1))
- 3000ms: Metric card gets gentle pulse (continuous: scale 1→1.02→1, 3s loop, GSAP yoyo)
- 3200ms: Connection line 1 draws outward (stroke-dashoffset, 400ms)
- 3400ms: Connection line 2 draws outward (stroke-dashoffset, 400ms)
- 3600ms: Connection line 3 draws outward (stroke-dashoffset, 400ms)
- 3800ms: Consumer icon 1 (Power BI) fades in (scale 0.8→1, opacity 0→1, 300ms)
- 4000ms: Consumer icon 2 (Jupyter) fades in (scale 0.8→1, opacity 0→1, 300ms)
- 4200ms: Consumer icon 3 (AI Agent) fades in (scale 0.8→1, opacity 0→1, 300ms)
- 4400ms: Result 1 types out (typewriter effect, "ARR Run-Rate", 800ms)
- 4800ms: Result 2 types out (typewriter effect, "ARR Run-Rate", 800ms)
- 5200ms: Result 3 types out (typewriter effect, "ARR Run-Rate", 800ms)
- 5800ms: Bottom text fades in (opacity 0→1, 400ms)
```

### Typewriter Effect Implementation

```javascript
function typewriterEffect(element, text, duration = 800) {
  const chars = text.split('');
  const delay = duration / chars.length;
  element.textContent = '';
  
  chars.forEach((char, i) => {
    setTimeout(() => {
      element.textContent += char;
    }, i * delay);
  });
}
```

---

## Slide 3.4 — Core vs Edge Governance Model

### Layout Requirements

1. Title: "Core vs Edge: Balanced Governance" (Inter Black, 48px, `#FFFFFF`)
2. Subtitle: "Enterprise stability + team innovation" (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
3. Two vertical columns (side-by-side, centered, ~400px wide each, gap 80px):

   **Left column (Purple `#750E5C`):**
   - Header bar: Full-width, 60px tall, `#750E5C` background
     - Icon: Lucide `shield-check` (left, 24px)
     - Text: "Core (Certified)" (Inter Bold, 24px, `#FFFFFF`)
   - Content area: `#2E2E38` background, padding 24px
     - List items (Inter Regular, 16px, `#FFFFFF`):
       - "Enterprise-wide metrics"
       - "Formal change review"
       - "Impact analysis required"
       - "Slow-moving, authoritative"
     - Each item has a small bullet (8px circle, `#750E5C`) before text

   **Right column (Teal `#27ACAA`):**
   - Header bar: Full-width, 60px tall, `#27ACAA` background
     - Icon: Lucide `zap` (left, 24px)
     - Text: "Edge (Team-Specific)" (Inter Bold, 24px, `#FFFFFF`)
   - Content area: `#2E2E38` background, padding 24px
     - List items (Inter Regular, 16px, `#FFFFFF`):
       - "Local extensions & synonyms"
       - "Team-managed"
       - "Fast-moving, experimental"
       - "Promotion path to Core"
     - Each item has a small bullet (8px circle, `#27ACAA`) before text

4. Center: Bidirectional arrow showing "Promotion Path"
   - SVG arrow: Horizontal, ~60px wide, 3px stroke, `#FFE600`
   - Arrowheads on both ends
   - Label below: "Promotion Path" (Inter Regular, 12px, `rgba(255,255,255,0.45)`)
   - Positioned between the two columns, vertically aligned with list items

5. Bottom text (centered):
   - "Core cannot be overridden by Edge. Platform-enforced boundary."
   - Inter Regular, 16px, `rgba(255,255,255,0.65)`
   - Max-width: 600px

### Animation Sequence (GSAP Timeline)

```
Timeline:
- 0ms: Title and subtitle fade in (opacity 0→1, 400ms)
- 400ms: Left column slides in from left (translateX(-50px)→0, opacity 0→1, 500ms)
- 500ms: Right column slides in from right (translateX(50px)→0, opacity 0→1, 500ms)
- 900ms: Center arrow draws itself (SVG stroke-dashoffset, 400ms)
- 1000ms: "Promotion Path" label fades in (opacity 0→1, 300ms)
- 1100ms: Left column item 1 appears (opacity 0→1, translateX(-10px)→0, 300ms)
- 1200ms: Right column item 1 appears (opacity 0→1, translateX(10px)→0, 300ms)
- 1300ms: Left column item 2 appears (opacity 0→1, translateX(-10px)→0, 300ms)
- 1400ms: Right column item 2 appears (opacity 0→1, translateX(10px)→0, 300ms)
- 1500ms: Left column item 3 appears (opacity 0→1, translateX(-10px)→0, 300ms)
- 1600ms: Right column item 3 appears (opacity 0→1, translateX(10px)→0, 300ms)
- 1700ms: Left column item 4 appears (opacity 0→1, translateX(-10px)→0, 300ms)
- 1800ms: Right column item 4 appears (opacity 0→1, translateX(10px)→0, 300ms)
- 2000ms: Bottom text fades in (opacity 0→1, 400ms)
```

---

## Global Requirements

### Slide Navigation

- Arrow keys (Left/Right) to switch between slides
- Slide container uses `transform: translateX()` for transitions
- Transition duration: 500ms with `cubic-bezier(0.4, 0, 0.2, 1)` easing
- This is Section 3 — slides should be reachable from Section 2 (Citadel Governance) and Section 4 (Agentic Layer)

### CSS Animation Patterns

```css
/* Bounce easing for element arrivals */
.bounce-in {
  animation-timing-function: cubic-bezier(0.34, 1.56, 0.64, 1);
}

/* Shield rise animation */
@keyframes shield-rise {
  from { transform: translateY(60px); opacity: 0; }
  to { transform: translateY(0); opacity: 1; }
}

/* Checkmark draw */
@keyframes checkmark-draw {
  from { stroke-dashoffset: 100; }
  to { stroke-dashoffset: 0; }
}

/* Continuous pulse for active steps */
@keyframes step-glow {
  0%, 100% { box-shadow: 0 0 10px currentColor; }
  50% { box-shadow: 0 0 30px currentColor, 0 0 50px currentColor; }
}

/* Data packet glow */
@keyframes packet-glow {
  0%, 100% { opacity: 1; transform: scale(1); }
  50% { opacity: 0.8; transform: scale(1.2); }
}

/* Typewriter cursor blink */
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
- For continuous loop animations (query path), use CSS animations rather than GSAP to reduce JS overhead

---

## Notes

- Data is the source of thought. The query path animation (Slide 3.2) is the most critical — it demonstrates governance by construction.
- Ensure the vertical flow on slide 3.2 is clear and the data packet movement is smooth and continuous.
- The shield icons on slide 3.1 should feel authoritative and protective — the checkmark drawing animation reinforces the "guarantee" concept.
- The semantic layer slide (3.3) should emphasize the "author once, reuse everywhere" principle — the hub-and-spoke layout visually reinforces this.
- Green (#2DB757) is the primary accent for this section, representing the data layer. Use it consistently for Databricks, data-related elements, and success states.
- The Core vs Edge slide (3.4) should visually communicate the balance between enterprise stability and team innovation — the contrasting colors (Purple for Core, Teal for Edge) help differentiate the two models while the center arrow shows the connection.
