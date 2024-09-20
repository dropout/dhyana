import 'package:dhyana/bloc/timer_settings_history/timer_settings_history_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/timer/settings_history/all.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:dhyana/widget/app_bar/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerSettingsHistoryScreen extends StatefulWidget {

  final String profileId;

  const TimerSettingsHistoryScreen({
    required this.profileId,
    super.key
  });

  @override
  State<TimerSettingsHistoryScreen> createState() => _TimerSettingsHistoryScreenState();
}

class _TimerSettingsHistoryScreenState extends State<TimerSettingsHistoryScreen> {


  @override
  void initState() {
    BlocProvider.of<TimerSettingsHistoryBloc>(context)
      .add(TimerSettingsHistoryEvent.loadSettingsList(profileId: widget.profileId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: CustomAppBar(
          leading: const CustomBackButton(),
          titleText: AppLocalizations.of(context).timerSettingsHistory,
        ),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          bottom: false,
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
