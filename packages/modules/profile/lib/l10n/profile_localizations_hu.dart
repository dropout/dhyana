// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'profile_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class ProfileLocalizationsHu extends ProfileLocalizations {
  ProfileLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get profile => 'Profil';

  @override
  String get sessionsHistory => 'Ülések';

  @override
  String get editProfile => 'Profil szerkesztése';

  @override
  String get donate => 'Adományozás';

  @override
  String get profileImageLabel => 'Profil kép';

  @override
  String get profileFirstnameLabel => 'Keresztnév';

  @override
  String get profileLastnameLabel => 'Vezetéknév';

  @override
  String get profileLocationLabel => 'Város';

  @override
  String get profileWizardTitle => 'Véglegesítsd a profilodat!';

  @override
  String get profileWizardDescription =>
      'Add meg a nevedet és profil fotódat a profil befejezéséhez és az alkalmazás teljes potenciáljának feloldásához.';

  @override
  String get profileSettings => 'Beállítások';

  @override
  String get profileStats => 'Statisztika';

  @override
  String get signOut => 'Kijelentkezés';

  @override
  String get deleteProfileScreenTitle => 'Profil törlése!';

  @override
  String get deleteProfileScreenText =>
      'A profilod törléséhez biztonsági okokból újra be kell jelentkezned.';

  @override
  String get deleteProfileScreenSuccessTitle => 'A profilod\ntörölve lett!';

  @override
  String get deleteProfileScreenOkayButtonText => 'Rendben';

  @override
  String get milestones => 'Mérföldkövek';

  @override
  String get consecutiveDays => 'Egymás utáni napok';

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
  String get statsSummary => 'Összesítés';

  @override
  String get statsTotalTimeSpent => 'Összes idő';

  @override
  String get statsTotalSessions => 'Összes alkalom';

  @override
  String get statsTotalDays => 'Összes nap';

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
  String sessionsPlural(num count) {
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
  String daysPlural(num count) {
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
  String get notAvailableAbbr => 'N/A';

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
