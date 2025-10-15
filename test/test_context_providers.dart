import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/service/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

List<LocalizationsDelegate> getLocalizationDelegates() {
  return const [
    AppLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}

Widget withLocalizationProvider(Widget child, {
  Locale locale = const Locale('hu', 'HU')
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

Widget withAllContextProviders(Widget child, {
  Locale locale = const Locale('hu', 'HU')
}) => withLocalizationProvider(
  getAppTestProviders(child),
  locale: locale
);



