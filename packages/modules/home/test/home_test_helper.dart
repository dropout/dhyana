import 'package:chanting/l10n/chanting_localizations.dart';
import 'package:material_ui/material_ui.dart';

import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:timer/timer.dart';

class HomeTestHelper {

  static List<LocalizationsDelegate> getHomeLocalizationDelegates() {
    return [
      ...CoreTestHelper.getLocalizationDelegates(),
      ProfileLocalizations.delegate,
      TimerLocalizations.delegate,
      ChantingLocalizations.delegate,
    ];
  }

  static Widget withLocalizationProvider(
    Widget child, {
    Locale locale = const Locale('hu', 'HU'),
  }) {
    return Localizations(
      delegates: getHomeLocalizationDelegates(),
      locale: locale,
      child: child,
    );
  }

}