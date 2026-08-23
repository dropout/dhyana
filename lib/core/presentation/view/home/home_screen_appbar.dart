import 'package:dhyana/core/presentation/viewmodel/home_screen_cubit.dart';
import 'package:dhyana/core/util/date_time_utils.dart';
import 'package:dhyana/core/presentation/view/app_bar/custom_app_bar.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/view/app_bar/presence_button.dart';
import 'package:dhyana/modules/profile/public/view/profile_button.dart';
import 'package:dhyana/core/presentation/view/home/today.dart';
import 'package:dhyana/core/presentation/view/app_bar/timer_settings_history_button.dart';
import 'package:dhyana/core/presentation/view/util/signed_in.dart';
import 'package:flutter/material.dart';

class HomeScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  final HomeScreenState homeScreenState;

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
              show: homeScreenState.sessionType == .sitting,
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
        trailing: [
          const ProfileButton(
            key: Key('home_screen_appbar_profile_button'),
          )
        ],
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
