import 'package:dhyana/core/presentation/auth_redirect_hook.dart';
import 'package:dhyana/core/presentation/view/transition/linear_gradient_mask_transition.dart';
import 'package:dhyana/core/presentation/view/util/app_context.dart';
import 'package:dhyana/modules/auth/auth_routes.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session.dart';
import 'package:dhyana/modules/practice/session/presentation/view/session_completed_screen.dart';
import 'package:dhyana/modules/practice/session/presentation/view/session_history_screen.dart';
import 'package:dhyana/core/util/assets.dart';
import 'package:flutter/material.dart';
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
      authRedirectHook(context, state, const LoginRoute());
}

final List<RouteBase> $sessionRoutes = [
  $sessionCompletedRoute,
  $sessionHistoryRoute,
];