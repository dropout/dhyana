// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$presenceRoute];

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
