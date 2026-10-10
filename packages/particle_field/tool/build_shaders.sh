#!/usr/bin/env bash
# Rebuilds the Flutter GPU shader bundle. Run after editing shaders/*.
set -euo pipefail
cd "$(dirname "$0")/.."

FLUTTER="$(readlink -f "$(command -v flutter)")"
ENGINE="$(dirname "$FLUTTER")/cache/artifacts/engine"
IMPELLERC="$(ls "$ENGINE"/*/impellerc | head -n 1)"
MANIFEST="$(python3 -c 'import json,sys; print(json.dumps(json.load(open("shaders/particle.shaderbundle.json"))))')"

mkdir -p assets
"$IMPELLERC" \
  --sl=assets/particle.shaderbundle \
  --shader-bundle="$MANIFEST" \
  --include=shaders \
  --include="$(dirname "$IMPELLERC")/shader_lib"
