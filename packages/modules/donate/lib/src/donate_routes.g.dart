// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donate_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$donateRoute];

RouteBase get $donateRoute => GoRouteData.$route(
  path: '/donate',
  name: 'DONATE',
  hasOverriddenOnExit: false,
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
