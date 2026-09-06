// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'timer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class TimerLocalizationsEn extends TimerLocalizations {
  TimerLocalizationsEn([String locale = 'en']) : super(locale);

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
  String get timerFinishSessionButtonText => 'Finish session';

  @override
  String get timerDiscardSessionButtonText => 'Discard session';

  @override
  String get timerSettingsHistory => 'Settings history';

  @override
  String get timerSettingsHistoryApplied => 'Timer settings applied.';

  @override
  String get timerSettingsHistoryEmpty =>
      'There are no timer settings\n saved in history yet.';

  @override
  String get noInterval => 'No interval';

  @override
  String get noWarmup => 'No warmup time';

  @override
  String get secondsAbbr => 's';

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
  String intervalPlural(num count) {
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
  String intervalPluralWithNumber(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count intervals',
      many: '$count intervals',
      few: '$count intervals',
      two: '$count intervals',
      one: '$count interval',
      zero: '$count interval',
    );
    return '$_temp0';
  }
}
