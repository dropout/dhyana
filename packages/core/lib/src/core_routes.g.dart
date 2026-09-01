// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$homeRoute, $donateRoute];

RouteBase get $homeRoute =>
    GoRouteData.$route(path: '/', name: 'HOME', factory: $HomeRoute._fromState);

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute(
    refresh: _$convertMapValue(
      'refresh',
      state.uri.queryParameters,
      int.tryParse,
    ),
    $extra: state.extra as Object?,
  );

  HomeRoute get _self => this as HomeRoute;

  @override
  String get location => GoRouteData.$location(
    '/',
    queryParams: {
      if (_self.refresh != null) 'refresh': _self.refresh!.toString(),
    },
  );

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

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
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
