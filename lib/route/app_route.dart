import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widgets/app_keys.dart';
import 'package:dhyana/widgets/screen/all.dart';

import 'app_screen.dart';

class AppRouter {

  late final GoRouter _goRouter;

  AppRouter() {
    _goRouter = GoRouter(
      debugLogDiagnostics: kDebugMode,
      navigatorKey: AppKeys.rootNavigatorKey,
      initialLocation: AppScreen.home.path,
      redirect: _redirectHook,
      routes: <GoRoute>[

        // Home
        GoRoute(
          path: AppScreen.home.path,
          name: AppScreen.home.name,
          builder: (context, state) => const HomeScreen(),
        ),

        // Settings
        GoRoute(
          path: AppScreen.settings.path,
          name: AppScreen.settings.name,
          builder: (context, state) => const SettingsScreen(),
        ),

        // Login
        GoRoute(
          path: AppScreen.login.path,
          name: AppScreen.login.name,
          builder: (context, state) => const LoginScreen(),
        ),

        // Timer Running
        GoRoute(
          path: AppScreen.timerRunning.path,
          name: AppScreen.timerRunning.name,
          builder: (context, state) {
            TimerSettings timerSettings = state.extra! as TimerSettings;
            return TimerRunningScreen(
              timerSettings: timerSettings
            );
          },
        ),

        // // Error
        // GoRoute(
        //   path: AppScreen.error.path,
        //   name: AppScreen.error.name,
        //   builder: (context, state) => ErrorPage(error: state.extra.toString()),
        // ),

      ],

      // errorBuilder: (context, state) => ErrorPage(error: state.error.toString()),

    );
  }

  FutureOr<String?> _redirectHook(BuildContext context, GoRouterState state) {
    return null;

    // final bool isAuthenticated = (_authBloc.state is AuthStateSignedIn);
    // final bool isLoginScreenShown = state.matchedLocation == AppScreen.login.name;
    //
    // if (!isAuthenticated && !isLoginScreenShown) {
    //   return AppScreen.login.path;
    // } else {
    //   return null;
    // }
  }

  GoRouter get router => _goRouter;

}
