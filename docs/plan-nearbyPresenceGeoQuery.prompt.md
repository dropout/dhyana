# Plan: Nearby Presence Geo Query

## TL;DR
Extend the Presence system to support location-aware "nearby" queries. Store a `geoHash` on each Presence document, then query 9 adjacent geohash cells (center + 8 neighbors at a precision derived from the requested distance) via 9 parallel Firestore range queries. The repository post-filters by exact haversine distance (km) and re-sorts closest-first.

**Key decisions from user:**
- Distance unit: **km**
- `showPresence` location source: **`Location?` parameter at call site**
- Scope: **both `query()` and `queryStream()`**
- Query strategy: **Lower precision from distance, 9 parallel range queries**

---

## Phase 1 — Model updates (must complete before all other phases)

**Step 1. Add `location: Location?` to `Presence` model**
- File: `lib/model/presence.dart`
- Add `@JsonKey(includeIfNull: false) Location? location` field inside the `const factory Presence({...})` constructor
- No converter needed — plain nullable Location
- Regenerate freezed/json: `dart run build_runner build --delete-conflicting-outputs`

**Step 2. Extend `PresenceQueryOptions` with geo fields**
- File: `lib/model/presence_query_options.dart`
- Add import for `Location` from `'location.dart'`
- Add two optional fields: `Location? location` and `double? distance` (in km, no default)
- Regenerate freezed/json

---

## Phase 2 — Data provider geo query

**Step 4. Add `_precisionForDistance(double distanceKm) → int` helper**
- File: `lib/data_provider/firebase/firebase_presence_data_provider.dart`
- Private static/top-level function
- Mapping (pick smallest precision where 3×cellSize covers the distance):
  - ≤ 0.114 km → 8, ≤ 0.459 km → 7, ≤ 3.66 km → 6, ≤ 14.7 km → 5, ≤ 117 km → 4, ≤ 468 km → 3, else → 2

**Step 5. Add `_buildGeoQueries(PresenceQueryOptions) → List<Query<Presence>>`**
- File: `lib/data_provider/firebase/firebase_presence_data_provider.dart`
- Compute `precision = _precisionForDistance(queryOptions.distance!)`
- Encode center: `GeoHasher().encode(location.latLng.longitude, location.latLng.latitude, precision: precision)`
- Get 8 neighbors: `GeoHasher().neighbors(centerHash).values` → combined 9-cell list
- For each cell, build a query:
  ```
  collectionRef
    .where('geoHash', isGreaterThanOrEqualTo: cell)
    .where('geoHash', isLessThanOrEqualTo: '$cell~')
    .where('startedAt', isGreaterThan: Timestamp.fromDate(now - windowSize))
    .where('startedAt', isLessThan: Timestamp.fromDate(now))
    .orderBy('startedAt')
    .limit(queryOptions.limit)
  ```
- Note: `ownProfileId` exclusion is NOT applied here (moved to repository) to avoid a 3-field compound inequality index

**Step 6. Update `query()` to use geo path**
- File: `lib/data_provider/firebase/firebase_presence_data_provider.dart`
- If `queryOptions.location != null && queryOptions.distance != null`:
  - `List<List<Presence>> results = await Future.wait(_buildGeoQueries(queryOptions).map(buildListFromQuery))`
  - Flatten, deduplicate by `id` (a document might appear in overlapping cell results at low precision), sort by `startedAt` ascending
- Else: existing `_buildQuery` path (unchanged)

**Step 7. Add `_combineStreams(List<Stream<List<Presence>>>) → Stream<List<Presence>>` helper**
- File: `lib/data_provider/firebase/firebase_presence_data_provider.dart`
- Pure `dart:async` — no external packages needed
- Maintain a `List<List<Presence>> slots` indexed by stream position; when any stream emits, update its slot and add the flattened result to the controller
- Use a `StreamController<List<Presence>>` with `onCancel` cancelling all subscriptions
- Sketch:
  ```dart
  final controller = StreamController<List<Presence>>();
  final slots = List<List<Presence>>.filled(streams.length, []);
  final subs = <StreamSubscription>[];
  for (var i = 0; i < streams.length; i++) {
    final idx = i;
    subs.add(streams[idx].listen(
      (list) { slots[idx] = list; controller.add(slots.expand((l) => l).toList()); },
      onError: controller.addError,
    ));
  }
  controller.onCancel = () { for (final s in subs) s.cancel(); };
  return controller.stream;
  ```

**Step 8. Update `queryStream()` to use geo path**
- File: `lib/data_provider/firebase/firebase_presence_data_provider.dart`
- If geo: call `_combineStreams(_buildGeoQueries(queryOptions).map(buildStreamFromQuery).toList())` then `.map(deduplicate + sortByStartedAt)`
- Else: existing path

---

## Phase 3 — Repository geo filter & sort (depends on Phase 1 + 2)

**Step 9. Add `_haversineDistanceKm(LatLng a, LatLng b) → double` helper**
- File: `lib/repository/firebase/firebase_presence_repository.dart`
- Private function using `dart:math`: standard haversine formula with earth radius 6371 km

**Step 10. Add `_filterAndSortByDistance(List<Presence>, Location, double distanceKm) → List<Presence>`**
- File: `lib/repository/firebase/firebase_presence_repository.dart`
- For each Presence with a non-null `geoHash`:
  - Decode: `final coords = GeoHasher().decode(presence.geoHash!)` → `[longitude, latitude]`
  - Compute distance from query location via haversine
  - Keep if `distance <= distanceKm`
- Return sorted ascending by distance (closest first)
- Presence with null `geoHash` are excluded from results when distance filtering is active

**Step 11. Override `query()` in repository**
- File: `lib/repository/firebase/firebase_presence_repository.dart`
- Call data provider `query(queryOptions)` to get the geo-filtered (coarse) list
- If `location` + `distance` provided: apply `_filterAndSortByDistance`
- Also apply `ownProfileId` exclusion here: `presenceList.where((p) => p.id != queryOptions.ownProfileId)`
- Return final list

**Step 12. Override `queryStream()` in repository**
- File: `lib/repository/firebase/firebase_presence_repository.dart`
- Pipe the data provider stream through `.map((list) => _filterAndSortByDistance(list, ...))`
- Apply `ownProfileId` exclusion in the map
- Return the transformed stream

---

## Phase 4 — Cubit updates (depends on Phase 1)

**Step 13. Update `showPresence(profileId, {Location? location})`**
- File: `lib/bloc/presence/presence_cubit.dart`
- Add `Location? location` named parameter
- When creating `Presence`, add `geoHash: location?.geoHash`

**Step 14. Update `loadPresenceData({Location? location, double? distance, ...})`**
- File: `lib/bloc/presence/presence_cubit.dart`
- Add `Location? location` and `double? distance` named parameters
- Pass to `PresenceQueryOptions(location: location, distance: distance, ...)`

---

## Phase 5 — Firestore index (parallel with other phases)

**Step 15. Add composite Firestore index**
- File: `support/firebase/firestore.indexes.json` (or equivalent)
- Add index on collection `presence`: fields `geoHash ASC, startedAt ASC`
- Required because each of the 9 queries has inequality filters on both `geoHash` and `startedAt` simultaneously

---

## Relevant files
- `lib/model/presence.dart` — add `geoHash: String?` field
- `lib/model/presence_query_options.dart` — add `location: Location?`, `distance: double?`
- `lib/data_provider/presence_data_provider.dart` — interface (no signature change needed)
- `lib/data_provider/firebase/firebase_presence_data_provider.dart` — geo query logic
- `lib/repository/presence_repository.dart` — interface (no signature change needed)
- `lib/repository/firebase/firebase_presence_repository.dart` — distance filter + sort
- `lib/bloc/presence/presence_cubit.dart` — showPresence and loadPresenceData updates
- `support/firebase/firestore.indexes.json` — new composite index

---

## Verification
1. Run `dart run build_runner build --delete-conflicting-outputs` — expect no errors
2. Run `flutter test` — all existing tests pass (especially `MockPresenceRepository` in `test/mock_definitions.dart` and the widget test that uses presence)
4. Manual: call `showPresence('id', location: someLocation)` → verify Firestore document has `geoHash` field set
5. Manual: call `loadPresenceData(location: someLocation, distance: 5.0)` → verify only users within 5km radius are returned, sorted closest-first
6. Manual (edge case): call without location → verify existing time-window-only behavior is unchanged

---

## Decisions
- `ownProfileId` exclusion moved from data provider to repository for the geo path (avoids 3-field compound inequality Firestore index)
- `Presence.geoHash` is nullable; existing documents without it are excluded when distance filtering is active
- Stream combining uses a native `dart:async` `StreamController`; no additional dependencies required

## Considerations
1. **Pagination with geo queries**: `loadMorePresenceData` uses `lastDocumentId` cursor pagination. This does not work across 9 parallel queries — pagination support for geo queries is left out of scope and will need a separate design (e.g., client-side pagination of the full merged result).
2. **Index cost**: 9 parallel Firestore queries per page load; at typical usage volumes this is acceptable, but could be monitored.
