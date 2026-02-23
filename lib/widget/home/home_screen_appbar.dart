import 'package:dhyana/bloc/home_screen/home_screen_cubit.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/widget/app_bar/custom_app_bar.dart';
import 'package:dhyana/widget/presence/presence_button.dart';
import 'package:dhyana/widget/profile/profile_button.dart';
import 'package:dhyana/widget/timer/settings/today.dart';
import 'package:dhyana/widget/timer/settings_history/timer_settings_history_button.dart';
import 'package:dhyana/widget/util/signed_in.dart';
import 'package:flutter/material.dart';

class HomeScreenAppbar extends StatelessWidget implements PreferredSizeWidget {

  final HomeScreenStateLoaded homeScreenState;

  const HomeScreenAppbar({
    required this.homeScreenState,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leading: Today(
        key: ValueKey(DateTime.now().toDayId()),
      ),
      trailing: [
        SignedIn(yes: (context, profileId) {
          return PresenceButton();
        }),
        if (homeScreenState.sessionType == .sitting) SignedIn(yes: (context, profileId) {
          return TimerSettingsHistoryButton(profileId: profileId);
        }),
        const ProfileButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
