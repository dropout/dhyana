import 'package:dhyana/bloc/timer_settings_history/timer_settings_history_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/timer_settings_history/all.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:dhyana/widget/util/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerSettingsHistoryScreen extends StatelessWidget {
  const TimerSettingsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: CustomAppBar(titleText: AppLocalizations.of(context).activity),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: buildState(context)
        )
    );
  }

  Widget buildState(BuildContext context) {
    return BlocBuilder<TimerSettingsHistoryBloc, TimerSettingsHistoryState>(
        builder: (context, state) {
          switch (state) {
            case TimerSettingsHistoryLoaded():
              return TimerSettingsHistoryList(
                settingsList: state.timerSettingsList
              );
            case TimerSettingsHistoryLoading():
              return const AppLoadingDisplay();
            case TimerSettingsHistoryError():
              return const AppErrorDisplay();
            default:
              return const AppErrorDisplay();
          }
        }
    );
  }

}
