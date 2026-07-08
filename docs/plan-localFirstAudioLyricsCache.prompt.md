## Plan: Local-First Audio/Lyrics Cache with Remote Invalidation

Implement a cache-first playback pipeline that always resolves to app-documents local files before handing paths to SoLoud, with Firestore as the version authority and Drift as the local cache index. On each play request, run an on-demand pre-flight validation against remote metadata; invalidate and re-download stale assets; if offline, play existing cache when available.

**Steps**
1. Phase 1 - Contracts and data model design
2. Define a Firestore metadata contract for each chant asset pair (audio + lyrics) with deterministic invalidation fields: `contentId`, `audioStoragePath`, `lyricsStoragePath`, `version`, `updatedAt`, `audioSha256`, `lyricsSha256`, `audioBytes`, `lyricsBytes` (*blocks all downstream implementation*).
3. Add/extend freezed model(s) for remote metadata in domain layer, following existing `@freezed` + JSON conventions from [lib/model/download_manifest.dart](lib/model/download_manifest.dart) and timestamp conversion pattern from [lib/model/converter/date_time_converter.dart](lib/model/converter/date_time_converter.dart).
4. Design Drift schema for cache tracking (single table for both asset types) with columns: `id` (pk), `contentId`, `assetType` (`audio|lyrics`), `storagePath`, `localFilePath`, `cachedVersion`, `remoteUpdatedAtEpochMs`, `remoteHash`, `fileBytes`, `isValid`, `downloadState`, `failureCount`, `lastError`, `lastValidatedAt`, `createdAt`, `updatedAt`; add unique index on (`contentId`,`assetType`) and query index on `contentId` (*depends on step 2*).
5. Add Drift enum/type converters for `assetType` and `downloadState`, using the same converter style as [lib/drift/offline_download_kind_converter.dart](lib/drift/offline_download_kind_converter.dart) (*depends on step 4*).
6. Phase 2 - Data providers and repository orchestration
7. Introduce Firestore provider contract for remote metadata lookup by `contentId` (or batch by ids for selected chants) in `lib/data_provider/firebase/` and keep Firebase-specific parsing inside provider layer (*depends on step 3*).
8. Extend storage provider boundary to support metadata-aware download workflow (download URL retrieval and byte fetch/write flow) while preserving existing upload/delete methods in [lib/data_provider/storage_data_provider.dart](lib/data_provider/storage_data_provider.dart) (*parallel with step 7 after model is final*).
9. Add Drift cache data provider under `lib/data_provider/drift/` for CRUD/upsert and state transitions (`pending -> downloading -> complete` and failure tracking), reusing insertion/query patterns from [lib/data_provider/drift/drift_download_data_provider.dart](lib/data_provider/drift/drift_download_data_provider.dart) (*depends on step 4*).
10. Define `AudioRepository` orchestration methods for pre-flight and retrieval, e.g., `preparePlayableChantAssets(List<String> contentIds)` and `preparePlayableAsset(String contentId, AssetType type)`, ensuring repository owns invalidate/download decisioning (*depends on steps 7-9*).
11. Phase 3 - Cache manager + filesystem persistence
12. Add `CacheManager` service interface in `lib/service/` as the single owner of local file lifecycle: path building, existence checks, hash validation, safe write, delete invalidated files, and atomic replace; enforce app-documents root using `getApplicationDocumentsDirectory()` only (*depends on step 10*).
13. Implement deterministic file layout under documents directory, e.g., `.../cached_content/{contentId}/audio_{version}.mp3` and `.../cached_content/{contentId}/lyrics_{version}.ass`, with migration-safe helper methods and no temp directory usage (*depends on step 12*).
14. Implement download transaction pattern: mark Drift row `downloading`, stream/download to `*.part`, verify byte count/hash, rename to final path, then commit Drift `complete + isValid=true`; on any error, delete partial file and persist failure metadata (*depends on steps 9 and 12*).
15. Phase 4 - Playback service and Cubit integration
16. Update/extend `PlaybackService` and chanting pipeline so setup receives local file paths instead of URLs; target integration points are [lib/bloc/chanting/chanting_cubit.dart](lib/bloc/chanting/chanting_cubit.dart), [lib/service/chanting_audio_service.dart](lib/service/chanting_audio_service.dart), and [lib/audio/so_chanting_audio_handler.dart](lib/audio/so_chanting_audio_handler.dart) (*depends on phases 2-3*).
17. Replace URL-based load path in SoLoud handler from `loadUrl(..., mode: .memory)` to local-file loading (`mode: .disk`/local file API), ensuring acceptance criterion that playback never receives remote streams (*depends on step 16*).
18. Refactor `ResourceResolver` role: keep it for storage path resolution if needed, but move playback-critical pre-flight logic into repository/cache manager (avoid resolver becoming stateful orchestration layer) (*parallel with step 16*).
19. Phase 5 - Pre-flight algorithm (critical path)
20. Implement pre-flight sequence for each chant when user presses Play: read Drift entry by (`contentId`,`assetType=audio`), fetch Firestore metadata for current remote version, compare (`cachedVersion`, `remoteUpdatedAt`, `remoteHash`), invalidate local if mismatch, ensure local download exists and verifies, return local path; repeat for lyrics asset and build path map for player + lyrics loader (*depends on phases 2-4*).
21. Define explicit decision tree:
22. If Drift miss and network available: download, store, play local.
23. If Drift hit and version matches and file exists/hash OK: play local immediately.
24. If Drift hit but invalidated/missing/corrupt and network available: re-download then play.
25. If network unavailable and valid local exists: play local and mark `lastValidatedAt` stale.
26. If network unavailable and no local: emit recoverable UI error state and block playback.
27. Add timeout/retry policy for metadata fetch and download with capped retries and exponential backoff persisted in Drift `failureCount` (*depends on step 20*).
28. Phase 6 - Error handling, observability, and UX states
29. Add domain error types for `metadataUnavailable`, `downloadInterrupted`, `hashMismatch`, `localFileMissing`, `offlineNoCache` and map them to user-facing states in `ChantingCubit` while reporting all failures through Crashlytics pattern already used in [lib/bloc/chanting/chanting_cubit.dart](lib/bloc/chanting/chanting_cubit.dart).
30. Handle interrupted downloads by resumable strategy where possible or clean restart: any `*.part` older than threshold is purged on next pre-flight; Drift row reset from `downloading` to `failed` on startup reconciliation (*depends on steps 14 and 20*).
31. Handle corruption by validating hash/size before playback and triggering forced invalidate + redownload; if still failing, fail gracefully with actionable error state (*depends on steps 14 and 29*).
32. Handle offline pre-flight by short-circuiting remote validation when connectivity check fails and relying on last known valid local file per accepted policy (*depends on step 20*).
33. Phase 7 - Dependency wiring and rollout
34. Register new providers/services/repository wiring in initialization graph around [lib/init/initializer.dart](lib/init/initializer.dart), `RepositoriesBuilder`, and `ServicesBuilder`, keeping dependency direction Widget -> Cubit -> Repository -> Data Provider/Service.
35. Add migration handling for Drift schema bump and startup reconciliation task (clean stale partials, normalize invalid states) before first playback call.
36. Perform staged rollout behind an internal feature flag if desired, with fallback to existing behavior during transition only in non-production builds.

**Relevant files**
- `/Users/adam/Projects/dhyana/lib/model/download_manifest.dart` - pattern to follow for new freezed metadata models; likely add `chant_asset_metadata.dart` or similar.
- `/Users/adam/Projects/dhyana/lib/model/converter/date_time_converter.dart` - reuse timestamp conversion approach for Firestore metadata fields.
- `/Users/adam/Projects/dhyana/lib/drift/database.dart` - add new cache table(s), converters, and schema version bump.
- `/Users/adam/Projects/dhyana/lib/drift/offline_download_kind_converter.dart` - reference implementation for enum converters in Drift.
- `/Users/adam/Projects/dhyana/lib/data_provider/drift/drift_download_data_provider.dart` - concrete drift provider pattern for upsert/query mapping.
- `/Users/adam/Projects/dhyana/lib/data_provider/storage_data_provider.dart` - extend storage interface for cache workflow support.
- `/Users/adam/Projects/dhyana/lib/data_provider/firebase/firebase_storage_data_provider.dart` - storage download interactions; adapt for metadata/download helpers.
- `/Users/adam/Projects/dhyana/lib/service/resource_resolver.dart` - boundary review; retain pure resolution responsibilities.
- `/Users/adam/Projects/dhyana/lib/service/default/default_resource_resolver.dart` - existing chant storage path construction.
- `/Users/adam/Projects/dhyana/lib/repository/` - add/adjust audio repository contract and implementation for pre-flight orchestration.
- `/Users/adam/Projects/dhyana/lib/service/` - add `CacheManager` and `PlaybackService` interfaces/implementations.
- `/Users/adam/Projects/dhyana/lib/bloc/chanting/chanting_cubit.dart` - invoke repository pre-flight before setup/play and surface errors.
- `/Users/adam/Projects/dhyana/lib/service/chanting_audio_service.dart` - adapt setup contract from URL map to local path map.
- `/Users/adam/Projects/dhyana/lib/audio/so_chanting_audio_handler.dart` - enforce local file loading into SoLoud.
- `/Users/adam/Projects/dhyana/lib/init/initializer.dart` - wire new dependencies.

**Verification**
1. Drift schema tests: validate insert/update/query and unique key behavior for (`contentId`,`assetType`) and state transitions.
2. Repository unit tests: cover pre-flight branches (cache hit valid, cache hit invalidated, cache miss online, cache miss offline, corruption redownload, interrupted download recovery).
3. Cache manager tests: verify documents-directory path building, atomic write/rename, partial cleanup, hash verification, and no temp-directory usage.
4. Chanting cubit tests: ensure user pressing play triggers pre-flight and emits expected loading/error/success states.
5. Integration test: first play downloads then plays from local path; second play is cache hit without remote bytes download; metadata change in Firestore forces re-download.
6. Static checks: run `dart run build_runner build`, `flutter analyze`, and focused `flutter test` suites for bloc/repository/service layers.
7. Manual verification on device/emulator: terminate/restart app and confirm cached playback still works; simulate OS temp clearing (without deleting app docs) and confirm cache survives.

**Decisions**
- Remote metadata source of truth: Firestore.
- Offline policy: if network unavailable, allow playback from existing valid cache.
- Sync scope: on-demand pre-flight only at play time (no proactive background prefetch in this feature).
- Included scope: chanting audio + lyrics caching/validation for playback path.
- Excluded scope: generic global media cache UI, playlist prefetch scheduler, migration of unrelated timer/audio asset flows.

**Further Considerations**
1. Metadata granularity: per-chant single `version` for both files vs independent `audioVersion`/`lyricsVersion`; recommendation is independent fields to avoid unnecessary redownloads.
2. Integrity check strategy: hash+size verification is preferred over timestamp-only comparison for corruption detection.
3. Batch metadata fetch: for multi-chant sessions, use batched Firestore reads to reduce latency before playback.