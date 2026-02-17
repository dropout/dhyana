import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/init/init_result.dart';
import 'package:dhyana/widget/transition/linear_gradient_mask_transition.dart';
import 'package:dhyana/util/assets.dart';
import 'package:dhyana/widget/app_keys.dart';
import 'package:dhyana/widget/screen/all.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/model/all.dart';

part 'app_routes.g.dart';

GoRouter createAppRouter({required InitResult initResult}) {
  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: AppWidgetKeys.rootNavigatorKey,
    initialLocation: '/',
    initialExtra: initResult.timerSettings,
    routes: $appRoutes,
    // errorBuilder: (context, state) => ErrorPage(error: state.error.toString()),
  );
}

/*
    Routes that does not require authentication
 */

@TypedGoRoute<HomeRoute>(
  path: '/',
  name: 'HOME',
)
class HomeRoute extends GoRouteData with $HomeRoute {
  final TimerSettings? $extra;
  const HomeRoute({this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
    HomeScreen(timerSettings: $extra, key: ValueKey($extra));
}

@TypedGoRoute<TimerRoute>(
  path: '/timer',
  name: 'TIMER',
)
class TimerRoute extends GoRouteData with $TimerRoute {
  final TimerSettings $extra;
  const TimerRoute({required this.$extra});
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    Duration transitionDuration = Durations.long1;
    return CustomTransitionPage(
      transitionDuration: transitionDuration,
      reverseTransitionDuration: transitionDuration,
      child: TimerScreen(
        key: state.pageKey,
        timerSettings: $extra,
      ),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return LinearGradientMaskTransition(
          progress: CurvedAnimation(parent: animation, curve: Curves.easeIn),
          shader: context.services.shaderService.get(Assets.shaderLinearGradientMask),
          child: child,
        );
      },
    );
  }
}

@TypedGoRoute<ChantingRoute>(
  path: '/chanting',
  name: 'CHANTING',
)
class ChantingRoute extends GoRouteData with $ChantingRoute {
  final ChantingSettings $extra;
  const ChantingRoute({required this.$extra});
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    ChantingScreen(chantingSettings: $extra);
}

@TypedGoRoute<SessionCompletedRoute>(
  path: '/sessionCompleted',
  name: 'SESSION_COMPLETED',
) class SessionCompletedRoute extends GoRouteData
  with $SessionCompletedRoute {

  final Session $extra;

  const SessionCompletedRoute({
    required this.$extra,
  });

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionDuration: Durations.extralong4,
      reverseTransitionDuration: Durations.long1,
      child: SessionCompletedScreen(
        session: $extra,
        key: state.pageKey,
      ),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        if (animation.status == AnimationStatus.reverse) {
          return LinearGradientMaskTransition(
            progress: CurvedAnimation(parent: animation, curve: Curves.easeIn),
            shader: context.services.shaderService.get(Assets.shaderLinearGradientMask),
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

@TypedGoRoute<LoginRoute>(
  path: '/login',
  name: 'LOGIN',
)
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    LoginScreen();
}

@TypedGoRoute<DonateRoute>(
  path: '/donate',
  name: 'DONATE',
)
class DonateRoute extends GoRouteData
  with AuthRedirectHook, $DonateRoute {
  const DonateRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    const DonateScreen();
}

/*
    Routes that require authentication
 */

mixin AuthRedirectHook {
  String? authRedirectHook(BuildContext context, GoRouterState state) {
    final LoginRoute loginRoute = const LoginRoute();
    final AuthCubit authCubit = context.read<AuthCubit>();
    final bool isAuthenticated = (authCubit.state is AuthStateSignedIn);
    final bool isLoginScreenShown = state.matchedLocation == loginRoute.location;
    if (!isAuthenticated && !isLoginScreenShown) {
      return loginRoute.location;
    } else {
      return null;
    }
  }
}

@TypedGoRoute<ProfileRoute>(
  path: '/profile/:profileId',
  name: 'PROFILE',
)
class ProfileRoute extends GoRouteData
  with AuthRedirectHook, $ProfileRoute {

  final String profileId;
  final Profile? $extra;
  const ProfileRoute({
    required this.profileId,
    this.$extra,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) =>
    ProfileScreen(profileId: profileId, profile: $extra);
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
    authRedirectHook(context, state);

}

@TypedGoRoute<ProfileWizardRoute>(
  path: '/profileWizard/:profileId',
  name: 'PROFILE_WIZARD',
)
class ProfileWizardRoute extends GoRouteData
  with AuthRedirectHook, $ProfileWizardRoute {

  final String profileId;
  const ProfileWizardRoute({required this.profileId});
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    ProfileWizardScreen(profileId: profileId);
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
    authRedirectHook(context, state);

}

@TypedGoRoute<ProfileStatsRoute>(
  path: '/profileStats/:profileId',
  name: 'PROFILE_STATS',
)
class ProfileStatsRoute extends GoRouteData
  with AuthRedirectHook, $ProfileStatsRoute {

  final String profileId;
  const ProfileStatsRoute({required this.profileId});
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    ProfileStatsScreen(profileId: profileId);
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
    authRedirectHook(context, state);

}

@TypedGoRoute<ProfileEditRoute>(
  path: '/editProfile',
  name: 'EDIT_PROFILE'
)
class ProfileEditRoute extends GoRouteData
  with AuthRedirectHook, $ProfileEditRoute {

  const ProfileEditRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    const ProfileEditScreen();
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
    authRedirectHook(context, state);

}

@TypedGoRoute<DeleteProfileRoute>(
  path: '/deleteProfile',
  name: 'DELETE_PROFILE',
)
class DeleteProfileRoute extends GoRouteData
  with AuthRedirectHook, $DeleteProfileRoute {

  const DeleteProfileRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    const DeleteProfileScreen();
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
    authRedirectHook(context, state);

}

@TypedGoRoute<SessionHistoryRoute>(
  path: '/activity',
  name: 'ACTIVITY',
)
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

@TypedGoRoute<PresenceRoute>(
  path: '/presence',
  name: 'PRESENCE',
)
class PresenceRoute extends GoRouteData

  with AuthRedirectHook, $PresenceRoute {
  const PresenceRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    PresenceScreen();
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
    authRedirectHook(context, state);

}

@TypedGoRoute<ProfileSettingsRoute>(
  path: '/profileSettings/:profileId',
  name: 'PROFILE_SETTINGS',
)
class ProfileSettingsRoute extends GoRouteData
  with AuthRedirectHook, $ProfileSettingsRoute {

  final String profileId;
  const ProfileSettingsRoute({required this.profileId});
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    ProfileSettingsScreen(profileId: profileId);
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
    authRedirectHook(context, state);

}


