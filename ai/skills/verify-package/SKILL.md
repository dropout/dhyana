---
name: verify-package
description: Verify changes in one Dhyana package - codegen, format, analyze, tests and layer/boundary import checks - with the smallest commands that cover the change. Use after editing a module or before handing work to review.
---

# Verify a package

Scope verification to the packages you changed. Run from the package directory unless stated.

## 1. Commands (in order)

| Step | When | Command |
|---|---|---|
| Codegen | freezed/json/routes/DI-annotated files changed | `dart run build_runner build --delete-conflicting-outputs` |
| Localization | `.arb` changed | `flutter gen-l10n` |
| Format | always | `dart format --line-length 120 lib test` |
| Analyze | always | `flutter analyze` |
| Tests | always | `flutter test` (single file: `flutter test test/path/x_test.dart`) |
| Dependents | public API / barrel / core changed | `flutter analyze` in each dependent package (grep pubspecs for the name) and in `apps/mobile_app` |

Workspace-wide (slow; use for core changes or before a PR): `melos run codegen`, `melos run analyze`, `melos run test`.

If tests fail only in a package you didn't touch, re-run once on a clean tree to separate pre-existing failures from yours; report them without fixing.

## 2. Boundary checks (manual, via grep)

Replace `<m>` with the module dir.

- **Domain isolation:** `grep -rn "^import" packages/modules/<m>/lib/src/domain` must show only: `dart:*`, pure packages, `package:core/core.dart`, `package:<m>/src/domain/...`, and another module's public API only inside `domain/port/`. No `flutter`, `cloud_firestore`, `firebase_*`, `drift`, `data/`, `presentation/`.
- **No cross-module `src`:** `grep -rn "package:[a-z_]*/src/" packages/modules/<m>/lib | grep -v "package:<m>/src/"` must be empty (core's `src` is also off-limits; use `package:core/core.dart`).
- **Data -> presentation:** `grep -rn "presentation" packages/modules/<m>/lib/src/data` must be empty.
- **Presentation -> data:** presentation may import data only for mappers (`data/mapper`); no repositories/providers/services implementations.
- **Public leakage:** `grep -rn "domain/entity" packages/modules/<m>/lib/src/public` must be empty (public models only), and the barrel must not export `domain/`, `data/`, `presentation/`.
- **GetIt:** `grep -rn "GetIt" packages/modules/<m>/lib/src` should hit only `*_di.dart`, `Screen` widgets and legacy files.
- **Hardcoded strings:** new user-facing text in widgets must be in `.arb` files.

Known false results: the `dhyana_lints` domain isolation rule is path-mismatched and does not fire; `docs/commands.md` mentions a non-existent `check_module_boundaries.sh`. Don't treat a clean lint run as proof of isolation.

## 3. Layer-specific tests expected

- Domain: unit tests per use case/service with mocked repositories/ports (`test/domain/`).
- Data: repository/provider/mapper tests (`test/data/`), fakes for SDKs.
- Presentation: `bloc_test` for cubits, widget tests for loading/loaded/error (`test/presentation/`).
- Public API: `test/public/`.

Details: `domain-layer`, `data-layer`, `presentation-cubit`.

## 4. Report format

Return concisely: packages checked, commands run with pass/fail, boundary-check findings (file:line), pre-existing failures (separately), and anything not run with the reason.

## 5. Checklist

- [ ] Codegen current (no stale `.freezed.dart`/`.g.dart`).
- [ ] Format, analyze, tests pass in each changed package.
- [ ] Dependents analyzed when public surface changed.
- [ ] Boundary greps clean.
- [ ] Pre-existing failures reported, not fixed.
