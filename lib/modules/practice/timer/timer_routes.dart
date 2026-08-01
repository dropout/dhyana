import 'package:dhyana/core/presentation/auth_redirect_hook.dart';
import 'package:dhyana/core/presentation/view/transition/linear_gradient_mask_transition.dart';
import 'package:dhyana/core/presentation/view/util/app_context.dart';
import 'package:dhyana/modules/auth/auth_routes.dart';
import 'package:dhyana/core/domain/entity/timer_settings.dart';
import 'package:dhyana/modules/practice/timer/presentation/view/timer_screen.dart';
import 'package:dhyana/modules/practice/timer/presentation/view/timer_settings_history_screen.dart';
import 'package:dhyana/core/util/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'timer_routes.g.dart';

@TypedGoRoute<TimerRoute>(path: '/timer', name: 'TIMER')
class TimerRoute extends GoRouteData with $TimerRoute {
  final TimerSettings $extra;
  const TimerRoute({required this.$extra});
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    Duration transitionDuration = Durations.long1;
    return CustomTransitionPage(
      transitionDuration: transitionDuration,
      reverseTransitionDuration: transitionDuration,
      child: TimerScreen(key: state.pageKey, timerSettings: $extra),
      transitionsBuilder:
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return LinearGradientMaskTransition(
              progress: CurvedAnimation(
                parent: animation,
                curve: Curves.easeIn,
              ),
              shader: context.services.shaderService.get(
                Assets.shaderLinearGradientMask,
              ),
              child: child,
            );
          },
    );
  }
}

@TypedGoRoute<TimerSettingsHistoryRoute>(
  path: '/timerSettingsHistory/:profileId',
  name: 'TIMER_SETTINGS_HISTORY',
)
class TimerSettingsHistoryRoute extends GoRouteData
    with AuthRedirectHook, $TimerSettingsHistoryRoute {
  final String profileId;
  const TimerSettingsHistoryRoute({required this.profileId});
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      TimerSettingsHistoryScreen(profileId: profileId);
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
      authRedirectHook(context, state, const LoginRoute());
}

List<RouteBase> $timerRoutes = [
  $timerRoute,
  $timerSettingsHistoryRoute,
];