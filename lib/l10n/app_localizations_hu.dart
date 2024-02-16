import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get minute => 'Perc';

  @override
  String get okay => 'Rendben';

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
  String get activity => 'Aktivitás';

  @override
  String get editProfile => 'Profile szerkesztése';

  @override
  String get signOut => 'Kijelentkezés';

  @override
  String get profileFirstnameLabel => 'Keresztnév';

  @override
  String get profileLastnameLabel => 'Vezetéknév';

  @override
  String testPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sampleOther',
      many: '$count sampleMany',
      few: '$count sampleFew',
      two: '$count sample2',
      one: '$count sample1',
      zero: '$count sample0',
    );
    return '$_temp0';
  }
}
