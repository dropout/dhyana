// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $sessionCompletedRoute,
  $sessionHistoryRoute,
];

RouteBase get $sessionCompletedRoute => GoRouteData.$route(
  path: '/sessionCompleted',
  name: 'SESSION_COMPLETED',
  hasOverriddenOnExit: false,
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

RouteBase get $sessionHistoryRoute => GoRouteData.$route(
  path: '/activity',
  name: 'ACTIVITY',
  hasOverriddenOnExit: false,
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
