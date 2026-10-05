import 'package:material_ui/material_ui.dart';

import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:stats/l10n/stats_localizations.dart';

class StatsTestHelper {

  static List<LocalizationsDelegate> getStatsLocalizationDelegates() {
    return [
      ...CoreTestHelper.getLocalizationDelegates(),
      ProfileLocalizations.delegate,
      StatsLocalizations.delegate
    ];
  }

  static Widget withLocalizationProvider(
    Widget child, {
    Locale locale = const Locale('hu', 'HU'),
  }) {
    return Localizations(
      delegates: getStatsLocalizationDelegates(),
      locale: locale,
      child: child,
    );
  }

}