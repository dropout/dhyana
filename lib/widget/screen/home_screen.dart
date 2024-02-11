import 'package:dhyana/widget/timer/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/bloc/timer_settings/timer_settings_bloc.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/bloc_provider/timer_settings_bloc_provider.dart';
import 'package:dhyana/widget/profile/profile_button.dart';

class HomeScreen extends StatelessWidget {

  // As an initialRoute it will receive timerSettings from initResult
  // Any other case, the bloc below will load timer settings from shared prefs
  final TimerSettings? timerSettings;

  const HomeScreen({
    this.timerSettings,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TimerSettingsBlocProvider(
      initialEvent: LoadTimerSettingsData(timerSettings: timerSettings),
      child: BlocBuilder<TimerSettingsBloc, TimerSettingsState>(
        builder: (BuildContext context, TimerSettingsState state) {
          switch (state) {
            case TimerSettingsDataErrorState():
              return const Text('Error occured');
            case TimerSettingsDataLoadingState():
              return const Text('Loading');
            case TimerSettingsDataLoadedState():
              return buildLoaded(context, state.timerSettings);
          }
        }
      )
    );
  }

  Widget buildLoaded(BuildContext context, TimerSettings timerSettings) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            TimerSettingsView(
              timerSettings: timerSettings,
            ),
            buildMenu(context),
          ],
        ),
      ),
    );
  }

  Widget buildMenu(BuildContext context) {
    return const Positioned(
      top: AppThemeData.spacingMd,
      right: AppThemeData.spacingMd,
      child: Wrap(
        children: [
          ProfileButton()
        ],
      )
    );
  }

}
