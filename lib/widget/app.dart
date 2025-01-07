import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/init/init_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_theme_data.dart';

import 'app_routes.dart';

class App extends StatelessWidget {

  final InitResult initResult;
  late final AuthBloc authBloc;
  late final GoRouter router;

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
    router = createAppRouter(initResult: initResult);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // unfocus user input if clicks anywhere on screen
        // useful for hiding keyboard after user input
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: MultiProvider(
        providers: [
          Provider<InitResult>(create: (_) => initResult),
          ...initResult.providers
        ],
        child: MultiBlocProvider(
          providers: <BlocProvider>[
            BlocProvider<AuthBloc>(create: (_) => authBloc),
            BlocProvider<ProfileBloc>(create: (_) => initResult.profileBloc),
          ],
          child: buildApp(context),
        ),
      ),
    );
  }

  Widget buildApp(BuildContext context) {
    return MaterialApp.router(
      builder: (BuildContext context, Widget? child) {
        child ??= const SizedBox.shrink();
        return MediaQuery.withClampedTextScaling(
          maxScaleFactor: 1.0,
          child: child
        );
      },
      routerConfig: router,
      supportedLocales: const [
        Locale('hu', 'HU'),
        Locale('en', 'EN')
      ],
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

