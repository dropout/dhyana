# Timer module

## Overview
The timer module is responsible for managing timer sessions, including setup, execution, and history management. It integrates with audio services to provide interval and ending sounds, and ensures accurate time measurement even when the app is running in the background.

## Features
- Setup timer session
- Run timer session
- Show presence of the user if authenticated and allowed in user settings
- Show timer settings history and allow restoring previous settings

## Technical details
- Runs in the background with home screen integration, uses playing a silent audio to keep the app alive in the background enabling the timer to play interval sounds and ending sound even when the app is in the background.
- Time measurement is based upon audio playback time, with [EventScheduler] to schedule events based upon the audio playback time

## Architectural notes

- In the timer module the services lifecycle is bound to the viewmodel lifecycle
- There is pragmatic shortcut to call services directly within the viewmodel to avoid boilerplate and creating one-liner usecases
- Everything that is more than a one liner should be in a usecase though
- Domain entities are leaking to both data and presentation layers, creating tighter coupling between the layers
- TimerSettings are saved and restored by a HydratedCubit in the presentation layer
- TimerSettingsHistoryCubit contains one liners to repository methods, if business logic grows will need its usecases to be created