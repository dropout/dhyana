import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:dhyana/core/domain/model/profile.dart';
import 'package:dhyana/core/navigation/auth_redirect_hook.dart';

import 'package:dhyana/modules/account/presentation/widget/screen/profile_screen.dart';
import 'package:dhyana/modules/account/presentation/widget/screen/profile_wizard_screen.dart';
import 'package:dhyana/modules/account/presentation/widget/screen/login_screen.dart';
import 'package:dhyana/modules/account/presentation/widget/screen/profile_edit_screen.dart';
import 'package:dhyana/modules/account/presentation/widget/screen/delete_profile_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<LoginRoute>(path: '/login', name: 'LOGIN')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => LoginScreen();
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
      authRedirectHook(context, state, const LoginRoute());
}

final List<RouteBase> $accountRoutes = [
  $loginRoute,
  $profileWizardRoute,
  $profileRoute,
  $profileEditRoute,
  $deleteProfileRoute,
];
