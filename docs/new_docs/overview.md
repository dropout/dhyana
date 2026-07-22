# Overview

See also: [Module Dependency Guidelines](module_dependency_guidelines.md)

## Modules

Modules are representing a self-contained feature or domain of the app. Each module should have its own data layer, business logic, and presentation layer. Modules can depend on core and other modules, but should not directly depend on the internal implementation of other modules.

### Inside each module, keep the same layered flow:

- presentation (screens, widgets, cubits)
- domain (models, repository contracts, enums/use-cases)
- data (repository impl, data providers)
- infrastructure (module-specific services only)

### Important boundary recommendations

- Keep truly cross-cutting services in core, not inside modules. Like analytics, crashlytics, remote settings, haptics, wakelock, shared preferences.
- Keep route setup and app bootstrap in core:
app_routes.dart, app_providers.dart, repositories.dart.

### Import/Dependency Rules During Migration

- No module may import another module’s data provider directly.
- Presentation can depend on module contracts + core.
- Keep data flow unchanged: Widget -> Cubit -> Repository -> DataProvider.
Update repositories.dart only at the end of each phase, not continuously file-by-file.
Keep routes centralized until final cleanup, then split route declarations by module and compose in app_routes.dart.


### 1. Core
Shared app shell, DI, navigation, generic UI primitives, cross-cutting services.

### 2. Account
Auth + profile + profile settings + profile media + delete account.
Keeps all identity/user state in one place.

### 3. Practice
Contains end-to-end session experience.
Includes timer, chanting runtime, session completion, session history, timer settings history.

### 3.1. Session 
Session completion, session history.

### 3.2. Timer
Timer setup/run logic, timer audio orchestration, timer settings/history.

### 3.3. Chanting
Playlist/settings, player, lyrics, chant asset prep/cache.

### 4. Insights (or Statistics)
All day/week/month/year/session aggregation and charts.
Could include profile stats UI or stay separate depending on product ownership.

### 5. Social
Presence discovery/query, proximity filters, “practiced with” views.

