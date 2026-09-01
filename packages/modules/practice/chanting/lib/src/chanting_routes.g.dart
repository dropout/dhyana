// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chanting_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$chantingRoute];

RouteBase get $chantingRoute => GoRouteData.$route(
  path: '/chanting',
  name: 'CHANTING',
  hasOverriddenOnExit: false,
  factory: $ChantingRoute._fromState,
);

mixin $ChantingRoute on GoRouteData {
  static ChantingRoute _fromState(GoRouterState state) =>
      ChantingRoute($extra: state.extra as Object);

  ChantingRoute get _self => this as ChantingRoute;

  @override
  String get location => GoRouteData.$location('/chanting');

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
