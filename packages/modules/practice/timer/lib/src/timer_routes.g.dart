// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$timerRoute, $timerSettingsHistoryRoute];

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
