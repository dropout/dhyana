// TODO: Move to module when payment/donate module is created
import 'package:core/core.dart';
import 'package:donate/src/presentation/widget/donate_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

part 'donate_routes.g.dart';


@TypedGoRoute<DonateRoute>(path: '/donate', name: 'DONATE')
class DonateRoute extends GoRouteData with AuthRedirectHook, $DonateRoute {
  const DonateRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DonateScreen();
}

List<RouteBase> $coreRoutes = [
  $donateRoute,
];