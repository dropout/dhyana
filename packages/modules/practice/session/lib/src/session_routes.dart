import 'package:core/core.dart';
import 'package:session/src/public/model/session.dart';
import 'package:session/src/presentation/view/session_completed_screen.dart';
import 'package:session/src/presentation/view/session_history_screen.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

part  'session_routes.g.dart';

@TypedGoRoute<SessionCompletedRoute>(
  path: '/sessionCompleted',
  name: 'SESSION_COMPLETED',
)
class SessionCompletedRoute extends GoRouteData with $SessionCompletedRoute {
  final Session $extra;

  const SessionCompletedRoute({required this.$extra});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionDuration: Durations.extralong4,
      reverseTransitionDuration: Durations.long1,
      child: SessionCompletedScreen(session: $extra, key: state.pageKey),
      transitionsBuilder:
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            if (animation.status == AnimationStatus.reverse) {
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
            } else {
              return FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOutExpo,
                ),
                child: child,
              );
            }
          },
    );
  }
}

@TypedGoRoute<SessionHistoryRoute>(path: '/activity', name: 'ACTIVITY')
class SessionHistoryRoute extends GoRouteData
    with AuthRedirectHook, $SessionHistoryRoute {
  final String profileId;
  const SessionHistoryRoute({required this.profileId});
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      SessionHistoryScreen(profileId: profileId);
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
      authRedirectHook(context, state);
}

final List<RouteBase> $sessionRoutes = [
  $sessionCompletedRoute,
  $sessionHistoryRoute,
];