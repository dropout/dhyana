import 'package:dhyana/l10n/app_localizations.dart';
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
          _buildTile(
            title: Text(
              context.localizations.editProfile,
              style: textStyle,
            ),
            onTap: () => _onEditProfileTapped(context),
          ),
          const Divider(height: 0),
          _buildTile(
            title: Text(
              context.localizations.sessionsHistory,
              style: textStyle,
            ),
            onTap: () => _onSessionHistoryTapped(context),
          ),
          const Divider(height: 0),
          _buildTile(
            title: Text(
              context.localizations.profileStats,
              style: textStyle,
            ),
            onTap: () => _onStatisticsTapped(context),
          ),
          const Divider(height: 0),
          _buildTile(
            title: Text(
              context.localizations.donate,
              style: textStyle,
            ),
            onTap: () => null,
          ),
          const Divider(height: 0),
          _buildTile(
            title: Text(
              context.localizations.profileDeleteTitle,
              style: textStyle,
            ),
            onTap: () => _onDeleteProfileTapped(context),
          ),
          const Divider(height: 0),
          _buildTile(
            title: Text(
              context.localizations.signOut,
              style: textStyle,
            ),
            onTap: () => _onSignoutTapped(context),
          ),
        ],
      )
    );

  }

  Widget _buildTile({
    required Widget title,
    required VoidCallback onTap,
  }) {
    return Material(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppThemeData.borderRadiusMd),
      ),
      color: AppColors.backgroundPaperLight,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          title: title,
        ),
      ),
    );
  }
}
