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
2. Install workspace dependencies and link packages: `melos bootstrap`
3. Generate code across the monorepo: `melos run codegen`
4. Generate localizations across packages: `melos run codegen:l10n`
5. Static checks: `melos run analyze`
6. Run tests: `melos run test`

## Run and Build
For running and building commands look at the commands documentation: [`docs/commands.md`](docs/commands.md)

## Repository Layout
- `apps/mobile_app/`: Mobile app shell.
- `apps/mobile_app/lib/bootstrap/`: Initialization and bootstrap code for the app.
- `apps/mobile_app/lib/main_<flavor_name>.dart`: Mobile app entry point for each flavor.
- `apps/mobile_app/integration_test/`: Integration tests.
- `packages/core/`: Core module, including app entry point, dependency injection, and shared utilities.
- `packages/modules/`: Feature modules, each with its own layers.
- `packages/modules/auth/`: Authentication feature module.
- `packages/modules/donate/`: Donation feature module.
- `packages/modules/profile/`: Profile feature module.
- `packages/modules/stats/`: Stats feature module.
- `packages/modules/practice/timer/`: Timer feature module.
- `packages/modules/practice/chanting/`: Chanting feature module.
- `packages/modules/practice/session/`: Session feature module.
- `packages/firebase_provider/`: Firebase SDK provider module for the app with emulator configuration code.
- `packages/bar_chart/`: Bar chart widget module for the app.
- `packages/particle_field/`: Particle field widget module for the app.
- `packages/*/lib/l10n/`: localization resources for the modules.
- `packages/*/test/`: Unit tests.
- `docs/`: Project-wide documentation.
- `ai/`: Agents, Skills, Prompts for AI augmented development.
- `support/firebase/`: Flavor specific Firebase backend source code and configuration.
- `support/maintenance_scripts`: Maintenance and helper scripts.

## Architecture Rules
- Required data flow: Widget -> Cubit/Bloc -> Use Case / Service -> Data Layer.
- Keep dependency direction downward: upper layers depend on interfaces, not concrete implementations.
- Keep business logic out of widgets; widgets should remain declarative.
- Prefer Cubit over Bloc for simple state flows.
- Use freezed for immutable state and domain models.

## Module Guidelines
- Modules are following a simplified version of Clean Architecture principles.
- Each module handles its own service configuration and dependencies internally.
- Modules are expected to encapsulate their internal logic and expose only necessary interfaces to other modules in a form of a public API layer.
- Hierarchy between modules: 
	- Higher-level modules can depend on lower-level modules, but not vice versa. (For example, the `profile` module can depend on the `auth` module, but the `auth` module should not depend on the `profile` module.)
	- Core modules should not depend on any other modules and provide foundational services and utilities for the rest of the project.

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

