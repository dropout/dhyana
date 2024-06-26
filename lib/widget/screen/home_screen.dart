import 'package:dhyana/widget/bloc_provider/all.dart';
import 'package:dhyana/widget/timer/all.dart';
import 'package:dhyana/widget/timer_settings_history/timer_settings_history_button.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/bloc/timer_settings/timer_settings_bloc.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/profile_button.dart';

class HomeScreen extends StatelessWidget {

  final TimerSettings? timerSettings;

  const HomeScreen({
    this.timerSettings,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TimerSettingsBlocProvider(
      onCreateEvent: TimerSettingsEvent.load(timerSettings: timerSettings),
      child: HomeScreenContent(timerSettings: timerSettings),
    );
  }

}

class HomeScreenContent extends StatefulWidget {

  final TimerSettings? timerSettings;

  const HomeScreenContent({
    this.timerSettings,
    super.key,
  });

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {

  @override
  void didUpdateWidget(HomeScreenContent oldWidget) {
    if (widget.timerSettings != oldWidget.timerSettings) {
      BlocProvider.of<TimerSettingsBloc>(context).add(
        TimerSettingsEvent.load(timerSettings: widget.timerSettings)
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: BlocBuilder<TimerSettingsBloc, TimerSettingsState>(
            builder: (BuildContext context, TimerSettingsState state) {
              switch (state) {
                case TimerSettingsDataErrorState():
                  return const Text('Error occured');
                case TimerSettingsDataLoadingState():
                  return const AppLoadingDisplay();
                case TimerSettingsDataLoadedState():
                  return buildLoaded(context, state.timerSettings);
              }
            }
        ),
      ),
    );
  }

  Widget buildLoaded(BuildContext context, TimerSettings timerSettings) {
    return Stack(
      fit: StackFit.expand,
      children: [
        TimerSettingsView(
          timerSettings: timerSettings,
        ),
        buildProfileMenu(context),
        buildTimerSettingsHistoryMenu(context),
      ],
    );
  }

  Widget buildProfileMenu(BuildContext context) {
    return const Positioned(
        top: AppThemeData.spacingMd,
        right: AppThemeData.spacingMd,
        child: Wrap(
          children: [
            ProfileButton(
              size: AppThemeData.circleSm,
            )
          ],
        )
    );
  }

  Widget buildTimerSettingsHistoryMenu(BuildContext context) {
    return const Positioned(
      top: AppThemeData.spacingMd,
      right: AppThemeData.spacingMd * 6,
      child: TimerSettingsHistoryButton(),
    );
  }

}
