# AGENTS.md - Contribution Guide for project Dhyana

## Scope
Dhyana is a Flutter meditation timer app (Dart) using layered architecture and Firebase.
Use this file as the default cross-agent guide. Keep instructions concise and link to docs for details.

## Critical Setup Pitfalls
- The app will not run without platform specific flavor Firebase config files.
- Keep config files in flavor folders:
	- iOS: `ios/config/<flavor>/GoogleService-Info.plist`
	- Android: `android/app/src/<flavor>/google-services.json`

## Initial setup
Run these first when working in a fresh environment:
1. Check if Flutter is available and healthy: `flutter doctor`
2. Install dependencies: `flutter pub get`
3. Generate code: `dart run build_runner build`
4. Generate localizations: `flutter gen-l10n`
5. Static checks: `flutter analyze`
6. Run tests: `flutter test`

## Run and Build
For running and building commands look at the commands documentaiton: [`docs/commands.md`](docs/commands.md)

## Repository Layout
- `lib/widget/`: UI, routing, view composition.
- `lib/bloc/`: Cubits/Blocs and state orchestration.
- `lib/repository/`: repository interfaces + implementations.
- `lib/data_provider/`: Firebase/local data source boundaries.
- `lib/service/`: external integrations (audio, analytics, notifications).
- `lib/init/`: dependency graph and bootstrap.
- `lib/l10n/`: localization resources.
- `docs/`: Documentation
- `ai/`: Agents, Skills, Prompts for AI augmented development.
- `test/`: Unit tests.
- `integration_test/`: Integration tests.
- `support/firebase/`: Flavor specific Firebase backend source code and configuration.
- `support/maintenance_scripts`: Maintenance and helper scripts.

## Architecture Rules
- Required data flow: Widget -> Cubit/Bloc -> Repository -> Data Provider.
- Keep dependency direction downward: upper layers depend on interfaces, not concrete implementations.
- Keep business logic out of widgets; widgets should remain declarative.
- Prefer Cubit over Bloc for simple state flows.
- Use freezed for immutable state and domain models.

## Project-Specific Expectations
- Use BuildContext extensions from `lib/widget/util/app_context.dart` to pass repositories/services into Cubits at construction time, use the available shorthands for localization and for accessing context related dependency injection. Only use services directly when it's related to UI (e.g., HapticsService, OverlayService).
- In Cubits, report errors through Crashlytics and avoid silent failures.
- Keep Firebase details behind providers and repositories.
- Keep services stateless unless the integration requires lifecycle management (e.g., audio playback, notification scheduling). Document the reason when a stateful service is necessary.

## Feature Work Checklist
- Define or adjust interfaces first (repository, provider, service).
- Implement changes by layer in matching feature folders.
- Add or update localization strings for user-facing text.
- Register new repositories and services in lib/init.
- Add or update unit tests, then integration tests when behavior is user-visible.
- Name files by feature then type: <feature>_repository.dart, <feature>_cubit.dart, <feature>_state.dart, <feature>_provider.dart.

## Testing Expectations
- Prioritize unit tests for Cubits, repositories, and services.
- Reuse shared mocks from test/mock_definitions.dart.
- Use integration_test for end-to-end flows.

## Source of Truth and References
- Project overview: [README.md](README.md)
- Commands for running and building: [docs/commands.md](docs/commands.md)
- Architecture summary: [docs/architecture_overview.md](docs/architecture_overview.md)
- Feature design template: [docs/feature_description.md](docs/feature_description.md)
