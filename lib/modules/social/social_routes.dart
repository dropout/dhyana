import 'package:dhyana/core/presentation/auth_redirect_hook.dart';
import 'package:dhyana/modules/auth/auth_routes.dart';
import 'package:dhyana/modules/social/presentation/view/presence_screen.dart';
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
      authRedirectHook(context, state, const LoginRoute());
}

List<RouteBase> $socialRoutes = [
  $presenceRoute,
];