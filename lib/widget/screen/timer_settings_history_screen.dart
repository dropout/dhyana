import 'package:dhyana/bloc/timer_settings_history/timer_settings_history_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/bloc_provider/all.dart';
import 'package:dhyana/widget/screen/default_screen_setup.dart';
import 'package:dhyana/widget/timer/settings_history/all.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:dhyana/widget/app_bar/all.dart';
import 'package:dhyana/widget/util/title_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerSettingsHistoryScreen extends StatefulWidget {

  final String profileId;

  const TimerSettingsHistoryScreen({
    required this.profileId,
    super.key
  });

  @override
  State<TimerSettingsHistoryScreen> createState() =>
    _TimerSettingsHistoryScreenState();

}

class _TimerSettingsHistoryScreenState extends State<TimerSettingsHistoryScreen>
  with DefaultScreenSetupHelpersMixin {

  @override
  Widget build(BuildContext context) {
    return TimerSettingsHistoryBlocProvider(
      initialEvent: TimerSettingsHistoryEvent.loadSettingsList(
        profileId: widget.profileId
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        extendBodyBehindAppBar: true,
        body: SafeArea(
          bottom: false,
          child: buildStates(context),
        )
      ),
    );
  }

  Widget buildStates(BuildContext context) {
    return BlocBuilder<TimerSettingsHistoryBloc, TimerSettingsHistoryState>(
      builder: (context, state) {
        switch (state) {
          case TimerSettingsHistoryLoaded():
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).timerSettingsHistory,
              slivers: [
                SliverSafeArea(
                  sliver: SliverPadding(
                    padding: const EdgeInsets.only(
                      left: AppThemeData.paddingLg,
                      right: AppThemeData.paddingLg,
                      bottom: AppThemeData.paddingLg,
                    ),
                    sliver: TimerSettingsHistoryList(
                      settingsList: state.timerSettingsList
                    ),
                  ),
                ),
              ],
            );
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

}
