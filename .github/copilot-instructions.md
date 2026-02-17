# Copilot Instructions for Dhyana

## Project Context
Dhyana is a Flutter meditation timer app written in Dart, using clean architecture and Firebase-backed services.

## Architectural Principles

### Architecture At A Glance
- **Presentation**: Flutter widgets + state management (Bloc/Cubit).
- **Domain**: Models and repository interfaces.
- **Data**: Repository implementations and data providers.
- **Infrastructure**: Services (Audio, Notifications, Analytics) and Firebase Functions.

### Architectural Rules
- Follow layered flow: `Widget -> Cubit/Bloc -> Repository -> Data Provider` with state flowing back to UI.
- Keep dependency direction: upper layers depend on lower-layer interfaces, not implementations.
- Keep Cubit state as the UI source of truth; prefer `Cubit` over `Bloc` for simpler flows.
- Use `freezed` for immutable domain models and state where applicable.

### Folder Map (Primary)
- `lib/widget/app_routes.dart`: Route definitions and navigation.
- `lib/widget/`: UI widgets and views (declarative, dispatch intent only).
- `lib/bloc/`: Cubit/Bloc state and orchestration.
- `lib/model/`, `lib/enum/`: Domain models and enums.
- `lib/repository/`: Repository interfaces + implementations; hide persistence details.
- `lib/data_provider/`: Data provider interfaces + implementations for Firebase/local.
- `lib/service/`: External services (Audio, Notifications, Analytics).
- `lib/init/`: DI, bootstrap, and configuration.
- `lib/l10n/`: Localization.

## Feature Development Expectations
- Define contracts (interfaces) before concrete implementations.
- Add or update widgets, cubits, repositories, and providers in their feature folders.
- Add new localization strings to ARB files and use `lib/l10n/` helpers.
- Keep services focused and stateless; reuse across features.

## Testing Expectations
- Prefer unit tests for Cubit, repositories, and services with mocks.
- Add integration tests for end-to-end flows where appropriate.

## Coding Conventions (Dart/Flutter)
- **Style & naming**: Use UpperCamelCase for types/extensions, lowerCamelCase for members/constants, snake_case for files; capitalize long acronyms as words; avoid leading underscore for non-private symbols.
- **Imports & layout**: Order `dart:` then `package:` then relative; keep exports in a separate section; sort sections alphabetically; run `dart format`; prefer <=80 chars; always use braces in control flow.
- **Docs & comments**: Use `///` for public APIs; start with a one-sentence summary; avoid block comments for docs; avoid redundant comments; use `[]` to link identifiers; put doc comments before annotations.
- **Null & initialization**: Avoid `late` unless needed; don't initialize to `null`; don't use explicit `null` defaults; prefer initializer lists; initialize fields at declaration when possible.
- **Collections & strings**: Prefer literals; use interpolation; avoid `Iterable.forEach()` with closures; use `isEmpty` over `length`; avoid `cast()` when possible; use `whereType()` for type filtering.
- **Functions & members**: Prefer tear-offs over lambdas; use `=>` for simple members; avoid unnecessary getters/setters; avoid `this.` except for disambiguation; avoid `new` and redundant `const`.
- **Async & errors**: Prefer `async`/`await`; avoid `async` without effect; avoid `Completer`; avoid catch-all `catch` without `on`; use `rethrow` when propagating.
- **Types & parameters**: Annotate return types and parameter types on declarations; avoid redundant local type annotations; avoid positional booleans; prefer named params; avoid `FutureOr<T>` returns.
- **Design**: Prefer immutable models (use `freezed`); make fields `final` when possible; avoid public `late final` without initializers; avoid `get` prefix for methods; keep naming consistent and descriptive.
- **Flutter architecture**: Keep logic out of widgets; separate UI and data layers; use repository pattern; prefer unidirectional data flow; use Cubit/Bloc as view-models.

### Flutter Widget Conventions
- Use `StatelessWidget` when possible; prefer `StatefulWidget` only when managing local state.
- Keep widgets focused on presentation; avoid business logic in widgets.
- Use composition over inheritance; prefer small reusable widgets.
- Use `const` constructors and widgets where possible for performance.

### Cubit/Bloc Conventions
- Name Cubits with `Cubit` suffix (e.g., `TimerSettingsCubit`).
- Define states as immutable classes, preferably with `freezed`.
- Emit new states on changes; avoid mutating existing state. Use `copyWith` for updates.
- Keep Cubits focused on a single feature or screen; avoid god Cubits.
- Avoid creating Cubits for a single state change; prefer direct state management in the widget for simple cases.
- Keep error handling in Cubits; avoid throwing exceptions from Cubit methods without catching them.
- Always use Crashlytics in Cubits for error reporting; avoid silent failures.

### Repository & Data Provider Conventions
- Define repository interfaces in the `repository/` folder; implementations can be in `repository/firebase/`.
- Keep data providers focused on a single source (e.g., Firebase, local storage); avoid mixing sources in one provider.
- Use dependency injection to provide repositories and data providers to Cubits/Blocs.
- Avoid exposing implementation details (e.g., Firebase APIs) in repository interfaces; keep them abstracted away from the UI layer.
- Use `async`/`await` for asynchronous operations in repositories and data providers; avoid returning raw `Future`s without handling them.
- Extend `CrudRepository` or similar base interfaces for common operations when applicable; avoid duplicating CRUD methods across repositories.
- When implementing a Firebase data provider, extend a base `FirebaseDataProvider` that handles common Firebase interactions; avoid duplicating Firebase logic across providers.
- Use `freezed` for data models returned by repositories; avoid mutable models or those without value equality.

### Service Conventions
- Define service interfaces in the `service/` folder; implementations can be in `service/default/` or `service/firebase/`.
- Keep services focused on a single responsibility (e.g., AudioService, NotificationService); avoid god services that handle multiple unrelated tasks.
- Use dependency injection to provide services to Cubits/Blocs and repositories; avoid direct instantiation of services in those layers.
- Use `async`/`await` for asynchronous operations in services; avoid returning raw `Future`s without handling them.
- Avoid stateful services when possible; prefer stateless services that can be easily mocked in tests.
- When using an external package (e.g., `just_audio` for audio), wrap it in a service interface to abstract away implementation details; avoid exposing package-specific APIs in the service interface.
