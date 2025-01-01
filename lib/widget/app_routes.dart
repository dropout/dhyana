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
    navigatorKey: AppKeys.rootNavigatorKey,
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

@TypedGoRoute<TimerRunningRoute>(
  path: '/timerRunning',
  name: 'TIMER_RUNNING',
)
class TimerRunningRoute extends GoRouteData {
  final TimerSettings $extra;
  const TimerRunningRoute({required this.$extra});
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    Duration transitionDuration = const Duration(milliseconds: 512);
    return CustomTransitionPage(
      transitionDuration: transitionDuration,
      reverseTransitionDuration: transitionDuration,
      child: TimerRunningScreen(
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
          progress: animation,
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
    ProfileWizardScreen(profileId: profileId);
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

@TypedGoRoute<EditProfileRoute>(
  path: '/editProfile/:profileId',
  name: 'EDIT_PROFILE'
)
class EditProfileRoute extends GoRouteData with AuthRedirectHook {
  final String profileId;
  const EditProfileRoute({required this.profileId});
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    const ProfileEditScreen();
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
    authRedirectHook(context, state);
}

@TypedGoRoute<ActivityRoute>(
  path: '/activity',
  name: 'ACTIVITY',
)
class ActivityRoute extends GoRouteData with AuthRedirectHook {
  const ActivityRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
    ActivityScreen();
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
