---
name: domain-layer
description: "Design and write the domain layer of a Dhyana module following Clean Architecture: entities, repository interfaces, use cases, ports, and shared domain services/managers. Use when adding or changing anything under a module's `lib/src/domain/`, creating a use case, defining a repository or port contract, or deciding where business logic should live."
license: MIT
---

# Dhyana Domain Layer

The domain layer holds a module's business rules and the contracts it needs from the outside world. It is the innermost layer: it knows nothing about Flutter UI, Firebase, storage, or other modules' internals.

## Layout

```text
packages/modules/<module>/lib/src/domain/
  entity/       # *_entity.dart   freezed models
  enum/         # domain enums
  repository/   # abstract interface class contracts for persistence
  service/      # shared business logic (services/managers) and ports
  usecase/      # *_use_case.dart one workflow each
```

Reference modules: `profile` (entities, repository, services, use cases), `practice/timer` and `practice/chanting` (ports, services), `auth` (minimal use cases).

## Dependency rules

A domain file may import only:

1. Its own module's `domain/` (`package:<module>/src/domain/...`).
2. `package:core/core.dart`: the core domain layer (entities, `CrudRepository`, `SerializableEntity`, `LoggerMixin`, `IdGeneratorService`, ...). This is the only cross-package domain dependency a use case or service may have directly.
3. Pure Dart / small utility packages (`freezed_annotation`, `clock`, `meta`, `dart:async`).
4. Another module's public API (`package:<other>/<other>.dart`), **only inside a port interface** (see Ports). Respect the module hierarchy: never import a higher-level module.

Never import `data/`, `presentation/`, `flutter/widgets`, `cloud_firestore`, `firebase_*`, `get_it`, or `drift`. `packages/dhyana_lints` has a `domain_layer_isolation` rule for this; run `melos run analyze`.

## Entities

- Use `@freezed abstract class XEntity with _$XEntity`, a private `const XEntity._()` constructor, and name files `*_entity.dart`.
- Entities are plain business data plus small derived getters and invariants (e.g. `displayName`, `consecutiveDaysProgressCheck`). No I/O, no logging, no framework types.
- Entities are allowed to leak outward in two controlled ways (see table below):
  - **Data layer** serializes entities through freezed: add `part '*.g.dart'`, `@JsonSerializable(explicitToJson: true)`, a `fromJson` factory, and converters such as `@DateTimeConverter()`. `implements SerializableEntity` when the repository needs generic JSON. Do not create a parallel DTO class unless the stored shape differs from the entity.
  - **Presentation layer** may use entities directly only when the view model is private to the module (cubit/state in `src/presentation/viewmodel`).
- Anything exposed to other modules (`src/public/`) must be a separate public model with `toApi()` / `toDomain()` mappers in `data/mapper/` (see `profile_mapper.dart`).
- Add a comment when a stored entity shape is mirrored elsewhere (e.g. Firebase functions create the initial profile record).

| Consumer | May use entities? | How |
|---|---|---|
| Data layer | Yes | Serialize via freezed/json_serializable; map to/from persistence types. |
| Module presentation (private view model) | Yes | Cubit states and widgets inside the module. |
| Public API / other modules | No | Use `public/model` types and mappers. |

## Repositories (persistence contracts)

- `abstract interface class XRepository` in `domain/repository/`, typed with entities.
- Extend `CrudRepository<XEntity>` from core when the standard CRUD shape fits; add only module-specific queries (`query`, `queryStream`).
- Implementations live in `data/repository/default_*_repository.dart`. Domain code depends only on the interface.

## Ports (everything that is not persistence)

Use a **port** whenever a use case or domain service needs something from outside the module's domain: another module, a platform capability, an SDK, audio, network, etc. Ports are how use cases stay free of outside dependencies.

- Define a narrow `abstract interface class` in `domain/service/`, e.g. `TimerAppPort`, `ChantingAppPort`.
- Express methods in domain terms using primitives, records, or own entities (`Future<({String? userId, bool isAuthenticated})> getAuthSession()`), not the vocabulary of the external SDK.
- A port is the **only** place in the domain layer where another module's public API types may appear, and only when mapping would add no value (e.g. `TimerAppPort.getProfile` returns the profile module's public `Profile`). Prefer primitives or own entities when practical.
- The adapter lives in `data/service/default_<name>_port.dart` and delegates to `AuthPublicApi`, `ProfilePublicApi`, etc. Keep adapters thin: translate and delegate, no business rules.
- Keep ports small and shaped by what the domain needs, not a one-to-one mirror of the external API. Split a port when it grows unrelated responsibilities.
- Use cases and services receive ports through the constructor; they never reach for `GetIt` or a concrete implementation.

## Use cases

One class = one business workflow with meaningful orchestration.

- File `<verb>_<noun>_use_case.dart`, class `<Verb><Noun>UseCase`.
- Constructor-injected dependencies: repository interfaces, ports, domain services. All `final`, required named parameters. Never import a cross-module type directly; go through a port.
- Single public method `execute(...)`. Return an entity, a Dart record for multiple results (`({ProfileEntity originalProfile, ProfileEntity updatedProfile})`), `void`, or a `Stream` for streaming (`LoadProfileStreamUseCase`).
- Use `clock.now()` from `package:clock` instead of `DateTime.now()` so tests can control time.
- Orchestrate; do not compute. Calling a repository, a port, and a service in sequence belongs in the use case; the rules themselves belong in an entity or service.
- Do **not** create a use case for trivial pass-through CRUD. A cubit may call a repository directly (see `docs/module_guidelines.md`). Do not add more one-line forwarders like `SignoutUseCase` unless they provide a stable seam.
- Non-blocking side effects (audit, analytics) may be `unawaited`, with the dependency optional (`StatsAuditService?`).
- Let domain/repository exceptions propagate unless the use case can add business meaning; the cubit decides how to present them.

## Shared business logic: services and managers

When two or more use cases need the same business rule, extract it instead of duplicating it or chaining use cases.

- **Service** (stateless rules): `<Subject><Action>Service` in `domain/service/`, e.g. `ProfileStatsReportUpdaterService`. Entities in, entities out; no repository calls.
- **Manager** (stateful or coordinating logic, long-lived resources, caching): `<Subject>Manager`, e.g. `ChantCacheManager`. May depend on repositories and ports and owns its state.
- Use cases depend on services/managers; services/managers never depend on use cases, and use cases never call other use cases.
- A service that needs an external capability declares an interface (`TimerAudioService`, `ChantingAudioService`) in domain, with the implementation in `data/service/`.
- `LoggerMixin` from core is allowed for diagnostics.

## Decision guide

| Need | Put it in |
|---|---|
| Business data and invariants | Entity |
| Read/write stored data | Repository interface (impl in data) |
| Something from another module, SDK, platform | Port (adapter in data) |
| One workflow orchestrating the above | Use case |
| Rule shared by 2+ use cases (pure) | Service |
| Shared logic with state or coordination | Manager |
| Trivial fetch-and-show | Cubit calls repository directly, no use case |

## Wiring

- Register implementations, ports, services, managers, and use cases in the module's DI file (`src/<module>_di.dart`), binding interfaces to `Default*` implementations.
- Export from the module barrel only what other modules need (public API, public models). Domain classes stay internal (`src/domain/...`).

## Testing

- Unit-test use cases with mocked repositories and ports (see `packages/modules/practice/timer/test/timer_mock_definitions.dart`).
- Unit-test services and entity getters as pure functions; control time with `withClock`.
- No Flutter bindings or Firebase in domain tests.

## Checklist

- [ ] Imports satisfy the dependency rules; no data/presentation/SDK imports.
- [ ] Entities are freezed; JSON serialization is added only where the data layer stores them.
- [ ] External needs go through a repository or a port, injected by constructor.
- [ ] Use cases expose one `execute`, contain orchestration only, and are not used for trivial CRUD.
- [ ] Rules duplicated across use cases moved to a service or manager.
- [ ] Nothing in `src/domain` leaks through the module barrel or public API.
- [ ] `melos run codegen` and `melos run analyze` pass; tests added for new rules.
