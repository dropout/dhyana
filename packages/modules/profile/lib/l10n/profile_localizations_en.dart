// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'profile_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class ProfileLocalizationsEn extends ProfileLocalizations {
  ProfileLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get profile => 'Profile';

  @override
  String get sessionsHistory => 'Sessions';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get donate => 'Donate';

  @override
  String get profileImageLabel => 'Profile image';

  @override
  String get profileFirstnameLabel => 'Firstname';

  @override
  String get profileLastnameLabel => 'Lastname';

  @override
  String get profileLocationLabel => 'City';

  @override
  String get profileWizardTitle => 'Complete your profile!';

  @override
  String get profileWizardDescription =>
      'Add your name and profile photo to complete the profile and unlock the full potential of the application.';

  @override
  String get profileSettings => 'Settings';

  @override
  String get profileStats => 'Statistics';

  @override
  String get signOut => 'Signout';

  @override
  String get deleteProfileScreenTitle => 'Delete profile!';

  @override
  String get deleteProfileScreenText =>
      'To delete your profile, you need to sign in again for security reasons.';

  @override
  String get deleteProfileScreenSuccessTitle =>
      'Your profile\nhas been deleted!';

  @override
  String get deleteProfileScreenOkayButtonText => 'Okay';

  @override
  String get milestones => 'Milestones';

  @override
  String get consecutiveDays => 'Consecutive days';

  @override
  String get statsSignedUp => 'Joined';

  @override
  String get statsFirstSession => 'First session';

  @override
  String get statsLastSession => 'Last session';

  @override
  String get statsCurrentStreak => 'Current streak';

  @override
  String get statsStartedAt => 'Started at';

  @override
  String get statsNotyetStarted => 'Not yet started';

  @override
  String get statsLastCheckedAt => 'Last checked';

  @override
  String get statsNotyetChecked => 'Not yet checked';

  @override
  String get statsLongestStreak => 'Longest streak';

  @override
  String get statsSummary => 'Summary';

  @override
  String get statsTotalTimeSpent => 'Total time';

  @override
  String get statsTotalSessions => 'Total sessions';

  @override
  String get statsTotalDays => 'Total days';

  @override
  String get statsCount => 'Count';

  @override
  String get statsNextMilestone => 'Next milestone';

  @override
  String statsNextMilestoneIn(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Next milestone in $count more days.',
      many: 'Next milestone in $count more days.',
      few: 'Next milestone in $count more days.',
      two: 'Next milestone in $count more days.',
      one: 'Next milestone in $count more day.',
      zero: 'Next milestone in $count more days.',
    );
    return '$_temp0';
  }

  @override
  String statsNextMilestoneInShort(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'In $count more days',
      many: 'In $count more days',
      few: 'In $count more days',
      two: 'In $count more days',
      one: 'In $count more day.',
      zero: 'In $count more days',
    );
    return '$_temp0';
  }

  @override
  String sessionsPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'sessions',
      many: 'sessions',
      few: 'sessions',
      two: 'sessions',
      one: 'session',
      zero: 'session',
    );
    return '$_temp0';
  }

  @override
  String minutesPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'minutes',
      many: 'minutes',
      few: 'minutes',
      two: 'minutes',
      one: 'minute',
      zero: 'minute',
    );
    return '$_temp0';
  }

  @override
  String daysPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'days',
      many: 'days',
      few: 'days',
      two: 'days',
      one: 'day',
      zero: 'day',
    );
    return '$_temp0';
  }

  @override
  String get notAvailableAbbr => 'N/A';

  @override
  String get showStatsOnFinishScreenTitle =>
      'Show statistics on\nSession Finish Screen';

  @override
  String get showStatsOnFinishScreenDescription =>
      'When enabled, your statistics updated with the finished session will be displayed on the Session Finish screen.';

  @override
  String get usePresenceFeatureTitle => 'Enable Presence feature';

  @override
  String get usePresenceFeatureDescription =>
      'When enabled, user will be able to see other users who are currently practicing.';

  @override
  String get clearCache => 'Clear cache';

  @override
  String get clearCacheDescription =>
      '\'Clears all cached audio and lyrics files for chants. This will free up storage space, but you will need to re-download the files if you want to play them again.\'';

  @override
  String get healthConnect_initializingTitle_ios =>
      'Save completed sessions to\nApple Health';

  @override
  String get healthConnect_initializingText_ios =>
      'Checking service availability...';

  @override
  String get healthConnect_initializingTitle_android =>
      'Save completed sessions to\nGoogle Health Connect';

  @override
  String get healthConnect_initializingText_android =>
      'Checking service availability...';

  @override
  String get healthConnect_serviceNotAvailableTitle_ios =>
      'Save completed sessions to\nApple Health';

  @override
  String get healthConnect_serviceNotAvailableText_ios =>
      'Apple Health Connect service is not available on this device. Please check if the service is installed and enabled.';

  @override
  String get healthConnect_serviceNotAvailableTitle_android =>
      'Save completed sessions to\nGoogle Health Connect';

  @override
  String get healthConnect_serviceNotAvailableText_android =>
      'Google Health Connect service is not available on this device. Please check if you have the latest updates installed.';

  @override
  String get healthConnect_readyTitle_ios =>
      'Save completed sessions to\nApple Health';

  @override
  String get healthConnect_readyText_ios =>
      'Sync the time you\'ve spent meditating in the application to Apple Health and keep your health data centralized.';

  @override
  String get healthConnect_readyTitle_android =>
      'Save completed sessions to\nGoogle Health';

  @override
  String get healthConnect_readyText_android =>
      'Keep the time you\'ve spent meditating in the application in sync with Google Health Connect.';

  @override
  String get healthConnect_unnecessaryTitle_ios =>
      'Save completed sessions to\nApple Health';

  @override
  String get healthConnect_unnecessaryText_ios =>
      'Keep the time you\'ve spent meditating in sync with Apple Health. To manage permissions, go to Settings > Apps > Health > Data Access & Devices.';

  @override
  String get healthConnect_unnecessaryTitle_android =>
      'Save completed sessions to\nGoogle Health Connect';

  @override
  String get healthConnect_unnecessaryText_android =>
      'Keep the time you\'ve spent meditating in the application in sync with Google Health Connect. To manage permissions, go to Settings > Security & Privacy > Privacy > Health Connect.';
}
