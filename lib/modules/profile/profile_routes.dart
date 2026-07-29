import 'package:dhyana/modules/auth/auth_routes.dart';
import 'package:dhyana/modules/profile/presentation/view/screen/profile_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/presentation/auth_redirect_hook.dart';

import 'package:dhyana/modules/profile/presentation/view/screen/profile_screen.dart';
import 'package:dhyana/modules/profile/presentation/view/screen/profile_wizard_screen.dart';
import 'package:dhyana/modules/profile/presentation/view/screen/profile_edit_screen.dart';
import 'package:dhyana/modules/profile/presentation/view/screen/delete_profile_screen.dart';

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
      authRedirectHook(context, state, const LoginRoute());
}

@TypedGoRoute<ProfileRoute>(path: '/profile/:profileId', name: 'PROFILE')
class ProfileRoute extends GoRouteData with AuthRedirectHook, $ProfileRoute {
  final String profileId;

  /// Pass the [Profile] object through extra to avoid unnecessary
  /// profile data fetching.
  final Object? $extra;

  const ProfileRoute({required this.profileId, this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    try {
      final Profile profile = ($extra is Profile)
          ? $extra as Profile
          : throw Exception('Invalid profile data');
      return ProfileScreen(profileId: profileId, profile: profile);
    } catch (e) {
      // If the passed profile data is invalid or not present,
      // load the profile from just the profile id.
      return ProfileScreen(profileId: profileId);
    }
  }

  @override
  String? redirect(BuildContext context, GoRouterState state) =>
      authRedirectHook(context, state, const LoginRoute());
}

@TypedGoRoute<ProfileEditRoute>(path: '/editProfile', name: 'EDIT_PROFILE')
class ProfileEditRoute extends GoRouteData
    with AuthRedirectHook, $ProfileEditRoute {
  const ProfileEditRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfileEditScreen();
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
      authRedirectHook(context, state, const LoginRoute());
}

@TypedGoRoute<ProfileDeleteRoute>(
  path: '/deleteProfile',
  name: 'DELETE_PROFILE',
)
class ProfileDeleteRoute extends GoRouteData
    with AuthRedirectHook, $ProfileDeleteRoute {
  const ProfileDeleteRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DeleteProfileScreen();
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
      authRedirectHook(context, state, const LoginRoute());
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
      authRedirectHook(context, state, const LoginRoute());
}


final List<RouteBase> $profileRoutes = [
  $loginRoute,
  $profileWizardRoute,
  $profileRoute,
  $profileEditRoute,
  $profileDeleteRoute,
  $profileSettingsRoute,
];


