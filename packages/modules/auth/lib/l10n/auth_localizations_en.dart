// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AuthLocalizationsEn extends AuthLocalizations {
  AuthLocalizationsEn([String locale = 'en']) : super(locale);

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
  String get loginSigninEmailPassword => 'Login with Email';

  @override
  String get loginSigninEmailPasswordScreenTitle => 'Login with Email';

  @override
  String get loginSigninEmailInputLabel => 'Email';

  @override
  String get loginSigninPasswordInputLabel => 'Password';

  @override
  String get loginSigninEmailPasswordButtonText => 'Login';

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
}
