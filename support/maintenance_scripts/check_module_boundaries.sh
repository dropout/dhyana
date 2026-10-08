#!/usr/bin/env bash
# Checks Clean Architecture boundaries of feature modules. Usage: check_module_boundaries.sh [module_dir...]
set -u
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT" || exit 2

if [ "$#" -gt 0 ]; then
  MODULES=("$@")
else
  MODULES=()
  for pubspec in packages/modules/*/pubspec.yaml packages/modules/practice/*/pubspec.yaml; do
    [ -f "$pubspec" ] && MODULES+=("$(dirname "$pubspec")")
  done
fi

FAIL=0
report() { echo "FAIL [$1] $2"; FAIL=1; }

for dir in "${MODULES[@]}"; do
  dir="${dir%/}"
  [ -d "$dir/lib/src" ] || continue
  name="$(basename "$dir")"
  src="$dir/lib/src"

  # Domain may import dart:, pure packages, core, its own domain, and other modules only inside ports (flutter/foundation tolerated).
  if [ -d "$src/domain" ]; then
    while IFS= read -r hit; do
      file="${hit%%:*}"
      case "$file" in */domain/port/*|*_port.dart) continue ;; esac
      report domain-isolation "$hit"
    done < <(grep -rnE "^import 'package:(flutter_[a-z_]+|cloud_firestore|firebase_[a-z_]+|drift|go_router|get_it|material_ui)[/']|^import 'package:flutter/(material|widgets|cupertino)\\.dart'|^import 'package:$name/src/(data|presentation|public)/" "$src/domain" --include=*.dart)
    while IFS= read -r hit; do
      file="${hit%%:*}"
      case "$file" in */domain/port/*|*_port.dart) continue ;; esac
      report domain-cross-module "$hit"
    done < <(grep -rnE "^import 'package:(auth|donate|home|profile|social|stats|timer|session|chanting|app_events)/" "$src/domain" --include=*.dart | grep -v "package:$name/")
  fi

  # Cross-package src imports.
  while IFS= read -r hit; do report cross-package-src "$hit"; done \
    < <(grep -rnE "^(import|export) 'package:[a-z_0-9]+/src/" "$dir/lib" --include=*.dart \
        | grep -v "package:$name/src/" | grep -v "\.g\.dart\|\.freezed\.dart")

  # Data must not know presentation.
  if [ -d "$src/data" ]; then
    while IFS= read -r hit; do report data-to-presentation "$hit"; done \
      < <(grep -rnE "^import 'package:$name/src/presentation/" "$src/data" --include=*.dart)
  fi

  # Public API must not expose entities.
  if [ -d "$src/public" ]; then
    while IFS= read -r hit; do report public-entity-leak "$hit"; done \
      < <(grep -rnE "^(import|export) 'package:$name/src/domain/entity/" "$src/public" --include=*.dart)
  fi

  # Barrel must not export internal layers.
  barrel="$dir/lib/$name.dart"
  if [ -f "$barrel" ]; then
    while IFS= read -r hit; do report barrel-export "$hit"; done \
      < <(grep -nE "^export 'src/(domain|data|presentation)/" "$barrel")
  fi
done

if [ "$FAIL" -eq 0 ]; then echo "OK: no module boundary violations"; fi
exit "$FAIL"
