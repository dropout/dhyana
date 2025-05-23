import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/service/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

Widget getTestLocalizationsProvider(Widget child, {
  Locale locale = const Locale('hu', 'HU')
}) {
  return Localizations(
    delegates: const [
      AppLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    locale: locale,
    child: child,
  );
}

Widget getAppTestProviders(Widget child) {
  return MultiProvider(
    providers: [
      Provider<AnalyticsService>(create: (_) => LoggingAnalyticsService()),
      Provider<CrashlyticsService>(create: (_) => LoggingCrashlyticsService())
    ],
    child: child,
  );
}

Widget getAllTestContextProviders(Widget child, {
  Locale locale = const Locale('hu', 'HU')
}) {
  return getTestLocalizationsProvider(getAppTestProviders(child), locale: locale);
}
