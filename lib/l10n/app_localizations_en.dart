import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get minute => 'Minute';

  @override
  String get okay => 'Okay';

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
  String get activity => 'Activity';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get signOut => 'Signout';

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
