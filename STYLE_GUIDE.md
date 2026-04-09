: # AI Landing Zone Documentation Style Guide

This style guide ensures consistency, clarity, and quality across all documentation. All contributors should follow these guidelines when creating or updating content.

---

## Voice and Tone

### Professional but Approachable
- Write as if explaining to a competent colleague
- Avoid overly formal academic language
- Use contractions sparingly ("don't", "can't") in conceptual content
- Be direct and action-oriented in procedures

### Direct Address
- Use **"you"** to address the reader directly
- Avoid "the user" or "one" when referring to the reader
- Use "we" when describing shared experiences or recommendations

**✅ Good:** "You can configure the gateway by editing the `config.yaml` file."

**❌ Avoid:** "The user can configure the gateway by editing the config.yaml file."

### Active Voice Preferred
- Lead with the action, not the actor
- Makes procedures clearer and more direct

**✅ Good:** "Deploy the gateway using the Azure CLI."

**❌ Avoid:** "The gateway can be deployed using the Azure CLI."

### Clear, Concise Language
- Aim for 8th-grade reading level (Hemingway Editor is helpful)
- Remove filler words: "very", "quite", "rather", "really"
- One idea per sentence
- Break complex concepts into multiple sentences

---

## Structure

### Page Frontmatter

Every page **must** include frontmatter at the top:

```yaml
---
title: 'Page Title'
description: 'Brief description for SEO and previews'
icon: 'icon-name'  # Optional: Lucide icon name
---
```

**Title guidelines:**
- Use sentence case: "Getting started" not "Getting Started"
- Keep under 60 characters when possible
- Front-load keywords: "Deploy gateway" not "How to deploy gateway"

**Description guidelines:**
- 120-160 characters ideal for SEO
- Include primary keyword naturally
- Describe what the reader will learn

### Heading Hierarchy

```
# H1: Page title (only one per page, in frontmatter)

## H2: Major sections

### H3: Subsections

#### H4: Detailed breakdowns (use sparingly)
```

**Rules:**
- Only one H1 per page (in frontmatter, auto-generated)
- Don't skip levels (no H2 → H4)
- Maximum 4 heading levels (H2-H5)
- H2s should be descriptive and scannable

### Paragraph Length

- Maximum **3-5 sentences** per paragraph
- Break up walls of text
- Use bullet points for lists of 3+ related items
- White space improves readability

### List Formatting

**Parallel structure required:** All items should start with the same part of speech.

**✅ Good:**
- Configure the gateway settings
- Deploy to Azure
- Monitor the deployment

**❌ Avoid:**
- Configuring gateway settings
- Deploy to Azure
- You should monitor the deployment

**Bullet points:**
- Use for unordered lists
- Capitalize first word
- No period at end (unless full sentence)

**Numbered lists:**
- Use for sequential steps
- Always start with action verb
- Include period at end (full sentences)

---

## Technical Writing

### Code Blocks

Always specify the language for syntax highlighting:

**✅ Good:**
```bash
# Install dependencies
npm install
```

```yaml
# config.yaml
gateway:
  port: 8080
```

**Inline code:**
- Use backticks for: `commands`, `file_paths`, `variable_names`, `classNames`
- Don't use for emphasis (use **bold** instead)
- Don't capitalize inside backticks: `config.yaml` not `Config.yaml`

### Callouts

Use Mintlify callouts for important information:

```jsx
<Info>
  Supplementary information that adds context.
</Info>

<Warning>
  Critical warnings that prevent errors or data loss.
</Warning>

<Tip>
  Helpful suggestions to improve workflow.
</Tip>

<Note>
  Neutral information worth noting.
</Note>
```

**When to use:**
- **Info:** Background context, optional details
- **Warning:** Destructive actions, irreversible operations, security risks
- **Tip:** Best practices, shortcuts, optimization suggestions
- **Note:** Exceptions, requirements, prerequisites

### Cards

Use Cards for related links and navigation:

```jsx
<CardGroup cols={2}>
  <Card title="Architecture Overview" icon="building-2" href="/architecture/overview">
    Learn about the hub-spoke topology
  </Card>
  <Card title="Quick Start" icon="rocket" href="/getting-started/quickstart">
    Deploy in 15 minutes
  </Card>
</CardGroup>
```

**Guidelines:**
- Use 2 columns for most cases
- Include descriptive icons (Lucide names)
- Keep descriptions under 100 characters
- Use for "Next Steps" and "Related Topics"

### Tabs

Use Tabs for alternate approaches or formats:

```jsx
<Tabs>
  <Tab title="Azure CLI">
    ```bash
    az deployment group create ...
    ```
  </Tab>
  <Tab title="PowerShell">
    ```powershell
    New-AzResourceGroupDeployment ...
    ```
  </Tab>
  <Tab title="Portal">
    1. Navigate to **Resource groups**
    2. Click **Create**
    ```
  </Tab>
</Tabs>
```

**When to use:**
- Multiple ways to accomplish the same task
- Different environments (Windows/Mac/Linux)
- Code examples in different languages

### Steps

Use the Steps component for procedures:

```jsx
<Steps>
  <Step title="Install prerequisites">
    Ensure you have Node.js 18+ and Azure CLI installed.
  </Step>
  <Step title="Clone the repository">
    ```bash
    git clone https://github.com/org/repo.git
    ```
  </Step>
  <Step title="Run setup">
    ```bash
    npm run setup
    ```
  </Step>
</Steps>
```

**Guidelines:**
- Each step has a clear, action-oriented title
- Include verification at the end
- Maximum 7 steps (break into multiple procedures if longer)

---

## Mintlify Components

### Available Components

| Component | Purpose | Example Use Case |
|-----------|---------|------------------|
| `<Accordion>` | Collapsible content | FAQ items, detailed explanations |
| `<AccordionGroup>` | Multiple accordions | FAQ section |
| `<Card>` | Link with preview | Navigation, related content |
| `<CardGroup>` | Grid of cards | Next steps, related topics |
| `<CodeGroup>` | Grouped code blocks | Multiple language examples |
| `<Info>` / `<Warning>` / `<Tip>` / `<Note>` | Highlighted callouts | Important information |
| `<Steps>` | Numbered procedure | Installation, configuration |
| `<Tabs>` | Alternate views | CLI vs Portal, OS variants |
| `<ParamField>` | API parameter docs | OpenAPI documentation |
| `<ResponseField>` | API response docs | Endpoint responses |

### Component Props Reference

**Card props:**
- `title` (required): Card heading
- `icon`: Lucide icon name
- `href`: Link destination
- `horizontal`: Boolean for horizontal layout

**Callout props:**
- All callouts accept children content
- No additional props required

**Tabs props:**
- `title` (on Tab): Display label
- Nest multiple Tab components inside Tabs

---

## Formatting

### Emphasis

**Bold (`**text**`):**
- UI elements: Click **Save**
- Important terms: The **gateway** handles routing
- Emphasis: **Do not** skip this step

*Italics (`*text*`):*
- Use sparingly
- Book titles, foreign terms
- Not for emphasis (use bold)

### Links

**Descriptive link text:**

**✅ Good:** "Learn more about [hub-spoke topology](/architecture/networking)"

**❌ Avoid:** "Click [here](/architecture/networking) to learn more"

**External links:**
- Use full URL for external resources
- Open in new tab when leaving documentation site
- Include protocol: `https://example.com` not `example.com`

**Internal links:**
- Use relative paths: `/architecture/overview`
- Don't include `.mdx` extension
- Use anchor links for section references: `/getting-started/quickstart#prerequisites`

### Images and Diagrams

**Format preference:**
1. **SVG** - Scalable, small file size, ideal for diagrams
2. **PNG** - Screenshots, when transparency not needed
3. **WebP** - Modern format, good compression

**File locations:**
```
docs/
├── images/
│   ├── diagrams/      # Architecture diagrams (SVG preferred)
│   ├── screenshots/   # UI screenshots (PNG)
│   └── icons/         # Custom icons (SVG)
```

**Naming convention:**
```
[section]-[purpose]-[variant].[ext]

Examples:
- architecture-hub-spoke-diagram.svg
- deployment-azure-portal-screenshot.png
- quickstart-terminal-output.png
```

**Alt text requirements:**
```mdx
<img src="/images/diagrams/architecture-overview.svg" alt="Hub-spoke network topology showing central hub VNet connected to three spoke VNets for AI workloads" />
```

- Describe the content, not the appearance
- Include key information conveyed by the image
- 125 characters or less when possible

**Figure captions:**
```mdx
<figure>
  <img src="/images/diagrams/architecture-overview.svg" alt="Hub-spoke topology" />
  <figcaption>Figure 1: Hub-spoke network architecture for AI Landing Zone</figcaption>
</figure>
```

---

## Terminology

### Product Names

**Always use correct capitalization:**
- ✅ Azure API Management
- ✅ Azure OpenAI Service
- ✅ Azure AI Foundry
- ❌ azure api management
- ❌ Azure OpenAI
- ❌ Azure Foundry

**Our product:**
- ✅ AI Landing Zone
- ✅ Citadel (when referring to the gateway component)
- ❌ AI landing zone
- ❌ CITADEL

### Acronyms

**Spell out on first use:**

**✅ Good:**
> Azure API Management (APIM) provides a unified management layer. With APIM, you can secure and monitor your APIs.

**❌ Avoid:**
> Use APIM to manage your APIs.

**Common acronyms (no need to spell out):**
- API, URL, HTTP, HTTPS, JSON, YAML, CLI, UI, CSS, HTML, SQL, SDK

### Glossary Terms

Key domain terms are defined in the [glossary](/resources/glossary). Use these consistently:

| Term | Definition | Notes |
|------|------------|-------|
| AI Landing Zone | Enterprise-ready AI infrastructure foundation | Product name |
| Citadel | AI gateway and policy enforcement component | Component name |
| Access Contract | Governance agreement defining AI service access | Domain term |
| Hub-spoke | Network topology with central hub and satellite spokes | Architecture pattern |
| 4-layer model | Architecture layers: Edge, Gateway, Services, Data | Framework reference |

---

## Code Examples

### Complete, Runnable Examples

**Provide full context:**

```yaml
# config/gateway.yaml
apiVersion: v1
kind: Gateway
metadata:
  name: ai-gateway
spec:
  port: 8080
  tls:
    enabled: true
```

**Not just fragments:**
```yaml
# ❌ Avoid
port: 8080
```

### Realistic Values

Use realistic, copy-pasteable examples:

**✅ Good:**
```bash
az deployment group create \
  --name ai-gateway-deployment \
  --resource-group my-ai-rg \
  --template-file main.bicep
```

**❌ Avoid:**
```bash
az deployment group create --name <deployment-name> --resource-group <rg-name>
```

### Comments in Code

Explain the "why" in comments:

```python
# Enable retry with exponential backoff for transient failures
retry_policy = RetryStrategy(
    max_attempts=3,
    backoff_factor=2
)
```

### Line Length

- Maximum 80 characters for code blocks
- Break long commands with `\`
- Indent continuation lines

```bash
# ✅ Good
az deployment group create \
  --name ai-gateway-deployment \
  --resource-group my-ai-rg \
  --template-file main.bicep \
  --parameters @parameters.json

# ❌ Avoid (line too long)
az deployment group create --name ai-gateway-deployment --resource-group my-ai-rg --template-file main.bicep
```

---

## Accessibility

### Writing

- Use descriptive link text (not "click here")
- Define acronyms on first use
- Use plain language (avoid jargon)
- Structure content with clear headings

### Images

- Always include alt text
- Don't rely on color alone to convey meaning
- Ensure sufficient contrast in diagrams

### Code

- Use syntax highlighting
- Avoid ASCII art or text-only diagrams
- Use semantic HTML/Markdown structure

---

## Review Checklist

Before submitting content:

- [ ] Frontmatter includes title and description
- [ ] No H1 in body (only in frontmatter)
- [ ] Heading hierarchy is correct (no skipped levels)
- [ ] Code blocks have language specified
- [ ] Images have alt text
- [ ] Links work (no 404s)
- [ ] Acronyms spelled out on first use
- [ ] Product names capitalized correctly
- [ ] Active voice used in procedures
- [ ] Callouts used appropriately (not overused)
- [ ] Paragraphs are 3-5 sentences max
- [ ] Lists use parallel structure

---

## Related Resources

- [Contributing Guidelines](/resources/contributing) - How to contribute
- [Templates](/resources/templates) - Page templates and starters
- [Glossary](/resources/glossary) - Terminology and definitions
- [Mintlify Components](https://mintlify.com/docs/content/components) - Full component reference

---

*Last updated: 2026-04-09*
*Version: 1.0*
