import 'package:dhyana/modules/practice/timer/presentation/bloc/timer_settings_history/timer_settings_history_cubit.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/modules/practice/timer/domain/model/timer_settings.dart';
import 'package:dhyana/modules/practice/timer/domain/model/timer_settings_history_record.dart';
import 'package:dhyana/core/navigation/app_routes.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/modules/practice/timer/presentation/widget/settings_history/timer_settings_history_list_item.dart';
import 'package:dhyana/core/presentation/util/app_animation.dart';
import 'package:dhyana/core/presentation/util/app_context.dart';
import 'package:dhyana/core/presentation/util/intersperse.dart';
import 'package:dhyana/core/presentation/util/toast.dart';
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

  void _onListItemTap(BuildContext context, TimerSettings timerSettings) async {
    
    context.hapticsTap();

    // Save the selected settings to the history cubit so that it can be    
    await context.read<TimerSettingsHistoryCubit>().useSettings(
      profileId,
      timerSettings,
    );

    // Force home screen recreation to apply the selected timer settings.
    if (context.mounted) {
      HomeRoute(
        refresh: DateTime.now().millisecondsSinceEpoch,
        $extra: timerSettings,
      ).go(context);
      Future.delayed(Durations.medium1, () {
        if (context.mounted) {
          context.showSuccessfulToast(
            AppLocalizations.of(context).timerSettingsHistoryApplied
          );
        }
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        timerSettingsHistoryRecordList.map((record) => TimerSettingsHistoryListItem(
          timerSettingsHistoryRecord: record,
          onTap: () => _onListItemTap(context, record.timerSettings),
        )).toList().intersperse(const SizedBox(height: DesignSpec.spacingMd)).revealListAnimation()
      ),
    );
  }


}
