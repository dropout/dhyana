---
name: data-layer
description: "Entry point for the data layer of a Dhyana module (`lib/src/data/`). Use for any work under `data/` to learn the folder map, dependency rules, naming, and DI wiring, and to pick the right detailed skill: data-persistence, data-boundary, or data-platform-services."
license: MIT
---

# Dhyana Data Layer (overview)

The data layer implements the contracts declared by the domain layer (see the `domain-layer` skill). It is the only layer allowed to know about Firebase, Drift, the file system, audio SDKs, and other modules' public APIs.

## Folder map

```text
packages/modules/<module>/lib/src/data/
  datasource/   # DataProvider interfaces + Firebase/Drift/Storage implementations
  repository/   # implementations of domain repository interfaces
  mapper/       # extension-method mappers (entity <-> public model / row / SDK type)
  service/      # Default*PublicApi, Default*Port, platform service implementations, navigator
```

## Pick the right skill

| Task | Read |
|---|---|
| Read/write stored data: Firestore, Drift, Storage; repository implementation; JSON serialization; caching flags | `data-persistence` |
| Implement `*PublicApi`, a port adapter, or any mapper | `data-boundary` |
| Implement a domain service interface with an SDK, audio, file system, downloader; navigator | `data-platform-services` |
| Entity, repository interface, port, use case, shared service | `domain-layer` |

## Dependency rules

- Data may import: its own `domain/`, `package:core/core.dart`, `package:firebase_provider/firebase_provider.dart`, SDKs, and other modules' **public API** (`package:<other>/<other>.dart`), respecting the module hierarchy.
- Data must not import `presentation/`. Exception: `service/Default*Navigator` imports the module's `*_routes.dart`.
- Domain never imports data. Data classes are reachable only through the interfaces they implement.
- SDK and persistence types (`DocumentSnapshot`, Drift rows, `audio_service` types) stop at the data layer. Convert them to entities or primitives before they cross into domain.

## Naming

- `Default<Name>` for the primary implementation of a domain interface (`DefaultProfileRepository`, `DefaultTimerAppPort`, `DefaultProfilePublicApi`).
- A technology prefix (`Firebase*`, `Drift*`, `Stubbed*`) only when more than one implementation exists or the name must say what it talks to (`FirebaseProfileDataProvider`).
- Files are snake_case of the class name. Mapper files end in `_mapper.dart`.

## DI wiring

Everything is registered in `src/<module>_di.dart` inside `extension <Module>ModuleDependencyInjection on GetIt`, grouped under comments in this order: Navigator, Data providers, Repositories, Services, Use cases, Cubits, Public API.

- Register by the **interface** type: `registerLazySingleton<ProfileRepository>(() => DefaultProfileRepository(...))`.
- Resolve with `GetIt.I.get<T>()` only inside the DI file. Classes receive dependencies through constructors.
- Cubits are `registerFactory`; everything else is `registerLazySingleton` unless it holds per-user state.

## Comments

Short, one sentence, explain why. Do not restate what the code does.

## Known legacy deviations (do not copy)

- `DefaultStatsAudioRepository` (typo for Audit) and `FirebaseTimerSettingsHistoryRepository` bypass or rebuild providers; see `data-persistence`.
- Inconsistent prefixes (`Firebase*` repositories wrapping providers vs `Default*`); use the rule above for new code.
- Domain/data boundary leaks in `chanting` (Drift rows in a domain repository, business rules in `data/service`); see `data-persistence` and `data-platform-services`.

## Checklist

- [ ] New classes live in the right folder and use the naming rule.
- [ ] No SDK/persistence type escapes the data layer.
- [ ] Registered in the module DI file by interface type.
- [ ] `melos run codegen` and `melos run analyze` pass.
