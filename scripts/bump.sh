#!/usr/bin/env bash
# Point Casks/sulsul.rb at a published Sulsul release.
# Usage: scripts/bump.sh <version>     e.g. scripts/bump.sh 5.0.1
# Downloads the release DMG, records its SHA-256 and rewrites version and sha256.
# It does not commit or push.

set -euo pipefail

if [[ $# -ne 1 || ! "$1" =~ ^[0-9]+(\.[0-9]+)+$ ]]; then
    echo "usage: $0 <version>   (for example 5.0.1)" >&2
    exit 2
fi

VERSION="$1"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CASK="$ROOT/Casks/sulsul.rb"
URL="https://github.com/qaws81877/sulsul/releases/download/v${VERSION}/Sulsul.dmg"

WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

echo "Downloading $URL"
curl --fail --location --silent --show-error --output "$WORK/Sulsul.dmg" "$URL"
SHA="$(shasum -a 256 "$WORK/Sulsul.dmg" | awk '{print $1}')"

sed -E -i '' \
    -e "s/^  version \".*\"/  version \"${VERSION}\"/" \
    -e "s/^  sha256 \".*\"/  sha256 \"${SHA}\"/" \
    "$CASK"

echo "version ${VERSION}"
echo "sha256  ${SHA}"
git -C "$ROOT" diff --stat -- "$CASK"
