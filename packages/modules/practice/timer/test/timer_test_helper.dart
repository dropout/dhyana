import 'package:material_ui/material_ui.dart';

import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:timer/timer.dart';


class TimerTestHelper {

  static List<LocalizationsDelegate> getLocalizationDelegates() {
    return [
      ...CoreTestHelper.getLocalizationDelegates(),
      ProfileLocalizations.delegate,
      TimerLocalizations.delegate,
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