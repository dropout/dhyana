import 'package:material_ui/material_ui.dart';

import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:home/src/public/viewmodel/home_screen_cubit.dart';

import 'today.dart';

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
            TrailingSlot(child: PresenceButton()),
            TrailingSlot(
              show: homeScreenState.sessionType == .sitting,
              child: TimerSettingsHistoryButton(profileId: profileId),
            ),
            TrailingSlot(
              child: ProfileButton(
                key: Key('home_screen_appbar_profile_button'),
              ),
            ),
          ],
        );
      },
      no: CustomAppBar(
        leading: Today(key: ValueKey(DateTime.now().toDayId())),
        trailing: [
          const ProfileButton(key: Key('home_screen_appbar_profile_button')),
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
