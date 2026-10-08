---
name: Create Screen With Route
description: "Create a new screen (Screen + content widget + cubit/state + typed route + DI + l10n) inside a Dhyana feature module under packages/modules. Use when adding a screen to an existing module."
argument-hint: "e.g. 'ProfileBadgesScreen in profile, param profileId, loads badges'"
agent: agent
---

Create a new screen in an existing Dhyana module. Follow `ai/skills/presentation-cubit` (primary) and the layer skills it references.

Inputs (ask once, together, if missing):
- Module (e.g. `packages/modules/profile`). If the module doesn't exist, stop and use `ai/skills/module-scaffold`.
- Screen name in PascalCase ending with `Screen` (e.g. `ProfileBadgesScreen`).
- Route parameters (e.g. `profileId`) and whether the screen needs authentication.
- Data the screen shows or actions it performs. If none yet, create a static placeholder body and no cubit.

Pre-checks (stop and tell the user before changing anything):
- A file for the screen, route class or cubit with the same name already exists.
- The screen needs data from another module that has no public API/port.

Create/update, all inside the module:
1. **Screen**: `lib/src/presentation/view/screen/<snake_name>_screen.dart`
   - `<Name>Screen` provides the cubit via `BlocProvider` + `GetIt` (only place `GetIt` is allowed); body in `<Name>ScreenContent`.
   - Render with an exhaustive `switch` on the sealed state; use `DefaultScreenSetup` (+ `.loading` / `.error`) from core; imports `material_ui`.
   - Title and all text from `<Module>Localizations.of(context)`; add keys to `lib/l10n/<m>_en.arb` and `<m>_hu.arb`; run `flutter gen-l10n`.
   - Add a stable `Key` on the root.
2. **Cubit + state** (when the screen has data/actions): `lib/src/presentation/viewmodel/<snake_name>_cubit.dart` with a freezed sealed state (`initial/loading/loaded/error`), crashlytics error handling, constructor-injected interfaces. Register with `registerFactory` in `lib/src/<m>_di.dart`.
3. **Route**: add to `lib/src/<m>_routes.dart`:
   - `@TypedGoRoute<<Base>Route>(path: '/<camelCasePath>[/:param]', name: '<UPPER_SNAKE>')`
   - `class <Base>Route extends GoRouteData with AuthRedirectHook, $<Base>Route`, `build` returns the screen, `redirect` calls `authRedirectHook(context, state)` (omit the hook for public screens).
   - Don't edit `*.g.dart`; run `dart run build_runner build --delete-conflicting-outputs` in the package.
4. **Wiring**: the barrel already exports `src/<m>_routes.dart`, and the app router spreads `...$<m>Routes`. If the module has no routes yet, follow `ai/skills/module-scaffold` section 5. If other modules must navigate here, add it to the module's navigator/public API instead of exposing the screen.
5. **Tests**: `bloc_test` for the cubit and a widget test for loading/loaded/error under `test/presentation/`. Add a Widgetbook use case if the module has them (`ai/skills/widgetbook`).

Rules:
- Match existing import order and formatting of the module; don't touch unrelated routes or screens.
- Public/other-module access goes through the public API only; no `src/` imports across packages.
- Comments: one sentence max, explain why only.

Finish with `ai/skills/verify-package` for the module.

Report:
- New files, updated files
- Route class, path and name
- l10n keys added
- Verification results
