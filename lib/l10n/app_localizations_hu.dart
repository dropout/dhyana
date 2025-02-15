import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get minute => 'Perc';

  @override
  String get minutes => 'Perc';

  @override
  String get day => 'Nap';

  @override
  String get days => 'Napok';

  @override
  String get week => 'Hét';

  @override
  String get weeks => 'Hetek';

  @override
  String get month => 'Hónap';

  @override
  String get months => 'Hónapok';

  @override
  String get year => 'Év';

  @override
  String get years => 'Évek';

  @override
  String get milestone => 'Mérföldkő';

  @override
  String get milestones => 'Mérföldkövek';

  @override
  String get okay => 'Rendben';

  @override
  String get warmup => 'Felkészülés';

  @override
  String get loading => 'Betöltés...';

  @override
  String get loadMore => 'Több betöltése';

  @override
  String get inputWarmupLabel => 'Felkészülés';

  @override
  String get inputStartingSoundLabel => 'Kezdőhang';

  @override
  String get inputDurationLabel => 'Időtartam';

  @override
  String get inputEndingSoundLabel => 'Végehang';

  @override
  String get startTimerButtonText => 'Start';

  @override
  String get noSound => 'Nincs hang';

  @override
  String get inputSoundChukpi => 'Chukpi';

  @override
  String get inputSoundSmallBell => 'Csengettyű';

  @override
  String get errorHeadline => 'Hoppá!';

  @override
  String get errorText => 'Váratlan probléma támadt.';

  @override
  String get errorButtonText => 'Rendben';

  @override
  String get session => 'Ülés';

  @override
  String get sessions => 'Ülések';

  @override
  String get timerFinishSessionButtonText => 'Befejezés';

  @override
  String get timerDiscardSessionButtonText => 'Megszakítás';

  @override
  String get loginHeadline1 => 'Ki';

  @override
  String get loginHeadline2 => 'vagy';

  @override
  String get loginHeadline3 => 'te?';

  @override
  String get loginSigninGoogle => 'Bejelentkezés Google-lal';

  @override
  String get loginSigninApple => 'Bejelentkezés Apple-lel';

  @override
  String get loginLegalPart1 => 'A bejelentkezéssel elfogadod az\n';

  @override
  String get loginLegalPart2 => 'ÁSZF-et';

  @override
  String get loginLegalPart3 => ' és az ';

  @override
  String get loginLegalPart4 => 'Adatvédelmi nyilatkozatot';

  @override
  String get profile => 'Profil';

  @override
  String get sessionsHistory => 'Ülések';

  @override
  String get editProfile => 'Profil szerkesztése';

  @override
  String get timerSettingsHistory => 'Legutóbbi beállítások';

  @override
  String get profileFirstnameLabel => 'Keresztnév';

  @override
  String get profileLastnameLabel => 'Vezetéknév';

  @override
  String get profileSaveButtonIdle => 'Ment';

  @override
  String get profileSaveButtonSaving => 'Mentés...';

  @override
  String get profileSaveButtonSaved => 'Elmentve!';

  @override
  String get profileWizardTitle => 'Véglegesítsd a profilodat!';

  @override
  String get photoAccessDialogTitle => 'Fotók nem érhetőek el';

  @override
  String get photoAccessDialogText => 'Az alkalmazásnak nincs engedélye hozzáférni a fotókhoz. Kérlek a telefon \'Beállítások\' menüjében engedélyezd a hozzáférést a fotókhoz, hogy meg tudjuk változtatni a profilképed.';

  @override
  String get photoAccessDialogButtonText => 'Rendben';

  @override
  String get profileStats => 'Statisztika';

  @override
  String get statsTimePerDay => 'Idő naponta';

  @override
  String get statsTimePerWeek => 'Idő hetente';

  @override
  String get statsTimePerMonth => 'Idő havonta';

  @override
  String get statsTimePerYear => 'Idő évente';

  @override
  String get statsTotalTimeSpent => 'Összes idő';

  @override
  String get statsTotalSessions => 'Összes alkalom';

  @override
  String get statsAverageTimeSpent => 'Átlagos idő';

  @override
  String get statsAverageSessions => 'Átlagos alkalom';

  @override
  String get signOut => 'Kijelentkezés';

  @override
  String get profileSignoutTitle => 'Kijelentkezés';

  @override
  String get profileSignoutQuestion => 'Biztos, hogy ki akarsz jelentkezni?';

  @override
  String get profileSignoutYes => 'Igen';

  @override
  String get profileSignoutCancel => 'Mégsem';

  @override
  String get presence => 'Jelenlét';

  @override
  String get presenceScreenSubTitle => 'Mozgasd a csuszkát a jelenlét időkeretének beállításához.';

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
  String daysPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nap',
      many: '$count nap',
      few: '$count nap',
      two: '$count nap',
      one: '$count nap',
      zero: '$count nap',
    );
    return '$_temp0';
  }

  @override
  String consecutiveDaysPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count egymás utáni nap',
      many: '$count egymás utáni nap',
      few: '$count egymás utáni nap',
      two: '$count egymás utáni nap',
      one: '$count nap',
      zero: '$count nap',
    );
    return '$_temp0';
  }
}
