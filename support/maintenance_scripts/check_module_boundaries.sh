#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT_DIR"

if [[ ! -d "lib/modules" ]]; then
  echo "No lib/modules directory found. Skipping module boundary checks."
  exit 0
fi

echo "Checking module boundaries in lib/modules..."

violations=0

while IFS= read -r file; do
  source_module="$(sed -nE 's#^lib/modules/([^/]+)/.*#\1#p' <<< "$file")"
  [[ -z "$source_module" ]] && continue

  while IFS= read -r match; do
    line_no="${match%%:*}"
    content="${match#*:}"

    imported_path="$(sed -nE "s#.*['\"]package:dhyana/modules/([^'\"]+)['\"].*#\1#p" <<< "$content")"
    [[ -z "$imported_path" ]] && continue

    target_module="${imported_path%%/*}"
    remaining="${imported_path#*/}"
    target_layer="${remaining%%/*}"

    if [[ "$source_module" != "$target_module" ]] && [[ "$target_layer" == "presentation" || "$target_layer" == "data" ]]; then
      ((violations+=1))
      echo "Violation: $file:$line_no imports forbidden module internals -> package:dhyana/modules/$imported_path"
    fi
  done < <(grep -nE "import ['\"]package:dhyana/modules/.+['\"];" "$file" || true)
done < <(find lib/modules -type f -name '*.dart' | sort)

if [[ "$violations" -gt 0 ]]; then
  echo ""
  echo "Found $violations module boundary violation(s)."
  echo "Allowed cross-module imports: domain contracts or explicit public API files only."
  echo "Forbidden cross-module imports: presentation/* and data/* internals."
  exit 1
fi

echo "Module boundary check passed."
