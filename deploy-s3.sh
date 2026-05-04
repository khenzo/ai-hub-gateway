#!/bin/bash

# Deploy Mintlify docs to S3 static website with CloudFront for HTTPS
# Usage: ./deploy-s3.sh [--no-build] [--presentation-only] [--profile <name>] [bucket-name] [aws-region] [domain-name (optional)] [acm-certificate-arn (optional)]
#   --no-build              Skip the `mintlify export` step and reuse the existing docs/export/ tree.
#   --presentation-only     Sync ONLY the presentation/ folder to s3://<bucket>/presentation/.
#                           Skips Mintlify build, skips the full-site sync, skips bucket/CloudFront setup.
#                           Issues a CloudFront invalidation for /presentation/* if a distribution exists.
#   --profile <name>        Use the named AWS CLI profile (sets AWS_PROFILE for the run).
#                           If omitted, AWS_PROFILE is unset and the default credential chain is used.

set -e

BUILD_DOCS=1
PRESENTATION_ONLY=0
AWS_PROFILE_ARG=""
POSITIONAL=()
EXPECT_PROFILE_VALUE=0
for arg in "$@"; do
    if [ "$EXPECT_PROFILE_VALUE" -eq 1 ]; then
        AWS_PROFILE_ARG="$arg"
        EXPECT_PROFILE_VALUE=0
        continue
    fi
    case "$arg" in
        --no-build|--skip-build)
            BUILD_DOCS=0
            ;;
        --build)
            BUILD_DOCS=1
            ;;
        --presentation-only|--decks-only)
            PRESENTATION_ONLY=1
            BUILD_DOCS=0
            ;;
        --profile)
            EXPECT_PROFILE_VALUE=1
            ;;
        --profile=*)
            AWS_PROFILE_ARG="${arg#--profile=}"
            ;;
        *)
            POSITIONAL+=("$arg")
            ;;
    esac
done
if [ "$EXPECT_PROFILE_VALUE" -eq 1 ]; then
    echo "Error: --profile requires a value (e.g. --profile my-profile)."
    exit 1
fi
set -- "${POSITIONAL[@]}"

BUCKET_NAME=${1:-"ai-plus-factory-hub-1"}
REGION=${2:-"eu-central-1"}
CUSTOM_DOMAIN=${3:-""} # Optional: e.g., "www.example.com"
ACM_CERTIFICATE_ARN=${4:-""} # Optional: ARN of an ACM certificate in eu-central-1

SCRIPT_DIR="$(dirname "$0")"
DOCS_DIR="$SCRIPT_DIR/docs/export"
PRESENTATION_DIR="$SCRIPT_DIR/presentation"

# AWS profile selection: use --profile arg if given, otherwise unset to fall back to
# the default credential chain (env vars / instance profile / SSO default).
if [ -n "$AWS_PROFILE_ARG" ]; then
    export AWS_PROFILE="$AWS_PROFILE_ARG"
    echo "Using AWS profile: $AWS_PROFILE"
else
    unset AWS_PROFILE
    echo "No --profile passed; using default AWS credential chain."
fi

# Verify AWS identity before doing anything
echo "Verifying AWS identity..."
if ! aws sts get-caller-identity --output table; then
    echo "Error: 'aws sts get-caller-identity' failed. Configure credentials before running this script."
    exit 1
fi

# --- Presentation-only fast path ---
if [ "$PRESENTATION_ONLY" -eq 1 ]; then
    if [ ! -d "$PRESENTATION_DIR" ]; then
        echo "Error: presentation directory not found at $PRESENTATION_DIR."
        exit 1
    fi

    echo "Presentation-only mode: syncing $PRESENTATION_DIR → s3://$BUCKET_NAME/presentation/ ..."
    aws s3 sync "$PRESENTATION_DIR" "s3://$BUCKET_NAME/presentation" \
        --delete \
        --exclude "README.md" \
        --exclude ".planning/*" \
        --exclude "prompts/*" \
        --region "$REGION"

    # Invalidate only the presentation path on the existing CloudFront distribution (if any)
    EXISTING_DISTS=$(aws cloudfront list-distributions \
        --query "DistributionList.Items[?Comment=='CloudFront distribution for S3 static website $BUCKET_NAME'].Id" \
        --output text)
    if [ -n "$EXISTING_DISTS" ]; then
        CF_DISTRIBUTION_ID=$(echo "$EXISTING_DISTS" | awk '{print $1}')
        echo "Invalidating /presentation/* on CloudFront distribution $CF_DISTRIBUTION_ID ..."
        aws cloudfront create-invalidation \
            --distribution-id "$CF_DISTRIBUTION_ID" \
            --paths "/presentation/*" \
            --output json > /dev/null
        echo "Cache invalidation requested."
    else
        echo "No CloudFront distribution found for bucket $BUCKET_NAME; skipping invalidation."
    fi

    echo ""
    echo "Presentation-only deploy complete."
    exit 0
fi

# Build Mintlify docs (export → unzip into docs/export)
if [ "$BUILD_DOCS" -eq 1 ]; then
    echo "Building Mintlify docs..."
    (
        cd "$SCRIPT_DIR/docs" && \
        rm -rf export export.zip && \
        npx mintlify export && \
        unzip -q export.zip -d export
    )
else
    echo "Skipping Mintlify build (--no-build). Reusing existing $DOCS_DIR."
fi

if [ ! -d "$DOCS_DIR" ]; then
    echo "Error: docs/export directory not found after build."
    exit 1
fi

# Copy presentation HTML files into the export so they're served from the same origin
if [ -d "$PRESENTATION_DIR" ]; then
    echo "Copying presentation files into $DOCS_DIR/presentation/ ..."
    mkdir -p "$DOCS_DIR/presentation"
    rsync -a \
        --exclude "README.md" \
        --exclude ".planning/" \
        --exclude "prompts/" \
        "$PRESENTATION_DIR"/ "$DOCS_DIR/presentation/"
else
    echo "Warning: presentation directory not found. Skipping presentation copy."
fi

echo "Deploying to S3 bucket: $BUCKET_NAME"
echo "Region: $REGION"

# --- S3 Bucket Setup (remains mostly the same) ---

# Check if bucket exists, create if not
if ! aws s3api head-bucket --bucket "$BUCKET_NAME" --region "$REGION" 2>/dev/null; then
    echo "Creating S3 bucket: $BUCKET_NAME"
    if [ "$REGION" == "us-east-1" ]; then
        aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION"
    else
        aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION" --create-bucket-configuration LocationConstraint="$REGION"
    fi
    sleep 5 # Give a moment for bucket creation to propagate
else
    echo "Bucket '$BUCKET_NAME' already exists. Skipping creation."
fi

# Enable static website hosting
echo "Enabling static website hosting on S3..."
aws s3 website "s3://$BUCKET_NAME" --index-document index.html --error-document index.html --region "$REGION"

# Get the S3 static website endpoint for CloudFront origin
if [ "$REGION" == "us-east-1" ]; then
    S3_WEBSITE_ENDPOINT="$BUCKET_NAME.s3-website-us-east-1.amazonaws.com"
else
    S3_WEBSITE_ENDPOINT="$BUCKET_NAME.s3-website-$REGION.amazonaws.com"
fi
echo "S3 Website Endpoint: $S3_WEBSITE_ENDPOINT"

# Set bucket policy for public read access (required for CloudFront to access)
echo "Setting bucket policy for public read access..."
if aws s3api put-bucket-policy --bucket "$BUCKET_NAME" --policy "{
    \"Version\": \"2012-10-17\",
    \"Statement\": [
        {
            \"Sid\": \"PublicReadGetObject\",
            \"Effect\": \"Allow\",
            \"Principal\": \"*\",
            \"Action\": \"s3:GetObject\",
            \"Resource\": \"arn:aws:s3:::$BUCKET_NAME/*\"
        }
    ]
}" --region "$REGION"; then
    echo "Bucket policy applied successfully."
else
    echo "Error: Failed to apply bucket policy. This might be due to 'Block Public Access' settings on your bucket."
    echo "Please ensure 'Block all public access' is disabled for this bucket in the AWS S3 console under Permissions -> Block public access (bucket settings)."
    exit 1
fi

# Sync files to S3 (includes presentation/ which was copied into export above)
echo "Uploading site to S3..."
aws s3 sync "$DOCS_DIR" "s3://$BUCKET_NAME" --delete --region "$REGION"

# --- CloudFront Distribution Setup ---

echo "Configuring CloudFront distribution for HTTPS..."

# Construct CloudFront distribution configuration
CF_CONFIG_TEMPLATE=$(cat <<EOF
{
    "CallerReference": "$(date +%s)",
    "Comment": "CloudFront distribution for S3 static website $BUCKET_NAME",
    "DefaultCacheBehavior": {
        "TargetOriginId": "S3-Website-Origin-$BUCKET_NAME",
        "ViewerProtocolPolicy": "redirect-to-https",
        "AllowedMethods": {
            "Quantity": 2,
            "Items": ["GET", "HEAD"]
        },
        "Compress": true,
        "ForwardedValues": {
            "QueryString": false,
            "Cookies": {"Forward": "none"},
            "Headers": {"Quantity": 0}
        },
        "MinTTL": 0,
        "DefaultTTL": 86400,
        "MaxTTL": 31536000
    },
    "Origins": {
        "Quantity": 1,
        "Items": [
            {
                "Id": "S3-Website-Origin-$BUCKET_NAME",
                "DomainName": "$S3_WEBSITE_ENDPOINT",
                "CustomHeaders": {"Quantity": 0},
                "OriginPath": "",
                "CustomOriginConfig": {
                    "HTTPPort": 80,
                    "HTTPSPort": 443,
                    "OriginProtocolPolicy": "http-only",
                    "OriginSslProtocols": {"Quantity": 1, "Items": ["TLSv1.2"]}
                }
            }
        ]
    },
    "Enabled": true,
    "IsIPV6Enabled": true,
    "PriceClass": "PriceClass_100",
    "ViewerCertificate": {
        "CloudFrontDefaultCertificate": true
    },
    "Restrictions": {
        "GeoRestriction": {
            "RestrictionType": "none",
            "Quantity": 0,
            "Items": []
        }
    }
}
EOF
)

# Add custom domain and ACM certificate if provided
if [ -n "$CUSTOM_DOMAIN" ]; then
    echo "Adding custom domain $CUSTOM_DOMAIN to CloudFront distribution..."
    CF_CONFIG_TEMPLATE=$(echo "$CF_CONFIG_TEMPLATE" | jq ".Aliases.Quantity = 1 | .Aliases.Items = [\"$CUSTOM_DOMAIN\"]")
    CF_CONFIG_TEMPLATE=$(echo "$CF_CONFIG_TEMPLATE" | jq ".ViewerCertificate.CloudFrontDefaultCertificate = false")
    CF_CONFIG_TEMPLATE=$(echo "$CF_CONFIG_TEMPLATE" | jq ".ViewerCertificate.ACMCertificateArn = \"$ACM_CERTIFICATE_ARN\"")
    CF_CONFIG_TEMPLATE=$(echo "$CF_CONFIG_TEMPLATE" | jq ".ViewerCertificate.SSLSupportMethod = \"sni-only\"")
    CF_CONFIG_TEMPLATE=$(echo "$CF_CONFIG_TEMPLATE" | jq ".ViewerCertificate.MinimumProtocolVersion = \"TLSv1.2_2021\"")
    echo "Ensure ACM_CERTIFICATE_ARN ($ACM_CERTIFICATE_ARN) is in us-east-1 region and covers $CUSTOM_DOMAIN."
fi

# Check if a CloudFront distribution already exists for this S3 bucket (by checking comment)
CF_DISTRIBUTION_ID=""
EXISTING_DISTS=$(aws cloudfront list-distributions --query "DistributionList.Items[?Comment=='CloudFront distribution for S3 static website $BUCKET_NAME'].Id" --output text)

if [ -n "$EXISTING_DISTS" ]; then
    CF_DISTRIBUTION_ID=$(echo "$EXISTING_DISTS" | awk '{print $1}') # Get the first ID if multiple
    echo "Existing CloudFront distribution found: $CF_DISTRIBUTION_ID."

    if [ -n "$CUSTOM_DOMAIN" ]; then
        echo "Updating distribution config (custom domain provided)..."
        # Fetch existing config and merge in alias + cert changes so we don't drop existing settings
        EXISTING_CFG=$(aws cloudfront get-distribution-config --id "$CF_DISTRIBUTION_ID" --output json)
        ETAG=$(echo "$EXISTING_CFG" | jq -r ".ETag")
        MERGED_CFG=$(echo "$EXISTING_CFG" | jq ".DistributionConfig
            | .Aliases.Quantity = 1
            | .Aliases.Items = [\"$CUSTOM_DOMAIN\"]
            | .ViewerCertificate = {
                CloudFrontDefaultCertificate: false,
                ACMCertificateArn: \"$ACM_CERTIFICATE_ARN\",
                SSLSupportMethod: \"sni-only\",
                MinimumProtocolVersion: \"TLSv1.2_2021\"
            }")
        aws cloudfront update-distribution \
            --id "$CF_DISTRIBUTION_ID" \
            --distribution-config "$MERGED_CFG" \
            --if-match "$ETAG" \
            --output json > /dev/null
        echo "CloudFront distribution update initiated. This can take 10-20 minutes to deploy."
    else
        echo "Skipping distribution config update — bucket/origin unchanged. Invalidating cache instead..."
        aws cloudfront create-invalidation \
            --distribution-id "$CF_DISTRIBUTION_ID" \
            --paths "/*" \
            --output json > /dev/null
        echo "CloudFront cache invalidation requested for /*."
    fi
else
    echo "No existing CloudFront distribution found. Creating a new one..."
    CF_CREATE_RESULT=$(aws cloudfront create-distribution \
        --distribution-config "$CF_CONFIG_TEMPLATE" \
        --output json)
    CF_DISTRIBUTION_ID=$(echo "$CF_CREATE_RESULT" | jq -r ".Distribution.Id")
    echo "CloudFront distribution creation initiated (ID: $CF_DISTRIBUTION_ID). This can take 10-20 minutes to deploy."
fi

echo ""
echo "Deployment complete!"
if [ -n "$CLOUDFRONT_DOMAIN_NAME" ]; then
    if [ -n "$CUSTOM_DOMAIN" ]; then
        echo "Website URL (via Custom Domain HTTPS): https://$CUSTOM_DOMAIN"
        echo "Please ensure you have configured your DNS records (CNAME) to point $CUSTOM_DOMAIN to $CLOUDFRONT_DOMAIN_NAME."
    else
        echo "Website URL (via CloudFront HTTPS): https://$CLOUDFRONT_DOMAIN_NAME"
    fi
else
    echo "CloudFront distribution is being deployed. You can find its domain name in the AWS CloudFront console."
    echo "CloudFront Distribution ID: $CF_DISTRIBUTION_ID"
fi
echo ""
echo "Note: CloudFront deployments can take 10-20 minutes to propagate globally. Your website will be accessible via HTTPS once deployed."