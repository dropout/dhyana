// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$profileStatsRoute];

RouteBase get $profileStatsRoute => GoRouteData.$route(
  path: '/profileStats/:profileId',
  name: 'PROFILE_STATS',
  hasOverriddenOnExit: false,
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
