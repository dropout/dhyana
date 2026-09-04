import 'package:auth/l10n/auth_localizations.dart';
import 'package:material_ui/material_ui.dart';

import 'package:core/core.dart';


class AuthTestHelper {

  static List<LocalizationsDelegate> getLocalizationDelegates() {
    return [
      ...CoreTestHelper.getLocalizationDelegates(),
      AuthLocalizations.delegate,
    ];
  }

  static Widget withLocalizationProvider(
    Widget child, {
    Locale locale = const Locale('hu', 'HU'),
  }) {
    return Localizations(
      delegates: getLocalizationDelegates(),
      locale: locale,
      child: child,
    );
  }

}