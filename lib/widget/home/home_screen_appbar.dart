import 'package:dhyana/bloc/home_screen/home_screen_cubit.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/widget/app_bar/custom_app_bar.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/presence/presence_button.dart';
import 'package:dhyana/widget/profile/profile_button.dart';
import 'package:dhyana/widget/timer/settings/today.dart';
import 'package:dhyana/widget/timer/settings_history/timer_settings_history_button.dart';
import 'package:dhyana/widget/util/signed_in.dart';
import 'package:flutter/material.dart';

class HomeScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  final HomeScreenStateLoaded homeScreenState;

  const HomeScreenAppbar({required this.homeScreenState, super.key});

  @override
  Widget build(BuildContext context) {
    return SignedIn(
      yes: (context, profileId) {
        return CustomAppBar(
          leading: Today(key: ValueKey(DateTime.now().toDayId())),
          trailing: [
            TrailingSlot(
              child: PresenceButton(),
            ),
            TrailingSlot(
              show: homeScreenState.sessionType == .timer,
              child: TimerSettingsHistoryButton(profileId: profileId),
            ),
            TrailingSlot(
              child: ProfileButton(
                key: Key('home_screen_appbar_profile_button'),
              )
            ),
          ],
        );
      },
      no: CustomAppBar(
        leading: Today(key: ValueKey(DateTime.now().toDayId())),
        trailing: [const ProfileButton()],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class TrailingSlot extends StatelessWidget {
  final bool show;
  final Widget child;

  const TrailingSlot({super.key, this.show = true, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: show ? CustomAppBar.widgetHeight + DesignSpec.spacingSm : 0,
      height: CustomAppBar.widgetHeight,
      child: show ? child : const SizedBox.shrink(),
    );
  }
}
