import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import 'package:timer/timer.dart';

import 'package:home/src/public/view/home_screen.dart';


part 'home_routes.g.dart';

// -----------------------------------------------------------------------------
//  Instead of using typed parameters for the routes, we need to use a generic
//  Object, because with typed parameters devtools will not be able
//  to serialize the parameters and will throw an error.
//  Making 'select widget mode' unusable where the route is used with
//  typed parameters.
// -----------------------------------------------------------------------------

@TypedGoRoute<HomeRoute>(path: '/', name: 'HOME')
class HomeRoute extends GoRouteData with $HomeRoute {
  /// An option to force home screen recreation when navigating to it,
  /// which is useful to apply changes that requires home screen reload such
  /// as timer settings change.
  final int? refresh;

  /// Use [TimerSettings] object as extra to propagate
  /// timer settings to the home screen.
  final Object? $extra;

  const HomeRoute({this.refresh, this.$extra})
    : assert(
        $extra is TimerSettings || $extra == null,
        'Invalid extra data for HomeRoute. Expected TimerSettings or null.',
      );

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final TimerSettings? timerSettings = ($extra is TimerSettings)
        ? $extra as TimerSettings
        : null;
    return HomeScreen(timerSettings: timerSettings);
  }
}

List<RouteBase> $homeRoutes = [
  $homeRoute,
];
