---
name: module-scaffold
description: Create a new feature module (package) in the Dhyana monorepo and wire it into the workspace, app DI, router, localization and Widgetbook. Use when adding a new module under packages/modules or a new top-level package.
---

# Module scaffold

Before scaffolding, confirm the module is justified and decide its place in the hierarchy: higher-level modules may depend on lower-level ones, never the reverse; `core` depends on nothing. Cross-module needs go through the other module's public API or a port (see `domain-layer`, `data-boundary`).

Layer details: `domain-layer`, `data-layer` (+ sub-skills), `presentation-cubit`.

## 1. Folder layout

Reference: `packages/modules/profile`. Practice sub-modules live under `packages/modules/practice/<name>`.

```
packages/modules/<m>/
  pubspec.yaml
  analysis_options.yaml
  l10n.yaml
  README.md  CHANGELOG.md  LICENSE
  lib/
    <m>.dart                    # barrel: public surface only
    l10n/<m>_en.arb  <m>_hu.arb # generated *_localizations*.dart are committed
    src/
      <m>_di.dart
      <m>_routes.dart           # only if the module has screens
      domain/{entity,repository,port,service,usecase,enum}/
      data/{datasource,repository,mapper,service}/
      presentation/{view,viewmodel}/
      public/{api,model,view,viewmodel}/
  test/
    <m>_mock_definitions.dart
    <m>_test_helper.dart
    {domain,data,presentation,public}/
```

Create only the folders you need now.

## 2. pubspec.yaml

Copy from `profile`, keep the `resolution: workspace` line, `publish_to: none`, `version: 0.0.1`, `sdk: ^3.13.1`. Include only dependencies actually used.
- Always: `flutter`, `flutter_localizations` (if l10n), `intl`, `core: ^0.0.1`, `get_it`, `flutter_bloc`, `freezed_annotation`, `json_annotation`, `material_ui` (if UI), `go_router` + `go_router_builder` (if routes).
- Dev: `flutter_test`, `flutter_lints`, `build_runner`, `freezed`, `json_serializable`, `bloc_test`, `mocktail`.
- Depend on another module (`auth: ^0.0.1`) only if it is lower in the hierarchy. No cycles.

`analysis_options.yaml` and `l10n.yaml`: copy from `profile`, change the names:
```yaml
arb-dir: lib/l10n
template-arb-file: <m>_en.arb
output-localization-file: <m>_localizations.dart
output-class: <M>Localizations
nullable-getter: false
```

## 3. Barrel `lib/<m>.dart`

Export only what other packages need: `l10n/<m>_localizations.dart`, `src/<m>_di.dart`, `src/<m>_routes.dart`, `src/public/**`. Never export `domain/`, `data/` or `presentation/`.

## 4. DI skeleton

```dart
extension <M>ModuleDependencyInjection on GetIt {
  void register<M>ModuleDependencies() {
    // 1. Navigators / platform services
    // 2. Data providers -> repositories
    // 3. Domain services -> use cases
    // 4. Cubits (registerFactory)
    // 5. Public API
  }
}
```

Order and registration styles: `data-layer` and `presentation-cubit`.

## 5. Wire the module in (all required)

1. Root `pubspec.yaml` -> `workspace:` list: add the package path.
2. `apps/mobile_app/pubspec.yaml`: add `<m>: ^0.0.1`.
3. `apps/mobile_app/lib/bootstrap/app_di.dart`: import `package:<m>/<m>.dart` and call `register<M>ModuleDependencies()` after every module it depends on.
4. `apps/mobile_app/lib/bootstrap/initializer.dart`: add `...$<m>Routes` to `GoRouter.routes` (only if routes exist).
5. `apps/mobile_app/lib/app.dart`: add `<M>Localizations.delegate` to `localizationsDelegates` (only if l10n exists).
6. `apps/widgetbook/pubspec.yaml`: add the dependency if the module exposes widgets/screens to document.
7. `AGENTS.md` repository layout: add the module line.

Do not skip a step silently: a missing delegate or DI call fails only at runtime.

## 6. Bootstrap and verify

```
melos bootstrap          # resolves workspace, runs codegen
melos run codegen:l10n
cd packages/modules/<m> && flutter analyze && flutter test
```
Then follow `verify-package`, plus run the app-level analyze since steps 3-5 touch `apps/mobile_app`.

## 7. Pitfalls

- Firebase flavor config files are needed to run the app, not to analyze/test packages.
- `.freezed.dart` / `.g.dart` are generated; if analysis reports missing parts, run `melos run codegen` rather than editing.
- Generated l10n Dart files exist in the repo (`lib/l10n/*_localizations*.dart`); regenerate after changing `.arb` files.
- Keep `.arb` keys identical in `en` and `hu`.
- The `dhyana_lints` `domain_layer_isolation` rule matches `/lib/modules/**/domain/`, but real paths are `packages/modules/<m>/lib/src/domain/`, so it likely never fires. Don't rely on it; check domain imports manually (`verify-package`).
- `docs/commands.md` references `support/maintenance_scripts/check_module_boundaries.sh`, which does not exist in the repo.

## 8. Checklist

- [ ] Placement in the hierarchy justified; no dependency cycle.
- [ ] Package created from the `profile` template; names replaced.
- [ ] Barrel exports only the public surface.
- [ ] Workspace, app pubspec, `app_di`, router, l10n delegate (and Widgetbook) wired.
- [ ] `melos bootstrap` + codegen succeed; package analyze and tests pass.
- [ ] AGENTS.md layout updated.
