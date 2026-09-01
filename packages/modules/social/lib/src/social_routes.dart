import 'package:core/core.dart';
import 'package:social/src/presentation/view/presence_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'social_routes.g.dart';

@TypedGoRoute<PresenceRoute>(path: '/presence', name: 'PRESENCE')
class PresenceRoute extends GoRouteData with AuthRedirectHook, $PresenceRoute {
  const PresenceRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => PresenceScreen();
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
      authRedirectHook(context, state);
}

List<RouteBase> $socialRoutes = [
  $presenceRoute,
];