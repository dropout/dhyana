// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $profileWizardRoute,
  $profileRoute,
  $profileEditRoute,
  $profileDeleteRoute,
  $profileSettingsRoute,
];

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

RouteBase get $profileRoute => GoRouteData.$route(
  path: '/profile/:profileId',
  name: 'PROFILE',
  factory: $ProfileRoute._fromState,
);

mixin $ProfileRoute on GoRouteData {
  static ProfileRoute _fromState(GoRouterState state) => ProfileRoute(
    profileId: state.pathParameters['profileId']!,
    $extra: state.extra as Object?,
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

RouteBase get $profileDeleteRoute => GoRouteData.$route(
  path: '/deleteProfile',
  name: 'DELETE_PROFILE',
  factory: $ProfileDeleteRoute._fromState,
);

mixin $ProfileDeleteRoute on GoRouteData {
  static ProfileDeleteRoute _fromState(GoRouterState state) =>
      const ProfileDeleteRoute();

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

RouteBase get $profileSettingsRoute => GoRouteData.$route(
  path: '/profileSettings/:profileId',
  name: 'PROFILE_SETTINGS',
  factory: $ProfileSettingsRoute._fromState,
);

mixin $ProfileSettingsRoute on GoRouteData {
  static ProfileSettingsRoute _fromState(GoRouterState state) =>
      ProfileSettingsRoute(profileId: state.pathParameters['profileId']!);

  ProfileSettingsRoute get _self => this as ProfileSettingsRoute;

  @override
  String get location => GoRouteData.$location(
    '/profileSettings/${Uri.encodeComponent(_self.profileId)}',
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
