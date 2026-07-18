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
  String get close => 'Close';

  @override
  String get cancel => 'Cancel';

  @override
  String get warmup => 'Warmup';

  @override
  String get underMaintenanceTitle => 'The application is under maintenance';

  @override
  String get underMaintenanceBody => 'Please check back later.';

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
  String get inputIntervalCountLabel => 'Intervals';

  @override
  String get intervalNoIntervalsText => 'No interval sounds will be played.';

  @override
  String get intervalOneIntervalText => 'At the half of the session.';

  @override
  String get intervalTwoIntervalsText =>
      'At the third and two-thirds of the session.';

  @override
  String get intervalThreeIntervalsText =>
      'At the quarter, half and three-quarters.';

  @override
  String get inputEndingSoundLabel => 'Ending sound';

  @override
  String get startTimerButtonText => 'Start';

  @override
  String get sessionModeTimerLabel => 'Timer';

  @override
  String get sessionModeChantingLabel => 'Chanting';

  @override
  String get noSound => 'No sound';

  @override
  String get inputSoundChukpi => 'Chukpi';

  @override
  String get inputSoundVibrate => 'Vibrate';

  @override
  String get inputSoundSmallBell => 'Small Bell';

  @override
  String get inputSoundTriangle => 'Triangle';

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
  String get sessionResultCompleted => 'Completed';

  @override
  String sessionResultMinutes(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

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
  String get loginGoToProfile => 'Go to your profile';

  @override
  String get profile => 'Profile';

  @override
  String get sessionsHistory => 'Sessions';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get donate => 'Donate';

  @override
  String get timerSettingsHistory => 'Settings history';

  @override
  String get timerSettingsHistoryApplied => 'Timer settings applied.';

  @override
  String get timerSettingsHistoryEmpty =>
      'There are no timer settings\n saved in history yet.';

  @override
  String get profileImageLabel => 'Profile image';

  @override
  String get profileFirstnameLabel => 'Firstname';

  @override
  String get profileLastnameLabel => 'Lastname';

  @override
  String get profileLocationLabel => 'City';

  @override
  String get profileSaveButtonIdle => 'Save';

  @override
  String get profileSaveButtonSaving => 'Saving...';

  @override
  String get profileSaveButtonSaved => 'Saved!';

  @override
  String get profileWizardTitle => 'Complete your profile!';

  @override
  String get profileWizardDescription =>
      'Add your name and profile photo to complete the profile and unlock the full potential of the application.';

  @override
  String get photoAccessDialogTitle => 'Cannot access photos';

  @override
  String get photoAccessDialogText =>
      'The application doesn\'t have a permission to access you photos. Please go into \'Settings\' and give access to the photos in order to change you profile photo.';

  @override
  String get photoAccessDialogButtonText => 'Okay';

  @override
  String get imageNotSafeDialogTitle => 'Unsafe image';

  @override
  String get imageNotSafeDialogText =>
      'The selected image may contain inappropriate content. Please choose a different image.';

  @override
  String get imageNotSafeDialogButtonText => 'Okay';

  @override
  String get profileSettings => 'Settings';

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
  String get statsTotal => 'Total';

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
  String get signOutSuccessfulMessage => 'Successfully signed out!';

  @override
  String get profileSignoutTitle => 'Signout';

  @override
  String get profileSignoutQuestion => 'Are you sure you want to sign out?';

  @override
  String get profileSignoutYes => 'Yes';

  @override
  String get profileSignoutCancel => 'No';

  @override
  String get profileDeleteTitle => 'Delete Profile';

  @override
  String get profileDeleteQuestion =>
      'All your data will be permanently deleted and cannot be restored.\nAre you sure?';

  @override
  String get profileDeleteYes => 'Delete';

  @override
  String get profileDeleteCancel => 'Cancel';

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
  String get presence => 'Presence';

  @override
  String get presenceScreenSubTitle =>
      'Move the slider to adjust presence timerframe.';

  @override
  String get secondsAbbr => 's';

  @override
  String secondsPlural(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'seconds',
      many: 'seconds',
      few: 'seconds',
      two: 'seconds',
      one: 'second',
      zero: 'second',
    );
    return '$_temp0';
  }

  @override
  String secondsPluralWithNumber(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString seconds',
      many: '$countString seconds',
      few: '$countString seconds',
      two: '$countString seconds',
      one: '$countString second',
      zero: '$countString second',
    );
    return '$_temp0';
  }

  @override
  String get minutesAbbr => 'm';

  @override
  String minutesPlural(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

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
  String minutesPluralWithNumber(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString minutes',
      many: '$countString minutes',
      few: '$countString minutes',
      two: '$countString minutes',
      one: '$countString minute',
      zero: '$countString minute',
    );
    return '$_temp0';
  }

  @override
  String get hoursAbbr => 'h';

  @override
  String hoursPlural(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

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
  String hoursPluralWithNumber(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString hours',
      many: '$countString hours',
      few: '$countString hours',
      two: '$countString hours',
      one: '$countString hour',
      zero: '$countString hour',
    );
    return '$_temp0';
  }

  @override
  String sessionsPlural(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

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
  String sessionsPluralWithNumber(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString sessions',
      many: '$countString sessions',
      few: '$countString sessions',
      two: '$countString sessions',
      one: '$countString session',
      zero: '$countString session',
    );
    return '$_temp0';
  }

  @override
  String daysPlural(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

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
  String daysPluralWithNumber(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString days',
      many: '$countString days',
      few: '$countString days',
      two: '$countString days',
      one: '$countString day',
      zero: '$countString day',
    );
    return '$_temp0';
  }

  @override
  String weeksPlural(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

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
  String weeksPluralWithNumber(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString weeks',
      many: '$countString weeks',
      few: '$countString weeks',
      two: '$countString weeks',
      one: '$countString week',
      zero: '$countString week',
    );
    return '$_temp0';
  }

  @override
  String weekNumber(int year, int weekNumber) {
    return '$year W$weekNumber';
  }

  @override
  String consecutiveDaysPlural(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

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
  String consecutiveDaysPluralWithNumber(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString consecutive days',
      many: '$countString consecutive days',
      few: '$countString consecutive days',
      two: '$countString consecutive days',
      one: '$countString day',
      zero: '$countString day',
    );
    return '$_temp0';
  }

  @override
  String get noInterval => 'No interval';

  @override
  String intervalPlural(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'intervals',
      many: 'intervals',
      few: 'intervals',
      two: 'intervals',
      one: 'interval',
      zero: 'interval',
    );
    return '$_temp0';
  }

  @override
  String intervalPluralWithNumber(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString intervals',
      many: '$countString intervals',
      few: '$countString intervals',
      two: '$countString intervals',
      one: '$countString interval',
      zero: '$countString interval',
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

  @override
  String get locationInputPlaceholder => 'Select your city';

  @override
  String get locationInputCurrentSelection => 'Current selection:';

  @override
  String get locationInputNoSelection => 'No city selected yet';

  @override
  String get locationInputNoResults => 'No results found';

  @override
  String get locationInputErrorMessage =>
      'An unexpected error occured.\nPlease try again later.';

  @override
  String get chantingTitle => 'Chanting';

  @override
  String get chantingNextChantIn => 'Next chant in';

  @override
  String get chantingAddChantSheetTitle => 'Add Chant';

  @override
  String get chantingPlaylistSheetTitle => 'Playlist';

  @override
  String get chantingAddChantSheetEmptyState => 'No chants available.';

  @override
  String get chantingAddChantListItemAddAction => 'Add Chant';

  @override
  String get chantingAddChantListItemAddedAction => 'Added';

  @override
  String get chantingPlaylistBadgeLoading => 'Loading';

  @override
  String get chantingPlaylistBadgePlaying => 'Playing';

  @override
  String get chantingPlaylistBadgePaused => 'Paused';

  @override
  String get chantingPlaylistBadgeCompleted => 'Completed';

  @override
  String get chantingPlaylistBadgeNext => 'Next';

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
