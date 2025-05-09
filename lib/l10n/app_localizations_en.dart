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
  String get pleaseWait => 'Please wait';

  @override
  String get notAvailable => 'Not available';

  @override
  String get notAvailableAbbr => 'N/A';

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
  String get timerSettingsHistoryApplied => 'Timer settings applied.';

  @override
  String get timerSettingsHistoryEmpty => 'There are no timer settings\n saved in history yet.';

  @override
  String get profileImageLabel => 'Profile image';

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
  String get consecutiveDays => 'Consecutive days';

  @override
  String get highlights => 'Highlights';

  @override
  String get average => 'Average';

  @override
  String get averagePerDay => 'Average per day';

  @override
  String get averagePerWeek => 'Average per week';

  @override
  String get averagePerMonth => 'Average per month';

  @override
  String get averagePerYear => 'Average per year';

  @override
  String get averageAbbr => 'Avg.';

  @override
  String get statsSignedUp => 'Joined';

  @override
  String get statsFirstSession => 'First session';

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
  String get statsTimePerDay => 'Time per day';

  @override
  String get statsTimePerWeek => 'Time per week';

  @override
  String get statsTimePerMonth => 'Time per month';

  @override
  String get statsTimePerYear => 'Time per years';

  @override
  String get statsSummary => 'Summary';

  @override
  String get statsTotalTimeSpent => 'Total time';

  @override
  String get statsTotalSessions => 'Total sessions';

  @override
  String get statsTotalDays => 'Total days';

  @override
  String get statsAverageTimeSpent => 'Average time';

  @override
  String get statsAverageSessions => 'Average sessions';

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
  String get statsLoadingData => 'Loading data...';

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
  String get minutesAbbr => 'm';

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
  String get hoursAbbr => 'h';

  @override
  String hoursPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hours',
      many: 'hours',
      few: 'hours',
      two: 'hours',
      one: 'hour',
      zero: 'hour',
    );
    return '$_temp0';
  }

  @override
  String hoursPluralWithNumber(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours',
      many: '$count hours',
      few: '$count hours',
      two: '$count hours',
      one: '$count hour',
      zero: '$count hour',
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
  String sessionsPluralWithNumber(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sessions',
      many: '$count sessions',
      few: '$count sessions',
      two: '$count sessions',
      one: '$count session',
      zero: '$count session',
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
  String daysPluralWithNumber(num count) {
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
  String weeksPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'weeks',
      many: 'weeks',
      few: 'weeks',
      two: 'weeks',
      one: 'week',
      zero: 'week',
    );
    return '$_temp0';
  }

  @override
  String weeksPluralWithNumber(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weeks',
      many: '$count weeks',
      few: '$count weeks',
      two: '$count weeks',
      one: '$count week',
      zero: '$count week',
    );
    return '$_temp0';
  }

  @override
  String weekNumber(int year, int weekNumber) {
    return '$year W$weekNumber';
  }

  @override
  String consecutiveDaysPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'consecutive days',
      many: 'consecutive days',
      few: 'consecutive days',
      two: 'consecutive days',
      one: 'day',
      zero: 'day',
    );
    return '$_temp0';
  }

  @override
  String consecutiveDaysPluralWithNumber(num count) {
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

  @override
  String get thousand => 'thousand';

  @override
  String get thousandShort => 'k';

  @override
  String get million => 'million';

  @override
  String get millionShort => 'm';
}
