import 'dart:async';

import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/initalizer.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/app_keys.dart';
import 'package:dhyana/widget/screen/all.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_screen.dart';

class AppRouter {

  final AuthBloc authBloc;
  final InitResult initResult;

  late final GoRouter _goRouter;

  AppRouter({
    required this.authBloc,
    required this.initResult,
  }) {
    _goRouter = GoRouter(
      debugLogDiagnostics: kDebugMode,
      navigatorKey: AppKeys.rootNavigatorKey,
      initialLocation: AppScreen.home.path,
      initialExtra: initResult.timerSettings,
      routes: <GoRoute>[

        // Home
        GoRoute(
          path: AppScreen.home.path,
          name: AppScreen.home.name,
          builder: (context, state) {
            try {
              TimerSettings ts = state.extra! as TimerSettings;
              return HomeScreen(
                timerSettings: ts,
              );
            } catch (_) {
              return const HomeScreen();
            }
          }
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

        // Profile
        GoRoute(
          path: AppScreen.profile.path,
          name: AppScreen.profile.name,
          builder: (context, state) => const ProfileScreen(),
          redirect: _signedInRedirectHook
        ),

        // Profile Wizard
        GoRoute(
          path: AppScreen.profileWizard.path,
          name: AppScreen.profileWizard.name,
          builder: (context, state) => const ProfileWizardScreen(),
          redirect: _signedInRedirectHook
        ),

        // Edit Profile
        GoRoute(
          path: AppScreen.editProfile.path,
          name: AppScreen.editProfile.name,
          builder: (context, state) => const ProfileEditScreen(),
          redirect: _signedInRedirectHook
        ),

        // Activity
        GoRoute(
            path: AppScreen.activity.path,
            name: AppScreen.activity.name,
            builder: (context, state) => const ActivityScreen(),
            redirect: _signedInRedirectHook,
        ),

        // Login
        GoRoute(
          path: AppScreen.login.path,
          name: AppScreen.login.name,
          builder: (context, state) => const LoginScreen(),
        ),

        // Settings
        GoRoute(
          path: AppScreen.settings.path,
          name: AppScreen.settings.name,
          builder: (context, state) => const SettingsScreen(),
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

  FutureOr<String?> _signedInRedirectHook(BuildContext context, GoRouterState state) {
    final bool isAuthenticated = (authBloc.state is AuthStateSignedIn);
    final bool isLoginScreenShown = state.matchedLocation == AppScreen.login.name;
    if (!isAuthenticated && !isLoginScreenShown) {
      return AppScreen.login.path;
    } else {
      return null;
    }
  }

  GoRouter get router => _goRouter;

}
