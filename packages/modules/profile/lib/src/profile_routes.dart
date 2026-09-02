import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import 'package:core/core.dart';
import 'package:profile/src/presentation/view/screen/profile_settings_screen.dart';
import 'package:profile/src/presentation/view/screen/profile_screen.dart';
import 'package:profile/src/presentation/view/screen/profile_wizard_screen.dart';
import 'package:profile/src/presentation/view/screen/profile_edit_screen.dart';
import 'package:profile/src/presentation/view/screen/delete_profile_screen.dart';


part 'profile_routes.g.dart';

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

@TypedGoRoute<ProfileRoute>(path: '/profile/:profileId', name: 'PROFILE')
class ProfileRoute extends GoRouteData with AuthRedirectHook, $ProfileRoute {
  final String profileId;

  const ProfileRoute({required this.profileId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
    ProfileScreen(profileId: profileId);

  @override
  String? redirect(BuildContext context, GoRouterState state) =>
      authRedirectHook(context, state);
}

@TypedGoRoute<ProfileEditRoute>(path: '/editProfile', name: 'EDIT_PROFILE')
class ProfileEditRoute extends GoRouteData
    with AuthRedirectHook, $ProfileEditRoute {
  final String profileId;

  const ProfileEditRoute({required this.profileId});
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProfileEditScreen(profileId: profileId);
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
      authRedirectHook(context, state);
}

@TypedGoRoute<ProfileDeleteRoute>(
  path: '/deleteProfile',
  name: 'DELETE_PROFILE',
)
class ProfileDeleteRoute extends GoRouteData
    with AuthRedirectHook, $ProfileDeleteRoute {
  final String profileId;
  const ProfileDeleteRoute({required this.profileId});
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      DeleteProfileScreen(profileId: profileId);
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

/// Will be used to register the profile module's routes with the app's router.
final List<RouteBase> $profileRoutes = [
  $profileWizardRoute,
  $profileRoute,
  $profileEditRoute,
  $profileDeleteRoute,
  $profileSettingsRoute,
];
