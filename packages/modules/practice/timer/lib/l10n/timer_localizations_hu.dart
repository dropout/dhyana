// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'timer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class TimerLocalizationsHu extends TimerLocalizations {
  TimerLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get inputWarmupLabel => 'Felkészülés';

  @override
  String get inputStartingSoundLabel => 'Kezdőhang';

  @override
  String get inputDurationLabel => 'Időtartam';

  @override
  String get inputIntervalCountLabel => 'Időközök';

  @override
  String get intervalNoIntervalsText => 'Nincs időközi jelzés.';

  @override
  String get intervalOneIntervalText => 'Az ülés felénél egy időközi jelzés.';

  @override
  String get intervalTwoIntervalsText =>
      'A harmadánál és a kétharmadánál két időközi jelzés.';

  @override
  String get intervalThreeIntervalsText =>
      'A negyedénél, felénél és háromnegyedénél.';

  @override
  String get inputEndingSoundLabel => 'Végehang';

  @override
  String get startTimerButtonText => 'Start';

  @override
  String get noSound => 'Nincs hang';

  @override
  String get inputSoundChukpi => 'Chukpi';

  @override
  String get inputSoundVibrate => 'Rezgés';

  @override
  String get inputSoundSmallBell => 'Csengettyű';

  @override
  String get inputSoundTriangle => 'Harang';

  @override
  String get timerFinishSessionButtonText => 'Befejezés';

  @override
  String get timerDiscardSessionButtonText => 'Megszakítás';

  @override
  String get timerSettingsHistory => 'Legutóbbi beállítások';

  @override
  String get timerSettingsHistoryApplied => 'Időzítő beállítások alkalmazva.';

  @override
  String get timerSettingsHistoryEmpty =>
      'Még nincsenek legutóbbi időzítő beaállítások elmentve.';

  @override
  String get noInterval => 'Nincs időköz';

  @override
  String get secondsAbbr => 'mp';

  @override
  String minutesPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'perc',
      many: 'perc',
      few: 'perc',
      two: 'perc',
      one: 'perc',
      zero: 'perc',
    );
    return '$_temp0';
  }

  @override
  String minutesPluralWithNumber(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perc',
      many: '$count perc',
      few: '$count perc',
      two: '$count perc',
      one: '$count perc',
      zero: '$count perc',
    );
    return '$_temp0';
  }

  @override
  String intervalPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'időköz',
      many: 'időköz',
      few: 'időköz',
      two: 'időköz',
      one: 'időköz',
      zero: 'időköz',
    );
    return '$_temp0';
  }

  @override
  String intervalPluralWithNumber(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count időköz',
      many: '$count időköz',
      few: '$count időköz',
      two: '$count időköz',
      one: '$count időköz',
      zero: '$count időköz',
    );
    return '$_temp0';
  }
}
