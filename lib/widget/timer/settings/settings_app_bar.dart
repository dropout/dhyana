import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/profile_button.dart';
import 'package:dhyana/widget/timer_settings_history/timer_settings_history_button.dart';
import 'package:flutter/material.dart';

class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Colors.pink,
        child: SafeArea(
          child: Container(
            color: Colors.orange.withOpacity(0.5),
            child: Row(
              children: [
                Spacer(),
                const TimerSettingsHistoryButton(),
                SizedBox(
                  width: AppThemeData.paddingMd,
                ),
                ProfileButton(
                  size: AppThemeData.circleSm,
                ),

              ],
            ),
          ),
        ),
      )
      // child: FittedBox(
      //   fit: BoxFit.fill,
      // ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
