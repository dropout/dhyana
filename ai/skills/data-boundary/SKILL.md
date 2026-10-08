---
name: data-boundary
description: "Implement the module boundary in a Dhyana data layer: `Default*PublicApi` classes that expose a module to others, `Default*Port` adapters that consume other modules' public APIs, and the extension-method mappers (entity <-> public model, entity <-> Drift row, SDK type -> entity). Use when adding a public API method, a public model, a port adapter, or any `*_mapper.dart`."
license: MIT
---

# Dhyana Data Boundary

Read `data-layer` first. This skill covers the places where a module meets the outside: **outbound** (`*PublicApi`, public models) and **inbound** (`*Port` adapters), plus the mappers used by both.

```text
other module --> <Module>PublicApi (public/api, interface)
                    ^ implemented by data/service/Default<Module>PublicApi
                        uses use cases + mappers (entity -> public model)

this module's domain --> <X>Port (domain/service, interface)
                    ^ implemented by data/service/Default<X>Port
                        delegates to <Other>PublicApi
```

## Public API (outbound)

- Interface in `src/public/api/<module>_public_api.dart`; exported from the barrel. Implementation in `src/data/service/default_<module>_public_api.dart`.
- Public models live in `src/public/model/` (freezed, no domain types). They are the **only** model types other modules see.
- Each method: run the use case (or repository call for trivial reads), then map entity -> public model with `.toApi()`; incoming public models map to entities with `.toDomain()`.
- No business rules in the public API; it is translation and an orchestration entry only.
- Exceptions: let domain/repository exceptions pass, or map to a public failure type defined in `public/types/` (see `auth_public_failure.dart`, `auth_public_failure_mapper.dart`).
- Streams: `.map((e) => e.toApi())`.
- Keep the surface small; add methods only for confirmed cross-module needs, and check the module hierarchy (a lower module must not need a higher one).

## Port adapters (inbound)

- `class DefaultXPort implements XPort` in `data/service/`, receiving `<Other>PublicApi` instances via the constructor (`DefaultTimerAppPort(authPublicApi, profilePublicApi, socialPublicApi)`).
- One short doc comment per injected API stating what the port uses it for.
- Translate and delegate only; reshape to the port's primitive/record types (`getAuthSession` returns `({String? userId, bool isAuthenticated})`). No branching business logic, no caching.
- Domain declares the port (see `domain-layer`); the adapter is the only code importing the other module.

## Mappers

Location: `data/mapper/<entity>_mapper.dart`. Form: **extension methods**, never mapper classes.

| Kind | Methods | Example |
|---|---|---|
| Entity <-> public model | `Entity.toApi()` / `PublicModel.toDomain()` | `profile_mapper.dart` |
| Entity <-> Drift row | `Row.toDomain()` / `Entity.toRow()` | `chant_cache_mapper.dart` |
| SDK type -> entity | `SdkType.toDomain()` | `playback_state_mapper.dart` |

Rules:

- One extension pair per file, with extension names unique across the module so imports do not clash. Import conflicting types with a prefix (`as domain`, `as api`).
- Nested models get their own mapper and are called from the parent (`settings.toApi()`).
- Map enums explicitly with an exhaustive `switch` (`ProfileSessionType` in `profile_session_mapper.dart`) so adding a case breaks compilation. Use `values.byName(...)` only for persisted names that are guaranteed to match.
- Mappers are pure: no I/O, no `DateTime.now()`, no logging.
- Import public models from `src/public/model/...`, not from the module barrel (`timer_module.dart`).
- Keep the public model separate from the entity even when they look identical; the public model is a compatibility contract.

## DI

```dart
registerLazySingleton<ProfilePublicApi>(() => DefaultProfilePublicApi(
  profileRepository: get(), profileStatsUpdater: get(), ...));
registerLazySingleton<TimerAppPort>(() => DefaultTimerAppPort(
  authPublicApi: get(), profilePublicApi: get(), socialPublicApi: get()));
```

Prefer injecting use cases into the public API instead of constructing them per call.

## Testing

- Mappers: round trips and one case per enum value.
- Public API: mock repositories/use cases; assert that returned values are public models.
- Port adapters: mock the other module's `*PublicApi`; assert delegation and reshaping.

## Legacy deviations (do not copy)

- `DefaultProfilePublicApi` builds use cases inside each method on every call; new code injects them.
- `timer_settings_mapper.dart` imports `timer_module.dart` (barrel) instead of `src/public/model/`.
- `CacheFirstProfileDataProvider` uses the public `Profile` model inside a provider; keep public models out of persistence.
- `chant_mapper.dart` contains commented-out code; delete dead code instead of commenting it out.

## Checklist

- [ ] Only public models cross the module barrel; no entity is exported.
- [ ] Every new public model has a mapper pair; enum mapping is exhaustive.
- [ ] Port adapter only translates and delegates.
- [ ] Mappers are pure extension methods imported from `src/...` paths.
- [ ] Registered by interface type in the module DI file.
