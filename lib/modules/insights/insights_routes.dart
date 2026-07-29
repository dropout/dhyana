import 'package:dhyana/core/presentation/auth_redirect_hook.dart';
import 'package:dhyana/modules/auth/auth_routes.dart';
import 'package:dhyana/modules/insights/presentation/view/profile_stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'insights_routes.g.dart';

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
      authRedirectHook(context, state, const LoginRoute());
}