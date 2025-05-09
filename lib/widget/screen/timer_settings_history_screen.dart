import 'package:dhyana/bloc/timer_settings_history/timer_settings_history_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/bloc_provider/all.dart';
import 'package:dhyana/widget/screen/default_screen_setup.dart';
import 'package:dhyana/widget/timer/settings_history/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerSettingsHistoryScreen extends StatelessWidget
  with DefaultScreenSetupHelpersMixin {

  final String profileId;

  const TimerSettingsHistoryScreen({
    required this.profileId,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TimerSettingsHistoryBlocProvider(
      initialEvent: TimerSettingsHistoryEvent.loadSettingsList(
        profileId: profileId
      ),
      child: buildStates(context),
    );
  }

  Widget buildStates(BuildContext context) {
    return BlocBuilder<TimerSettingsHistoryBloc, TimerSettingsHistoryState>(
      builder: (context, state) {
        switch (state) {
          case TimerSettingsHistoryLoaded():
            return buildLoadedState(context, state);
          case TimerSettingsHistoryLoading():
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).timerSettingsHistory,
              enableScrolling: false,
              slivers: [
                buildLoadingSliver(context),
              ],
            );
          case TimerSettingsHistoryError():
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).timerSettingsHistory,
              enableScrolling: false,
              slivers: [
                buildErrorSliver(context),
              ],
            );
          default:
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).timerSettingsHistory,
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
        title: AppLocalizations.of(context).timerSettingsHistory,
        enableScrolling: false,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(
              left: AppThemeData.paddingLg,
              right: AppThemeData.paddingLg,
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
                  const SizedBox(height: AppThemeData.spacingMd),
                  Text(AppLocalizations.of(context).timerSettingsHistoryEmpty,
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
        title: AppLocalizations.of(context).timerSettingsHistory,
        slivers: [
          SliverSafeArea(
            top: false,
            minimum: EdgeInsets.only(
              bottom: AppThemeData.padding4Xl,
            ),
            sliver: SliverPadding(
              padding: const EdgeInsets.only(
                left: AppThemeData.paddingLg,
                right: AppThemeData.paddingLg,
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
