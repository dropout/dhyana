import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/route/all.dart';
import 'package:dhyana/widget/profile/profile_button.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileMenu extends StatelessWidget {

  final Profile profile;

  const ProfileMenu({
    required this.profile,
    super.key
  });

  void _onActivityTapped(BuildContext context) {
    context.pushNamed(AppScreen.activity.name);
    context.hapticsTap();
  }

  void _onEditProfileTapped(BuildContext context) {
    context.pushNamed(AppScreen.editProfile.name);
    context.hapticsTap();
  }

  void _onStatisticsTapped(BuildContext context) {
    context.pushNamed(
      AppScreen.profileStats.name,
      pathParameters: {
        'profileId': profile.id
      }
    );
    context.hapticsTap();
  }

  void _onSignOutTapped(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(const SignOut());
    context.hapticsTap();
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
          onTap: () => _onActivityTapped(context),
        ),
        const Divider(height: 0),
        ListTile(
          title: Text(
            AppLocalizations.of(context).editProfile,
            style: textStyle,
          ),
          enabled: true,
          onTap: () => _onEditProfileTapped(context),
        ),
        const Divider(height: 0),
        ListTile(
          title: Text(
            AppLocalizations.of(context).profileStats,
            style: textStyle,
          ),
          enabled: true,
          onTap: () => _onStatisticsTapped(context),
        ),
        const Divider(height: 0),
        ListTile(
          title: Text(
            AppLocalizations.of(context).signOut,
            style: textStyle,
          ),
          enabled: true,
          onTap: () => _onSignOutTapped(context),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
