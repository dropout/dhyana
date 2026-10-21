# Commands for running and building
This is a list of useful commands for the project.

## Available flavors for commands `<flavor>`
When running commands that require a flavor, ask for clarification.
- `development`
- `staging`
- `production`

## Available build modes `<build_mode>`
If no build mode specified, use `debug`.
- `debug`
- `profile`
- `release`

## Running
- Install dependencies: `flutter pub get`
- Generate localizations: `flutter gen-l10n`
- Generate code: `dart run build_runner build`
    - If build_runner reports conflicts, resolve with `dart run build_runner build --delete-conflicting-outputs`.
- Watch for code changes and generate code: `pub run build_runner watch`
- Static checks: `flutter analyze`
- Module boundary checks: `bash support/maintenance_scripts/check_module_boundaries.sh`
- Run: `flutter run --flavor <flavor> -t lib/main_<flavor>.dart --<build_mode>`
- Widget and Unit Tests: `flutter test`
    - Run with `--coverage` for getting test coverage report.
- Integration Tests: `flutter test integration_test/<test_file>.dart --flavor <flavor> --dart-define=IS_TEST=true --dart-define=TEST_USER_EMAIL=<email> --dart-define=TEST_USER_PASSWORD=<password>`
- Format: `dart format .`
- Clean: `flutter clean`

## Building
- If build mode is not excplicitly specified use `debug` build mode.
- App Bundle (Android): `flutter build appbundle --flavor <flavor> -t lib/main_<flavor>.dart --<build_mode>`
- IPA (iOS): `build ipa --flavor <flavor> -t lib/main_<flavor>.dart --<build_mode>`

## Distribution
- iOS to Firebase App Distribution (`ios_testers`) + Crashlytics symbols: `bash support/maintenance_scripts/distribute_ios.sh <firebase_project> [--notes "<text>"] [--dry-run]`
    - Example: `bash support/maintenance_scripts/distribute_ios.sh stepstones-staging`
    - Requires a clean git tree; bumps only the build number in `apps/mobile_app/pubspec.yaml` and commits it after success.
    - Currently only the `staging` flavor is supported.
