import 'package:dhyana/modules/auth/presentation/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'auth_routes.g.dart';

@TypedGoRoute<LoginRoute>(path: '/login', name: 'LOGIN')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => LoginScreen();
}

List<RouteBase> $authRoutes = [
  $loginRoute,
];