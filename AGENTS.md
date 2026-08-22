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
For running and building commands look at the commands documentation: [`docs/commands.md`](docs/commands.md)

## Repository Layout
- `lib/main_local.dart`, `lib/main_staging.dart`, `lib/main_prod.dart`: App entry points for each flavor.
- `lib/bootstrap/`: Initialization and bootstrap code for the app.
- `lib/core/`: Core module, including app entry point, dependency injection, and shared utilities.
- `lib/drift/`: Drift database configuration for the app.
- `lib/modules/`: Feature modules, each with its own layers.
- `lib/modules/auth/`: Authentication feature module.
- `lib/modules/donate/`: Donation feature module.
- `lib/modules/profile/`: Profile feature module.
- `lib/modules/stats/`: Stats feature module.
- `lib/modules/practice/timer/`: Timer feature module.
- `lib/modules/practice/chanting/`: Chanting feature module.
- `lib/modules/practice/session/`: Session feature module.
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

## Commenting & Verbosity Rules
- Keep all inline code comments extremely short and concise (maximum one sentence).
- Explain *why* complex logic exists, never restate *what* the code visibly does.
- Avoid conversational fluff, introductions, or verbose summaries in all outputs.

## Project-Specific Expectations


## AI Directory and Agent Customizations
- Project-specific AI assets live in `ai/`.
- Agents should inspect this folder early when starting work in this repository.

### Current layout
- `ai/skills/`: reusable workflow skills (`*/SKILL.md`) and skill references.
- `ai/prompts/`: reusable task prompts (`*.prompt.md`).

### Usage guidance for agents (Copilot, Claude, Antigravity, or other coding agents):
- Prefer matching project skills before applying generic behavior.
- When a task matches a skill description, read that skill's `SKILL.md` and follow it.
- For focused one-off tasks, check `ai/prompts/` for an existing prompt template before creating a new one.
- If a requested customization type is not present (for example hooks or subagents), propose creating it under `ai/` instead of scattering files.
- Keep new AI assets in this folder so future agents can discover and reuse them consistently.

## Feature Work Checklist


## Testing Expectations


## Source of Truth and References
- Project overview: [README.md](README.md)
- Commands for running and building: [docs/commands.md](docs/commands.md)
- Architecture overview: [docs/architecture_overview.md](docs/architecture_overview.md)
- Module guidelines: [docs/new_docs/module_guidelines.md](docs/module_guidelines.md)

