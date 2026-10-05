import 'package:material_ui/material_ui.dart';

import 'package:core/core.dart';
import 'package:profile/profile.dart';


class ProfileTestHelper {
  static List<LocalizationsDelegate> getProfileLocalizationDelegates() {
    return [
      ...CoreTestHelper.getLocalizationDelegates(), 
      ProfileLocalizations.delegate
    ];
  }

  static Widget withLocalizationProvider(
    Widget child, {
    Locale locale = const Locale('hu', 'HU'),
  }) {
    return Localizations(
      delegates: getProfileLocalizationDelegates(),
      locale: locale,
      child: child,
    );
  }

}
