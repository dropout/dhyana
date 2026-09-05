import 'package:get_it/get_it.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import 'package:core/core.dart';
import 'package:timer/src/public/viewmodel/timer_settings_cubit.dart';
import 'package:timer/src/presentation/view/timer_screen.dart';
import 'package:timer/src/presentation/view/timer_settings_history_screen.dart';


part 'timer_routes.g.dart';

@TypedGoRoute<TimerRoute>(path: '/timer', name: 'TIMER')
class TimerRoute extends GoRouteData with $TimerRoute {

  const TimerRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {

    final settings = GetIt.I.get<TimerSettingsCubit>().state.timerSettings; 

    Duration transitionDuration = Durations.long1;
    return CustomTransitionPage(
      transitionDuration: transitionDuration,
      reverseTransitionDuration: transitionDuration,
      child: TimerScreen(key: state.pageKey, timerSettings: settings),
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
      authRedirectHook(context, state);
}

List<RouteBase> $timerRoutes = [
  $timerRoute,
  $timerSettingsHistoryRoute,
];