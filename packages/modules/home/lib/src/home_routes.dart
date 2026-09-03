import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import 'package:home/src/public/view/home_screen.dart';

part 'home_routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/', name: 'HOME')
class HomeRoute extends GoRouteData with $HomeRoute {
  /// An option to force home screen recreation when navigating to it,
  /// which is useful to apply changes that requires home screen reload such
  /// as timer settings change.
  final int? refresh;

  const HomeRoute({this.refresh});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

List<RouteBase> $homeRoutes = [$homeRoute];
