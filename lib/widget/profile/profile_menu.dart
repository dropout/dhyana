import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/route/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileMenu extends StatelessWidget {

  final Profile profile;

  const ProfileMenu({
    required this.profile,
    super.key
  });

  void _onSignOutPressed(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(const SignOut());
    context.goNamed(AppScreen.home.name);
  }

  @override
  Widget build(BuildContext context) {

    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            AppLocalizations.of(context).activity,
            style: textStyle,
          ),
          enabled: true,
          onTap: () => context.pushNamed(AppScreen.activity.name),
        ),
        const Divider(height: 0),
        ListTile(
          title: Text(
            AppLocalizations.of(context).editProfile,
            style: textStyle,
          ),
          enabled: true,
          onTap: () => context.pushNamed(AppScreen.editProfile.name),
        ),
        const Divider(height: 0),
        ListTile(
          title: Text(
            AppLocalizations.of(context).profileStats,
            style: textStyle,
          ),
          enabled: true,
          onTap: () => context.pushNamed(
            AppScreen.profileStats.name,
            pathParameters: {
              'profileId': profile.id
            }
          ),
        ),
        const Divider(height: 0),
        ListTile(
          title: Text(
            AppLocalizations.of(context).signOut,
            style: textStyle,
          ),
          enabled: true,
          onTap: () => _onSignOutPressed(context),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
