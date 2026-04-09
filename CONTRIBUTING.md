# Contributing to AI Landing Zone Documentation

Thank you for your interest in contributing to the AI Landing Zone documentation! This guide will help you get started and ensure your contributions are effective and consistent.

## Table of Contents

- [Getting Started](#getting-started)
- [Contribution Types](#contribution-types)
- [Development Workflow](#development-workflow)
- [Content Guidelines](#content-guidelines)
- [Review Process](#review-process)
- [Questions and Support](#questions-and-support)

---

## Getting Started

### Prerequisites

Before contributing, you'll need:

- **Git**: For version control
- **Node.js 18+**: For running Mintlify locally
- **GitHub account**: To submit pull requests
- **Text editor**: VS Code recommended with MDX extensions

### Fork and Clone

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/ai-hub-gateway.git
   cd ai-hub-gateway
   ```
3. **Add upstream remote**:
   ```bash
   git remote add upstream https://github.com/original-org/ai-hub-gateway.git
   ```

### Branch Naming Conventions

Use descriptive branch names:

| Type | Pattern | Example |
|------|---------|---------|
| New content | `content/description` | `content/apim-deployment-guide` |
| Bug fixes | `fix/description` | `fix/broken-links-in-quickstart` |
| Improvements | `improve/description` | `improve/monitoring-section-clarity` |
| Documentation | `docs/description` | `docs/style-guide-updates` |

### Local Development Setup

1. **Install dependencies**:
   ```bash
   npm install
   ```

2. **Start Mintlify dev server**:
   ```bash
   npm run dev
   ```

3. **Open your browser** to `http://localhost:3000`

4. **Make changes** and see them live reload

---

## Contribution Types

### New Content

Creating new documentation pages:

- **Check existing structure**: Review where content fits in the navigation
- **Use templates**: Start from appropriate template in `templates/`
- **Follow style guide**: Adhere to [STYLE_GUIDE.md](./STYLE_GUIDE.md)
- **Test locally**: Verify rendering with `npm run dev`
- **Add cross-references**: Link to related content

**Process**:
1. Create new `.mdx` file in appropriate directory
2. Add entry to `docs.json` navigation
3. Include "Next Steps" section with CardGroup
4. Test all internal links

### Updates to Existing Content

Improving existing documentation:

- **Clarify explanations**: Make concepts easier to understand
- **Add examples**: Include concrete, copy-pasteable examples
- **Update screenshots**: Keep visuals current with UI changes
- **Fix outdated info**: Update for new versions or features

**Process**:
1. Edit existing `.mdx` file
2. Update date in frontmatter if significant changes
3. Verify all links still work
4. Test code examples

### Bug Fixes

Fixing documentation errors:

- **Broken links**: Fix or update URLs
- **Typos**: Correct spelling and grammar
- **Formatting**: Fix Markdown/MDX syntax errors
- **Code errors**: Correct non-working examples

**Process**:
1. Identify the issue
2. Make minimal fix
3. Test the fix locally
4. Reference issue number in PR if applicable

### Improvements

Enhancing existing content:

- **Better organization**: Improve structure and flow
- **More examples**: Add real-world use cases
- **Visual aids**: Add diagrams or screenshots
- **Accessibility**: Improve alt text and structure

---

## Development Workflow

### 1. Create a Branch

```bash
git checkout -b content/your-feature-name
```

### 2. Make Changes

- Edit files in your editor
- Preview with `npm run dev`
- Follow the [Style Guide](./STYLE_GUIDE.md)

### 3. Test Your Changes

```bash
# Verify Mintlify builds successfully
npm run build

# Check for broken links
npm run check-links
```

### 4. Commit Your Changes

Follow conventional commit format:

```bash
# Content changes
git commit -m "content: add APIM deployment guide"

# Bug fixes
git commit -m "fix: correct broken link in quickstart"

# Improvements
git commit -m "improve: clarify authentication section"

# Documentation updates
git commit -m "docs: update style guide with new patterns"
```

### 5. Push and Create PR

```bash
git push origin content/your-feature-name
```

Then create a Pull Request on GitHub using our PR template.

---

## Content Guidelines

### Style Guide

All content must follow the [STYLE_GUIDE.md](./STYLE_GUIDE.md):

- **Voice and tone**: Professional but approachable
- **Structure**: Use proper heading hierarchy
- **Components**: Use Mintlify components appropriately
- **Formatting**: Consistent code blocks, lists, tables
- **Accessibility**: Include alt text for images

### Templates

Start with the appropriate template:

| Template | Use For |
|----------|---------|
| `templates/page-template.mdx` | General documentation pages |
| `templates/concept-page.mdx` | Architecture concepts |
| `templates/guide-page.mdx` | Step-by-step procedures |
| `templates/reference-page.mdx` | API documentation |
| `templates/diagram-template.mdx` | Visual content guidelines |
| `templates/api-doc-template.mdx` | API endpoints |

### Frontmatter Requirements

Every page must include:

```yaml
---
title: 'Page Title'
description: 'Brief description (120-160 characters)'
icon: 'icon-name'  # Lucide icon
---
```

### Content Quality Checklist

Before submitting:

- [ ] Follows style guide
- [ ] Uses appropriate template
- [ ] All code examples tested
- [ ] Images have alt text
- [ ] Links work correctly
- [ ] No spelling/grammar errors
- [ ] Next Steps section included
- [ ] Cross-references added

---

## Review Process

### PR Requirements

Your Pull Request must:

1. **Fill out the PR template** completely
2. **Link related issues** (e.g., "Fixes #123")
3. **Include screenshots** for visual changes
4. **Pass automated checks** (links, formatting)
5. **Be focused**: One logical change per PR

### Review Checklist

Reviewers will check:

- [ ] Content accuracy
- [ ] Style guide compliance
- [ ] Technical correctness
- [ ] Link validity
- [ ] Formatting consistency
- [ ] Accessibility (alt text, headings)

### Approval Process

1. **Automated checks** must pass
2. **Content review** by docs maintainer
3. **Technical review** by subject matter expert (if applicable)
4. **Approval** from at least one maintainer
5. **Merge** by maintainer

### Merge Criteria

PRs will be merged when:

- All reviews approved
- No outstanding change requests
- CI checks passing
- Branch is up to date with main

---

## Questions and Support

### How to Ask Questions

- **General questions**: Open a [Discussion](https://github.com/org/repo/discussions)
- **Documentation requests**: Open an [Issue](https://github.com/org/repo/issues) with "documentation" label
- **Bug reports**: Open an [Issue](https://github.com/org/repo/issues) with "bug" label
- **Quick questions**: Join our community Slack (if available)

### Getting Help

Resources to help you contribute:

- **[STYLE_GUIDE.md](./STYLE_GUIDE.md)**: Writing standards and conventions
- **[Templates](./templates/)**: Starting points for new content
- **[Mintlify Docs](https://mintlify.com/docs)**: Platform documentation
- **[Lucide Icons](https://lucide.dev/icons/)**: Available icons
- **[MDX Documentation](https://mdxjs.com/)**: MDX syntax reference

### Issue Templates

Use appropriate templates when opening issues:

- **Documentation Request**: Request new documentation
- **Bug Report**: Report documentation errors
- **Feature Request**: Suggest improvements

---

## Recognition

Contributors will be recognized in:

- **Release notes**: Significant contributions mentioned
- **Contributors page**: Listed on documentation site
- **Git history**: Permanent record in repository

---

## Code of Conduct

This project adheres to a code of conduct. By participating, you are expected to:

- Be respectful and inclusive
- Welcome newcomers
- Focus on constructive feedback
- Respect different viewpoints

---

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.

---

## Quick Reference

```bash
# Setup
git clone https://github.com/YOUR_USERNAME/ai-hub-gateway.git
cd ai-hub-gateway
npm install

# Development
git checkout -b content/my-feature
npm run dev
# Edit files...

# Submit
git add .
git commit -m "content: add my feature"
git push origin content/my-feature
# Create PR on GitHub
```

---

Thank you for contributing to AI Landing Zone documentation! 🎉