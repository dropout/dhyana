# Architectural Overview of the Application

## Overview
Dhyana is a Flutter meditation timer app built with a clean architecture style, Firebase-backed services, and environment flavors (dev/staging/prod). The design emphasizes predictable state, clear boundaries between layers, and a scalable backend.

## Architecture At A Glance
- **Presentation**: Flutter widgets + state management (Bloc/Cubit).
- **Domain**: Models and repository interfaces.
- **Data**: Repository implementations and data providers.
- **Infrastructure**: Services (Audio, Notifications, Analytics) and Firebase Functions.

## Folder Mapping
- `lib/init/`: Dependency injection, app bootstrap, and configuration.
- `lib/widget/`: Views and UI components.
- `lib/bloc/`: Presentation state (Bloc/Cubit).
- `lib/model/`, `lib/enum/`: Domain models and enums.
- `lib/repository/`: Repository interfaces and implementations.
- `lib/data_provider/`: Data provider interfaces and implementations.
- `lib/service/`: External services (Audio, Notifications, Analytics).
- `lib/l10n/`: Localization.

## Data Flow (Typical)
1. UI triggers a Bloc/Cubit event.
2. Bloc calls a repository interface.
3. Repository delegates to one or more data providers.
4. Data providers reads/writes to Firebase or local sources.
5. Results propagate back to the Bloc and UI.

## Key Systems
- **Timer/Session**: Domain models + state in Bloc, persists session data via repositories.
- **Profile**: Profile edits and settings persist to Firebase.
- **Statistics**: Aggregates session history for charts and metrics.
- **Social**: GeoHash-based proximity lookups (Cloud Functions / Maps API).

## Environment Flavors
Multiple entry points support dev/staging/prod:
- `lib/main_local.dart`
- `lib/main_staging.dart`
- `lib/main_prod.dart`

Platform-specific Firebase config lives in the corresponding flavor folders.

## Coding Conventions
- Use `freezed` library for immutable data classes.
- Prefer using `Cubit` over `Bloc` for simple state management.
- 


## Testing
Unit tests focus on Bloc, repositories, and services with mocks (mocktail). Integration tests validate top-level flows.

## Non-Goals
This document is a concise architecture summary; operational details (build, setup, emulator) are documented in `README.md`.

