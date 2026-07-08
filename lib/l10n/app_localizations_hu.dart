// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get minute => 'Perc';

  @override
  String get minutes => 'Percek';

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
  String get close => 'Bezárás';

  @override
  String get cancel => 'Mégsem';

  @override
  String get warmup => 'Felkészülés';

  @override
  String get underMaintenanceTitle => 'Az alkalmazás karbantartás alatt van';

  @override
  String get underMaintenanceBody => 'Kérlek nézz vissza később.';

  @override
  String get loading => 'Betöltés...';

  @override
  String get loadMore => 'Több betöltése';

  @override
  String get pleaseWait => 'Kérlek várj';

  @override
  String get notAvailable => 'Nem elérhető';

  @override
  String get notAvailableAbbr => 'N/A';

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
  String get sessionModeTimerLabel => 'Időzítő';

  @override
  String get sessionModeChantingLabel => 'Kántálás';

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
  String get sessionResultCompleted => 'Teljesítettél';

  @override
  String sessionResultMinutes(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'percet',
      many: 'percet',
      few: 'percet',
      two: 'percet',
      one: 'percet',
      zero: 'percet',
    );
    return '$_temp0';
  }

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
  String get loginGoToProfile => 'Ugrás a profilodra';

  @override
  String get profile => 'Profil';

  @override
  String get sessionsHistory => 'Ülések';

  @override
  String get editProfile => 'Profil szerkesztése';

  @override
  String get donate => 'Adományozás';

  @override
  String get timerSettingsHistory => 'Legutóbbi beállítások';

  @override
  String get timerSettingsHistoryApplied => 'Időzítő beállítások alkalmazva.';

  @override
  String get timerSettingsHistoryEmpty =>
      'Még nincsenek legutóbbi időzítő beaállítások elmentve.';

  @override
  String get profileImageLabel => 'Profil kép';

  @override
  String get profileFirstnameLabel => 'Keresztnév';

  @override
  String get profileLastnameLabel => 'Vezetéknév';

  @override
  String get profileLocationLabel => 'Város';

  @override
  String get profileSaveButtonIdle => 'Mentés';

  @override
  String get profileSaveButtonSaving => 'Mentés...';

  @override
  String get profileSaveButtonSaved => 'Elmentve!';

  @override
  String get profileWizardTitle => 'Véglegesítsd a profilodat!';

  @override
  String get profileWizardDescription =>
      'Add meg a nevedet és profil fotódat a profil befejezéséhez és az alkalmazás teljes potenciáljának feloldásához.';

  @override
  String get photoAccessDialogTitle => 'Fotók nem érhetőek el';

  @override
  String get photoAccessDialogText =>
      'Az alkalmazásnak nincs engedélye hozzáférni a fotókhoz. Kérlek a telefon \'Beállítások\' menüjében engedélyezd a hozzáférést a fotókhoz, hogy meg tudjuk változtatni a profilképed.';

  @override
  String get photoAccessDialogButtonText => 'Rendben';

  @override
  String get imageNotSafeDialogTitle => 'Nem megfelelő kép';

  @override
  String get imageNotSafeDialogText =>
      'A kiválasztott kép nem megfelelő a profilképként való használatra. Kérlek válassz egy másik képet.';

  @override
  String get imageNotSafeDialogButtonText => 'Rendben';

  @override
  String get profileSettings => 'Beállítások';

  @override
  String get showStatsOnFinishScreenTitle =>
      'Statisztika megjelenítése a Gyakorlat befejezése képernyőn';

  @override
  String get showStatsOnFinishScreenDescription =>
      'Ha engedélyezve van, a gyakorlat befejezése képernyőn megjelenik a gyakorlat eredmény statisztikája.';

  @override
  String get usePresenceFeatureTitle => 'Jelenlét funkció engedélyezése';

  @override
  String get usePresenceFeatureDescription =>
      'Ha engedélyezve van, láthatod kikkel gyakorolsz együtt. Ilyenkor mások számára is látható leszel, hogy te is gyakorolsz.';

  @override
  String get clearCache => 'Gyorsítótár törlése';

  @override
  String get clearCacheDescription =>
      'Törli az összes gyorsítótárban tárolt hang- és dalszövegfájlt a mantrákhoz. Ez felszabadítja a tárhelyet, de újra le kell töltened a fájlokat, ha újra szeretnéd lejátszani őket.';

  @override
  String get profileStats => 'Statisztika';

  @override
  String get consecutiveDays => 'Egymás utáni napok';

  @override
  String get highlights => 'Kiemelt adatok';

  @override
  String get average => 'Átlag';

  @override
  String get averagePerDay => 'Átlagosan naponta';

  @override
  String get averagePerWeek => 'Átlagosan hetente';

  @override
  String get averagePerMonth => 'Átlagosan havonta';

  @override
  String get averagePerYear => 'Átlagosan évente';

  @override
  String get averageAbbr => 'Átl.';

  @override
  String get statsSignedUp => 'Csatlakozás';

  @override
  String get statsFirstSession => 'Első ülés';

  @override
  String get statsLastSession => 'Legutóbbi ülés';

  @override
  String get statsCurrentStreak => 'Aktuális sorozat';

  @override
  String get statsStartedAt => 'Aktuálist sorozat kezdete';

  @override
  String get statsNotyetStarted => 'Még nem kezdted el';

  @override
  String get statsLastCheckedAt => 'Legutolsó ellenőrzés';

  @override
  String get statsNotyetChecked => 'Még nincs ellenőrizve';

  @override
  String get statsLongestStreak => 'Leghosszabb sorozat';

  @override
  String get statsTimePerDay => 'Idő naponta';

  @override
  String get statsTimePerWeek => 'Idő hetente';

  @override
  String get statsTimePerMonth => 'Idő havonta';

  @override
  String get statsTimePerYear => 'Idő évente';

  @override
  String get statsSummary => 'Összesítés';

  @override
  String get statsTotalTimeSpent => 'Összes idő';

  @override
  String get statsTotalSessions => 'Összes alkalom';

  @override
  String get statsTotalDays => 'Összes nap';

  @override
  String get statsAverageTimeSpent => 'Átlagos idő';

  @override
  String get statsAverageSessions => 'Átlagos alkalom';

  @override
  String get statsCount => 'Darab';

  @override
  String get statsNextMilestone => 'Következő mérföldkő';

  @override
  String statsNextMilestoneIn(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Még $count a következő mérföldkőig.',
      many: 'Még $count a következő mérföldkőig.',
      few: 'Még $count a következő mérföldkőig.',
      two: 'Még $count a következő mérföldkőig.',
      one: 'Még $count a következő mérföldkőig.',
      zero: 'Még $count a következő mérföldkőig.',
    );
    return '$_temp0';
  }

  @override
  String statsNextMilestoneInShort(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nap múlva',
      many: '$count nap múlva',
      few: '$count nap múlva',
      two: '$count nap múlva',
      one: '$count nap múlva',
      zero: '$count nap múlva',
    );
    return '$_temp0';
  }

  @override
  String get statsLoadingData => 'Adatok betöltése...';

  @override
  String get signOut => 'Kijelentkezés';

  @override
  String get signOutSuccessfulMessage => 'Sikeresen kijelentkeztél!';

  @override
  String get profileSignoutTitle => 'Kijelentkezés';

  @override
  String get profileSignoutQuestion => 'Biztos, hogy ki akarsz jelentkezni?';

  @override
  String get profileSignoutYes => 'Igen';

  @override
  String get profileSignoutCancel => 'Mégsem';

  @override
  String get profileDeleteTitle => 'Profil törlése';

  @override
  String get profileDeleteQuestion =>
      'Minden adatod véglegesen törlődni fog és nem lesz visszaállítható. Biztos vagy benne?';

  @override
  String get profileDeleteYes => 'Törlés';

  @override
  String get profileDeleteCancel => 'Mégsem';

  @override
  String get deleteProfileScreenTitle => 'Profil törlése!';

  @override
  String get deleteProfileScreenText =>
      'Ahhoz, hogy töröljük a profilod, biztonsági okokból újra be kell jelentkezned.';

  @override
  String get deleteProfileScreenSuccessTitle => 'A profilodat töröltük!';

  @override
  String get deleteProfileScreenOkayButtonText => 'Rendben';

  @override
  String get presence => 'Jelenlét';

  @override
  String get presenceScreenSubTitle =>
      'Mozgasd a csuszkát a jelenlét időkeretének beállításához.';

  @override
  String get secondsAbbr => 'mp';

  @override
  String secondsPlural(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'másodperc',
      many: 'másodperc',
      few: 'másodperc',
      two: 'másodperc',
      one: 'másodperc',
      zero: 'másodperc',
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
      other: '$countString másodperc',
      many: '$countString másodperc',
      few: '$countString másodperc',
      two: '$countString másodperc',
      one: '$countString másodperc',
      zero: '$countString másodperc',
    );
    return '$_temp0';
  }

  @override
  String get minutesAbbr => 'p';

  @override
  String minutesPlural(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

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
  String minutesPluralWithNumber(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString perc',
      many: '$countString perc',
      few: '$countString perc',
      two: '$countString perc',
      one: '$countString perc',
      zero: '$countString perc',
    );
    return '$_temp0';
  }

  @override
  String get hoursAbbr => 'ó';

  @override
  String hoursPlural(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'óra',
      many: 'óra',
      few: 'óra',
      two: 'óra',
      one: 'óra',
      zero: 'óra',
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
      other: '$countString óra',
      many: '$countString óra',
      few: '$countString óra',
      two: '$countString óra',
      one: '$countString óra',
      zero: '$countString óra',
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
      other: 'ülés',
      many: 'ülés',
      few: 'ülés',
      two: 'ülés',
      one: 'ülés',
      zero: 'ülés',
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
      other: '$countString ülés',
      many: '$countString ülés',
      few: '$countString ülés',
      two: '$countString ülés',
      one: '$countString ülés',
      zero: '$countString ülés',
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
      other: 'nap',
      many: 'nap',
      few: 'nap',
      two: 'nap',
      one: 'nap',
      zero: 'nap',
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
      other: '$countString nap',
      many: '$countString nap',
      few: '$countString nap',
      two: '$countString nap',
      one: '$countString nap',
      zero: '$countString nap',
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
      other: 'hét',
      many: 'hét',
      few: 'hét',
      two: 'hét',
      one: 'hét',
      zero: 'hét',
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
      other: '$countString hét',
      many: '$countString hét',
      few: '$countString hét',
      two: '$countString hét',
      one: '$countString hét',
      zero: '$countString hét',
    );
    return '$_temp0';
  }

  @override
  String weekNumber(int year, int weekNumber) {
    return '$year ${weekNumber}H';
  }

  @override
  String consecutiveDaysPlural(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString egymás utáni nap',
      many: '$countString egymás utáni nap',
      few: '$countString egymás utáni nap',
      two: '$countString egymás utáni nap',
      one: '$countString nap',
      zero: '$countString nap',
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
      other: '$countString egymás utáni nap',
      many: '$countString egymás utáni nap',
      few: '$countString egymás utáni nap',
      two: '$countString egymás utáni nap',
      one: '$countString nap',
      zero: '$countString nap',
    );
    return '$_temp0';
  }

  @override
  String get noInterval => 'Nincs időköz';

  @override
  String intervalPlural(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

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
  String intervalPluralWithNumber(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString időköz',
      many: '$countString időköz',
      few: '$countString időköz',
      two: '$countString időköz',
      one: '$countString időköz',
      zero: '$countString időköz',
    );
    return '$_temp0';
  }

  @override
  String get thousand => 'ezer';

  @override
  String get thousandShort => 'e';

  @override
  String get million => 'millió';

  @override
  String get millionShort => 'm';

  @override
  String get locationInputPlaceholder => 'Válaszz egy várost';

  @override
  String get locationInputCurrentSelection => 'Jelenlegi választás:';

  @override
  String get locationInputNoSelection => 'Nincs kiválasztva város';

  @override
  String get locationInputNoResults => 'Nincs találat';

  @override
  String get locationInputErrorMessage =>
      'Váratlan hiba történt.\nKérlek próbáld újra később.';

  @override
  String get chantingTitle => 'Éneklés';

  @override
  String get chantingNextChantIn => 'Következő éneklés';

  @override
  String get chantingAddChantSheetTitle => 'Hozzáadás';

  @override
  String get chantingPlaylistSheetTitle => 'Lejátszási lista';

  @override
  String get chantingPlaylistBadgeLoading => 'Betöltés';

  @override
  String get chantingPlaylistBadgePlaying => 'Lejátszás';

  @override
  String get chantingPlaylistBadgePaused => 'Szünet';

  @override
  String get chantingPlaylistBadgeCompleted => 'Befejezett';

  @override
  String get chantingPlaylistBadgeNext => 'Következő';

  @override
  String get healthConnect_initializingTitle_ios =>
      'Befejezett ülések mentése az\nApple Health-be';

  @override
  String get healthConnect_initializingText_ios =>
      'Szolgáltatás elérhetőségének ellenőrzése...';

  @override
  String get healthConnect_initializingTitle_android =>
      'Befejezett ülések mentése a\nGoogle Health-be';

  @override
  String get healthConnect_initializingText_android =>
      'Szolgáltatás elérhetőségének ellenőrzése...';

  @override
  String get healthConnect_serviceNotAvailableTitle_ios =>
      'Befejezett ülések mentése az\nApple Health-be';

  @override
  String get healthConnect_serviceNotAvailableText_ios =>
      'Az Apple Health szolgáltatás nem elérhető ezen az eszközön. Kérlek ellenőrizd, hogy a szolgáltatás telepítve és engedélyezve van-e.';

  @override
  String get healthConnect_serviceNotAvailableTitle_android =>
      'Befejezett ülések mentése a\nGoogle Health-be';

  @override
  String get healthConnect_serviceNotAvailableText_android =>
      'A Google Health Connect szolgáltatás nem elérhető ezen az eszközön. Kérlek ellenőrizd, hogy a szolgáltatás telepítve és engedélyezve van-e.';

  @override
  String get healthConnect_readyTitle_ios =>
      'Befejezett ülések mentése az\nApple Health-be';

  @override
  String get healthConnect_readyText_ios =>
      'Engedélyezd az Apple Health szolgáltatást, hogy a meditációra fordított időt elmenthessük és ezáltal egy helyen tarthatod az egészségügyi adataidat.';

  @override
  String get healthConnect_readyTitle_android =>
      'Befejezett ülések mentése a\nGoogle Health-be';

  @override
  String get healthConnect_readyText_android =>
      'Engedélyezd a Google Health Connect szolgáltatást, hogy a meditációra fordított időt elmenthessük és ezáltal egy helyen tarthatod az egészségügyi adataidat.';

  @override
  String get healthConnect_unnecessaryTitle_ios =>
      'Befejezett ülések mentése az\nApple Health-be';

  @override
  String get healthConnect_unnecessaryText_ios =>
      'Az Apple Health szolgáltatás már engedélyezve van, így a meditációra fordított időt már elmenthetjük az Apple Health-be.';

  @override
  String get healthConnect_unnecessaryTitle_android =>
      'Befejezett ülések mentése a\nGoogle Health-be';

  @override
  String get healthConnect_unnecessaryText_android =>
      'A Google Health Connect szolgáltatás már engedélyezve van, így a meditációra fordított időt már elmenthetjük a Google Health Connect-be.';
}
