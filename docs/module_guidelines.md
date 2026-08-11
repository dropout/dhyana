# Module Guidelines

This document complements the compressed clean architecture guidance in [architecture_guidelines.md](architecture_guidelines.md). It defines the default structure and conventions for creating new modules in Dhyana.

## 1. Core Principles

Each module should be treated as a small, self-contained feature boundary.

- Keep modules feature-first and cohesive.
- Use the compressed clean architecture model:
  - Domain and application logic are combined.
  - Presentation handles UI and state.
  - Data handles repositories, data sources, and mapping.
- Prefer simple implementations over over-engineering.
- Skip use cases for trivial CRUD-like flows when a controller or cubit can call a repository directly.
- Keep dependencies flowing downward: presentation -> domain -> data.
- Expose module functionality through a clear public API instead of letting other modules reach into internal implementation details.

## 2. Module Shape

New modules should live under the feature-oriented structure in [lib/modules](../../lib/modules) and follow a consistent layout:

```text
lib/modules/<module_name>/
  data/
    datasources/
    repositories/
  domain/
    entities/
    repositories/
    services/
  presentation/
    controllers/
    pages/
    widgets/
    state/
  public/
  <module_name>_di.dart
  <module_name>_module.dart
  <module_name>_routes.dart
```

Not every module needs every folder. Use the minimal structure that fits the feature.

## 3. Responsibilities by Layer

### Domain

The domain layer contains the module’s core business concepts and contracts.

- Define entities and immutable domain models.
- Define repository interfaces and service contracts.
- Keep business rules here when they are meaningful and reusable.
- Prefer simple, focused abstractions over large generic interfaces.

### Data

The data layer implements the contracts defined by the domain layer.

- Implement repositories and data sources.
- Handle Firebase, Drift, local persistence, and remote API access.
- Map data models to domain entities.
- Keep storage and network concerns isolated behind the repository boundary.

### Presentation

The presentation layer contains UI and state management.

- Use Cubit or Bloc for stateful flows when the feature needs more than trivial UI state.
- Keep widgets declarative and free of business logic.
- Let controllers or cubits orchestrate user actions and repository calls.
- Emit explicit, immutable states such as initial, loading, success, and failure.

### Public API

Each module should expose a small public surface for other modules.

- Export the module entry point and any reusable UI components.
- Avoid forcing other modules to depend on implementation details.
- Keep the public API stable and minimal.

## 4. Implementation Rules

### Keep the module cohesive

A module should own its own data, state, routes, and UI. Avoid scattering feature-specific logic across the app.

### Prefer direct use of repositories for simple flows

If a feature is just fetching data and displaying it, a cubit or controller can call the repository directly. Do not create a use case class unless the workflow has meaningful orchestration or business logic.

### Use immutable models

Prefer freezed-based models or other immutable value objects for entities and state.

### Keep the dependency direction clean

The rule of thumb is:

- Presentation may depend on domain contracts.
- Domain should not depend on presentation.
- Data implements domain contracts.
- Modules should communicate through public exports or shared contracts, not by reaching into each other’s internals.

## 5. State Management Guidance

Use the simplest state approach that fits the feature.

- Use Cubit for simple or medium complexity flows.
- Use Bloc when the flow needs more structured event-driven behavior.
- Keep state classes focused and immutable.
- Avoid putting network calls or business logic directly inside widgets.

## 6. Routing and Dependency Injection

Every module should integrate cleanly with the application’s navigation and dependency setup.

- Define module routes in a dedicated route file.
- Register dependencies in the module entry point or DI setup.
- Keep route definitions close to the feature they serve.
- Avoid hard-coding navigation logic inside widgets when the flow is reusable.

## 7. Testing Expectations

Every module should be testable at the same level as the rest of the app.

- Add unit tests for repositories, mapping logic, and domain rules.
- Add widget tests for UI behavior and state rendering.
- Add integration tests for multi-step flows when the behavior crosses layers.

## 8. New Module Checklist

Use this checklist when creating a new module:

- [ ] Create the module folder under the appropriate feature area.
- [ ] Add a module entry point and route definitions.
- [ ] Define the public API surface.
- [ ] Create the domain entities and repository/service contracts.
- [ ] Implement the data layer and any required mapping.
- [ ] Build the presentation layer with state management and screens.
- [ ] Register dependencies and routes.
- [ ] Add tests for the core behavior.

## 9. Practical Default

For most features in this project, the default approach should be:

1. Start with a minimal module structure.
2. Define the entity and repository contract.
3. Implement the repository and data source.
4. Add a cubit or controller for state.
5. Build the screen and widgets.
6. Expose only what other modules need.

This keeps the codebase consistent, readable, and easy to evolve without introducing unnecessary layers.
