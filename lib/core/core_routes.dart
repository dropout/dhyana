import 'package:dhyana/core/presentation/auth_redirect_hook.dart';
import 'package:dhyana/core/presentation/view/home/home_screen.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/chanting_settings.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings.dart';
import 'package:dhyana/core/presentation/view/util/app_error_display.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../modules/practice/chanting/presentation/widget/chanting_screen.dart';
import '../../modules/donate/presentation/widget/donate_screen.dart';

part 'core_routes.g.dart';

// -----------------------------------------------------------------------------
//  Instead of using typed parameters for the routes, we need to use a generic
//  Object, because with typed parameters devtools will not be able
//  to serialize the parameters and will throw an error.
//  Making 'select widget mode' unusable where the route is used with
//  typed parameters.
// -----------------------------------------------------------------------------

// GoRouter createAppRouter({required InitResult initResult}) {
//   return GoRouter(
//     debugLogDiagnostics: kDebugMode,
//     navigatorKey: AppWidgetKeys.rootNavigatorKey,
//     initialLocation: '/',
//     routes: $appRoutes,
//     // errorBuilder: (context, state) => ErrorPage(error: state.error.toString()),
//   );
// }

/*
    Routes that does not require authentication
 */

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

@TypedGoRoute<ChantingRoute>(path: '/chanting', name: 'CHANTING')
class ChantingRoute extends GoRouteData with $ChantingRoute {
  /// Use [ChantingSettings] as extra to propagate chanting settings.
  final Object $extra;

  const ChantingRoute({required this.$extra})
    : assert(
        $extra is ChantingSettings,
        'Invalid extra data for ChantingRoute. Expected ChantingSettings.',
      );

  @override
  Widget build(BuildContext context, GoRouterState state) {
    try {
      final ChantingSettings chantingSettings = ($extra is ChantingSettings)
          ? $extra as ChantingSettings
          : throw Exception('Invalid chanting settings data');
      return ChantingScreen(
        chantingSettings: chantingSettings,
        key: state.pageKey,
      );
    } catch (e) {
      return AppErrorDisplay(onButtonTap: () => HomeRoute().go(context));
    }
  }
}

@TypedGoRoute<DonateRoute>(path: '/donate', name: 'DONATE')
class DonateRoute extends GoRouteData with AuthRedirectHook, $DonateRoute {
  const DonateRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DonateScreen();
}

List<RouteBase> $coreRoutes = [
  $homeRoute,
  $chantingRoute,
  $donateRoute,
];