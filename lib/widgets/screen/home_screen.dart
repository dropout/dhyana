import 'package:dhyana/widgets/timer/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/bloc/timer_settings/timer_settings_bloc.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widgets/app_colors.dart';
import 'package:dhyana/widgets/app_theme_data.dart';
import 'package:dhyana/widgets/bloc_provider/timer_settings_bloc_provider.dart';
import 'package:dhyana/widgets/profile/profile_button.dart';
import 'package:dhyana/widgets/settings/settings_button.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TimerSettingsBlocProvider(
      child: BlocBuilder<TimerSettingsBloc, TimerSettingsState>(
        builder: (BuildContext context, TimerSettingsState state) {
          switch (state) {
            case TimerSettingsDataErrorState():
              return const Text('Error occured');
            case TimerSettingsDataLoadingState():
              return const Text('Loading');
            case TimerSettingsDataLoadedState():
              return buildLoaded(context, state.timerSettings);
            default:
              return Container();
          }
        }
      )
    );
  }

  Widget buildLoaded(BuildContext context, TimerSettings timerSettings) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundPaper,
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
          SettingsIcon(),
          SizedBox(width: AppThemeData.spacingSm),
          ProfileButton()
        ],
      )
    );
  }

}
