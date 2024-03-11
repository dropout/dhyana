import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/service/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

Widget getLocalizationsProvider(Locale locale, Widget child) {
  return Localizations(
    delegates: const [
      AppLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    locale: const Locale('hu', 'HU'),
    child: child,
  );
}

Widget getAppProviders(Widget child) {
  return MultiProvider(
    providers: [
      Provider<AnalyticsService>(create: (_) => LoggingAnalyticsService()),
      Provider<CrashlyticsService>(create: (_) => LoggingCrashlyticsService())
    ],
    child: child,
  );
}
