// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get minute => 'Minute';

  @override
  String get minutes => 'Minutes';

  @override
  String get day => 'Day';

  @override
  String get days => 'Days';

  @override
  String get week => 'Week';

  @override
  String get weeks => 'Weeks';

  @override
  String get month => 'Month';

  @override
  String get months => 'Months';

  @override
  String get year => 'Year';

  @override
  String get years => 'Years';

  @override
  String get milestone => 'Milestone';

  @override
  String get milestones => 'Milestones';

  @override
  String get okay => 'Okay';

  @override
  String get warmup => 'Warmup';

  @override
  String get loading => 'Loading...';

  @override
  String get loadMore => 'Load more';

  @override
  String get inputWarmupLabel => 'Warmup';

  @override
  String get inputStartingSoundLabel => 'Starting sound';

  @override
  String get inputDurationLabel => 'Duration';

  @override
  String get inputEndingSoundLabel => 'Ending sound';

  @override
  String get startTimerButtonText => 'Start';

  @override
  String get noSound => 'No sound';

  @override
  String get inputSoundChukpi => 'Chukpi';

  @override
  String get inputSoundSmallBell => 'Small Bell';

  @override
  String get errorHeadline => 'Ooops!';

  @override
  String get errorText => 'An unexpected error has occured.';

  @override
  String get errorButtonText => 'Okay';

  @override
  String get session => 'Session';

  @override
  String get sessions => 'Sessions';

  @override
  String get timerFinishSessionButtonText => 'Finish session';

  @override
  String get timerDiscardSessionButtonText => 'Discard session';

  @override
  String get loginHeadline1 => 'Who';

  @override
  String get loginHeadline2 => 'are';

  @override
  String get loginHeadline3 => 'you?';

  @override
  String get loginSigninGoogle => 'Login with Google';

  @override
  String get loginSigninApple => 'Login with Apple';

  @override
  String get loginLegalPart1 => 'By logging in you accept the\n';

  @override
  String get loginLegalPart2 => 'Terms of Use';

  @override
  String get loginLegalPart3 => ' and the ';

  @override
  String get loginLegalPart4 => 'Privacy statement';

  @override
  String get profile => 'Profile';

  @override
  String get sessionsHistory => 'Sessions';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get timerSettingsHistory => 'Settings history';

  @override
  String get profileFirstnameLabel => 'Firstname';

  @override
  String get profileLastnameLabel => 'Lastname';

  @override
  String get profileSaveButtonIdle => 'Save';

  @override
  String get profileSaveButtonSaving => 'Saving...';

  @override
  String get profileSaveButtonSaved => 'Saved!';

  @override
  String get profileWizardTitle => 'Complete your profile!';

  @override
  String get photoAccessDialogTitle => 'Cannot access photos';

  @override
  String get photoAccessDialogText => 'The application doesn\'t have a permission to access you photos. Please go into \'Settings\' and give access to the photos in order to change you profile photo.';

  @override
  String get photoAccessDialogButtonText => 'Okay';

  @override
  String get profileStats => 'Statistics';

  @override
  String get statsTimePerDay => 'Time per day';

  @override
  String get statsTimePerWeek => 'Time per week';

  @override
  String get statsTimePerMonth => 'Time per month';

  @override
  String get statsTimePerYear => 'Time per years';

  @override
  String get statsTotalTimeSpent => 'Total time spent';

  @override
  String get statsTotalSessions => 'Total sessions';

  @override
  String get statsAverageTimeSpent => 'Average time spent';

  @override
  String get statsAverageSessions => 'Average sessions';

  @override
  String get signOut => 'Signout';

  @override
  String get profileSignoutTitle => 'Signout';

  @override
  String get profileSignoutQuestion => 'Are you sure you want to sign out?';

  @override
  String get profileSignoutYes => 'Yes';

  @override
  String get profileSignoutCancel => 'No';

  @override
  String get presence => 'Presence';

  @override
  String get presenceScreenSubTitle => 'Move the slider to adjust presence timerframe.';

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
  String minutesPluralWithNumber(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      many: '$count minutes',
      few: '$count minutes',
      two: '$count minutes',
      one: '$count minute',
      zero: '$count minute',
    );
    return '$_temp0';
  }

  @override
  String daysPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      many: '$count days',
      few: '$count days',
      two: '$count days',
      one: '$count day',
      zero: '$count day',
    );
    return '$_temp0';
  }

  @override
  String consecutiveDaysPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count consecutive days',
      many: '$count consecutive days',
      few: '$count consecutive days',
      two: '$count consecutive days',
      one: '$count day',
      zero: '$count day',
    );
    return '$_temp0';
  }
}
