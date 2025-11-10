// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $homeRoute,
  $timerRoute,
  $sessionCompletedRoute,
  $loginRoute,
  $donateRoute,
  $profileRoute,
  $profileWizardRoute,
  $profileStatsRoute,
  $profileEditRoute,
  $deleteProfileRoute,
  $sessionHistoryRoute,
  $timerSettingsHistoryRoute,
  $presenceRoute,
];

RouteBase get $homeRoute =>
    GoRouteData.$route(path: '/', name: 'HOME', factory: $HomeRoute._fromState);

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) =>
      HomeRoute($extra: state.extra as TimerSettings?);

  HomeRoute get _self => this as HomeRoute;

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $timerRoute => GoRouteData.$route(
  path: '/timer',
  name: 'TIMER',
  factory: $TimerRoute._fromState,
);

mixin $TimerRoute on GoRouteData {
  static TimerRoute _fromState(GoRouterState state) =>
      TimerRoute($extra: state.extra as TimerSettings);

  TimerRoute get _self => this as TimerRoute;

  @override
  String get location => GoRouteData.$location('/timer');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $sessionCompletedRoute => GoRouteData.$route(
  path: '/sessionCompleted',
  name: 'SESSION_COMPLETED',
  factory: $SessionCompletedRoute._fromState,
);

mixin $SessionCompletedRoute on GoRouteData {
  static SessionCompletedRoute _fromState(GoRouterState state) =>
      SessionCompletedRoute($extra: state.extra as Session);

  SessionCompletedRoute get _self => this as SessionCompletedRoute;

  @override
  String get location => GoRouteData.$location('/sessionCompleted');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',
  name: 'LOGIN',
  factory: $LoginRoute._fromState,
);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $donateRoute => GoRouteData.$route(
  path: '/donate',
  name: 'DONATE',
  factory: $DonateRoute._fromState,
);

mixin $DonateRoute on GoRouteData {
  static DonateRoute _fromState(GoRouterState state) => const DonateRoute();

  @override
  String get location => GoRouteData.$location('/donate');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $profileRoute => GoRouteData.$route(
  path: '/profile/:profileId',
  name: 'PROFILE',
  factory: $ProfileRoute._fromState,
);

mixin $ProfileRoute on GoRouteData {
  static ProfileRoute _fromState(GoRouterState state) => ProfileRoute(
    profileId: state.pathParameters['profileId']!,
    $extra: state.extra as Profile?,
  );

  ProfileRoute get _self => this as ProfileRoute;

  @override
  String get location =>
      GoRouteData.$location('/profile/${Uri.encodeComponent(_self.profileId)}');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $profileWizardRoute => GoRouteData.$route(
  path: '/profileWizard/:profileId',
  name: 'PROFILE_WIZARD',
  factory: $ProfileWizardRoute._fromState,
);

mixin $ProfileWizardRoute on GoRouteData {
  static ProfileWizardRoute _fromState(GoRouterState state) =>
      ProfileWizardRoute(profileId: state.pathParameters['profileId']!);

  ProfileWizardRoute get _self => this as ProfileWizardRoute;

  @override
  String get location => GoRouteData.$location(
    '/profileWizard/${Uri.encodeComponent(_self.profileId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $profileStatsRoute => GoRouteData.$route(
  path: '/profileStats/:profileId',
  name: 'PROFILE_STATS',
  factory: $ProfileStatsRoute._fromState,
);

mixin $ProfileStatsRoute on GoRouteData {
  static ProfileStatsRoute _fromState(GoRouterState state) =>
      ProfileStatsRoute(profileId: state.pathParameters['profileId']!);

  ProfileStatsRoute get _self => this as ProfileStatsRoute;

  @override
  String get location => GoRouteData.$location(
    '/profileStats/${Uri.encodeComponent(_self.profileId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $profileEditRoute => GoRouteData.$route(
  path: '/editProfile',
  name: 'EDIT_PROFILE',
  factory: $ProfileEditRoute._fromState,
);

mixin $ProfileEditRoute on GoRouteData {
  static ProfileEditRoute _fromState(GoRouterState state) =>
      const ProfileEditRoute();

  @override
  String get location => GoRouteData.$location('/editProfile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $deleteProfileRoute => GoRouteData.$route(
  path: '/deleteProfile',
  name: 'DELETE_PROFILE',
  factory: $DeleteProfileRoute._fromState,
);

mixin $DeleteProfileRoute on GoRouteData {
  static DeleteProfileRoute _fromState(GoRouterState state) =>
      const DeleteProfileRoute();

  @override
  String get location => GoRouteData.$location('/deleteProfile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $sessionHistoryRoute => GoRouteData.$route(
  path: '/activity',
  name: 'ACTIVITY',
  factory: $SessionHistoryRoute._fromState,
);

mixin $SessionHistoryRoute on GoRouteData {
  static SessionHistoryRoute _fromState(GoRouterState state) =>
      SessionHistoryRoute(profileId: state.uri.queryParameters['profile-id']!);

  SessionHistoryRoute get _self => this as SessionHistoryRoute;

  @override
  String get location => GoRouteData.$location(
    '/activity',
    queryParams: {'profile-id': _self.profileId},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $timerSettingsHistoryRoute => GoRouteData.$route(
  path: '/timerSettingsHistory/:profileId',
  name: 'TIMER_SETTINGS_HISTORY',
  factory: $TimerSettingsHistoryRoute._fromState,
);

mixin $TimerSettingsHistoryRoute on GoRouteData {
  static TimerSettingsHistoryRoute _fromState(GoRouterState state) =>
      TimerSettingsHistoryRoute(profileId: state.pathParameters['profileId']!);

  TimerSettingsHistoryRoute get _self => this as TimerSettingsHistoryRoute;

  @override
  String get location => GoRouteData.$location(
    '/timerSettingsHistory/${Uri.encodeComponent(_self.profileId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $presenceRoute => GoRouteData.$route(
  path: '/presence',
  name: 'PRESENCE',
  factory: $PresenceRoute._fromState,
);

mixin $PresenceRoute on GoRouteData {
  static PresenceRoute _fromState(GoRouterState state) => const PresenceRoute();

  @override
  String get location => GoRouteData.$location('/presence');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
