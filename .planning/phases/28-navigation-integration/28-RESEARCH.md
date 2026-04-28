# Phase 28: Navigation & Integration - Research

**Researched:** 2026-04-28
**Domain:** Mintlify docs.json navigation wiring + MDX cross-link authoring
**Confidence:** HIGH

---

<phase_requirements>
## Phase Requirements

| ID | Description | Research Support |
|----|-------------|-----------------|
| DNAV-01 | Data Foundation documentation section exists in docs.json as a new tab with all content pages wired and existing Citadel pages cross-linked into the new section | All four `.mdx` pages confirmed present; docs.json tab structure documented; cross-link attachment points identified on Layer 2 and Layer 4 |
</phase_requirements>

---

## Summary

Phase 28 is a pure wiring phase. Its job is to make the Data Foundation pages produced in Phases 23–26 discoverable via the Mintlify top-level navigation and to add cross-links from existing Citadel architecture pages into the new section. There are no new content pages to create.

Four MDX pages exist in `docs/data-foundation/` and are ready to wire: `onelake-architecture.mdx` (Phase 23), `unity-catalog-governance.mdx` (Phase 24), `semantic-layer.mdx` (Phase 25), and `apim-semantic-endpoint.mdx` (Phase 26). A fifth page — `security-identity-patterns.mdx` — will be created by Phase 27 (directory: `27-security-identity-patterns/`), which must execute before Phase 28 can safely wire the complete tab.

The current `docs/docs.json` has six tabs and zero Data Foundation references. Adding a seventh "Data Foundation" tab requires one new group block in the `navigation.groups` array and one new entry in the `tabs` array. Layer 1 (`layer-1-governance-hub.mdx`) already has a cross-link to `apim-semantic-endpoint.mdx` from Phase 26. Layer 2 (`layer-2-control-plane.mdx`) and Layer 4 (`layer-4-security-fabric.mdx`) have no Data Foundation cross-links yet.

**Primary recommendation:** One plan suffices for this phase — a single atomic task: (1) add the Data Foundation tab to `docs.json`, (2) add a surgical `<Note>` callout with cross-link to each of Layer 2 and Layer 4. The full tab wiring is eight lines of JSON; the cross-links are two small MDX edits.

---

## Standard Stack

### Core

| Tool | Version | Purpose | Why Standard |
|------|---------|---------|--------------|
| Mintlify | ^4.0.0 | Documentation site engine — reads `docs/docs.json` | Project's documentation platform (package.json) |
| docs.json | Schema: mintlify v4 | Navigation config — tabs array + navigation.groups array | Single source of truth for page routing |
| MDX | Mintlify-flavored | Page format — supports Mintlify components (Note, CardGroup, Card) | All data-foundation pages are `.mdx` |

### Supporting

| Tool | Purpose | When to Use |
|------|---------|-------------|
| `npx mintlify dev` (via `npm run dev`) | Local preview of the rendered site | Verify tab renders and links resolve before commit |
| `jq` | Parse and verify docs.json structure from shell | Automated verification of navigation changes |
| `grep` | Verify cross-link hrefs are present in modified MDX files | Cross-link hygiene checks |

**Validation command (from Phase 15 precedent):**
```bash
cd /home/khenzo/projects/ai-hub-gateway/docs && npx mintlify dev
```

---

## Architecture Patterns

### docs.json Navigation Structure

The current `docs/docs.json` (239 lines) has this top-level shape:

```json
{
  "tabs": [
    { "name": "Getting Started", "url": "getting-started" },
    { "name": "Architecture",    "url": "architecture" },
    { "name": "Agent Factory",   "url": "agent-factory" },
    { "name": "Guides",          "url": "guides" },
    { "name": "Governance",      "url": "governance" },
    { "name": "EY Alignment",    "url": "ey-framework-alignment" }
  ],
  "navigation": {
    "groups": [
      { "group": "Getting Started", "tab": "Getting Started", "pages": [...] },
      { "group": "Architecture",    "tab": "Architecture",    "pages": [...] },
      ...
    ]
  }
}
```

### Pattern: Adding a New Tab

To add "Data Foundation" as a top-level tab:

1. Add one entry to the `tabs` array:
```json
{ "name": "Data Foundation", "url": "data-foundation" }
```

2. Add one entry to `navigation.groups`:
```json
{
  "group": "Data Foundation",
  "tab": "Data Foundation",
  "pages": [
    "data-foundation/onelake-architecture",
    "data-foundation/unity-catalog-governance",
    "data-foundation/semantic-layer",
    "data-foundation/apim-semantic-endpoint",
    "data-foundation/security-identity-patterns"
  ]
}
```

**Key rules observed from existing entries:**
- `tab` value in a group MUST exactly match the `name` value in the `tabs` array
- Page paths are relative to `docs/` without the `.mdx` extension
- No `icon` is required at the top-level group level (only sub-groups use icons)
- Pages are rendered in the order listed — order matters for reader journey

### Recommended Page Order in the Tab

The dependency chain determines the logical reading order:

```
1. data-foundation/onelake-architecture          (storage substrate — Phase 23)
2. data-foundation/unity-catalog-governance      (governance layer — Phase 24)
3. data-foundation/semantic-layer                (semantic layer ADR — Phase 25)
4. data-foundation/apim-semantic-endpoint        (APIM integration ADR — Phase 26)
5. data-foundation/security-identity-patterns    (identity/security ADR — Phase 27)
```

This mirrors the architectural stack from bottom (storage) to top (security enforcement), matching the Phase 23→27 build order.

### Pattern: Surgical Cross-Link (MDX)

Prior phases used a `<Note>` callout pattern for surgical cross-links to new sections. Phase 26 established this exact pattern on `layer-1-governance-hub.mdx` (line 173–177):

```mdx
<Note>
  **Data Access: Semantic Endpoint Registration**
  The Databricks SQL REST API semantic endpoint registers as an APIM backend,
  inheriting all Layer 1 governance capabilities — Entra token validation,
  rate limiting, and usage tracking. [...] See [APIM Governed Data Access](../data-foundation/apim-semantic-endpoint)
  for the full integration pattern.
</Note>
```

The same pattern applies to Layer 2 and Layer 4. The callout should be placed in the "Integration with Other Layers" section of each page, where that pattern already exists (both pages have an "Integration with Other Layers" / "Layer N" subsection).

### Anti-Patterns to Avoid

- **Relative path errors:** Cross-links from `docs/architecture/*.mdx` to `docs/data-foundation/*.mdx` must use `../data-foundation/page-name` (not `data-foundation/page-name` or `/data-foundation/page-name`)
- **Missing tab registration:** Adding pages to `navigation.groups` without a corresponding `tabs` entry causes the tab to be unreachable in the top nav
- **Wiring Phase 27 page before it exists:** `data-foundation/security-identity-patterns` must not be added to `docs.json` until Phase 27 has created the file. Phase 28 depends on Phase 27.
- **Breaking existing links:** Any edit to `docs.json` must preserve all existing group/page entries exactly — never reorganize or re-order existing groups

---

## Current State Audit

### docs/data-foundation/ MDX Files (as of 2026-04-28)

| File | Phase | Lines | Title | docs.json? |
|------|-------|-------|-------|-----------|
| `onelake-architecture.mdx` | 23 | 174 | "OneLake Architecture" | NO |
| `unity-catalog-governance.mdx` | 24 | 285 | "Unity Catalog Governance" | NO |
| `semantic-layer.mdx` | 25 | 257 | "Semantic Layer" | NO |
| `apim-semantic-endpoint.mdx` | 26 | 170 | "APIM Governed Data Access" | NO |
| `security-identity-patterns.mdx` | 27 | — | "Security & Identity Patterns" | NO (not yet created) |

**Non-MDX files in data-foundation/ (not navigable — source material only):**
- `expanding-onelake-unity-catalog.md`
- `integrate-onelake-azure-databricks.md`
- `microsoft-onelake-unified-data-lake.md`
- `multi-ontology-semantic-layer-converted.md`
- `multi-ontology-semantic-layer.md`
- `one-conslidation.md`
- `open-platform-dbt-databricks.md`
- `semantic-layer-architecture.md`

These `.md` files are research/source material and must NOT be added to `docs.json`. Only the four `.mdx` files (plus Phase 27's future `.mdx`) are navigable documentation pages.

### Existing Cross-Links to Data Foundation

| Architecture Page | Cross-Link to Data Foundation | Status |
|------------------|-------------------------------|--------|
| `architecture/layer-1-governance-hub.mdx` | `../data-foundation/apim-semantic-endpoint` | PRESENT (line 176, added Phase 26) |
| `architecture/layer-2-control-plane.mdx` | — | MISSING — needs cross-link |
| `architecture/layer-4-security-fabric.mdx` | — | MISSING — needs cross-link |

**Layer 1 is already wired.** Phase 28 adds cross-links to Layer 2 and Layer 4 only.

### Cross-Link Placement Analysis

**Layer 2 (`layer-2-control-plane.mdx`, 197 lines):**
- The "Integration with Other Layers" section (line ~140) already lists Layer 1, Layer 3, Layer 4
- Best insertion point: after "Layer 1: Governance Hub" subsection — add a Note callout about Data Foundation observability (query-count metrics emit to the same Event Hub namespace; Usage Tracking row in the page already references "Usage Tracking — Token consumption, request volumes, cost allocation")
- Relevant Data Foundation page: `semantic-layer.mdx` (semantic query observability) and `apim-semantic-endpoint.mdx` (usage tracking schema)

**Layer 4 (`layer-4-security-fabric.mdx`, ~230 lines):**
- The "Integration with Other Layers" section (line ~186) lists Layer 1, Layer 2, Layer 3
- The Purview section covers "Data Governance and Labeling" with sensitivity labels and column-level governance — directly relevant to Phase 27's column mask propagation topic
- Best insertion point: after the Purview section or the "Layer 1: Governance Hub" subsection in "Integration with Other Layers"
- Relevant Data Foundation page: `security-identity-patterns.mdx` (Phase 27 — Entra MI chain and Purview column mask propagation)

---

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Navigation tab registration | Custom routing or redirect files | Add to `docs.json` tabs + groups array | Mintlify's single config file controls all routing |
| Link verification | Custom link checker scripts | `grep` + file existence check | Already established pattern in Phase 15 |
| Page ordering | Alphabetical/arbitrary order | Architectural dependency order (Phase 23→27) | Reader journey should follow conceptual stack |
| Cross-link style | New MDX component patterns | `<Note>` callout with inline `[text](../path)` link | Phase 26 established this exact pattern on Layer 1 |

---

## Common Pitfalls

### Pitfall 1: Wiring Phase 27's Page Before It Exists

**What goes wrong:** If `data-foundation/security-identity-patterns` is added to `docs.json` before Phase 27 runs, Mintlify will show a 404 or broken navigation entry for that page.
**Why it happens:** Phase 28 is planned before Phase 27 completes.
**How to avoid:** Phase 28's plan must explicitly state Phase 27 must complete first. The docs.json change for `security-identity-patterns` is conditional on the file existing at execution time.
**Warning signs:** File existence check fails: `ls docs/data-foundation/security-identity-patterns.mdx`

### Pitfall 2: Tab Name / Group Tab Mismatch

**What goes wrong:** The `tab` field in a navigation group must exactly match a `name` field in the `tabs` array. If they differ (e.g., "Data Foundation" vs "data-foundation"), the group is invisible.
**Why it happens:** JSON string comparison is exact and case-sensitive.
**How to avoid:** Copy the tab name string from the tabs array entry when writing the group's `tab` field.

### Pitfall 3: Including .md Source Files in Navigation

**What goes wrong:** The `docs/data-foundation/` directory contains eight `.md` files (research source material). Adding any of these to `docs.json` will produce a broken page or rendered raw Markdown without Mintlify component support.
**Why it happens:** The directory appears to contain "content" files.
**How to avoid:** Only files ending in `.mdx` with a proper frontmatter (`title`, `description`) belong in `docs.json`.

### Pitfall 4: Wrong Relative Path in Cross-Links

**What goes wrong:** A cross-link from `docs/architecture/layer-2-control-plane.mdx` to `docs/data-foundation/semantic-layer.mdx` using `./data-foundation/semantic-layer` (wrong) instead of `../data-foundation/semantic-layer` (correct) will produce a 404 in Mintlify.
**Why it happens:** MDX href paths are relative to the current file's directory, not the `docs/` root.
**How to avoid:** From any `docs/architecture/*.mdx` file, data-foundation pages are at `../data-foundation/page-name`. Verified by grep on Phase 26's working cross-link: `../data-foundation/apim-semantic-endpoint`.

### Pitfall 5: Disrupting Existing Navigation Order

**What goes wrong:** Reordering, renaming, or restructuring existing groups in `docs.json` while adding the new tab can break previously working links and bookmarks.
**Why it happens:** Temptation to "clean up" the config while it's open.
**How to avoid:** Append the new tab to the `tabs` array and the new group to the end of `navigation.groups`. Do not touch any existing entries.

---

## Exact Changes Required

### Change 1: docs/docs.json — Add Data Foundation tab

**In `tabs` array** — append after "EY Alignment" entry:
```json
{
  "name": "Data Foundation",
  "url": "data-foundation"
}
```

**In `navigation.groups` array** — append after the "Guides" group (last entry):
```json
{
  "group": "Data Foundation",
  "tab": "Data Foundation",
  "pages": [
    "data-foundation/onelake-architecture",
    "data-foundation/unity-catalog-governance",
    "data-foundation/semantic-layer",
    "data-foundation/apim-semantic-endpoint",
    "data-foundation/security-identity-patterns"
  ]
}
```

### Change 2: docs/architecture/layer-2-control-plane.mdx — Add Data Foundation callout

Placement: "Integration with Other Layers" section, after the "Layer 1: Governance Hub" subsection bullet list.

Content: Note callout explaining that data query telemetry (query-count + warehouse-id) from the semantic endpoint emits to the same Event Hub namespace monitored by Layer 2, enabling unified observability across LLM and data access workloads. Link to `../data-foundation/apim-semantic-endpoint`.

### Change 3: docs/architecture/layer-4-security-fabric.mdx — Add Data Foundation callout

Placement: After the Purview "Data Governance and Labeling" subsection or in the "Integration with Other Layers" → "Layer 1: Governance Hub" subsection.

Content: Note callout explaining that Purview sensitivity labels and column masks flow through the APIM data access policy to AI agent responses (governance by construction). Link to `../data-foundation/security-identity-patterns` (Phase 27 page).

**Note:** If Phase 27 has not yet created `security-identity-patterns.mdx`, the Layer 4 callout should link to `../data-foundation/apim-semantic-endpoint` as a proxy cross-link, with the `security-identity-patterns` link added once Phase 27 completes.

---

## Phase Dependency Confirmation

| Dependency | Status | Evidence |
|-----------|--------|---------|
| Phase 23 (onelake-architecture.mdx) | COMPLETE | File exists, 174 lines |
| Phase 24 (unity-catalog-governance.mdx) | COMPLETE | File exists, 285 lines |
| Phase 25 (semantic-layer.mdx) | COMPLETE | File exists, 257 lines |
| Phase 26 (apim-semantic-endpoint.mdx) | COMPLETE | File exists, 170 lines |
| Phase 27 (security-identity-patterns.mdx) | NOT STARTED | File does not exist yet |

Phase 28 can wire Phases 23–26 immediately. The Phase 27 page must be created before Phase 28 completes its docs.json entry for `security-identity-patterns` and the Layer 4 cross-link.

---

## Code Examples

### Verified Pattern: Phase 26 Cross-Link (Layer 1)

Source: `docs/architecture/layer-1-governance-hub.mdx` line 173–177 (working):
```mdx
<Note>
**Data Access: Semantic Endpoint Registration**

The Databricks SQL REST API semantic endpoint registers as an APIM backend,
inheriting all Layer 1 governance capabilities — Entra token validation,
rate limiting, and usage tracking. The data access policy fragment design
differs from LLM policy fragments to account for the distinct risk surface
and throttling model. See [APIM Governed Data Access](../data-foundation/apim-semantic-endpoint)
for the full integration pattern, including ADR-DF-04 and the policy fragment comparison.
</Note>
```

This is the exact pattern to replicate for Layer 2 and Layer 4 (adapted content, same `<Note>` wrapper and `../data-foundation/` prefix).

### Verified Pattern: docs.json Tab Registration (EY Alignment reference)

Current working entry from `docs/docs.json` (lines 48–51 / group lines 130–157):
```json
{
  "name": "EY Alignment",
  "url": "ey-framework-alignment"
}
```
With group:
```json
{
  "group": "EY Framework Alignment",
  "tab": "EY Alignment",
  "pages": [...]
}
```
Note: The group name ("EY Framework Alignment") can differ from the tab name ("EY Alignment") — only the `tab` field must match `name` in the tabs array exactly.

---

## State of the Art

| Old Approach | Current Approach | Impact |
|--------------|-----------------|--------|
| mint.json (Mintlify v3) | docs.json (Mintlify v4) | This project already uses v4; no migration needed |
| Operations tab (removed in Phase 21) | Guides tab (consolidated) | Precedent: tabs can be added and removed; this project has done it before |

---

## Open Questions

1. **Phase 27 completion timing**
   - What we know: Phase 27's plan file exists at `27-security-identity-patterns/27-01-PLAN.md`; the output file `security-identity-patterns.mdx` does not yet exist
   - What's unclear: Will Phase 27 run before or concurrently with Phase 28 planning?
   - Recommendation: Plan Phase 28 with an explicit blocker check — "verify `docs/data-foundation/security-identity-patterns.mdx` exists before adding to docs.json". If Phase 27 is incomplete, complete Phase 28 in two steps: first wire Phases 23–26, then add Phase 27 page after it exists.

2. **REQUIREMENTS.md traceability discrepancy**
   - What we know: REQUIREMENTS.md traceability table (lines 85–88) assigns DSEC-01/DSEC-02 to "Phase 27" and DSEC-03/DSEC-04 to "Phase 28" — these are stale labels from before the dbt phase was removed and phases renumbered
   - What's unclear: Whether Phase 28 (this phase) is expected to also satisfy DSEC-03/DSEC-04 in addition to DNAV-01
   - Recommendation: The additional_context for this phase explicitly states requirements: DNAV-01 only. The REQUIREMENTS.md discrepancy is a stale documentation artifact (same kind noted in Phase 26 verification report). DSEC-03 and DSEC-04 belong to Phase 27 content and will be satisfied there. Phase 28 only owns DNAV-01.

---

## Sources

### Primary (HIGH confidence)
- `docs/docs.json` — live navigation config, read directly; current tab structure and group pattern confirmed
- `docs/data-foundation/*.mdx` — all four content pages confirmed with `ls -la` and frontmatter grep
- `docs/architecture/layer-1-governance-hub.mdx` line 176 — working cross-link pattern verified by grep
- `docs/architecture/layer-2-control-plane.mdx` — confirmed no existing Data Foundation cross-links
- `docs/architecture/layer-4-security-fabric.mdx` — confirmed no existing Data Foundation cross-links

### Secondary (MEDIUM confidence)
- `.planning/phases/26-apim-governed-data-access/26-01-SUMMARY.md` — confirmed Phase 26 outputs and Layer 1 cross-link pattern
- `.planning/phases/25-semantic-layer/25-01-SUMMARY.md` — confirmed Phase 25 outputs and docs.json deferral decision
- `.planning/phases/15-navigation-integration/15-01-SUMMARY.md` — Phase 15 navigation precedent: validation via `mintlify dev`, jq-based nav checks, cross-link verification via grep

### Tertiary (LOW confidence)
- None

---

## Metadata

**Confidence breakdown:**
- Current page inventory: HIGH — confirmed with `ls -la` and frontmatter grep
- docs.json tab wiring pattern: HIGH — reverse-engineered from existing EY Alignment tab (working)
- Cross-link relative paths: HIGH — verified against working Phase 26 cross-link on Layer 1
- Layer 2/4 insertion points: MEDIUM — read first 200 lines of each file; exact line numbers may shift if Phase 27 or another phase modifies these files before Phase 28 executes

**Research date:** 2026-04-28
**Valid until:** Phase 28 execution (changes in data-foundation/ or docs.json by intervening phases would invalidate the page count and exact line numbers, but not the patterns)
