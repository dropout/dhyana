# Feature Design Guidelines (Architecture-Aligned)

This document describes how to design and document a new feature so it fits the current app architecture. It is intended to guide the architect agent and developers when designing additions to the system.

## 1. Architectural Principles
- **Layered flow**: `Widget -> Cubit/Bloc -> Repository -> Data Provider` (plus backflow of state).
- **Single responsibility**: Each layer should do one job and be testable in isolation.
- **Contract-first**: Define interfaces before concrete implementations.
- **Deterministic state**: Cubit state is the source of truth for UI.
- **Dependency direction**: Upper layers depend on interfaces of lower layers, never the reverse.

## 2) Feature Summary
- **Name**: _Short, descriptive feature name._
- **Goal**: _What problem does the feature solve?_
- **Primary User Flow**: _Bullet list of user actions and expected outcomes._
- **Scope**: _In-scope vs out-of-scope behaviors._

## 3) Architecture Mapping (All Layers)
Describe how the feature maps to each layer in the architecture. Use the sections below for consistency.

### Presentation Layer
- **Widgets**
  - `lib/widget/...`: _List new or updated widgets and their responsibility._
  - **Guideline**: 
    - Keep widgets declarative; Read from Cubit state and dispatch user intent
    - Group related widgets into a directory named after the feature.
  - **Example**: `FeatureCard` renders the entry point for the feature and dispatches user intent to the Cubit.
- **Cubit/Bloc**
  - `lib/bloc/...`: _List Cubit/Bloc classes, their state shape, and events._
  - **Guideline**: Validate input, orchestrate calls to repositories and/or services, emit immutable state.
  - **Example**: `FeatureCubit` manages feature state and calls the repository on saving feature data.
- **Navigation/Transitions**
  - `lib/widget/app_routes.dart`: _Any new routes or navigation logic._
  - **Guideline**: Keep navigation decisions in the presentation layer.
  - **Example**: Add `FeatureRoute` to the routes files, define any necessary arguments.
- **Screens**
  - `lib/screen/...`: _New or updated screens that compose the feature._
  - **Guideline**: Screens are responsible for injecting the Cubit/Bloc and to render scaffoldings.
  - **Example**: `FeatureScreen` injects `FeatureCubit` and renders `FeatureView`.
- **Localization**
  - `lib/l10n/...`: _New strings and their usage._
  - **Guideline**: Add new strings to the appropriate ARB files and reference them in widgets.
  - 

### Domain Layer
- **Models**
  - `lib/model/...`: _New or updated domain models; include fields and invariants._
  - **Guideline**: Use `freezed` library to define models.
  - **Example**: `FeatureDetail { featureName, featureDuration, createdAt }` with validation rules.
- **Enums**
  - `lib/enum/...`: _Any new enums used across layers._

### Data Layer
- **Repositories**
  - `lib/repository/...`: _Repository interfaces and implementations._
  - **Guideline**: 
    - Repositories define use-case-oriented operations and hide persistence details across multiple data providers.
    - Use `lib/repository/crud_repository.dart` for common CRUD operations if applicable.
  - **Example**: `SessionRepository` exposes `createPlan` and `loadPlans`.
- **Data Providers**
  - `lib/data_provider/...`: _Abstract and concrete data providers for Firebase or local cache._
  - **Guideline**: 
    - Providers talk directly to external systems (Firestore, local storage, HTTP).
    - Use `lib/data_provider/crud_data_provider.dart` for common CRUD operations if applicable.
  - **Example**: `FirestoreSessionPlanDataProvider` implements `SessionPlanDataProvider` and handles Firestore interactions.

### Infrastructure / External
- **Firebase / Cloud Functions**
  - _Any Firestore collections, Cloud Functions, or Storage needs._
- **Services**
  - `lib/service/...`: _Service interface + implementation used by cubits and repositories._
  - **Guideline**:
    - Services provide external capabilities that may be used across multiple features (e.g., audio playback, notifications, analytics).
    - Keep services stateless and focused on a single domain of functionality.
  - **Example**: `DefaultAudioService` implements `AudioService` and provides methods to play / pause sounds.

## 4) Cross-Cutting Concerns
- **Error Handling**: Define user-facing errors and recovery states in Cubit state.
- **Logging/Analytics**: Document any events and where they are emitted.
- **Permissions**: Specify access rules for data providers and Firestore rules.
- **Performance**: Identify any hot paths or heavy operations that need caching.

## 5) Example Feature Walkthrough (End-to-End)
Use the template below to show the full flow for one concrete action within the feature.

### Example: Save a Session Plan
1. **Widget**: `FeatureCard` displays data and gathers user inputs.
2. **Cubit**: `FeatureCubit.update(Feature feature)` validates input and calls `FeatureRepository.update(Feature feature)`.
3. **Repository**: `ConcreteFeatureRepository` calls `FeatureDataProvider.update(Feature feature)`.
4. **Data Provider**: `ConcreteFeatureDataProvider` writes to `feature/{uid}/feature_data`.
5. **Result**: Cubit updates `FeatureState` with success or error; UI reacts.

## 6) Contracts (Interfaces)
Specify the contracts so the architecture remains consistent.

### Repository Interface (Example)
```dart
abstract class FeatureRepository {
  Future<void> create(Feature feature);
  Stream<List<Feature>> queryStream();
}
```

### Service Interface (Example)
```dart
abstract class FeatureService {
  Future<FeatureCalculationResult> playFeature(Feature feature);
}
```

### Data Provider Interface (Example)
```dart
abstract class SessionPlanDataProvider {
  Future<void> create(Feature feature);
  Stream<List<Feature>> queryStream();
}
```

## 7) Example Service Implementation (Sketch)
Provide at least one concrete service example to clarify boundaries.

```dart
class ConcreteFeatureService implements FeatureService {
  ConcreteFeatureService(this._library);

  final SessionPlanDataProvider _library;

  @override
  Future<void> play(Feature feature) {
    return _library.play(feature);
  }
}
```

## 8) Data Schema (If Firebase)
- **Collection**: `users/{uid}/session_plans`
- **Fields**: `duration`, `bellSound`, `themeId`, `createdAt`, `updatedAt`
- **Indexes**: _List any required composite indexes._

## 9) Localization
- `lib/l10n/`: _New strings and usage._

## 10) Testing Strategy
- **Cubit tests**: Validate state transitions for success and error paths.
- **Repository/service tests**: Ensure provider calls and mapping logic are correct.
- **Integration tests**: Validate the end-to-end user flow.

## 11) Observability & Error Handling
- _List user-facing error states, retries, and logging needs._

## 12) Rollout Notes
- _Feature flags, staged rollout, or migration steps._
