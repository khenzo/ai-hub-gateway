# Deploy

Deploy the Mintlify docs site (and the AI+ HUB Factory presentation decks) to S3 + CloudFront via `deploy-s3.sh`.

## Prerequisites

- AWS CLI configured with credentials that can manage the target S3 bucket and CloudFront distribution
- `node` ≥ 18 (Mintlify CLI runs through `npx`)
- `jq`, `unzip`, `rsync` installed locally
- The bucket must allow public read (the script disables Block Public Access via bucket policy — confirm the account-level setting permits this)

## Usage

```bash
./deploy-s3.sh [--no-build] [--presentation-only] [--profile <name>] [bucket-name] [aws-region] [domain-name] [acm-certificate-arn]
```

All positional args are optional; defaults are:

| Position | Default              | Notes                                     |
|----------|----------------------|-------------------------------------------|
| 1        | `ai-plus-factory-hub-1` | S3 bucket name                         |
| 2        | `eu-central-1`        | AWS region                                |
| 3        | *(empty)*             | Custom domain (e.g. `docs.example.com`)   |
| 4        | *(empty)*             | ACM certificate ARN (must live in `us-east-1` for CloudFront) |

### Flags

- `--no-build` (alias `--skip-build`) — skip `mintlify export` and reuse the existing `docs/export/` tree. Useful for republishing assets/presentations without rebuilding the docs.
- `--build` — force build (this is the default).
- `--presentation-only` (alias `--decks-only`) — sync **only** the `presentation/` folder to `s3://<bucket>/presentation/` and invalidate `/presentation/*` on CloudFront. Skips the Mintlify build, the full-site sync, and the bucket/CloudFront provisioning steps. Use this when you only changed the HTML decks and don't want to redeploy the docs site.
- `--profile <name>` (also `--profile=<name>`) — use a specific AWS CLI named profile for this run (exports `AWS_PROFILE`). If omitted, `AWS_PROFILE` is unset and the default credential chain is used (env vars, SSO default, instance profile).

Flags can appear anywhere on the command line; positional args are extracted independently.

### AWS identity check

Before any AWS call, the script runs:

```bash
aws sts get-caller-identity --output table
```

This prints the active account, ARN, and UserId so you can confirm you're deploying with the intended principal. If the call fails, the script aborts before touching S3 or CloudFront.

## What the script does

### Default (full deploy)

1. **Build Mintlify docs** (unless `--no-build`): `cd docs && npx mintlify export && unzip export.zip -d export`.
2. **Copy presentations**: `rsync` the contents of `presentation/` into `docs/export/presentation/`, excluding `README.md`, `.planning/`, `prompts/`. This guarantees decks are served from the same origin so Mintlify's anchor links resolve.
3. **Provision S3 bucket** (idempotent): create if missing, enable static website hosting, apply a public-read bucket policy.
4. **Sync to S3**: `aws s3 sync docs/export/ s3://$BUCKET --delete`.
5. **CloudFront**:
   - If no distribution exists with the matching comment → create one (HTTPS via the default CloudFront cert, or via the supplied ACM cert if a custom domain was passed).
   - If a distribution already exists and **no** custom domain was passed → skip the config update and issue a `create-invalidation /*` so the new content goes live immediately.
   - If a distribution already exists and a custom domain **was** passed → fetch the existing `DistributionConfig`, merge in the new `Aliases` and `ViewerCertificate`, then update — preserving any other settings on the distribution.

### `--presentation-only` (fast path)

When this flag is set the script short-circuits after the AWS identity check and runs **only** these steps:

1. `aws s3 sync presentation/ s3://$BUCKET/presentation/ --delete` (excluding `README.md`, `.planning/`, `prompts/`).
2. `aws cloudfront create-invalidation --paths "/presentation/*"` against the existing distribution (if one exists for this bucket).

It does **not** run `mintlify export`, the full-site sync, the bucket policy step, or the CloudFront create/update. Use it when only the HTML decks have changed.

## Examples

```bash
# Default: full build + deploy to ai-plus-factory-hub-1 in eu-central-1
./deploy-s3.sh

# Skip the Mintlify build, just resync existing export + presentations
./deploy-s3.sh --no-build

# Different bucket / region
./deploy-s3.sh my-docs-bucket us-east-1

# Reuse existing docs but deploy to a different bucket
./deploy-s3.sh --no-build my-docs-bucket us-east-1

# With custom domain + ACM cert (cert MUST be in us-east-1)
./deploy-s3.sh ai-plus-factory-hub-1 eu-central-1 docs.example.com arn:aws:acm:us-east-1:123456789012:certificate/abc-123

# Use a specific AWS CLI named profile
./deploy-s3.sh --profile ey-sandbox

# Skip build + use a profile + override bucket
./deploy-s3.sh --no-build --profile ey-sandbox my-docs-bucket us-east-1

# Republish ONLY the presentation decks (no docs rebuild, no full-site sync)
./deploy-s3.sh --presentation-only

# Decks-only with a specific profile
./deploy-s3.sh --presentation-only --profile ey-sandbox
```

## Presentation links

The `presentation/` folder contains standalone HTML decks:

- `ai-plus-hub-factory-business.html`
- `ai-plus-hub-factory-technical.html`

They are surfaced in the Mintlify sidebar via `anchors` in `docs/docs.json`. Because Mintlify only opens **cross-origin** anchors in a new tab (there is no `openInNewTab` field in the schema), the anchor URLs are pinned to the absolute CloudFront domain:

```
https://d2mkqg3u8r0me5.cloudfront.net/presentation/ai-plus-hub-factory-business.html
https://d2mkqg3u8r0me5.cloudfront.net/presentation/ai-plus-hub-factory-technical.html
```

If the CloudFront distribution domain changes, update both URLs in `docs/docs.json` accordingly.

## Current deployment

- **Bucket**: `ai-plus-factory-hub-1` (`eu-central-1`)
- **CloudFront**: `d2mkqg3u8r0me5.cloudfront.net`
- **Site root**: `https://d2mkqg3u8r0me5.cloudfront.net/`
- **Presentations**: `https://d2mkqg3u8r0me5.cloudfront.net/presentation/<file>.html`

## Troubleshooting

- **`IllegalUpdate: Aliases are missing`** — the existing distribution has aliases configured but you ran the script without `--no-build` style updates picking them up. The script now skips the config update when no custom domain is passed; if you need to change aliases, pass `domain-name` and `acm-certificate-arn` as positional args 3 and 4.
- **`docs/export directory not found after build`** — `mintlify export` failed; check `docs/docs.json` is valid and that `npx mintlify` resolves.
- **CloudFront still serves stale content** — the script issues an invalidation for `/*`; allow ~30–60 seconds for it to propagate, or check the invalidation status in the CloudFront console.
- **403 from S3** — Block Public Access is enabled at the account or bucket level. Disable it for this bucket, or front S3 with an Origin Access Control instead of public read (would require script changes).
