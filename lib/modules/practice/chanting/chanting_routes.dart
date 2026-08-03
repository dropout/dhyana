import 'package:dhyana/core/domain/entity/chant/chanting_settings.dart';
import 'package:dhyana/core/presentation/view/util/app_error_display.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/modules/practice/chanting/presentation/view/chanting_screen.dart';
import 'package:dhyana/core/core_routes.dart';

part 'chanting_routes.g.dart';

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

final List<RouteBase> chantingRoutes = [
  $chantingRoute,
];