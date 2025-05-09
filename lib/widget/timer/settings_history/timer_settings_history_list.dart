import 'package:dhyana/bloc/timer_settings_history/timer_settings_history_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/model/timer_settings_history_record.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/timer/settings_history/timer_settings_history_list_item.dart';
import 'package:dhyana/widget/util/app_animation.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/intersperse.dart';
import 'package:dhyana/widget/util/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerSettingsHistoryList extends StatelessWidget {

  final String profileId;
  final List<TimerSettingsHistoryRecord> timerSettingsHistoryRecordList;

  const TimerSettingsHistoryList({
    required this.profileId,
    required this.timerSettingsHistoryRecordList,
    super.key
  });

  void _onListItemTap(BuildContext context, TimerSettings timerSettings) {
    HomeRoute($extra: timerSettings).go(context);
    context.hapticsTap();
    BlocProvider.of<TimerSettingsHistoryBloc>(context).add(
      TimerSettingsHistoryEvent.saveSettings(
        timerSettings: timerSettings,
        profileId: profileId,
      )
    );

    Future.delayed(Durations.medium1, () {
      if (context.mounted) {
        context.showSuccessfulToast(
          AppLocalizations.of(context).timerSettingsHistoryApplied
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        timerSettingsHistoryRecordList.map((record) => TimerSettingsHistoryListItem(
          timerSettingsHistoryRecord: record,
          onTap: () => _onListItemTap(context, record.timerSettings),
        )).toList().intersperse(const SizedBox(height: AppThemeData.spacingMd)).revealListAnimation()
      ),
    );
  }


}
