import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/dialog_helper.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {

  final Profile profile;

  const ProfileMenu({
    required this.profile,
    super.key
  });

  void _onSessionHistoryTapped(BuildContext context) {
    SessionHistoryRoute(profileId: profile.id).push(context);
    context.hapticsTap();
  }

  void _onEditProfileTapped(BuildContext context) {
    ProfileEditRoute().push(context);
    context.hapticsTap();
  }

  void _onStatisticsTapped(BuildContext context) {
    ProfileStatsRoute(profileId: profile.id).push(context);
    context.hapticsTap();
  }

  void _onDonateTapped(BuildContext context) {
    DonateRoute().push(context);
    context.hapticsTap();
  }

  void _onSettingsTapped(BuildContext context) {
    ProfileSettingsRoute(profileId: profile.id).push(context);
    context.hapticsTap();
  }

  void _onSignoutTapped(BuildContext context) {
    showSignoutDialog(context);
    context.hapticsTap();
  }

  void _onDeleteProfileTapped(BuildContext context) {
    showDeleteProfileDialog(context, profile);
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          ProfileMenuTile(
            title: Text(
              context.localizations.editProfile,
              style: textStyle,
            ),
            onTap: () => _onEditProfileTapped(context),
            key: const Key('profile_menu_edit_profile_tile'),
          ),
          const Divider(height: 0),
          ProfileMenuTile(
            title: Text(
              context.localizations.sessionsHistory,
              style: textStyle,
            ),
            onTap: () => _onSessionHistoryTapped(context),
            key: const Key('profile_menu_session_history_tile'),
          ),
          const Divider(height: 0),
          ProfileMenuTile(
            title: Text(
              context.localizations.profileStats,
              style: textStyle,
            ),
            onTap: () => _onStatisticsTapped(context),
            key: const Key('profile_menu_statistics_tile'),
          ),
          const Divider(height: 0),
          ProfileMenuTile(
            title: Text(
              context.localizations.donate,
              style: textStyle,
            ),
            onTap: () => _onDonateTapped(context),
            key: const Key('profile_menu_donate_tile'),
          ),
          const Divider(height: 0),
          ProfileMenuTile(
            title: Text(
              context.localizations.profileDeleteTitle,
              style: textStyle,
            ),
            onTap: () => _onDeleteProfileTapped(context),
            key: const Key('profile_menu_delete_profile_tile'),
          ),
          const Divider(height: 0),
          ProfileMenuTile(
            title: Text(
              context.localizations.profileSettings,
              style: textStyle,
            ),
            onTap: () => _onSettingsTapped(context),
            key: const Key('profile_menu_settings_tile'),
          ),
          const Divider(height: 0),
          ProfileMenuTile(
            title: Text(
              context.localizations.signOut,
              style: textStyle,
            ),
            onTap: () => _onSignoutTapped(context),
            key: const Key('profile_menu_signout_tile'),
          ),
        ],
      )
    );

  }

}

class ProfileMenuTile extends StatelessWidget {

  final Widget title;
  final VoidCallback onTap;

  const ProfileMenuTile({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppThemeData.borderRadiusMd),
      ),
      color: AppColors.backgroundPaperLight,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          key: key,
          title: title,
        ),
      ),
    );
  }
}

