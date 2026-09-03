// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'core_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class CoreLocalizationsHu extends CoreLocalizations {
  CoreLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get okay => 'Rendben';

  @override
  String get close => 'Bezárás';

  @override
  String get profileDeleteTitle => 'Profil törlése';

  @override
  String get profileDeleteQuestion =>
      'Minden adatod véglegesen törlődni fog és nem lesz visszaállítható. Biztos vagy benne?';

  @override
  String get profileDeleteCancel => 'Mégsem';

  @override
  String get profileDeleteYes => 'Törlés';

  @override
  String get imageNotSafeDialogTitle => 'Nem megfelelő kép';

  @override
  String get imageNotSafeDialogText =>
      'A kiválasztott kép nem megfelelő a profilképként való használatra. Kérlek válassz egy másik képet.';

  @override
  String get imageNotSafeDialogButtonText => 'Rendben';

  @override
  String get photoAccessDialogTitle => 'Fotók nem érhetőek el';

  @override
  String get photoAccessDialogText =>
      'Az alkalmazásnak nincs engedélye hozzáférni a fotókhoz. Kérlek a telefon \'Beállítások\' menüjében engedélyezd a hozzáférést a fotókhoz, hogy meg tudjuk változtatni a profilképed.';

  @override
  String get photoAccessDialogButtonText => 'Rendben';

  @override
  String get profileSignoutTitle => 'Kijelentkezés';

  @override
  String get profileSignoutQuestion => 'Biztos, hogy ki akarsz jelentkezni?';

  @override
  String get profileSignoutCancel => 'Mégsem';

  @override
  String get profileSignoutYes => 'Igen';

  @override
  String get signOutSuccessfulMessage => 'Sikeresen kijelentkeztél!';

  @override
  String get locationInputPlaceholder => 'Válaszz egy várost';

  @override
  String get locationInputNoSelection => 'Nincs kiválasztva város';

  @override
  String get locationInputCurrentSelection => 'Jelenlegi választás:';

  @override
  String get locationInputErrorMessage =>
      'Váratlan hiba történt.\nKérlek próbáld újra később.';

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
  String get minutesAbbr => 'p';

  @override
  String get hoursAbbr => 'ó';

  @override
  String get millionShort => 'm';

  @override
  String get million => 'millió';

  @override
  String get thousandShort => 'e';

  @override
  String get thousand => 'ezer';

  @override
  String get startTimerButtonText => 'Start';

  @override
  String get profileSaveButtonIdle => 'Mentés';

  @override
  String get profileSaveButtonSaving => 'Mentés...';

  @override
  String get profileSaveButtonSaved => 'Elmentve!';

  @override
  String get errorHeadline => 'Hoppá!';

  @override
  String get errorText => 'Váratlan probléma támadt.';

  @override
  String get errorButtonText => 'Rendben';

  @override
  String get noSound => 'Nincs hang';

  @override
  String get inputSoundVibrate => 'Rezgés';

  @override
  String get inputSoundSmallBell => 'Kis harang';

  @override
  String get inputSoundTriangle => 'Háromszög';

  @override
  String get inputSoundChukpi => 'Chukpi';
}
