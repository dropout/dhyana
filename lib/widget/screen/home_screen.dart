import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/model/profile_settings.dart';
import 'package:dhyana/util/all.dart';
import 'package:dhyana/widget/app_bar/custom_app_bar.dart';
import 'package:dhyana/widget/bloc_provider/timer_settings_cubit_provider.dart';
import 'package:dhyana/widget/presence/presence_button.dart';
import 'package:dhyana/widget/profile/profile_button.dart';
import 'package:dhyana/widget/timer/all.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:dhyana/widget/util/signed_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/bloc/timer_settings/timer_settings_cubit.dart';
import 'package:dhyana/model/timer_settings.dart';

class HomeScreen extends StatelessWidget {

  final TimerSettings? timerSettings;

  const HomeScreen({
    this.timerSettings,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TimerSettingsCubitProvider(
      onCreate: (timerSettingsCubit) => timerSettingsCubit.loadTimerSettings(),
      child: buildScaffolding(context),
    );
  }

  Widget buildScaffolding(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(
        leading: Today(
          key: ValueKey(DateTime.now().toDayId()),
        ),
        trailing: [
          SignedIn(yes: (context, profileId) {
            return PresenceButton();
          }),
          SignedIn(yes: (context, profileId) {
            return TimerSettingsHistoryButton(profileId: profileId);
          }),
          const ProfileButton(),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<TimerSettingsCubit, TimerSettingsState>(
        builder: (BuildContext context, TimerSettingsState state) {
          switch (state) {
            case TimerSettingsDataErrorState():
              return const AppErrorDisplay();
            case TimerSettingsDataLoadingState():
              return const AppLoadingDisplay();
            case TimerSettingsDataLoadedState():
              return buildLoadedState(context, state);
          }
        }
      ),
    );
  }

  Widget buildLoadedState(BuildContext context, TimerSettingsDataLoadedState state) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, profileState) {
        if (profileState is ProfileLoadedState) {
          return TimerSettingsView(
            timerSettings: state.timerSettings,
            profileSettings: profileState.settings,
          );
        } else {
          return TimerSettingsView(
            timerSettings: state.timerSettings,
            profileSettings: ProfileSettings(id: 'anonymous'),
          );
        }
      },
    );
  }

}

