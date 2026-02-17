# Timer Settings

This document describes the timer settings feature, the main UI pieces, and the data flow.

## Purpose

The timer settings screen lets a user configure:
- Warmup duration
- Starting sound
- Timer duration
- Ending sound
- Optional start/end time display (based on profile settings)

## Entry Point

- `HomeScreen` provides `TimerSettingsCubit` via `TimerSettingsCubitProvider`.
- The cubit loads persisted settings on create.
- The screen renders `TimerSettingsView` when settings are loaded.

## Data Flow

1. `TimerSettingsCubit` loads settings on start via `TimerSettingsSharedPrefsService`.
2. `TimerSettingsView` renders input widgets using the current `TimerSettings`.
3. Input widgets call back into `TimerSettingsView`, which calls `timerSettingsChanged` on the cubit with a new `TimerSettings` value, and the cubit lazily persists it.
4. The Start button pushes `TimerRoute` with the current `TimerSettings`.

## Data Management

- `TimerSettingsCubit.loadTimerSettings` emits a loaded state using either provided settings (when supplied) or persisted settings from shared preferences.
- `TimerSettingsCubit.timerSettingsChanged` emits the updated state and writes it via `TimerSettingsSharedPrefsService`.
- Persistence is handled through a shared-preferences-backed service; reads happen on cubit initialization and writes happen on each change.

## UI Components

- `TimerSettingsView`
  - Container for all inputs and the start button.
  - Responds to `ProfileSettings` to show optional time labels.
- `WarmupTimeInput`
  - Duration picker for the warmup period.
- `SoundInput`
  - Picker for starting and ending sounds.
- `DurationInput`
  - Picker for the main timer duration.
- `TimerStartButton`
  - Shader-backed button that starts the timer.

## Behavior Notes

- `TimerSettingsView.didUpdateWidget` reloads cubit state when a new `TimerSettings` is supplied.
- `TimerStartButton` animates a shader background and handles tap-to-start.
- Both `DurationInput` and `SoundInput` use `OverlayService` to display modal bottom sheets.

## Widget Diagram

See `docs/timer_settings_widgets.mmd` for a Mermaid diagram of the widget tree and interactions.
