# Claude Prompt: Generate Hub-Spoke Topology Slides

## Objective

Generate a single-file HTML presentation containing slides 5.1 (One Hub, Many Spokes), 5.2 (Spoke Autonomy, Hub Control), and 5.3 (The Complete Architecture) for the AI+ HUB Factory presentation deck.

This is the **culmination section** of the presentation — the complete architecture diagram that ties together all previous sections (Landing Zone, Citadel, Data, Agents) into a single scalable topology.

## Output File

Save the generated HTML to:
```
./presentation/slides/section-5-hub-spoke-topology.html
```

Create the directory if it doesn't exist.

---

## Design System

**Source:** `.planning/PRESENTATION.md` Section 5

### Color Palette

| Role | Hex | Usage |
|------|-----|-------|
| **Primary** | `#FFE600` | Headlines, accents, active states, hub elements, CTAs |
| **Background** | `#1A1A24` | Slide backgrounds |
| **Surface** | `#2E2E38` | Cards, panels, secondary containers |
| **Text Primary** | `#FFFFFF` | Body text at 90-100% opacity |
| **Text Secondary** | `rgba(255,255,255,0.65)` | Descriptions, captions |
| **Text Muted** | `rgba(255,255,255,0.45)` | Labels, metadata |
| **Accent Orange** | `#FF6D00` | Hub-spoke connections, energy flows (PRIMARY accent for this section) |
| **Accent Blue** | `#188CE5` | Infrastructure, Azure services, IT spoke, Landing Zone |
| **Accent Purple** | `#750E5C` | Governance, security, Legal spoke, Citadel layers |
| **Accent Teal** | `#27ACAA` | Agentic layer, Finance spoke, orchestration |
| **Accent Green** | `#2DB757` | Data layer, HR spoke, success states |
| **Accent Red** | `#FF4136` | Warnings, risk, blocked paths |

### Typography

| Role | Font | Weight | Size | Usage |
|------|------|--------|------|-------|
| **Display** | Inter | 900 (Black) | 48-64px | Slide titles |
| **Heading** | Inter | 700 (Bold) | 28-36px | Section headers, card titles, spoke labels |
| **Subheading** | Inter | 600 | 20-24px | Card subtitles, layer labels |
| **Body** | Inter | 400 (Regular) | 16-18px | Descriptions, bullet text |
| **Caption** | Inter | 300 (Light) | 12-14px | Annotations, source notes, metric labels |
| **Mono** | JetBrains Mono | 400 | 13px | Code blocks, metric numbers |

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

## Slide 5.1 — One Hub, Many Spokes

### Layout Requirements

1. Full-screen slide (1920x1080) with `#1A1A24` background
2. 5px `#FFE600` accent bar at top (animate width 0→100% over 800ms)
3. Title: "Hub-Spoke: Govern Central, Innovate Local" (Inter Black, 48px, `#FFFFFF`)
4. Subtitle: "Modular AI applications connected through a single governance contract" (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
5. Central hub positioned at center of slide (~500px from top, horizontally centered):

   **Hub Circle:**
   - Diameter: 280px
   - Background: `#FFE600` (solid yellow)
   - Border: 4px solid `rgba(255, 230, 0, 0.6)` with box-shadow: `0 0 60px rgba(255, 230, 0, 0.3)`
   - Label: "Citadel Governance Hub" (Inter Bold, 20px, `#1A1A24`, centered)
   - 4 inner icons arranged in a 2x2 grid inside the hub (each 40px):
     - Top-left: Lucide `shield` (Gateway)
     - Top-right: Lucide `gavel` (Policy)
     - Bottom-left: Lucide `eye` (Observability)
     - Bottom-right: Lucide `clipboard-list` (Registry)
   - Icon color: `#1A1A24` (dark on yellow)
   - Icon labels (Caption, 11px, `#1A1A24`, below each icon): "Gateway", "Policy", "Observability", "Registry"

6. Radiating spokes positioned organically around the hub (not in a perfect grid):

   **Spoke 1 — Finance (Teal `#27ACAA`):**
   - Position: Top-left quadrant, ~300px from hub center at ~135° angle
   - Diameter: 120px
   - Background: `#27ACAA` with border 2px solid `rgba(39, 172, 170, 0.6)`
   - Label: "Finance" (Inter Bold, 16px, `#FFFFFF`, centered below circle)
   - Lucide `landmark` icon, 32px, `#FFFFFF`, centered in circle
   - Box-shadow: `0 0 20px rgba(39, 172, 170, 0.2)`

   **Spoke 2 — HR (Green `#2DB757`):**
   - Position: Top-right quadrant, ~280px from hub center at ~45° angle
   - Diameter: 120px
   - Background: `#2DB757` with border 2px solid `rgba(45, 183, 87, 0.6)`
   - Label: "HR" (Inter Bold, 16px, `#FFFFFF`, centered below circle)
   - Lucide `users` icon, 32px, `#FFFFFF`, centered in circle
   - Box-shadow: `0 0 20px rgba(45, 183, 87, 0.2)`

   **Spoke 3 — Legal (Purple `#750E5C`):**
   - Position: Left side, ~320px from hub center at ~180° angle
   - Diameter: 120px
   - Background: `#750E5C` with border 2px solid `rgba(117, 14, 92, 0.6)`
   - Label: "Legal" (Inter Bold, 16px, `#FFFFFF`, centered below circle)
   - Lucide `scale` icon, 32px, `#FFFFFF`, centered in circle
   - Box-shadow: `0 0 20px rgba(117, 14, 92, 0.2)`

   **Spoke 4 — Ops (Orange `#FF6D00`):**
   - Position: Bottom-left quadrant, ~290px from hub center at ~225° angle
   - Diameter: 120px
   - Background: `#FF6D00` with border 2px solid `rgba(255, 109, 0, 0.6)`
   - Label: "Ops" (Inter Bold, 16px, `#FFFFFF`, centered below circle)
   - Lucide `settings` icon, 32px, `#FFFFFF`, centered in circle
   - Box-shadow: `0 0 20px rgba(255, 109, 0, 0.2)`

   **Spoke 5 — IT (Blue `#188CE5`):**
   - Position: Bottom-right quadrant, ~310px from hub center at ~315° angle
   - Diameter: 120px
   - Background: `#188CE5` with border 2px solid `rgba(24, 140, 229, 0.6)`
   - Label: "IT" (Inter Bold, 16px, `#FFFFFF`, centered below circle)
   - Lucide `server` icon, 32px, `#FFFFFF`, centered in circle
   - Box-shadow: `0 0 20px rgba(24, 140, 229, 0.2)`

   **Spoke 6 — R&D (Teal `#27ACAA`):**
   - Position: Right side, ~270px from hub center at ~0° angle
   - Diameter: 120px
   - Background: `#27ACAA` at 80% opacity with border 2px solid `rgba(39, 172, 170, 0.6)`
   - Label: "R&D" (Inter Bold, 16px, `#FFFFFF`, centered below circle)
   - Lucide `flask-conical` icon, 32px, `#FFFFFF`, centered in circle
   - Box-shadow: `0 0 20px rgba(39, 172, 170, 0.2)`

7. Connection lines (SVG):
   - Draw straight lines from hub edge to each spoke edge
   - Stroke: `#FF6D00` (Orange) at 60% opacity, 3px width
   - Style: `stroke-dasharray: 8 4` (dashed line representing VNet peering)
   - Small data packet dots traveling along each line (see continuous animations)

8. Background decoration:
   - Very faint radial gradient from center: `rgba(255, 230, 0, 0.03)` at center to transparent at edges
   - Subtle grid pattern at 5% opacity

### Animation Sequence (GSAP Timeline)

```
Timeline:
- 0ms: Accent bar draws (width 0→100%, 800ms)
- 200ms: Title fades in (opacity 0→1, translateY(20px)→0, 500ms, ease: power2.out)
- 400ms: Subtitle fades in (opacity 0→1, translateY(10px)→0, 400ms)
- 600ms: Hub scales up (scale 0→1, opacity 0→1, 600ms, ease: back.out(1.4))
- 900ms: Hub starts pulse (CSS animation, scale 1→1.05→1, 2s loop)
- 1000ms: Hub inner icons fade in with stagger (opacity 0→1, 300ms, stagger 100ms)
- 1200ms: Hub icon labels fade in (opacity 0→1, 200ms, stagger 80ms)
- 1400ms: Connection line 1 draws (stroke-dashoffset, 400ms)
- 1500ms: Spoke 1 appears (scale 0→1, opacity 0→1, 400ms, ease: back.out(1.7))
- 1600ms: Spoke 1 label fades in (opacity 0→1, 200ms)
- 1700ms: Connection line 2 draws (stroke-dashoffset, 400ms)
- 1800ms: Spoke 2 appears (scale 0→1, opacity 0→1, 400ms, ease: back.out(1.7))
- 1900ms: Spoke 2 label fades in (opacity 0→1, 200ms)
- 2000ms: Connection line 3 draws (stroke-dashoffset, 400ms)
- 2100ms: Spoke 3 appears (scale 0→1, opacity 0→1, 400ms, ease: back.out(1.7))
- 2200ms: Spoke 3 label fades in (opacity 0→1, 200ms)
- 2300ms: Connection line 4 draws (stroke-dashoffset, 400ms)
- 2400ms: Spoke 4 appears (scale 0→1, opacity 0→1, 400ms, ease: back.out(1.7))
- 2500ms: Spoke 4 label fades in (opacity 0→1, 200ms)
- 2600ms: Connection line 5 draws (stroke-dashoffset, 400ms)
- 2700ms: Spoke 5 appears (scale 0→1, opacity 0→1, 400ms, ease: back.out(1.7))
- 2800ms: Spoke 5 label fades in (opacity 0→1, 200ms)
- 2900ms: Connection line 6 draws (stroke-dashoffset, 400ms)
- 3000ms: Spoke 6 appears (scale 0→1, opacity 0→1, 400ms, ease: back.out(1.7))
- 3100ms: Spoke 6 label fades in (opacity 0→1, 200ms)
- 3400ms: Data packet animation starts on all lines (CSS, continuous loop)
```

### Continuous Animations (CSS)

```css
/* Hub pulse */
@keyframes hub-pulse {
  0%, 100% { transform: scale(1); }
  50% { transform: scale(1.05); }
}

/* Data packet travel along connection lines */
@keyframes packet-travel {
  0% { offset-distance: 0%; opacity: 0; }
  10% { opacity: 1; }
  90% { opacity: 1; }
  100% { offset-distance: 100%; opacity: 0; }
}

/* Spoke gentle glow */
@keyframes spoke-glow {
  0%, 100% { box-shadow: 0 0 20px currentColor; }
  50% { box-shadow: 0 0 40px currentColor; }
}
```

### Data Packet Implementation

Use SVG `<animateMotion>` for data packets traveling along connection lines:

```svg
<circle r="4" fill="#FF6D00">
  <animateMotion dur="3s" repeatCount="indefinite" path="M hubX hubY L spokeX spokeY"/>
</circle>
```

Or use CSS `offset-path` with `offset-distance` animation for HTML elements.

---

## Slide 5.2 — Spoke Autonomy, Hub Control

### Layout Requirements

1. Full-screen slide (1920x1080) with `#1A1A24` background
2. 5px `#FFE600` accent bar at top (animate width 0→100% over 800ms)
3. Title: "Spoke Independence with Central Oversight" (Inter Black, 48px, `#FFFFFF`)
4. Subtitle: "Each spoke owns compute, data, and operations. The hub owns governance." (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
5. Split diagram with two panels and a center contract badge:

   **Left Panel — "Spoke" (~700px wide, positioned left with 60px margin):**
   - Panel background: `rgba(39, 172, 170, 0.08)` with 2px solid `#27ACAA` border
   - Border-radius: 8px
   - Header: "Spoke" (Inter Bold, 28px, `#27ACAA`, top of panel with 24px padding)
   - Sub-header: "Local Autonomy" (Inter Regular, 16px, `rgba(255,255,255,0.65)`)
   - 4 capability rows, each with icon + text (padding: 20px 24px, gap: 16px):

     Row 1 — Dedicated Compute:
     - Icon: Lucide `server`, 32px, `#27ACAA`
     - Title: "Dedicated Compute" (Inter Bold, 18px, `#FFFFFF`)
     - Description: "AKS, Container Apps, VMs" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)

     Row 2 — Application Databases:
     - Icon: Lucide `database`, 32px, `#27ACAA`
     - Title: "App-Specific Data" (Inter Bold, 18px, `#FFFFFF`)
     - Description: "Dedicated databases and storage" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)

     Row 3 — Independent Scaling:
     - Icon: Lucide `refresh-cw`, 32px, `#27ACAA`
     - Title: "Independent Scaling" (Inter Bold, 18px, `#FFFFFF`)
     - Description: "Autonomous DevOps cycles" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)

     Row 4 — Own Integrations:
     - Icon: Lucide `plug`, 32px, `#27ACAA`
     - Title: "Own Integrations" (Inter Bold, 18px, `#FFFFFF`)
     - Description: "Data sources and external APIs" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)

   - Each row has a subtle bottom border: 1px solid `rgba(39, 172, 170, 0.2)`
   - Row hover effect (desktop only): background shifts to `rgba(39, 172, 170, 0.15)`

   **Right Panel — "Hub" (~700px wide, positioned right with 60px margin):**
   - Panel background: `rgba(255, 230, 0, 0.08)` with 2px solid `#FFE600` border
   - Border-radius: 8px
   - Header: "Hub" (Inter Bold, 28px, `#FFE600`, top of panel with 24px padding)
   - Sub-header: "Central Governance" (Inter Regular, 16px, `rgba(255,255,255,0.65)`)
   - 4 guarantee rows, each with icon + text:

     Row 1 — Single Entry Point:
     - Icon: Lucide `shield`, 32px, `#FFE600`
     - Title: "Single Entry Point" (Inter Bold, 18px, `#FFFFFF`)
     - Description: "All AI API calls through one gateway" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)

     Row 2 — Policy Enforcement:
     - Icon: Lucide `lock`, 32px, `#FFE600`
     - Title: "Policy Enforcement" (Inter Bold, 18px, `#FFFFFF`)
     - Description: "Consistent rules across all spokes" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)

     Row 3 — Cost Attribution:
     - Icon: Lucide `credit-card`, 32px, `#FFE600`
     - Title: "Cost Attribution" (Inter Bold, 18px, `#FFFFFF`)
     - Description: "Unified billing and chargeback" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)

     Row 4 — Audit Trail:
     - Icon: Lucide `clipboard-check`, 32px, `#FFE600`
     - Title: "Complete Audit Trail" (Inter Bold, 18px, `#FFFFFF`)
     - Description: "Full traceability for compliance" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)

   - Each row has a subtle bottom border: 1px solid `rgba(255, 230, 0, 0.2)`

   **Center Contract Badge:**
   - Position: Absolute center between panels, vertically centered
   - Shape: Circle, diameter: 140px
   - Background: `#FFE600` with border 3px solid `rgba(255, 230, 0, 0.8)`
   - Icon: Lucide `handshake`, 48px, `#1A1A24`, centered
   - Label: "Contract" (Inter Bold, 16px, `#1A1A24`, below icon)
   - Sub-label: "Active" (Inter Regular, 12px, `#1A1A24`, below "Contract")
   - Glow effect: `box-shadow: 0 0 40px rgba(255, 230, 0, 0.4)`
   - Connecting lines: SVG lines from badge to both panels with bidirectional arrows

6. Connecting elements:
   - SVG line from left panel center-right edge to contract badge left edge
   - SVG line from contract badge right edge to right panel center-left edge
   - Stroke: `#FF6D00`, 3px, `stroke-dasharray: 6 3`
   - Bidirectional arrowheads at each end
   - Label mid-line: "VNet Peering" (Caption, 12px, `rgba(255,255,255,0.5)`)

### Animation Sequence (GSAP Timeline)

```
Timeline:
- 0ms: Accent bar draws (width 0→100%, 800ms)
- 200ms: Title and subtitle fade in (opacity 0→1, 400ms)
- 600ms: Left panel slides in from left (translateX(-50px)→0, opacity 0→1, 500ms, ease: power3.out)
- 700ms: Left panel header and sub-header fade in (opacity 0→1, 300ms)
- 800ms: Left panel row 1 fades in (translateX(-20px)→0, opacity 0→1, 400ms)
- 900ms: Left panel row 2 fades in (translateX(-20px)→0, opacity 0→1, 400ms)
- 1000ms: Left panel row 3 fades in (translateX(-20px)→0, opacity 0→1, 400ms)
- 1100ms: Left panel row 4 fades in (translateX(-20px)→0, opacity 0→1, 400ms)
- 600ms: Right panel slides in from right (translateX(50px)→0, opacity 0→1, 500ms, ease: power3.out)
- 700ms: Right panel header and sub-header fade in (opacity 0→1, 300ms)
- 1000ms: Right panel row 1 fades in (translateX(20px)→0, opacity 0→1, 400ms)
- 1100ms: Right panel row 2 fades in (translateX(20px)→0, opacity 0→1, 400ms)
- 1200ms: Right panel row 3 fades in (translateX(20px)→0, opacity 0→1, 400ms)
- 1300ms: Right panel row 4 fades in (translateX(20px)→0, opacity 0→1, 400ms)
- 1400ms: Center contract badge scales up (scale 0→1, opacity 0→1, 400ms, ease: back.out(1.7))
- 1500ms: Contract badge starts glow pulse (CSS animation, opacity 0.6→1→0.6, 2s loop)
- 1600ms: Connecting lines draw (stroke-dashoffset, 400ms)
- 1800ms: Bidirectional arrows fade in (opacity 0→1, 200ms)
- 2000ms: Left panel icons start autonomous pulse (random intervals 2-4s, CSS)
- 2000ms: Right panel steady monitoring lines start (CSS continuous glow)
```

### Continuous Animations (CSS)

```css
/* Left panel icon autonomous pulse */
@keyframes spoke-pulse {
  0%, 100% { transform: scale(1); opacity: 1; }
  50% { transform: scale(1.15); opacity: 0.8; }
}

/* Contract badge glow */
@keyframes contract-glow {
  0%, 100% { box-shadow: 0 0 30px rgba(255, 230, 0, 0.3); opacity: 0.9; }
  50% { box-shadow: 0 0 60px rgba(255, 230, 0, 0.6); opacity: 1; }
}

/* Right panel monitoring line */
@keyframes monitor-glow {
  0% { opacity: 0.3; }
  50% { opacity: 0.8; }
  100% { opacity: 0.3; }
}
```

### Random Interval Pulse for Left Panel

Use GSAP or JavaScript to trigger pulses at random intervals:

```javascript
// For each left panel icon
leftPanelIcons.forEach((icon, i) => {
  setInterval(() => {
    icon.style.animation = 'spoke-pulse 1s ease';
    setTimeout(() => { icon.style.animation = ''; }, 1000);
  }, 2000 + Math.random() * 2000); // Random 2-4s interval
});
```

---

## Slide 5.3 — The Complete Architecture

### Layout Requirements

1. Full-screen slide (1920x1080) with `#1A1A24` background
2. 5px `#FFE600` accent bar at top (animate width 0→100% over 800ms)
3. Title: "The AI+ HUB Factory — Complete Architecture" (Inter Black, 48px, `#FFFFFF`)
4. Subtitle: "Landing Zone · Citadel · Data · Agents · Hub-Spoke" (Inter Regular, 20px, `rgba(255,255,255,0.65)`)
5. Comprehensive layered architecture diagram (centered, ~800px wide, ~500px tall):

   **Layer 1 — Azure Landing Zone (Bottom):**
   - Full-width bar, 100px tall
   - Background: `#188CE5` at 30% opacity, 2px solid `#188CE5` border
   - Border-radius: 4px
   - Label: "Azure Landing Zone" (Inter Bold, 20px, `#FFFFFF`, left-aligned with 24px padding)
   - Lucide `cloud` icon, 28px, `#188CE5`, left of label
   - Sub-label: "Foundation Layer" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)
   - Decorative: Small Azure service icons (VNet, Firewall, NSG) as inline dots on right side

   **Layer 2 — Citadel 4-Layer Stack:**
   - Full-width, 120px tall
   - 4 sub-layers stacked horizontally (each 25% width):
     - Sub-layer 1: `#750E5C` (Purple) — "Governance Hub" — Lucide `shield`
     - Sub-layer 2: `#FF6D00` (Orange) — "AI Control Plane" — Lucide `eye`
     - Sub-layer 3: `#27ACAA` (Teal) — "Agent Identity" — Lucide `fingerprint`
     - Sub-layer 4: `#188CE5` (Blue) — "Security Fabric" — Lucide `shield-check`
   - Each sub-layer: background at 25% opacity, 1px solid border in respective color
   - Label below stack: "Citadel Governance Stack" (Inter Bold, 18px, `#FFFFFF`)
   - Gap between Layer 1 and 2: 16px

   **Layer 3 — Data Foundation:**
   - Full-width bar, 90px tall
   - Background: `#2DB757` at 25% opacity, 2px solid `#2DB757` border
   - Border-radius: 4px
   - Label: "Data Foundation" (Inter Bold, 20px, `#FFFFFF`, left-aligned)
   - Lucide `database` icon, 28px, `#2DB757`, left of label
   - Sub-label: "Semantic Layer — Unity Catalog · OneLake · MetricFlow" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)
   - Decorative: Small data icons (table, metric, catalog) as inline dots on right

   **Layer 4 — Agentic Layer with Spokes (Top):**
   - Full-width, 140px tall
   - Central hub (Yellow `#FFE600`, 100px diameter circle) in center
     - Label: "Citadel Hub" (Inter Bold, 14px, `#1A1A24`)
   - 5 spokes radiating outward (small circles, 50px diameter):
     - Finance (Teal `#27ACAA`) — left
     - HR (Green `#2DB757`) — top-left
     - Legal (Purple `#750E5C`) — top-right
     - Ops (Orange `#FF6D00`) — right
     - IT (Blue `#188CE5`) — bottom
   - Connection lines from hub to each spoke (Orange `#FF6D00`, 2px)
   - Label below: "Agentic Layer with Hub-Spoke Topology" (Inter Bold, 18px, `#FFFFFF`)

   **Gap between layers:** 12px vertical spacing
   **Entire stack container:** Centered horizontally, positioned below subtitle (~200px from top)

6. Animated flow lines between layers (SVG):
   - Vertical dashed lines connecting Layer 1 → 2 → 3 → 4
   - Stroke: `rgba(255, 230, 0, 0.4)`, 2px, `stroke-dasharray: 6 4`
   - Animated gradient flowing upward showing data movement
   - Flow direction: Bottom to top (Landing Zone → Agents)

7. Summary statement (below architecture diagram):
   - Text: "A single platform vision: secure infrastructure, governed AI, trusted data, autonomous agents, scalable topology"
   - Inter Regular, 18px, `rgba(255,255,255,0.8)`, centered, max-width: 1000px
   - Italic style

8. Four key metrics positioned at corners of the slide:

   **Top-left metric:**
   - Number: "2-4 weeks" (Inter Black, 36px, `#FFE600`)
   - Label: "Time to production governance" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)
   - Icon: Lucide `zap`, 20px, `#FFE600`
   - Position: Top-left, 80px from edge, below title area

   **Top-right metric:**
   - Number: "80%" (Inter Black, 36px, `#FFE600`)
   - Label: "Reduction in shadow AI risk" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)
   - Icon: Lucide `trending-down`, 20px, `#FFE600`
   - Position: Top-right, 80px from edge

   **Bottom-left metric:**
   - Number: "20-30%" (Inter Black, 36px, `#FFE600`)
   - Label: "Cost reduction through optimization" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)
   - Icon: Lucide `piggy-bank`, 20px, `#FFE600`
   - Position: Bottom-left, 80px from edge, 100px from bottom

   **Bottom-right metric:**
   - Number: "7 years" (Inter Black, 36px, `#FFE600`)
   - Label: "Audit trail retention" (Inter Regular, 14px, `rgba(255,255,255,0.65)`)
   - Icon: Lucide `clock`, 20px, `#FFE600`
   - Position: Bottom-right, 80px from edge, 100px from bottom

### Animation Sequence (GSAP Timeline)

```
Timeline:
- 0ms: Accent bar draws (width 0→100%, 800ms)
- 200ms: Title and subtitle fade in (opacity 0→1, 400ms)
- 600ms: Layer 1 (Landing Zone) rises from bottom (translateY(80px)→0, opacity 0→1, 600ms, ease: power3.out)
- 800ms: Layer 1 label and icons fade in (opacity 0→1, 300ms, stagger 50ms)
- 1000ms: Layer 2 sub-layer 1 slides in (translateX(-30px)→0, opacity 0→1, 400ms)
- 1100ms: Layer 2 sub-layer 2 slides in (translateX(-30px)→0, opacity 0→1, 400ms)
- 1200ms: Layer 2 sub-layer 3 slides in (translateX(-30px)→0, opacity 0→1, 400ms)
- 1300ms: Layer 2 sub-layer 4 slides in (translateX(-30px)→0, opacity 0→1, 400ms)
- 1400ms: Layer 2 label fades in (opacity 0→1, 300ms)
- 1500ms: Layer 3 fades in (opacity 0→1, translateY(40px)→0, 500ms, ease: power2.out)
- 1600ms: Layer 3 label and icons fade in (opacity 0→1, 300ms, stagger 50ms)
- 1800ms: Layer 4 hub scales up (scale 0→1, opacity 0→1, 600ms, ease: back.out(1.4))
- 2000ms: Spoke 1 appears (scale 0→1, opacity 0→1, 300ms, ease: back.out(1.7))
- 2100ms: Spoke 2 appears (scale 0→1, opacity 0→1, 300ms)
- 2200ms: Spoke 3 appears (scale 0→1, opacity 0→1, 300ms)
- 2300ms: Spoke 4 appears (scale 0→1, opacity 0→1, 300ms)
- 2400ms: Spoke 5 appears (scale 0→1, opacity 0→1, 300ms)
- 2500ms: Layer 4 label fades in (opacity 0→1, 300ms)
- 2800ms: Flow lines draw between layers (stroke-dashoffset, 600ms)
- 3000ms: Flow lines start continuous gradient animation (CSS, 3s loop)
- 3200ms: Metric 1 counts up (0→"2-4 weeks", 1000ms)
- 3400ms: Metric 2 counts up (0→80%, 1000ms)
- 3600ms: Metric 3 counts up (0→20-30%, 1000ms)
- 3800ms: Metric 4 counts up (0→7 years, 1000ms)
- 4000ms: Metric labels fade in (opacity 0→1, 200ms, stagger 100ms)
- 4200ms: Summary statement types out (typewriter effect, 1500ms)
```

### Count-Up Animation for Metrics

Implement count-up using GSAP or JavaScript:

```javascript
// Count-up helper
function countUp(element, target, duration = 1000, suffix = '') {
  const obj = { value: 0 };
  gsap.to(obj, {
    value: parseFloat(target),
    duration: duration / 1000,
    ease: 'power2.out',
    onUpdate: () => {
      element.textContent = obj.value.toFixed(0) + suffix;
    }
  });
}

// For text metrics like "2-4 weeks" and "20-30%", use a typewriter or direct fade
function typeMetric(element, text, duration = 1000) {
  element.textContent = '';
  let i = 0;
  const interval = setInterval(() => {
    element.textContent += text[i];
    i++;
    if (i >= text.length) clearInterval(interval);
  }, duration / text.length);
}
```

### Typewriter Effect for Summary

```javascript
function typewriter(element, text, duration = 1500) {
  element.textContent = '';
  element.style.borderRight = '2px solid #FFE600';
  let i = 0;
  const interval = setInterval(() => {
    element.textContent += text[i];
    i++;
    if (i >= text.length) {
      clearInterval(interval);
      element.style.borderRight = 'none';
    }
  }, duration / text.length);
}
```

### Continuous Animations (CSS)

```css
/* Flow line gradient animation */
@keyframes flow-gradient {
  0% { stroke-dashoffset: 24; }
  100% { stroke-dashoffset: 0; }
}

/* Layer glow on hover (desktop only) */
@keyframes layer-glow {
  0%, 100% { box-shadow: 0 0 10px currentColor; }
  50% { box-shadow: 0 0 30px currentColor; }
}

/* Hub pulse in complete architecture */
@keyframes arch-hub-pulse {
  0%, 100% { transform: scale(1); box-shadow: 0 0 20px rgba(255, 230, 0, 0.3); }
  50% { transform: scale(1.03); box-shadow: 0 0 40px rgba(255, 230, 0, 0.5); }
}
```

---

## Global Requirements

### Slide Navigation

- Arrow keys (Left/Right) to switch between slides
- Slide container uses `transform: translateX()` for transitions
- Transition duration: 500ms with `cubic-bezier(0.4, 0, 0.2, 1)` easing
- This is Section 5 — slides should be reachable from Section 4 (Agentic Layer) and Section 6 (Closing)
- Ensure all previous slide sections (Sections 0-4) remain accessible via keyboard navigation

### CSS Animation Patterns

```css
/* Bounce easing for element arrivals */
.bounce-in {
  animation-timing-function: cubic-bezier(0.34, 1.56, 0.64, 1);
}

/* Standard fade-up entrance */
@keyframes fade-up {
  from { transform: translateY(20px); opacity: 0; }
  to { transform: translateY(0); opacity: 1; }
}

/* Scale pop entrance */
@keyframes scale-pop {
  from { transform: scale(0); opacity: 0; }
  to { transform: scale(1); opacity: 1; }
}

/* Slide from left */
@keyframes slide-left {
  from { transform: translateX(-50px); opacity: 0; }
  to { transform: translateX(0); opacity: 1; }
}

/* Slide from right */
@keyframes slide-right {
  from { transform: translateX(50px); opacity: 0; }
  to { transform: translateX(0); opacity: 1; }
}

/* Glow pulse */
@keyframes glow-pulse {
  0%, 100% { opacity: 0.6; }
  50% { opacity: 1; }
}

/* Count-up number flicker */
@keyframes number-flicker {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.8; }
}

/* Typewriter cursor blink */
@keyframes cursor-blink {
  0%, 100% { border-color: #FFE600; }
  50% { border-color: transparent; }
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

### Data Packet Implementation (SVG)

For continuous data packet movement along connection lines on Slide 5.1:

```svg
<g class="data-packets">
  <!-- One packet per spoke connection -->
  <circle r="4" fill="#FF6D00" opacity="0.8">
    <animateMotion 
      dur="3s" 
      repeatCount="indefinite"
      path="M hubCenterX hubCenterY L spoke1X spoke1Y"
      calcMode="linear"
    />
  </circle>
  <!-- Repeat for each spoke -->
</g>
```

### Accessibility

- Respect `prefers-reduced-motion`: disable all animations, show static final states
- All icons have `aria-label` attributes
- Color contrast ratios meet WCAG AA (4.5:1 for body, 3:1 for large text)
- Focus indicators visible for keyboard navigation
- Slide sections use semantic `<section>` tags with `aria-label`

### Performance

- Use `transform` and `opacity` for animations (GPU-accelerated)
- Lazy-load Lucide icons per slide section
- Use `will-change` sparingly on animated elements
- For continuous loop animations, prefer CSS animations over GSAP to reduce JavaScript overhead
- Use `contain: layout style paint` on slide containers for paint containment

---

## Speaker Notes

**Section 5: Hub-Spoke Topology (4 minutes)**

- **Hub-spoke is the *scaling mechanism*** — this is how the AI+ HUB Factory grows from a single deployment to an enterprise-wide platform
- **Central governance + local autonomy** — the hub provides the governance contract, but each spoke maintains operational independence
- **Spokes as modules** — connect via a single contract with the hub, but own their infrastructure, compute, data, and DevOps cycles
- **The complete picture** — all layers working together: Landing Zone provides the foundation, Citadel provides governance, Data provides the semantic layer, Agents provide intelligence, and Hub-Spoke provides the scaling topology

**Slide 5.1 specific:**
- Emphasize the organic growth pattern — spokes can be added incrementally
- Mention that spokes can be business units, projects, or multi-agent orchestrations
- The single contract means consistent governance regardless of how many spokes exist

**Slide 5.2 specific:**
- Contrast the autonomy of the spoke with the control of the hub
- The spoke owns compute (AKS, Container Apps, VMs), databases, scaling, and integrations
- The hub owns the gateway, policies, cost attribution, and audit trail
- The contract badge is the critical boundary — everything passes through here

**Slide 5.3 specific:**
- This is the "money shot" — the complete architecture that ties everything together
- Build the story bottom-to-top: foundation → governance → data → intelligence → scale
- The metrics reinforce business value: 2-4 weeks to governance, 80% shadow AI reduction, 20-30% cost savings, 7-year audit retention
- End with the summary statement for memorability

---

## Notes

- Orange (`#FF6D00`) is the PRIMARY accent color for the Hub-Spoke section. Use it for connection lines, flow indicators, and energy metaphors.
- Slide 5.1 should feel like a living network — the hub pulses, spokes glow, and data packets travel continuously. This is the most visually dynamic slide.
- Slide 5.2 should feel balanced and contractual — the split diagram with the handshake badge in the center reinforces the "contract" metaphor.
- Slide 5.3 is the culmination — the assembly animation should feel dramatic and satisfying, building from foundation to intelligence like a cathedral rising.
- The count-up animation for metrics on 5.3 should feel precise and authoritative — these are business numbers that matter.
- Ensure the typewriter effect for the summary statement completes before the presenter reaches this slide (it's the final visual element).
- The layered architecture on 5.3 should use consistent colors from previous sections: Blue for Landing Zone, Purple/Orange/Teal for Citadel layers, Green for Data, Teal/Blue/Green/Orange/Purple for spokes.
- All connection lines should use `#FF6D00` (Orange) to maintain visual consistency across the section.
- This section transitions from "intelligence" to "scale" — the visual language should feel more expansive and connected than the Agentic Layer section.
