import 'package:timer/src/data/mapper/timer_settings_mapper.dart';
import 'package:timer/src/presentation/viewmodel/timer_settings_history/timer_settings_history_cubit.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:timer/src/timer_module.dart';
import 'package:timer/src/domain/entity/timer_settings_history_record_entity.dart';
import 'package:timer/src/presentation/view/timer_settings_history/timer_settings_history_list_item.dart';
import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerSettingsHistoryList extends StatelessWidget {
  final String profileId;
  final List<TimerSettingsHistoryRecordEntity> timerSettingsHistoryRecordList;

  const TimerSettingsHistoryList({
    required this.profileId,
    required this.timerSettingsHistoryRecordList,
    super.key,
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
      context.services.homeNavigator.navigateToHome(
        refresh: DateTime.now().millisecondsSinceEpoch,
      );
      Future.delayed(Durations.medium1, () {
        if (context.mounted) {
          context.showSuccessfulToast(
            AppLocalizations.of(context).timerSettingsHistoryApplied,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        timerSettingsHistoryRecordList
            .map(
              (record) => TimerSettingsHistoryListItem(
                timerSettingsHistoryRecord: record,
                onTap: () =>
                    _onListItemTap(context, record.timerSettings.toApi()),
              ),
            )
            .toList()
            .intersperse(const SizedBox(height: DesignSpec.spacingMd))
            .revealListAnimation(),
      ),
    );
  }
}
