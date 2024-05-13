# Dhyana - Meditation Timer

A simple meditation timer for everyday meditators.

## Features

### Timer 
- Preparation time
- Starting sound
- Duration
- Ending sound

### Profile
- Name, profile image
- Track sessions
- Count consecutive days

### Community
- Show who you have meditated with

## Getting Started

Currently developing on iOS platform.  
The application won't run without `GoogleService-Info.plist`.  


### Flavors configured (iOS only for now):
- local
- staging
- production


## Commands

### Code generation

- build localizations: `flutter gen-l10n`
- build freezed models: `dart run build_runner build`
- start firebase emulator: `./start_firebase_emulator.sh -d empty_with_admin_user`
