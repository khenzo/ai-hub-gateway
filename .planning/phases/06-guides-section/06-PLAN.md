# Phase 6: Guides Documentation Section

**Phase Goal:** Create a comprehensive "Guides" section in the Mintlify documentation that converts all 13 guides from `@guides/` into `.mdx` format with integrated `@bicep/` code snippets, documents supporting resources (`@shared/`, `@scripts/`, `@src/`), cross-links them properly, and updates `docs.json` navigation.

**Success Criteria:**
- [ ] All 13 guides accessible via Mintlify navigation
- [ ] Bicep snippets display with proper syntax highlighting
- [ ] All internal links work (no 404s)
- [ ] Cross-references from existing docs sections
- [ ] Search indexing working for new content
- [ ] Shared resources, scripts, and source code documented
- [ ] Validation notebooks referenced from relevant guides

**Phase Status:** 📋 Planned  
**Target Completion:** TBD  
**Owner:** TBD  

---

## Task List

### Task 1: Create `docs/guides/` Directory Structure
**Status:** ⏳ Not Started  
**Estimated Effort:** 30 minutes  
**Files to Create:**
- `docs/guides/` directory
- `docs/guides/index.mdx` (overview/landing page)
- `docs/guides/deployment/` subdirectory
- `docs/guides/architecture/` subdirectory
- `docs/guides/features/` subdirectory
- `docs/guides/operations/` subdirectory
- `docs/guides/reference/` subdirectory

**Deliverables:**
- Directory structure matching the planned organization
- `index.mdx` with overview card grid linking to all guides

---

### Task 2: Convert 13 Markdown Guides to .mdx Format
**Status:** ⏳ Not Started  
**Estimated Effort:** 1-2 days  
**Files to Convert:**
1. `quick-deployment-guide.md` → `docs/guides/deployment/quick-start.mdx`
2. `full-deployment-guide.md` → `docs/guides/deployment/full-deployment.mdx`
3. `parameters-usage-guide.md` → `docs/guides/deployment/parameters.mdx`
4. `network-approach.md` → `docs/guides/architecture/networking.mdx`
5. `llm-routing-architecture.md` → `docs/guides/architecture/llm-routing.mdx`
6. `pii-masking-apim.md` → `docs/guides/features/pii-masking.mdx`
7. `throttling-events-handling.md` → `docs/guides/features/throttling-handling.mdx`
8. `LLM-Backend-Onboarding-Guide.md` → `docs/guides/features/llm-backend-onboarding.mdx`
9. `citadel-sizing-guide.md` → `docs/guides/operations/citadel-sizing.mdx`
10. `put-estimation-guide.md` → `docs/guides/operations/estimation-guide.mdx`
11. `power-bi-dashboard.md` → `docs/guides/operations/power-bi-dashboard.mdx`
12. `entraid-auth-validation.md` → `docs/guides/reference/entraid-auth.mdx`
13. `governance-hub-benefits.md` → `docs/guides/reference/governance-benefits.mdx`

**Conversion Requirements:**
- Add frontmatter: `--- title: "..." description: "..." ---`
- Convert mermaid diagrams to Mintlify-compatible format (or use images)
- Replace relative links with absolute docs paths
- Use Mintlify components:
  - `<Card>` and `<CardGroup>` for navigation
  - `<CodeGroup>` and `<Code>` for code blocks
  - `<Accordion>` for expandable sections
  - `<Tabs>` for tabbed content
  - `<Note>`, `<Warning>`, `<Tip>` for callouts
- Maintain bicep syntax highlighting
- Add "Related Guides" section at end of each file

---

### Task 3: Integrate Bicep Snippets
**Status:** ⏳ Not Started  
**Estimated Effort:** 4 hours  
**Key Bicep References to Embed:**

**From quick-deployment-guide.md:**
- Environment variable configuration examples
- Default configuration table

**From full-deployment-guide.md:**
- Parameter file structure examples
- Network configuration bicep blocks
- AI Foundry configuration arrays
- Diagnostic logging settings
- Security configuration blocks

**From parameters-usage-guide.md:**
- `main.bicepparam` usage examples
- Environment-specific parameter files (dev/prod)
- Customization scenarios
- Security best practices for secrets

**From LLM-Backend-Onboarding-Guide.md:**
- Backend configuration objects
- Authentication scheme examples
- Load balancing configurations
- Priority and weight examples

**From network-approach.md:**
- Hub-based configuration
- Spoke-based configuration
- Subnet and DNS configuration

**Integration Strategy:**
1. Inline critical bicep code using `<Code lang="bicep">`
2. Use `<CodeGroup>` for comparing dev vs prod configurations
3. Link to full files using `<Card href="/bicep/..." icon="file-code">`
4. Create snippet includes for reusable bicep patterns
5. Add line numbers for reference

---

### Task 4: Update docs.json Navigation
**Status:** ⏳ Not Started  
**Estimated Effort:** 30 minutes  
**Current Navigation Structure:**
```json
{
  "group": "AI Landing Zone Patterns",
  "pages": [...]
},
{
  "group": "Implementation",
  "pages": [...]
}
```

**New Navigation Entry:**
Add between "AI Landing Zone Patterns" and "Implementation":
```json
{
  "group": "Guides",
  "pages": [
    "guides/index",
    {
      "group": "Deployment",
      "pages": [
        "guides/deployment/quick-start",
        "guides/deployment/full-deployment",
        "guides/deployment/parameters"
      ]
    },
    {
      "group": "Architecture",
      "pages": [
        "guides/architecture/networking",
        "guides/architecture/llm-routing"
      ]
    },
    {
      "group": "Features",
      "pages": [
        "guides/features/pii-masking",
        "guides/features/throttling-handling",
        "guides/features/llm-backend-onboarding"
      ]
    },
    {
      "group": "Operations",
      "pages": [
        "guides/operations/citadel-sizing",
        "guides/operations/estimation-guide",
        "guides/operations/power-bi-dashboard"
      ]
    },
    {
      "group": "Reference",
      "pages": [
        "guides/reference/entraid-auth",
        "guides/reference/governance-benefits"
      ]
    }
  ]
}
```

---

### Task 5: Add Cross-References from Existing Sections
**Status:** ⏳ Not Started  
**Estimated Effort:** 2 hours  
**Files to Update:**

**From Getting Started:**
- `docs/getting-started/quick-start.mdx` - Add link to deployment guides
- `docs/getting-started/prerequisites.mdx` - Link to parameters guide

**From Architecture:**
- `docs/architecture/networking.mdx` - Link to network-approach guide
- `docs/architecture/core-components.mdx` - Link to llm-routing guide

**From Implementation:**
- `docs/implementation/deployment.mdx` - Link to deployment guides
- `docs/implementation/configuration.mdx` - Link to parameters guide

**From Operations:**
- `docs/operations/monitoring.mdx` - Link to power-bi and throttling guides
- `docs/operations/troubleshooting.mdx` - Link to relevant guides

**From AI Patterns:**
- `docs/ai-patterns/*.mdx` - Add "Implementation Guide" cards

**Cross-Reference Format:**
Use `<CardGroup>` with links:
```mdx
<CardGroup cols={2}>
  <Card title="Quick Deployment" icon="rocket" href="/guides/deployment/quick-start">
    Get started in 30 minutes
  </Card>
  <Card title="Full Deployment" icon="server" href="/guides/deployment/full-deployment">
    Production-ready setup
  </Card>
</CardGroup>
```

---

### Task 6: Create Bicep Snippet Includes
**Status:** ⏳ Not Started  
**Estimated Effort:** 1 hour  
**Files to Create:**

**`docs/_snippets/bicep/param-usage.mdx`**
- Common parameter file patterns
- Using statement example
- Environment variable usage

**`docs/_snippets/bicep/network-config.mdx`**
- Hub-based network configuration
- Spoke-based network configuration
- Private endpoint examples

**`docs/_snippets/bicep/ai-foundry-config.mdx`**
- Foundry instance configuration
- Model deployment arrays
- SKU and capacity examples

**`docs/_snippets/bicep/backend-config.mdx`**
- LLM backend onboarding template
- Authentication schemes
- Load balancing configuration

---

### Task 7: Test and Validate
**Status:** ⏳ Not Started  
**Estimated Effort:** 2 hours  
**Validation Checklist:**

**Link Validation:**
- [ ] Run `mintlify broken-links` (or equivalent)
- [ ] Check all internal links work
- [ ] Verify bicep file links resolve
- [ ] Test anchor links within pages

**Rendering Validation:**
- [ ] All pages render without errors
- [ ] Code blocks have syntax highlighting
- [ ] Mermaid diagrams display (or fallback images work)
- [ ] Cards and components render correctly
- [ ] Mobile responsiveness

**Navigation Validation:**
- [ ] Guides appear in sidebar
- [ ] Sub-groups expand/collapse
- [ ] Active state shows correctly
- [ ] Breadcrumbs work

**Search Validation:**
- [ ] Content is searchable
- [ ] Code snippets don't pollute search
- [ ] Page titles appear in results

---

### Task 8: Document Shared Resources, Scripts, and Source Code
**Status:** ⏳ Not Started  
**Estimated Effort:** 3 hours  
**Analysis Summary:**
Current references to these folders in docs:
- `@shared/`: NOT referenced in Mintlify docs (only in validation notebooks)
- `@scripts/`: Referenced 5 times in validation docs (example scripts, not integrated)
- `@src/`: Referenced 2 times in guides (power-bi-dashboard.md) and 1 time in docs

**Files to Document:**

**`@shared/` (Critical for validation/testing):**
- `shared/apimtools.py` - APIM testing utilities
- `shared/utils.py` - Common utilities
- `shared/snippets/api-http-requests.py` - HTTP request patterns
- `shared/snippets/openai-api-requests.py` - OpenAI API examples
- `shared/snippets/create-az-deployment.py` - Deployment helpers
- `shared/snippets/deployment-outputs.py` - Output parsing
- `shared/snippets/create-az-resource-group.py` - Resource group creation
- `shared/snippets/README.md` - Snippet usage guide

**`@scripts/` (Operational scripts):**
- `scripts/apim-event-hub-logger.ps1` - Event Hub logging setup
- `scripts/azure-key-vault-certificate-import.sh` - Certificate import

**`@src/` (Source code and tools):**
- `src/testing/openai-testing.http` - HTTP test files
- `src/usage-ingestion-logicapp/` - Logic App workflows for usage ingestion
- `src/usage-reports/` - Power BI reports and cost estimation
  - `AI-Hub-Gateway-Usage-Report-v1-5-Incremetal.pbix`
  - `model-pricing.json`
  - `AI-Search-Cost-Estimation-Logic.md`
  - `usage-record.json`

**`@validation/` (Jupyter notebooks - referenced but not documented):**
- `validation/citadel-access-contracts-tests.ipynb`
- `validation/citadel-agent-frameworks-tests.ipynb`
- `validation/citadel-pii-processing-tests.ipynb`
- `validation/llm-backend-onboarding-runner.ipynb`

**New Files to Create:**

**`docs/guides/development/shared-resources.mdx`**
- Document Python utilities in `shared/`
- Explain snippet system for Jupyter notebooks
- Show usage examples for each utility
- Code examples for `apimtools.py`, `utils.py`

**`docs/guides/operations/scripts-reference.mdx`**
- Document operational scripts
- PowerShell script usage for Event Hub
- Bash script for certificate management
- Include command examples and parameters

**`docs/guides/operations/usage-analytics.mdx`** (expand from power-bi-dashboard.md)
- Document `src/usage-reports/` content
- Power BI dashboard setup guide (migrate from guides/)
- Cost estimation logic documentation
- Model pricing configuration
- Usage record schema

**`docs/guides/development/testing-tools.mdx`**
- Document `src/testing/` HTTP files
- Document validation notebooks
- Explain how to run validation tests
- Link to notebooks from relevant guides:
  - LLM onboarding guide → llm-backend-onboarding-runner.ipynb
  - PII masking guide → citadel-pii-processing-tests.ipynb
  - Access contracts guide → citadel-access-contracts-tests.ipynb

**Integration Points:**
- Add "Testing & Validation" section to deployment guides
- Link shared utilities from troubleshooting guide
- Reference scripts from operations runbooks
- Add notebook links to feature guides

---

### Task 9: Update Navigation and Cross-References for New Resources
**Status:** ⏳ Not Started  
**Estimated Effort:** 1 hour  

**Update docs.json:**
Add to Guides navigation:
```json
{
  "group": "Development",
  "pages": [
    "guides/development/shared-resources",
    "guides/development/testing-tools"
  ]
}
```

**Cross-References to Add:**

**From Deployment Guides:**
- Link to validation notebooks for post-deployment testing
- Reference shared utilities for automation

**From Operations Guides:**
- Link to scripts-reference for operational tasks
- Link to usage-analytics for monitoring setup

**From Feature Guides:**
- LLM onboarding → testing-tools (validation notebook)
- PII masking → testing-tools (PII processing tests)
- Access contracts → testing-tools (access contracts tests)

**From Implementation Section:**
- Add "Testing Tools" card to implementation/validation/index.mdx
- Link to shared-resources from troubleshooting guide

---

## Dependencies

**Prerequisites:**
- None (this phase can run in parallel with other documentation improvements)

**Post-requisites:**
- Phase 7 could focus on: Video guides, interactive tutorials, or advanced examples

**Discovery Dependencies:**
Task 8 requires analysis of:
- Python code in `shared/` (understanding utility functions)
- PowerShell/Bash scripts (documenting parameters and usage)
- Jupyter notebooks (identifying test scenarios)
- Power BI files (understanding dashboard structure)

---

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Broken links after conversion | Medium | Medium | Automated link checking, manual review |
| Missing bicep references | Low | High | Comprehensive grep scan before/after |
| Large file sizes (PII guide is 981 lines) | Medium | Low | Split into multiple pages if needed |
| Mintlify component compatibility | Low | Medium | Test each page individually |

---

## Resource Requirements

**Time:** 4-5 days (increased from 3-4 to account for Tasks 8-9)  
**Skills Needed:**
- Markdown/MDX authoring
- Mintlify component knowledge
- Bicep syntax understanding
- Azure/APIM domain knowledge
- Python (for documenting shared utilities)
- PowerShell/Bash (for documenting scripts)
- Jupyter notebooks (for validation guides)

**Tools:**
- VS Code with MDX extensions
- Mintlify CLI for local testing
- Link checker tool
- Python environment (to test shared utilities)
- Power BI Desktop (to document usage reports)

---

## Definition of Done

- [ ] All 13 guides converted to .mdx and in `docs/guides/`
- [ ] `docs.json` updated with Guides navigation group
- [ ] All bicep snippets properly formatted with syntax highlighting
- [ ] Cross-references added from at least 5 existing sections
- [ ] No broken internal links
- [ ] All pages render correctly in Mintlify
- [ ] Search functionality works for new content
- [ ] Mobile layout verified
- [ ] **NEW:** Shared resources documented (`docs/guides/development/shared-resources.mdx`)
- [ ] **NEW:** Operational scripts documented (`docs/guides/operations/scripts-reference.mdx`)
- [ ] **NEW:** Usage analytics documented (`docs/guides/operations/usage-analytics.mdx`)
- [ ] **NEW:** Testing tools documented (`docs/guides/development/testing-tools.mdx`)
- [ ] **NEW:** Validation notebooks referenced from relevant guides
- [ ] **NEW:** Navigation updated with Development and Operations sub-groups
- [ ] Phase summary document created (06-SUMMARY.md)

---

## Notes

**Content Organization Philosophy:**
The guides are organized by use case rather than alphabetical order:
- **Deployment** = First-time users (start here)
- **Architecture** = Design decisions
- **Features** = Specific capabilities
- **Operations** = Ongoing management
- **Development** = Tools and utilities (NEW)
- **Reference** = Deep-dive topics

**Bicep Integration Strategy:**
Rather than duplicating bicep content, we'll:
1. Show relevant snippets inline with context
2. Link to full files for complete reference
3. Use includes for common patterns
4. Maintain single source of truth in `/bicep/`

**Shared Resources Documentation Strategy:**
The `@shared/`, `@scripts/`, and `@src/` folders contain operational code that:
- Powers validation notebooks (critical for testing)
- Supports deployment automation
- Enables usage analytics and monitoring
- Provides testing utilities

Documentation approach:
- Show code with inline comments explaining usage
- Provide practical examples of when to use each utility
- Link from relevant guides (e.g., deployment guide → validation notebooks)
- Include copy-paste ready command examples

**Future Considerations:**
- Consider splitting `pii-masking-apim.md` into multiple pages (it's 981 lines)
- Add interactive parameter generators
- Include video walkthroughs for complex guides
- Create quick-reference cards for common tasks
- Consider auto-generating Python utility docs from docstrings
