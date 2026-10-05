---
name: flutter-localization-extraction
description: 'Extract hardcoded inline text from a Flutter widget into module-specific ARB localization files and replace it with a generated localization call. Use after finishing a widget with literal strings (Text("..."), labels, tooltips, hints, semantics), or when asked to localize/internationalize a widget, add ARB keys, or clean up hardcoded strings.'
---

# Flutter Localization Extraction

## When to Use

- A widget was just written or edited and contains literal user-facing strings (e.g. `Text('Sit for a while')`, `tooltip: 'Close'`, `hintText: 'Enter name'`, `SemanticsLabel`).
- The user asks to localize a widget, remove hardcoded strings, or add ARB entries.

Do not use for non-user-facing strings: debug logs, analytics event names, asset paths, keys, or identifiers.

## Repo Facts

- Every module owns its own l10n setup: `packages/{core|modules/**}/l10n.yaml` + `packages/{core|modules/**}/lib/l10n/{module}_en.arb` and `{module}_hu.arb`.
- `l10n.yaml` declares `output-class: {ModuleName}Localizations` (e.g. `TimerLocalizations`, `AuthLocalizations`, `CoreLocalizations`).
- Generated usage: `{ModuleName}Localizations.of(context).someKey`, imported from `package:{module}/l10n/{module}_localizations.dart`.
- Core has a shortcut extension: `context.coreL10n.someKey` (see [app_context.dart](../../../packages/core/lib/src/presentation/view/util/app_context.dart)). Other modules have no shortcut — use the full `.of(context)` form.
- ARB keys are `camelCase`, prefixed by feature/screen (e.g. `timerTitle`, `loginHeadline1`, `profileDeleteTitle`). Generic short strings have no prefix (`okay`, `close`).
- Plurals use ICU plural syntax already present in ARB files (see `minutesPlural`, `minutesPluralWithNumber`) — follow this pattern for any new countable string instead of manual `count == 1 ? ... : ...` branching.
- Regenerate localization code with `melos run codegen:l10n` (runs `flutter gen-l10n` in every package) after editing any ARB file.

## Procedure

1. **Identify the target widget file** the user points to (single file scope). Read it fully.
2. **Collect candidate strings**: every string literal that renders to the user — `Text(...)`, `Text.rich` spans, `tooltip`, `hintText`, `labelText`, `semanticLabel`, `title`/`content` in dialogs/snackbars, button child text, `AppBar` titles, error messages shown in UI. Skip strings passed to logging, `debugPrint`, keys, route names, or asset paths.
3. **Determine the owning module** from the widget's path (e.g. `packages/modules/practice/timer/...` → `timer` module, ARB at `packages/modules/practice/timer/lib/l10n/timer_en.arb`). Confirm the inferred module/ARB file with the user before writing, since a widget can sometimes reuse a shared/core string.
4. **Check for reuse before adding new keys**: search the target module's `*_en.arb` and `packages/core/lib/l10n/core_en.arb` for an existing key with the same or near-identical value. Reuse an existing key (importing `CoreLocalizations` if the match is in core) instead of duplicating.
5. **For each remaining new string**, add a key to the module's `{module}_en.arb`:
   - Name it `camelCase`, prefixed with the feature/screen name consistent with sibling keys already in that file.
   - If the string is countable/pluralized, use ICU plural form matching the existing `*Plural`/`*PluralWithNumber` patterns rather than string concatenation.
   - If the string has placeholders (names, counts, dynamic values), use ARB placeholders (`{count}`, `{name}`) with a `@key` metadata block only if sibling entries in that file already document placeholders that way — otherwise keep it minimal and consistent with the file's current style.
6. **Add the Hungarian translation** to the sibling `{module}_hu.arb` with the same key, translating the meaning into Hungarian (not copying the English text).
7. **Edit the widget**: replace each literal string with the localization call.
   - In `packages/core/**`, prefer `context.coreL10n.key`.
   - In any other module, use `{ModuleName}Localizations.of(context).key` and add the import `package:{module_package}/l10n/{module}_localizations.dart` if missing.
8. **Regenerate**: run `melos run codegen:l10n`.
9. **Verify**: run `melos run analyze` (or analyze just the touched package) to confirm the generated getters resolve and there are no unused imports.

## Completion Checks

- No string literal in the touched widget renders directly to the user; all such text goes through a generated `*Localizations` accessor.
- Every new key exists in both `{module}_en.arb` and `{module}_hu.arb`, with a real Hungarian translation (not a copy of the English value).
- No duplicate key was created for a string that already existed in the same module's ARB or in `core`.
- New key names follow the file's existing `camelCase` + feature-prefix convention.
- Plural/placeholder strings use ICU syntax consistent with existing entries, not manual branching or string interpolation of full sentences.
- `melos run codegen:l10n` was run after ARB edits, and the generated `{module}_localizations*.dart` files reflect the new keys.
- `melos run analyze` passes for the touched package(s).
