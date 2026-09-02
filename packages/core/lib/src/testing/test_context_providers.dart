import 'package:dhyana/l10n/app_localizations.dart';
import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart' hide GlobalMaterialLocalizations;
import 'package:provider/provider.dart';

List<LocalizationsDelegate> getLocalizationDelegates() {
  return const [
    AppLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}

Widget withLocalizationProvider(
  Widget child, {
  Locale locale = const Locale('hu', 'HU'),
}) {
  return Localizations(
    delegates: getLocalizationDelegates(),
    locale: locale,
    child: child,
  );
}

Widget getAppTestProviders(Widget child) {
  return MultiProvider(
    providers: [
      Provider<AnalyticsService>(create: (_) => LoggingAnalyticsService()),
      Provider<CrashlyticsService>(create: (_) => LoggingCrashlyticsService()),
    ],
    child: child,
  );
}

Widget withAllContextProviders(
  Widget child, {
  Locale locale = const Locale('hu', 'HU'),
}) => withLocalizationProvider(getAppTestProviders(child), locale: locale);
