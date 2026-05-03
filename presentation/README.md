# AI+ HUB Factory — Animated HTML Presentation

## Milestone v3.0

This folder will contain the generated prompts and final HTML presentation for the AI+ HUB Factory deck.

## Source Document

📄 `.planning/PRESENTATION.md` — Complete design specification with:
- 22 slides across 6 sections + opening/closing
- Design system (colors, typography, layout)
- Animation specifications
- Speaker notes
- Technical implementation notes

## Phase Structure

| Phase | Slides | Description | Prompt File |
|-------|--------|-------------|-------------|
| 29 | 0.1-0.2 | Opening & Title Sequence | `prompts/phase-29-opening-title-prompt.md` |
| 30 | 1.1-1.3 | Landing Zone Foundation | `prompts/phase-30-landing-zone-prompt.md` |
| 31 | 2.1-2.4 | Citadel Governance Core | `prompts/phase-31-citadel-governance-prompt.md` |
| 32 | 3.1-3.4 | Data Foundation | `prompts/phase-32-data-foundation-prompt.md` |
| 33 | 4.1-4.4 | Agentic Layer | `prompts/phase-33-agentic-layer-prompt.md` |
| 34 | 5.1-5.3 | Hub-Spoke Topology | `prompts/phase-34-hub-spoke-topology-prompt.md` |
| 35 | 6.1-6.2 | Closing & Call to Action | `prompts/phase-35-closing-cta-prompt.md` |

## How to Use

1. Execute each phase plan to generate the Claude prompt
2. Use the prompt with Claude to generate the HTML/CSS/JS for those slides
3. Combine all generated sections into a single presentation file
4. Test keyboard navigation and animations

## Design System

- **Background:** `#1A1A24`
- **Primary:** `#FFE600` (Yellow)
- **Surface:** `#2E2E38`
- **Typography:** Inter (300-900 weights)
- **Canvas:** 1920x1080px (16:9)
- **Animation:** GSAP + CSS animations

## Output Location

Generated presentation files will be saved to:
- `presentation/index.html` — Main presentation file
- `presentation/assets/` — Images, icons, fonts
