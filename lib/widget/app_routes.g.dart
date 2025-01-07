// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $timerRunningRoute,
      $loginRoute,
      $profileRoute,
      $profileWizardRoute,
      $profileStatsRoute,
      $editProfileRoute,
      $sessionHistoryRoute,
      $timerSettingsHistoryRoute,
      $presenceRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      name: 'HOME',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute(
        $extra: state.extra as TimerSettings?,
      );

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $timerRunningRoute => GoRouteData.$route(
      path: '/timerRunning',
      name: 'TIMER_RUNNING',
      factory: $TimerRunningRouteExtension._fromState,
    );

extension $TimerRunningRouteExtension on TimerRunningRoute {
  static TimerRunningRoute _fromState(GoRouterState state) => TimerRunningRoute(
        $extra: state.extra as TimerSettings,
      );

  String get location => GoRouteData.$location(
        '/timerRunning',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      name: 'LOGIN',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $profileRoute => GoRouteData.$route(
      path: '/profile/:profileId',
      name: 'PROFILE',
      factory: $ProfileRouteExtension._fromState,
    );

extension $ProfileRouteExtension on ProfileRoute {
  static ProfileRoute _fromState(GoRouterState state) => ProfileRoute(
        profileId: state.pathParameters['profileId']!,
      );

  String get location => GoRouteData.$location(
        '/profile/${Uri.encodeComponent(profileId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $profileWizardRoute => GoRouteData.$route(
      path: '/profileWizard/:profileId',
      name: 'PROFILE_WIZARD',
      factory: $ProfileWizardRouteExtension._fromState,
    );

extension $ProfileWizardRouteExtension on ProfileWizardRoute {
  static ProfileWizardRoute _fromState(GoRouterState state) =>
      ProfileWizardRoute(
        profileId: state.pathParameters['profileId']!,
      );

  String get location => GoRouteData.$location(
        '/profileWizard/${Uri.encodeComponent(profileId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $profileStatsRoute => GoRouteData.$route(
      path: '/profileStats/:profileId',
      name: 'PROFILE_STATS',
      factory: $ProfileStatsRouteExtension._fromState,
    );

extension $ProfileStatsRouteExtension on ProfileStatsRoute {
  static ProfileStatsRoute _fromState(GoRouterState state) => ProfileStatsRoute(
        profileId: state.pathParameters['profileId']!,
      );

  String get location => GoRouteData.$location(
        '/profileStats/${Uri.encodeComponent(profileId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $editProfileRoute => GoRouteData.$route(
      path: '/editProfile/:profileId',
      name: 'EDIT_PROFILE',
      factory: $EditProfileRouteExtension._fromState,
    );

extension $EditProfileRouteExtension on EditProfileRoute {
  static EditProfileRoute _fromState(GoRouterState state) => EditProfileRoute(
        profileId: state.pathParameters['profileId']!,
      );

  String get location => GoRouteData.$location(
        '/editProfile/${Uri.encodeComponent(profileId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $sessionHistoryRoute => GoRouteData.$route(
      path: '/activity',
      name: 'ACTIVITY',
      factory: $SessionHistoryRouteExtension._fromState,
    );

extension $SessionHistoryRouteExtension on SessionHistoryRoute {
  static SessionHistoryRoute _fromState(GoRouterState state) =>
      SessionHistoryRoute(
        profileId: state.uri.queryParameters['profile-id']!,
      );

  String get location => GoRouteData.$location(
        '/activity',
        queryParams: {
          'profile-id': profileId,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $timerSettingsHistoryRoute => GoRouteData.$route(
      path: '/timerSettingsHistory/:profileId',
      name: 'TIMER_SETTINGS_HISTORY',
      factory: $TimerSettingsHistoryRouteExtension._fromState,
    );

extension $TimerSettingsHistoryRouteExtension on TimerSettingsHistoryRoute {
  static TimerSettingsHistoryRoute _fromState(GoRouterState state) =>
      TimerSettingsHistoryRoute(
        profileId: state.pathParameters['profileId']!,
      );

  String get location => GoRouteData.$location(
        '/timerSettingsHistory/${Uri.encodeComponent(profileId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $presenceRoute => GoRouteData.$route(
      path: '/presence',
      name: 'PRESENCE',
      factory: $PresenceRouteExtension._fromState,
    );

extension $PresenceRouteExtension on PresenceRoute {
  static PresenceRoute _fromState(GoRouterState state) => const PresenceRoute();

  String get location => GoRouteData.$location(
        '/presence',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
