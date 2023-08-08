import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:dhyana/initalizer.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/route/all.dart';
import 'package:dhyana/route/app_route.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/widgets/app_theme_data.dart';

class App extends StatelessWidget {

  final InitResult initResult;
  final AppRouter appRouter = AppRouter();

  App({
    required this.initResult,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<InitResult>(create: (_) => initResult),
        Provider<CrashlyticsService>(create: (_) => LoggingCrashlyticsService()),
      ],
      child: buildApp(context),
    );
  }

  Widget buildApp(BuildContext context) {
    return MaterialApp.router(
      builder: (BuildContext context, Widget? child) {
        child ??= const Placeholder();
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child
        );
      },
      routerConfig: appRouter.router,
      supportedLocales: const [
        Locale('hu', 'HU'),
        // Locale('en', 'EN')
      ],
      locale: const Locale('hu', 'HU'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppThemeData(isDark: false).themeData,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      //   fontFamily: 'RobotoSlab',
      // ),
    );
  }

}

