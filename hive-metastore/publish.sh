#!/bin/bash

set -euo pipefail

# Učitaj varijable iz .env.local
set -a
source .env.local
set +a

# Finalni naziv imagea
IMAGE_ID="ghcr.io/${GITHUB_USER}/${REPO_NAME}/${IMAGE_NAME}:${IMAGE_TAG}"

echo "🔐 Logging in to GHCR..."
echo "${GHCR_PAT}" | docker login ghcr.io -u "${GITHUB_USER}" --password-stdin

echo "🏷  Tagging image as ${IMAGE_ID} ..."
docker tag "${IMAGE_NAME}:${IMAGE_TAG}" "${IMAGE_ID}"

echo "🚀 Pushing to GHCR..."
docker push "${IMAGE_ID}"

echo "✅ Done! Image pushed: ${IMAGE_ID}"

