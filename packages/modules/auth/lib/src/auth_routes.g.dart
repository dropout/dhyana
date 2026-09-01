// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $loginRoute,
  $loginWithEmailAndPasswordRoute,
];

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',
  name: 'LOGIN',
  hasOverriddenOnExit: false,
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

RouteBase get $loginWithEmailAndPasswordRoute => GoRouteData.$route(
  path: '/login/email',
  name: 'LOGIN_WITH_EMAIL_AND_PASSWORD',
  hasOverriddenOnExit: false,
  factory: $LoginWithEmailAndPasswordRoute._fromState,
);

mixin $LoginWithEmailAndPasswordRoute on GoRouteData {
  static LoginWithEmailAndPasswordRoute _fromState(GoRouterState state) =>
      const LoginWithEmailAndPasswordRoute();

  @override
  String get location => GoRouteData.$location('/login/email');

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
