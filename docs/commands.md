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
- Test: `flutter test`
    - Run with `--coverage` for getting test coverage report.
- Format: `dart format .`
- Clean: `flutter clean`

## Building
- If build mode is not excplicitly specified use `debug` build mode.
- App Bundle (Android): `flutter build appbundle --flavor <flavor> -t lib/main_<flavor>.dart --<build_mode>`
- IPA (iOS): `build ipa --flavor <flavor> -t lib/main_<flavor>.dart --<build_mode>`
