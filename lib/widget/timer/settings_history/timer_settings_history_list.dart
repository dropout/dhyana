import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/route/all.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/timer/settings_history/timer_settings_history_list_item.dart';
import 'package:dhyana/widget/util/app_animation.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/intersperse.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/widget/util/snackbar_helper.dart';

class TimerSettingsHistoryList extends StatelessWidget {

  final List<TimerSettings> settingsList;

  const TimerSettingsHistoryList({
    required this.settingsList,
    super.key
  });

  void _onListItemTap(BuildContext context, TimerSettings timerSettings) {
    context.goNamed(
      AppScreen.home.name,
      extra: timerSettings,
    );
    context.hapticsTap();
    context.showSuccessfulSnackBar('Timer settings restored');

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        top: AppThemeData.paddingLg,
        left: AppThemeData.paddingMd,
        right: AppThemeData.paddingMd,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      children: settingsList.map(
        (settings) => TimerSettingsHistoryListItem(
          timerSettings: settings,
          onTap: () => _onListItemTap(context, settings),
        )
      ).toList().intersperse(const SizedBox(height: AppThemeData.spacingMd)).revealListAnimation(),
    );
  }

}
