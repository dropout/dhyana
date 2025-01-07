import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/timer/settings_history/timer_settings_history_list_item.dart';
import 'package:dhyana/widget/util/app_animation.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/intersperse.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/widget/util/snackbar_helper.dart';

class TimerSettingsHistoryList extends StatelessWidget {

  final List<TimerSettings> settingsList;

  const TimerSettingsHistoryList({
    required this.settingsList,
    super.key
  });

  void _onListItemTap(BuildContext context, TimerSettings timerSettings) {
    const HomeRoute().go(context);
    context.hapticsTap();
    context.showSuccessfulSnackBar('Timer settings restored');
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        settingsList.map((settings) => TimerSettingsHistoryListItem(
          timerSettings: settings,
          onTap: () => _onListItemTap(context, settings),
        )).toList().intersperse(const SizedBox(height: AppThemeData.spacingMd)).revealListAnimation()
      ),
    );
  }

}
