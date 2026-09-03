import 'package:core/core.dart';
import 'package:timer/src/presentation/viewmodel/timer_settings_history/timer_settings_history_cubit.dart';
import 'package:timer/l10n/timer_localizations.dart';
import 'package:timer/src/presentation/view/timer_settings_history/timer_settings_history_list.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class TimerSettingsHistoryScreen extends StatelessWidget
  with DefaultScreenSetupHelpersMixin {

  final String profileId;

  const TimerSettingsHistoryScreen({
    required this.profileId,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimerSettingsHistoryCubit>(
      create: (_) =>
        GetIt.I.get<TimerSettingsHistoryCubit>()..loadSettings(profileId),
      child: buildStates(context),
    );
  }

  Widget buildStates(BuildContext context) {
    return BlocBuilder<TimerSettingsHistoryCubit, TimerSettingsHistoryState>(
      builder: (context, state) {
        switch (state) {
          case TimerSettingsHistoryLoaded():
            return buildLoadedState(context, state);
          case TimerSettingsHistoryLoading():
            return DefaultScreenSetup(
              title: TimerLocalizations.of(context).timerSettingsHistory,
              enableScrolling: false,
              slivers: [
                buildLoadingSliver(context),
              ],
            );
          case TimerSettingsHistoryError():
            return DefaultScreenSetup(
              title: TimerLocalizations.of(context).timerSettingsHistory,
              enableScrolling: false,
              slivers: [
                buildErrorSliver(context),
              ],
            );
          default:
            return DefaultScreenSetup(
              title: TimerLocalizations.of(context).timerSettingsHistory,
              enableScrolling: false,
            );
        }
      }
    );
  }

  Widget buildLoadedState(
    BuildContext context,
    TimerSettingsHistoryLoaded state
  ) {
    if (state.timerSettingsList.isEmpty) {
      return DefaultScreenSetup(
        title: TimerLocalizations.of(context).timerSettingsHistory,
        enableScrolling: false,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(
              left: DesignSpec.paddingLg,
              right: DesignSpec.paddingLg,
            ),
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_rounded,
                    color: Colors.black,
                    size: 96,
                  ),
                  const SizedBox(height: DesignSpec.spacingMd),
                  Text(TimerLocalizations.of(context).timerSettingsHistoryEmpty,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ]
              )
            )
          )
        ],
      );
    } else {
      return DefaultScreenSetup(
        title: TimerLocalizations.of(context).timerSettingsHistory,
        slivers: [
          SliverSafeArea(
            top: false,
            minimum: const EdgeInsets.only(
              bottom: DesignSpec.padding4Xl,
            ),
            sliver: SliverPadding(
              padding: const EdgeInsets.only(
                left: DesignSpec.paddingLg,
                right: DesignSpec.paddingLg,
              ),
              sliver: TimerSettingsHistoryList(
                profileId: profileId,
                timerSettingsHistoryRecordList: state.timerSettingsList
              ),
            ),
          ),
        ],
      );
    }

  }

}
