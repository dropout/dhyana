import 'package:auth/src/presentation/view/login_screen.dart';
import 'package:auth/src/presentation/view/login_with_email_and_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'auth_routes.g.dart';

@TypedGoRoute<LoginRoute>(path: '/login', name: 'LOGIN')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => LoginScreen();
}

@TypedGoRoute<LoginWithEmailAndPasswordRoute>(path: '/login/email', name: 'LOGIN_WITH_EMAIL_AND_PASSWORD')
class LoginWithEmailAndPasswordRoute extends GoRouteData with $LoginWithEmailAndPasswordRoute {
  const LoginWithEmailAndPasswordRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginWithEmailAndPasswordScreen();
}

/// Use when instantiating the router in the app shell, 
/// to include all routes from this module.
List<RouteBase> $authRoutes = [
  $loginRoute,
  $loginWithEmailAndPasswordRoute,
];

