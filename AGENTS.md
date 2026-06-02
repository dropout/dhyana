# AGENTS.md

## Scope
Dhyana is a Flutter meditation timer app (Dart) using layered architecture and Firebase.

Use this file as the default cross-agent guide. Keep instructions concise and link to docs for details.

## First Commands
Run these first when working in a fresh environment:

- Install dependencies: `flutter pub get`
- Generate code: `dart run build_runner build`
- Generate localizations: `flutter gen-l10n`
- Static checks: `flutter analyze`
- Run tests: `flutter test`

## Run and Build
- Run staging app: `flutter run --flavor staging -t lib/main_staging.dart`
- Build staging Android: `flutter build appbundle --release --flavor staging -t lib/main_staging.dart`
- Build staging iOS: `flutter build ipa --release --flavor staging -t lib/main_staging.dart`
- Start Firebase emulator dataset: `./start_firebase_emulator.sh -d empty_with_admin_user`

## Critical Setup Pitfalls
- The app will not run without platform flavor Firebase config files.
- Keep config files in flavor folders:
	- iOS: `ios/config/<flavor>/GoogleService-Info.plist`
	- Android: `android/app/src/<flavor>/google-services.json`

## Architecture Rules
- Required flow: Widget -> Cubit/Bloc -> Repository -> Data Provider.
- Keep dependency direction downward: upper layers depend on interfaces, not concrete implementations.
- Keep business logic out of widgets; widgets should remain declarative.
- Prefer Cubit over Bloc for simple state flows.
- Use freezed for immutable state and domain models.

## Repository Layout
- `lib/widget/`: UI, routing, view composition.
- `lib/bloc/`: Cubits/Blocs and state orchestration.
- `lib/repository/`: repository interfaces + implementations.
- `lib/data_provider/`: Firebase/local data source boundaries.
- `lib/service/`: external integrations (audio, analytics, notifications).
- `lib/init/`: dependency graph and bootstrap.
- `lib/l10n/`: localization resources.
- `docs/`: Documentation
- `ai/`: Agents, Skills, Prompts for LLMs.
- `test/`: Unit tests.
- `integration_test/`: Integration tests.

## Project-Specific Expectations
- Use BuildContext extensions from lib/widget/util/app_context.dart to access repositories, services, and localization.
- In Cubits, report errors through Crashlytics and avoid silent failures.
- Keep Firebase details behind providers and repositories.
- Keep services focused and preferably stateless.

## Testing Expectations
- Prioritize unit tests for Cubits, repositories, and services.
- Reuse shared mocks from test/mock_definitions.dart.
- Use integration_test for end-to-end flows.

## Source of Truth and References
- Main setup and commands: [README.md](README.md)
- Architecture summary: [docs/architecture_overview.md](docs/architecture_overview.md)
- Feature design template: [docs/feature_description.md](docs/feature_description.md)
- Copilot project instructions: [.github/copilot-instructions.md](.github/copilot-instructions.md)

## Feature Work Checklist
- Define or adjust interfaces first (repository, provider, service).
- Implement changes by layer in matching feature folders.
- Add or update localization strings for user-facing text.
- Register new repositories and services in lib/init.
- Add or update unit tests, then integration tests when behavior is user-visible.
