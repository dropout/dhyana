import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:material_ui/material_ui.dart';

import 'package:core/core.dart';
import 'package:timer/l10n/timer_localizations.dart';
import 'package:timer/src/presentation/view/timer_settings_history/timer_settings_history_grid_item.dart';
import 'package:timer/src/presentation/viewmodel/timer_settings_history/timer_settings_history_cubit.dart';
import 'package:timer/src/public/model/timer_settings.dart';
import 'package:timer/src/public/model/timer_settings_history_record.dart';


class const TimerSettingsHistoryGrid({
  required final String profileId,
  required final List<TimerSettingsHistoryRecord> timerSettingsHistoryRecordList,
  super.key,
}) extends StatelessWidget {

  void _onListItemTap(BuildContext context, TimerSettings timerSettings) async {
    context.hapticsTap();

    // Save the selected settings to the history cubit so that it can be
    await context.read<TimerSettingsHistoryCubit>().useSettings(
      profileId,
      timerSettings,
    );

    // Force home screen recreation to apply the selected timer settings.
    if (context.mounted) {
      context.services.homeNavigator.navigateToHome(
        refresh: DateTime.now().millisecondsSinceEpoch,
      );
      Future.delayed(Durations.medium1, () {
        if (context.mounted) {
          context.showSuccessfulToast(
            TimerLocalizations.of(context).timerSettingsHistoryApplied,
          );
        }
      });
    }
  }  
  
  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: DesignSpec.spacingMd,
      crossAxisSpacing: DesignSpec.spacingMd,
      childCount: timerSettingsHistoryRecordList.length,
      itemBuilder: (context, index) {
        final record = timerSettingsHistoryRecordList[index];
        return TimerSettingsHistoryGridItem(
          timerSettingsHistoryRecord: record,
          onTap: () => _onListItemTap(context, record.timerSettings),
        );
      },
    );
  }

}
