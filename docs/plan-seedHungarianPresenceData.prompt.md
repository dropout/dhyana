## Plan: Seed Hungarian Presence Data

Add a checked-in reusable staging seed script under the existing maintenance-scripts area, generate 18 deterministic Presence records for Hungarian cities, and write them into the Firestore `presence` collection in the schema the app actually queries. Reuse the existing model shape and default profile placeholders where possible, and explicitly handle the current `geoHash` mismatch so nearby queries work immediately in staging.

**Steps**
1. Confirm the write schema for `presence` against the app’s read path. Reuse `Presence`, `Location`, and `PublicProfile` from the app models as the source of truth, but account for the fact that the current Firestore query uses a top-level `geoHash` while generated JSON nests `location.geoHash`. This step blocks the seed payload shape.
2. Implement the reusable seed entrypoint in `/Users/adam/Projects/dhyana/support/maintenance_scripts/`. Recommended approach: add a dedicated Node script there because the folder already depends on `firebase-admin` and is the repo’s existing maintenance-script area. Avoid introducing a second scripting stack unless there is a strong reason to keep the seed path in Dart.
3. Add a deterministic data source for exactly 18 Hungarian cities with fixed coordinates. Use well-known cities such as Budapest, Debrecen, Szeged, Miskolc, Pecs, Gyor, Nyiregyhaza, Kecskemet, Szekesfehervar, Szombathely, Szolnok, Tatabanya, Kaposvar, Bekescsaba, Zalaegerszeg, Eger, Nagykanizsa, and Sopron. Compute geohashes at precision 8 to match the app’s city selector logic.
4. Build each seed document to match the current Presence requirements: deterministic `id`, `profile` object, `startedAt`, and `location`. Reuse the existing default profile image URL and blurhash from `/Users/adam/Projects/dhyana/lib/util/default_profile_data.dart` unless product-specific avatars are required. Make `startedAt` recent enough to satisfy the app’s default query window so the seeded records are visible without further configuration.
5. Decide and implement idempotency behavior. Recommended approach: use stable document ids like `staging-hu-001` through `staging-hu-018` and write with overwrite semantics so rerunning the script refreshes the same 18 records instead of growing the collection.
6. Add a safe execution contract for staging. Include explicit project targeting to `dhyana-staging`, a conspicuous confirmation/logging step, and usage documentation in the script or maintenance-scripts README/package scripts so the seed path is repeatable by other contributors.
7. If the team wants the app and Firestore schema aligned, add a follow-up implementation slice to normalize `geoHash` handling permanently. Recommended direction: either flatten `geoHash` into the Firestore payload for Presence writes or update the presence query code to use the nested path consistently. This can run in parallel with seed-script authoring only if the seed payload is deliberately writing both fields for compatibility.

**Relevant files**
- `/Users/adam/Projects/dhyana/lib/model/presence.dart` — source-of-truth Presence fields required in each seed document
- `/Users/adam/Projects/dhyana/lib/model/location.dart` — required location payload and nested `geoHash`
- `/Users/adam/Projects/dhyana/lib/model/public_profile.dart` — required public profile shape for seeded records
- `/Users/adam/Projects/dhyana/lib/util/default_profile_data.dart` — reusable placeholder photo URL and blurhash for test profiles
- `/Users/adam/Projects/dhyana/lib/data_provider/firebase/firebase_presence_data_provider.dart` — current Firestore read/query behavior, including top-level `geoHash` and time-window filtering
- `/Users/adam/Projects/dhyana/lib/data_provider/firebase/firebase_model_extension.dart` — confirms model writes currently mirror generated JSON directly
- `/Users/adam/Projects/dhyana/support/maintenance_scripts/package.json` — existing reusable scripting area with `firebase-admin`
- `/Users/adam/Projects/dhyana/support/maintenance_scripts/src/index.mjs` — likely seed-script entrypoint or pattern to extend
- `/Users/adam/Projects/dhyana/support/firebase/staging/.firebaserc` — confirms the default staging Firebase project id
- `/Users/adam/Projects/dhyana/support/firebase/staging/firestore.indexes.json` — existing `presence` index needed by nearby queries

**Verification**
1. Run the reusable seed script against the staging project and confirm it reports exactly 18 upserts to the `presence` collection.
2. Inspect Firestore and verify each document contains `id`, `profile`, `startedAt`, `location`, and a queryable geohash field compatible with `/Users/adam/Projects/dhyana/lib/data_provider/firebase/firebase_presence_data_provider.dart`.
3. Launch the staging app or a narrow repository/data-provider check and confirm a presence query with the default limit returns the seeded records within the active time window.
4. Re-run the seed script and verify the document count remains 18, confirming idempotent overwrite behavior.
5. If the geoHash schema is normalized as part of the work, add or run a focused test around Presence serialization/query assumptions so future writes cannot regress the Firestore shape silently.

**Decisions**
- Included scope: checked-in reusable seed path for the staging Firebase project and exactly 18 Hungarian-city Presence records.
- Excluded scope: production seeding, emulator-only fixtures, and unrelated presence feature changes.
- Recommendation: implement the seed path in `support/maintenance_scripts` rather than as a Flutter/Dart script because the repo already has a Node maintenance area with `firebase-admin` available.
- Risk to address during implementation: current app code writes nested `location.geoHash`, but nearby queries read top-level `geoHash`; the seed payload must account for this or the app’s location queries will not see the new records.

**Further Considerations**
1. If you want the seeded records to look more realistic in UI screenshots, vary first and last names across the 18 profiles while still reusing the default image assets.
2. If staging already contains manual presence data, decide whether the script should optionally prune only its own deterministic ids before reseeding or simply overwrite them in place.
3. If this seed path will be reused often, add a package script alias in `support/maintenance_scripts/package.json` so it can be run without remembering the raw node command.
