# Module Dependency Guidelines

This document defines import and dependency rules for the modular architecture in `lib/modules`.

## Goal

Keep modules independent, testable, and easy to evolve by preventing deep cross-module coupling.

## Rule of thumb

1. Domain knows what is needed.
2. Data knows how it is done.
3. Presentation/application depends on domain contract, never on data implementation.

## Current module roots

- `lib/core/`
- `lib/modules/account`
- `lib/modules/practice/session`
- `lib/modules/practice/timer`
- `lib/modules/practice/chanting`
- `lib/modules/insights`
- `lib/modules/social`

## Layering inside a module

Allowed direction:

1. `presentation -> domain`
2. `presentation -> application` (if present)
3. `application -> domain`
4. `data -> domain`
5. `data -> core infrastructure`

Disallowed direction:

1. `domain -> presentation`
2. `domain -> data`
3. `presentation -> another module's data`
4. `presentation -> another module's presentation`

## Cross-module dependency policy

A module may depend on another module only through stable contracts.

Allowed:

1. Import from another module's `domain` contract model or interface.
2. Import from another module's explicit public API file.
3. Import from `core` shared abstractions.

Not allowed:

1. Import from another module's `presentation` folder.
2. Import from another module's `data` folder.
3. Import private/internal files from another module.

## Profile model in insights: recommended approach

If insights needs profile data, use one of these patterns.

1. Shared contract pattern:
   Keep a stable profile contract in account domain (or in a shared kernel), and consume only that contract.
2. Local read-model pattern:
   Define an insights-specific read model with only required fields and map from account/profile contract at module boundary.

Use the smallest dependency that satisfies the use case.

## Public API files

Each module should expose public entrypoints and keep internals private.

Example public API files:

1. `lib/modules/account/account.dart`
2. `lib/modules/insights/insights.dart`
3. `lib/modules/practice/practice.dart`
4. `lib/modules/social/social.dart`

Other modules should import from these files (or domain-only exports), not from deep internal paths.

## Import examples

Good:

```dart
import 'package:dhyana/modules/account/account.dart';
import 'package:dhyana/modules/account/domain/profile.dart';
import 'package:dhyana/core/context/app_context.dart';
```

Bad:

```dart
import 'package:dhyana/modules/account/presentation/widget/profile_view.dart';
import 'package:dhyana/modules/account/data/firebase/firebase_profile_data_provider.dart';
import 'package:dhyana/modules/account/presentation/bloc/profile_cubit.dart';
```

## Rules for repositories and data providers

1. Repositories in a module may use only their own module data providers.
2. No module may import another module's data provider directly.
3. Shared generic providers (for example Firestore CRUD base classes) belong in `core` or shared infrastructure, not in a feature module.

## Rules for presentation

1. Presentation can depend on:
   - its own module's bloc/cubit/use-cases
   - stable domain contracts
   - core shared UI/utilities
2. Presentation cannot depend on another module's bloc/cubit/widgets/screens.

## Foreign models in presentation

Presentation may use a model from another module, but not by default and not freely.

Allowed:

1. The model is a stable business contract shared across modules.
2. The model is imported through a public domain API or shared domain kernel.
3. The widget genuinely needs the full model semantics, not just a few display fields.

Prefer mapping instead when:

1. The widget only needs a subset of fields.
2. The foreign model is shaped around another module's use case.
3. The UI would become tightly coupled to another module's future changes.

Recommended pattern:

1. Keep cross-module models at module boundaries.
2. Map them into local presentation models or view models before rendering.
3. Let leaf widgets consume local UI-focused models whenever practical.

### Example: acceptable usage

An insights widget can render a shared `Session` domain entity if `Session` is a stable cross-module concept and is exposed from shared domain or a module public domain API.

### Example: better local mapping

If an insights widget only needs:

1. session duration
2. completion time
3. session type

then prefer an insights-local presentation model such as `SessionSummaryViewData` instead of binding the widget directly to the full foreign `Session` entity.

### When to move a model into shared domain

Move a model into the shared domain kernel when:

1. It is used by multiple modules as the same core business concept.
2. It is stable and not shaped around one module's private workflow.
3. Multiple modules would otherwise import the same feature-owned domain file directly.

If those conditions do not hold, keep the model module-private and map at the boundary.

## Migration guardrails

1. During migration, temporary cross-module imports are allowed only behind TODO markers and must be removed in the same phase or next phase PR.
2. Do not move route/bootstrap internals into feature modules until module contracts are stable.
3. Update dependency wiring in one place after each phase (composition root/DI).

## PR review checklist

1. Does any import reach into another module's `presentation` or `data` folder?
2. Are cross-module imports using public API or domain contracts only?
3. Did a domain file import UI or infrastructure details?
4. Are mappings done at module boundaries instead of leaking foreign models deeply?
5. Are shared abstractions placed in core/shared rather than in a feature module?
6. Are presentation widgets depending on foreign domain models only when those models are stable shared contracts?

## Automation

Boundary checks are automated via:

1. Local script: `bash support/maintenance_scripts/check_module_boundaries.sh`
2. CI workflow: `.github/workflows/module-boundaries.yml`

The check fails when a file under `lib/modules/<source_module>/...` imports
`package:dhyana/modules/<other_module>/presentation/...` or
`package:dhyana/modules/<other_module>/data/...`.
