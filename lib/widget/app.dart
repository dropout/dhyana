import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:dhyana/initalizer.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/route/all.dart';
import 'package:dhyana/route/app_router.dart';
import 'package:dhyana/widget/app_theme_data.dart';

class App extends StatelessWidget {

  final InitResult initResult;
  late final AuthBloc authBloc;
  late final AppRouter appRouter;

  App({
    required this.initResult,
    super.key
  }) {
    authBloc = AuthBloc(
      initialAuthState: (initResult.user != null) ? AuthState.signedIn(user: initResult.user!) : const AuthState.initial(),
      authenticationRepository: initResult.repositories.authRepository,
      analyticsService: initResult.services.analyticsService,
      crashlyticsService: initResult.services.crashlyticsService,
    );
    appRouter = AppRouter(
      authBloc: authBloc,
      initResult: initResult,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<InitResult>(create: (_) => initResult),
        ...initResult.providers
      ],
      child: MultiBlocProvider(
        providers: <BlocProvider>[
          BlocProvider<AuthBloc>(create: (_) => authBloc)
        ],
        child: buildApp(context),
      ),
    );
  }

  Widget buildApp(BuildContext context) {
    return MaterialApp.router(
      builder: (BuildContext context, Widget? child) {
        child ??= const Placeholder();
        return MediaQuery.withClampedTextScaling(
            maxScaleFactor: 1.0,
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
    );
  }

}

