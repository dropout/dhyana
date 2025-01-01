import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/dialog_helper.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {

  final Profile profile;

  const ProfileMenu({
    required this.profile,
    super.key
  });

  void _onActivityTapped(BuildContext context) {
    ActivityRoute().push(context);
    context.hapticsTap();
  }

  void _onEditProfileTapped(BuildContext context) {
    EditProfileRoute(profileId: profile.id).push(context);
    context.hapticsTap();
  }

  void _onStatisticsTapped(BuildContext context) {
    ProfileStatsRoute(profileId: profile.id).push(context);
    context.hapticsTap();
  }

  void _onSignoutTapped(BuildContext context) {
    showSignoutDialog(context);
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {

    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
            AppLocalizations.of(context).activity,
            style: textStyle,
          ),
          enabled: true,
          onTap: () => _onActivityTapped(context),
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
          onTap: () => _onSignoutTapped(context),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
