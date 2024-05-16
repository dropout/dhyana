# Dhyana - Meditation Timer

## What?
A simple meditation timer (Work in progress version)  

## How?
Encourage your practice with measuring consecutive days.  
Support your practice with the presence of community members.  
Simple and easy to use.

## Who?
For serious practitioners. No guided meditations.

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

### Requirements
- flutter
- firebase cli
- gsutil cli

### Flavors configured (iOS only for now):
- local
- staging
- production


## Commands

### Code generation

- build localizations: `flutter gen-l10n`
- build freezed models: `dart run build_runner build`
- start firebase emulator: `./start_firebase_emulator.sh -d empty_with_admin_user`

### Building

- release android: `flutter build appbundle --release --flavor staging -t ./lib/main_staging.dart`
- release ios: `flutter build ipa --release --flavor staging -t ./lib/main_staging.dart`
