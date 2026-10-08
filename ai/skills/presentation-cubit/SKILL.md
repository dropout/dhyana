---
name: presentation-cubit
description: Create or modify the presentation layer of a Dhyana module - Cubits (viewmodels), freezed states, screens, typed go_router routes and cubit DI registration. Use when adding a screen, a cubit/state, a route, or changing how UI talks to use cases, repositories or public APIs.
---

# Presentation layer (Cubit + passive UI)

Flow: `Screen -> Cubit -> UseCase / Service / Repository / PublicApi -> Data`.
Widgets render state and forward user intent. They contain no business logic.
Related skills: `domain-layer` (use cases, entities), `data-boundary` (public API, mappers), `widgetbook`, `flutter-localization-extraction`.

## 1. Layout and visibility

```
packages/modules/<m>/lib/src/
  presentation/
    view/            # screens + widgets private to the module
    viewmodel/       # private cubits + states
  public/
    viewmodel/       # cubits other modules/app consume (e.g. ProfileCubit)
    view/            # widgets other modules embed
  <m>_routes.dart    # typed go_router routes
  <m>_di.dart        # DI (see below)
```

- Default to `presentation/`. Put a cubit/widget in `public/` only if another module or the app shell needs it.
- Public cubits expose **public models only** (`src/public/model`), never entities.
- Private cubits may use entities and the data-layer mappers (`toApi()` / `toDomain()`), as long as the viewmodel is not exported.
- Never import another module's `src/`. Use its public API / barrel.

## 2. State

Use a freezed sealed class, one concrete class per state, explicit and immutable:

```dart
part 'delete_profile_cubit.freezed.dart';

@freezed
sealed class DeleteProfileState with _$DeleteProfileState {
  const DeleteProfileState._();
  const factory DeleteProfileState.initial() = DeleteProfileInitialState;
  const factory DeleteProfileState.loading() = DeleteProfileLoadingState;
  const factory DeleteProfileState.completed() = DeleteProfileCompletedState;
  const factory DeleteProfileState.error() = DeleteProfileErrorState;
}
```

- Factory names: `initial`, `loading`, `loaded(...)`, `completed`, `error`. Bind each to a named class `<Feature><Name>State` so screens can `switch` exhaustively.
- Do not bind to private `_Initial`-style classes: widgets cannot pattern-match them.
- A single-shape state (no status variants) is fine: `@freezed sealed class XState { const factory XState({required ...}) = _XState; }`. Use it for settings-style cubits.
- Keep the state file next to the cubit (same file) unless it is shared.
- Prefer `@freezed sealed class` over the legacy `@freezed class` form.

## 3. Cubit

```dart
class DeleteProfileCubit extends Cubit<DeleteProfileState> with LoggerMixin {
  final DeleteProfileUseCase deleteProfileUseCase;
  final CrashlyticsService crashlyticsService;

  DeleteProfileCubit({
    required this.deleteProfileUseCase,
    required this.crashlyticsService,
  }) : super(const DeleteProfileState.initial());

  Future<void> deleteProfile(String profileId) async {
    emit(const DeleteProfileState.loading());
    try {
      await deleteProfileUseCase.execute(profileId);
      emit(const DeleteProfileState.completed());
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to delete profile',
      );
      emit(const DeleteProfileState.error());
    }
  }
}
```

Rules:
- `extends Cubit<State> with LoggerMixin`. Use `Bloc` only when events genuinely help (debounce, transformers).
- Dependencies: `final`, named, constructor-injected. Types are interfaces (use cases, repositories, ports, `*PublicApi`, core services). Never call `GetIt` inside a cubit.
- Skip a use case when it would be a one-line pass-through (CRUD, single service call); the cubit may call the repository/service directly. Anything orchestrating more than one dependency or containing rules belongs in a use case.
- Every async action: `try/catch (e, stack)` -> `crashlyticsService.recordError(exception:, stackTrace:, reason:)` -> emit the error state. `reason` is a short human sentence.
- Don't swallow errors silently and don't emit raw exception text to the UI. Localized copy lives in the screen.
- Check `isClosed` before emitting after an `await` on something that can outlive the cubit (streams, timers, long downloads).
- Streams: store `StreamSubscription`s in fields and cancel them in `close()` (`await sub.cancel(); return super.close();`).
- Optional `onComplete` / `onError` callbacks are acceptable for one-shot flows that navigate afterwards (see `ProfileEditCubit`). Prefer a terminal state + `BlocListener` for new code.
- Hydrated settings cubits use `HydratedCubit` with `fromJson`/`toJson` and live in `public/viewmodel` when shared.
- No `BuildContext`, no widgets, no `Navigator`/`GoRouter` in cubits. Navigation from a cubit goes through a navigator port implemented in the data layer (see `data-platform-services`).
- Methods return `Future<void>`/`void`. State is the output; don't return data to the widget.

## 4. Screens

```dart
class DeleteProfileScreen extends StatelessWidget {
  const DeleteProfileScreen({super.key, required this.profileId});
  final String profileId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeleteProfileCubit>(
      create: (_) => GetIt.I.get<DeleteProfileCubit>(),
      child: DeleteProfileScreenContent(profileId: profileId),
    );
  }
}
```

- `Screen` = provider/wiring. `ScreenContent` (or private widgets) = rendering. Cubit actions that must run on creation use cascade in `create:` (`..load()`); parameters go through `GetIt.I.get<X>(param1: ...)` with `registerFactoryParam`.
- `GetIt` is allowed in the `Screen` only. Child widgets use `context.read<XCubit>()`.
- Render with `BlocBuilder` + exhaustive `switch (state)` on the sealed state. Side effects (navigation, snackbars, dialogs) use `BlocListener`/`BlocConsumer`, never `builder`.
- Use `buildWhen`/`BlocSelector` when only a slice of state matters or the builder is expensive.
- Reuse core widgets: `DefaultScreenSetup` (+ `.loading` / `.error`), `AppErrorDisplay`, `AppLoadingDisplay`. UI imports `material_ui` (not `material.dart`).
- Strings: `<Module>Localizations.of(context).key` from `package:<m>/l10n/<m>_localizations.dart`. No hardcoded user-facing text (use `flutter-localization-extraction`).
- Analytics: `context.services.analyticsService.logEvent(...)`. Not inside the cubit unless it is domain-level event tracking.
- Add stable `Key`s to screen roots and key interaction points; tests rely on them.
- Keep `build` free of work: no repository calls, no parsing, no sorting of large lists. Do it in the cubit/mapper.
- Stateful widgets only for ephemeral UI state (controllers, animations, form keys). `initState` may trigger a load only if the cubit is provided above the screen.

## 5. Routes

`<m>_routes.dart`, typed routes with `go_router_builder`:

```dart
part 'profile_routes.g.dart';

@TypedGoRoute<ProfileWizardRoute>(
  path: '/profileWizard/:profileId',
  name: 'PROFILE_WIZARD',
)
class ProfileWizardRoute extends GoRouteData
    with AuthRedirectHook, $ProfileWizardRoute {
  const ProfileWizardRoute({required this.profileId});
  final String profileId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProfileWizardScreen(profileId: profileId);

  @override
  String? redirect(BuildContext context, GoRouterState state) =>
      authRedirectHook(context, state);
}
```

- Path: camelCase segments with `:param` (`/profileSettings/:profileId`); name: UPPER_SNAKE (`PROFILE_SETTINGS`). Path params must match constructor field names.
- One route class per screen, parameters as typed fields (use `$extra` only for non-serializable objects).
- Use `AuthRedirectHook` for authenticated screens.
- Routes are consumed by navigators in the data layer (`<M>Navigator` implementing a port) and by the app shell's router. Register new routes in the app shell route list only through the module's public export.
- Run `melos run codegen` after route/state changes.

## 6. DI registration

In `<m>_di.dart`, on the `GetIt` extension:

```dart
registerFactory<DeleteProfileCubit>(
  () => DeleteProfileCubit(
    deleteProfileUseCase: get<DeleteProfileUseCase>(),
    crashlyticsService: get<CrashlyticsService>(),
  ),
);
```

- Cubits: `registerFactory` (or `registerFactoryParam`). Never singleton, unless it is intentionally app-wide state (hydrated settings, auth) and documented.
- Register after use cases/repositories so lookups resolve at call time. Use `get<T>()` consistently inside the module.
- Interface types for dependencies; the concrete cubit type for registration.

## 7. Testing

- Cubit tests: `bloc_test` + `mocktail`. Mocks live in `test/<m>_mock_definitions.dart`; shared setup in `test/<m>_test_helper.dart`.
- Path mirrors source: `test/presentation/viewmodel/<name>_cubit_test.dart`.
- Per cubit method cover: success emission sequence, failure emission sequence **and** `crashlyticsService.recordError` verification, and `close()` cancelling subscriptions.
- Use `blocTest` with `build`, `act`, `expect`, `verify`. For streams use `StreamController` and close it in teardown. Use `clock`/`withClock` instead of `DateTime.now()` for time.
- Widget tests: `test/presentation/view/`, provide mocked cubits with `BlocProvider.value` (or `MockBloc`/`MockCubit` + `whenListen`), wrap with the localization delegates and mocked `Services`. Cover loading, loaded and error states.
- Add a Widgetbook use case for new screens/widgets (see `widgetbook`).
- Run: `cd packages/modules/<m> && flutter test` then `melos run analyze`.

## 8. Legacy deviations (do not copy)

- `TimerCubit` extends `Cubit<TimerStateEntity>`: the state is a raw domain entity, not a presentation state. It also depends on a data-layer mapper and has a doc typo ("call"). New cubits use their own freezed state.
- `TimerCubit` is constructed with a `TimerSettings` argument and starts work (configures the scheduler, subscribes) in its constructor. Prefer an explicit `start()`/`load()` called from the screen.
- `TimerSettingsHistoryCubit` binds `initial()` to private `_Initial` and uses `@freezed class` rather than `sealed`. It also depends on the repository and another cubit (`TimerSettingsCubit`) directly. Cubit-to-cubit dependencies make testing and lifecycle hard; pass values or use a use case.
- `ProfileSettingsScreen` / `ProfileWizardScreen` carry large commented-out `BlocBuilder` blocks. Don't leave dead code.
- `ProfileScreen` calls `context.read<ProfileCubit>().loadProfile(...)` in `initState`. Prefer loading in `BlocProvider.create`.
- `ProfileScreen` error branch signs the user out through `AuthStateCubit` from inside the widget tree callback. Keep this decision in a cubit or use case.
- Some cubits use `onComplete`/`onError` callbacks instead of terminal states.
- Direct `Cubit<Entity>` or `Cubit<List<Entity>>` states without wrappers (no loading/error). Always model loading and error.
- `core/DefaultScreenSetup` is declared with primary-constructor syntax (`class const X({...}) extends ...`). This is valid only with the current Dart SDK (>= 3.13); do not introduce it in new module code unless the file already uses it.
- The generic `ai/prompts/create-screen-with-route.prompt.md` assumes `lib/widget/screen` and `app_routes.dart`; follow this skill's layout instead.

## 9. Checklist

- [ ] Cubit and state in `presentation/viewmodel` (or `public/viewmodel` with justification).
- [ ] Freezed sealed state, named state classes, loading + error modelled.
- [ ] Constructor-injected interfaces; no `GetIt`, `BuildContext` or navigation inside the cubit.
- [ ] try/catch with `crashlyticsService.recordError`; subscriptions cancelled in `close()`.
- [ ] Public cubits expose public models only; private cubits map entities at the edge.
- [ ] `Screen` provides the cubit; content widget renders via exhaustive `switch`; side effects in listeners.
- [ ] Strings localized; keys added; core widgets reused.
- [ ] Route class added with `AuthRedirectHook` if needed; codegen run.
- [ ] DI: `registerFactory` in `<m>_di.dart`.
- [ ] bloc_test + widget tests + Widgetbook use case; `melos run analyze` clean.
