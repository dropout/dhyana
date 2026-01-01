# Dhyana - Meditation Timer (Work in Progress)

## Overview


[![Overview](https://github.com/dropout/dhyana/blob/63f2e48ef5cbf9d7963f2fb9f151498be3d867c5/docs/assets/video_placeholder.jpg)](https://github.com/dropout/dhyana/blob/63f2e48ef5cbf9d7963f2fb9f151498be3d867c5/docs/assets/video.mp4)


https://github.com/dropout/dhyana/blob/63f2e48ef5cbf9d7963f2fb9f151498be3d867c5/docs/assets/video.mp4
A simple and clean meditation timer, when you just need a timer to support your practice.
Least noise possible but with enough features to be able to support a busy lifestyle.

## Tech stack: 
- Flutter 
- Firebase 
- Google Cloud Platform
- Stripe

## Features

### Timer Settings
- Preparation time
- Starting sound
- Duration
- Ending sound
- Settings history

### Timer / Session
- Display timer phases
- Dimmable screen
- Pause timer
- Discard session / Finish session

### Profile
- Edit profile
  - Profile image
  - Firstname
  - Lastname
  - Location, geohash (City Selector via Cloud Functions / Google Maps API)
- Profile settings
  - Show / Hide statistics and progress
  - Show / Hide current time on timer settings screen
- Delete profile

### Statistics
- Session history
- Count consecutive days
- Count milestones (after every 7 consecutive days)
- Count minutes, days, sessions
- Display statistics in bar chart with selectable timeframes (days, weeks, months, years)

### Social
- Show who you have practiced with
- Sort practitioners by closest location (via GeoHashing)

### Clean Architecture

- Presentation: Widgets
- Domain: Blocs, Cubits, Services
- Data: Models, DataProviders, Repositories
- Dependency Injection: Provider
- Flavors: Dev, Staging, Prod
- Localization
- Crashlytics
- Unit tests (mostly)

### Custom Widget Packages
- Barchart
- Particle System

## Getting Started

The application won't run without platform specific firebase configuration files placed into its folder according to flavor being built againts.

### Requirements
- flutter
- firebase cli
- gsutil cli
- gcloud cli

### Useful commands

- generate localizations: `flutter gen-l10n`
- generate code: `dart run build_runner build`
- start firebase emulator: `./start_firebase_emulator.sh -d empty_with_admin_user`

### Building

#### Staging
- release android: `flutter build appbundle --release --flavor staging -t ./lib/main_staging.dart`
- release ios: `flutter build ipa --release --flavor staging -t ./lib/main_staging.dart`

