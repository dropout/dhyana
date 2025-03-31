import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/init/init_result.dart';
import 'package:dhyana/transition/linear_gradient_mask_transition.dart';
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
  name: 'HOME'
)
class HomeRoute extends GoRouteData {
  final TimerSettings? $extra;
  const HomeRoute({this.$extra});
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    HomeScreen(timerSettings: $extra);
}

@TypedGoRoute<TimerRoute>(
  path: '/timer',
  name: 'TIMER',
)
class TimerRoute extends GoRouteData {
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
        // timerSettings: $timerSettings,
      ),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return LinearGradientMaskTransition(
          progress: CurvedAnimation(parent: animation, curve: Curves.easeIn),
          shader: context.services.shaderService.get('shaders/linear_gradient_mask.frag'),
          child: child,
        );
      },
    );
  }
}

@TypedGoRoute<LoginRoute>(
  path: '/login',
  name: 'LOGIN',
)
class LoginRoute extends GoRouteData {
  const LoginRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    LoginScreen();
}

/*
    Routes that require authentication
 */

mixin AuthRedirectHook {
  String? authRedirectHook(BuildContext context, GoRouterState state) {
    final LoginRoute loginRoute = const LoginRoute();
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    final bool isAuthenticated = (authBloc.state is AuthStateSignedIn);
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
class ProfileRoute extends GoRouteData with AuthRedirectHook {
  final String profileId;
  const ProfileRoute({
    required this.profileId,
  });
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    ProfileScreen(profileId: profileId);
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
    authRedirectHook(context, state);
}

@TypedGoRoute<ProfileWizardRoute>(
  path: '/profileWizard/:profileId',
  name: 'PROFILE_WIZARD',
)
class ProfileWizardRoute extends GoRouteData with AuthRedirectHook {
  final String profileId;
  const ProfileWizardRoute({required this.profileId});
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    ProfileWizardScreen();
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
    authRedirectHook(context, state);
}

@TypedGoRoute<ProfileStatsRoute>(
  path: '/profileStats/:profileId',
  name: 'PROFILE_STATS',
)
class ProfileStatsRoute extends GoRouteData with AuthRedirectHook {
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
class ProfileEditRoute extends GoRouteData with AuthRedirectHook {
  const ProfileEditRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    const ProfileEditScreen();
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
    authRedirectHook(context, state);
}

@TypedGoRoute<SessionHistoryRoute>(
  path: '/activity',
  name: 'ACTIVITY',
)
class SessionHistoryRoute extends GoRouteData with AuthRedirectHook {
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
class TimerSettingsHistoryRoute extends GoRouteData with AuthRedirectHook {
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
class PresenceRoute extends GoRouteData with AuthRedirectHook {
  const PresenceRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    PresenceScreen();
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
    authRedirectHook(context, state);
}
