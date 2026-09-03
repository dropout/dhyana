// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AuthLocalizationsHu extends AuthLocalizations {
  AuthLocalizationsHu([String locale = 'hu']) : super(locale);

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
  String get loginSigninEmailPassword => 'Bejelentkezés Email-lel';

  @override
  String get loginSigninEmailPasswordScreenTitle => 'Bejelentkezés Email-lel';

  @override
  String get loginSigninEmailInputLabel => 'Email';

  @override
  String get loginSigninPasswordInputLabel => 'Jelszó';

  @override
  String get loginSigninEmailPasswordButtonText => 'Bejelentkezés';

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
}
