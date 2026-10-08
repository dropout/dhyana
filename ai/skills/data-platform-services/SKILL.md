---
name: data-platform-services
description: "Implement domain service interfaces in a Dhyana data layer using platform capabilities: audio, haptics, file system, downloads, and navigation. Use when adding or changing a `Default*Service`, `*FileSystem`, downloader/validator, or `Default*Navigator` under `data/service/`, or when deciding whether a class in `data/service` is really a domain manager."
license: MIT
---

# Dhyana Platform Services

Read `data-layer` first. This skill covers `data/service/` classes that are **not** public APIs or port adapters (those are in `data-boundary`).

## What belongs here

A class in `data/service/` exists because it touches a platform or SDK that the domain must not know about.

| Kind | Examples | Domain contract |
|---|---|---|
| SDK/platform service | `DefaultTimerAudioService` (audio handler, haptics) | `TimerAudioService` in `domain/service/` |
| File system / OS access | `ChantCacheFileSystem` | none, or a narrow interface |
| Transfer/IO helpers | `ChantAssetDownloader`, `file_validation_extension.dart` | used by a domain manager or repository |
| Navigator | `DefaultProfileNavigator`, `DefaultTimerNavigator` | `<Module>Navigator` base class |

## Rules

1. **Interface in domain, implementation here.** `class DefaultXService implements XService`. The domain interface speaks in entities and primitives (`PlaybackStateEntity`, `Duration`), never SDK types.
2. **Map SDK types at the edge.** Convert with a mapper extension (`PlaybackStateToDomain` on `audio_service.PlaybackState`, see `data-boundary`) before returning or emitting.
3. **No business rules.** A service that decides *what* to do (validation rules, retry policy, state machines) is domain logic. Move it to a domain service or manager and keep only the platform call here (see "Spotting misplaced logic").
4. **Constructor injection for platform handles** (`AppAudioHandler`, `Future<Directory> Function() documentsDirectoryProvider`) so tests can substitute them. No `GetIt` lookups and no `FirebaseFirestore.instance`.
5. **Lifecycle.** If the service owns resources (streams, timers, handlers), expose `dispose()`/`close()` and make DI or the owning cubit call it. Cancel subscriptions there.
6. **Time and ids** come from `clock` and `IdGeneratorService`, not `DateTime.now()` / `Random()`.
7. **Platform effects** (haptics via `gaimon`) stay inside the implementation and fail with a log (`LoggerMixin`), never crash the flow.

## Navigators

- `class DefaultXNavigator extends XNavigator`, constructor `super.router`; one method per destination calling `navigateTo(XRoute(...), type: type)`.
- They import the module's `*_routes.dart` only. No logic, no state.
- Registered first in DI under `// Navigator`.

## File system and downloads

- Keep paths and layout in one class (`ChantCacheFileSystem`); other code asks it for paths and never builds them by string concatenation.
- Use `StorageDataProvider` from core for remote files; do not call `FirebaseStorage` directly.
- Download to a temporary name and rename on success, so an interrupted download never looks like a valid cache file.

## Spotting misplaced logic

Move a class to `domain/service/` (as a service or manager, see `domain-layer`) when it:

- decides validity, versions, or retry/backoff;
- coordinates repositories and updates state across steps;
- has behavior you want to unit test without the file system or network.

Leave only the platform primitives (read file, write file, download bytes) behind a small interface in the data layer.

Current offenders: `ChantAssetDownloader` (download orchestration plus cache-entry state) and `ChantCacheValidator` (validation rules, imports Drift rows). New code splits them as a domain manager (rules and state, alongside `ChantCacheManager`) plus data primitives (`ChantCacheFileSystem`, `StorageDataProvider`).

## DI

```dart
registerLazySingleton<TimerAudioService>(
  () => DefaultTimerAudioService(get<AppAudioHandler>()),
);
registerLazySingleton(() => ChantCacheFileSystem(
  documentsDirectoryProvider: getApplicationDocumentsDirectory,
));
```

Register by the domain interface when one exists.

## Testing

- Mock the injected handle (`AppAudioHandler`, directory provider); assert the domain-facing behavior.
- File-system classes: use a temp directory per test and delete it in `tearDown`.
- Do not test platform plugins themselves.

## Legacy deviations (do not copy)

- `ChantAssetDownloader` and `ChantCacheValidator` hold business logic and import Drift row types.
- `DefaultTimerService` implements a domain interface marked "not in use currently"; do not extend it.
- `timer/src/audio/` sits outside `data/` while `DefaultTimerAudioService` imports it; put new audio handlers beside the service that uses them or in `core`.

## Checklist

- [ ] Implements a domain interface or is a narrow platform helper.
- [ ] No SDK type leaves the class; no business rules inside.
- [ ] Dependencies injected; resources disposed.
- [ ] Uses `clock` / `IdGeneratorService`.
- [ ] Registered in DI by interface type.
