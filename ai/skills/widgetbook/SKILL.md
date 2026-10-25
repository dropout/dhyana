---
name: widgetbook
description: "Create and maintain Flutter Widgetbook use cases in this Dhyana monorepo. Use when adding a Widgetbook use case, previewing a Flutter widget, wiring Widgetbook knobs, mocking GetIt or Bloc dependencies, handling localization, displaying modal bottom sheets, or previewing storage-backed images locally."
license: MIT
---

# Dhyana Widgetbook

## Scope

Widgetbook lives in `apps/widgetbook`. Use cases are under `apps/widgetbook/lib/use_case/` and are discovered from `@widgetbook.UseCase` annotations. The Widgetbook app uses code generation both `main.dart` and the use case files; Run project specific code generation after adding or removing use cases or editing annotation in `main.dart`.

## Before Editing

1. Read the target widget constructor and its immediate child widgets.
2. Check whether the widget is exported from its package barrel:
   - Prefer `package:<module>/<module>.dart` for public APIs.
   - Import `package:<module>/src/...` only when previewing an internal presentation widget that is not exported.
3. Inspect required models and use their real constructors or `Profile.anonymous()` plus `copyWith` for fixtures.
4. Check `apps/widgetbook/lib/main.dart` only when the target needs shared services, themes, localization, or a mock not covered below.

Do not search or open neighboring use-case files just to rediscover formatting, imports, annotation shape, or fixture conventions. The templates and rules in this skill are the source of truth. Inspect another case only when the target has a dependency or interaction pattern not documented here.

## Use Case Shape

Create one file per use case under `apps/widgetbook/lib/use_case/<module>/`. Use the public module barrel for public widgets and models; internal presentation widgets require the file-level `implementation_imports` ignore and an import from `src/`.

Use this template as the default:

```dart
// Include only when importing an internal package implementation:
// ignore_for_file: implementation_imports

import 'package:material_ui/material_ui.dart';
import 'package:module/module.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: ExampleWidget,
  path: '[Module]/public/view/',
)
Widget buildExampleWidget(BuildContext context) {
  final value = context.knobs.int.slider(
    label: 'Value',
    initialValue: 10,
    min: 0,
    max: 100,
  );

  return Center(child: ExampleWidget(value: value));
}
```

For an internal widget, import its `src` file and use a matching path such as `[Module]/internal/view/`. Keep the path category and module capitalization consistent with this template; Widgetbook generates the navigation tree from these annotations.

Keep fixtures deterministic where possible. Add knobs for meaningful visual states, not every constructor argument. Use `Center`, `Padding`, and bounded constraints when a component needs a stable preview size; use `SingleChildScrollView` for tall screens or content that changes with knobs.

## Standard Fixtures

- Profile screen/view: start with `Profile.anonymous().copyWith(...)`; set a stable `id`, desired name/settings, and a non-empty `ProfileStatsReport` when showcasing statistics. A `Show stats` boolean knob is useful when the widget has a stats visibility branch.
- Profile image/avatar: use a deterministic `profileId` and, when previewing the image state, pass an `AssetImage` through the widget's `ImageProvider` parameter. Do not use an asset key as a storage URL.
- Models with defaults: use their real public constructors and override only values visible in the preview. Avoid fakes or adding test-only fixture dependencies to Widgetbook.
- Knobs: use labels meaningful to a designer, sensible initial values, and bounded ranges for numeric sliders.

## Localization and Theme

`Widgetbook.material` uses `LocalizationAddon` in `apps/widgetbook/lib/main.dart`. Keep the app-level delegates complete:

```dart
localizationsDelegates: [
  GlobalMaterialLocalizations.delegate,
  ...CoreLocalizations.localizationsDelegates,
  ...TimerLocalizations.localizationsDelegates,
  ...SessionLocalizations.localizationsDelegates,
]
```

A use case normally inherits this setup. If a modal route is created on a navigator outside the addon's `Localizations` subtree, a child-level `Localizations.override` is insufficient for framework-created modal chrome. For a faithful modal preview, create a small local `MaterialApp` with the required delegates and call `showModalBottomSheet` with `useRootNavigator: false` on its local navigator.

When opening a modal automatically, schedule it after the first frame. Prevent hot reload/rebuilds from stacking sheets:

```dart
WidgetsBinding.instance.addPostFrameCallback((_) {
  if (Navigator.of(context).canPop()) return;

  showModalBottomSheet(
    context: context,
    enableDrag: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    useRootNavigator: false,
    builder: (context) => ExampleView(),
  );
});
```

Avoid wrapping a use case in a second `MaterialApp` unless it needs its own navigator/route scope. A redundant app can hide Widgetbook's inherited localization and theme behavior.

## Modal Bottom Sheets

To reproduce production overlay behavior, match the project's `DefaultOverlayService` settings:

- `enableDrag: false` where the production input uses it.
- `isScrollControlled: true`.
- `backgroundColor: Colors.transparent`.
- `shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)`.
- `useRootNavigator: false` inside the local Widgetbook `MaterialApp`.

Use the real `showModalBottomSheet` route when route behavior matters. Use a bottom-aligned static widget only when the use case is intended to show layout without animation or scrim.

## Mocking GetIt and Bloc Dependencies

A `BlocProvider` around a use case does not intercept a widget that calls `GetIt.instance.get<C>()` internally. Override the GetIt registration instead.

For a factory-created cubit, register a fresh mock factory during Widgetbook startup, not inside the use-case builder. This avoids global registration churn on rebuilds and hot reload:

```dart
class _MockPresenceCubit extends MockCubit<PresenceState>
    implements PresenceCubit {}

void configurePresenceCubitForUseCase() {
  final getIt = GetIt.instance;
  if (getIt.isRegistered<PresenceCubit>()) {
    getIt.unregister<PresenceCubit>();
  }

  getIt.registerFactory<PresenceCubit>(() {
    final cubit = _MockPresenceCubit();
    const state = PresenceState.loaded(presenceList: []);
    whenListen(cubit, Stream.value(state), initialState: state);
    when(() => cubit.loadPresenceData(
      ownProfileId: any(named: 'ownProfileId'),
      limit: any(named: 'limit'),
      windowSize: any(named: 'windowSize'),
    )).thenAnswer((_) async {});
    return cubit;
  });
}
```

For cubits obtained from the widget tree, follow the existing pattern with `MockCubit`, `BlocProvider.value`, and `MultiBlocProvider`. Mock both state and callbacks used during the preview. Do not manually close a shared singleton mock; let the provider lifecycle own factory-created instances.

## Storage-Backed Images

`ResourceResolver.resolveStoragePath` returns a URL string, and `AppCachedNetworkImage` passes that result to `CachedNetworkImageProvider`. Returning a Flutter asset key from the resolver does not make it load as an asset; it is still treated as a network URL.

The preferred long-term API is to add an optional `ImageProvider` to `AppCachedNetworkImage` and use it before the resolver path:

```dart
final ImageProvider? imageProvider;

// Widgetbook preview:
const AssetImage('images/example.jpg', package: 'assets')
```

Keep the production resolver path unchanged. If modifying the shared widget is not appropriate, use a test-only wrapper or a mock resolver that returns a real reachable URL. Do not overload storage-path strings with `asset://` conventions unless the image widget explicitly supports and parses them.

The Widgetbook service mock is configured in `configureServicesForUseCase()` in `main.dart`. It commonly returns `Assets.avatarPlaceholder` for resolver calls, which is useful for placeholder-only states but is not a valid `CachedNetworkImageProvider` URL.

## Fixture Patterns

- Use public Freezed models directly when possible.
- Use `Profile.anonymous().copyWith(statsReport: ...)` for profile statistics views.
- Construct `Session` with deterministic `startTime`, `endTime`, `duration`, and `SessionType`.
- For list/grid history items, import the internal view directly if it is not exported, but keep the fixture model public.
- For white completion-screen content, use a dark `ColoredBox` so the preview has the same contrast as the app.
- Disable optional presence/stats branches when the use case is only intended to preview the base result. If exercising presence, provide a GetIt `PresenceCubit` factory mock.

## Validation

After adding a use case:

1. Run the editor diagnostics or `flutter analyze` for the changed file.
2. Run from `apps/widgetbook`:

```bash
dart run build_runner build
```

3. If generated output fails because of stale outputs in another package, run `flutter analyze` separately and report the unrelated generator failure instead of changing generated files blindly.

Do not commit generated files manually unless the repository's normal build process produces them as tracked outputs.
