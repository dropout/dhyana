import 'package:dhyana/bloc/home_screen/home_screen_appbar.dart';
import 'package:dhyana/bloc/home_screen/home_screen_cubit.dart';
import 'package:dhyana/bloc/timer_settings/timer_settings_cubit.dart';
import 'package:dhyana/enum/session_type.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/bloc_provider/chanting_settings_provider.dart';
import 'package:dhyana/widget/bloc_provider/home_screen_cubit_provider.dart';
import 'package:dhyana/widget/bloc_provider/safe_profile_settings.dart';
import 'package:dhyana/widget/bloc_provider/timer_settings_cubit_provider.dart';
import 'package:dhyana/widget/chanting/chanting_settings_view.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/home/session_type_toggle.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/widget/timer/timer_settings_view.dart';


class HomeScreen extends StatelessWidget {

  final TimerSettings? timerSettings;

  const HomeScreen({
    this.timerSettings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomeScreenCubitProvider(
      onCreate: (context, cubit) => cubit.init(timerSettings),
      builder: (context, state) {
        return switch (state) {
          HomeScreenStateLoading() => const AppLoadingDisplay(),
          HomeScreenStateLoaded() => buildScaffolding(context, state),
        };
      }
    );
  }

  Widget buildScaffolding(BuildContext context, HomeScreenStateLoaded state) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: HomeScreenAppbar(homeScreenState: state),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          buildBody(context, state),
          Positioned(
            bottom: DesignSpec.spacingLg,
            right: DesignSpec.spacingLg,
            child: SafeArea(child: buildToggle(context, state)),
          ),
        ],
      )
    );
  }

  Widget buildToggle(BuildContext context, HomeScreenStateLoaded state) {
    return SessionTypeToggle(
      activeMode: state.sessionType,
      onModeChanged: (mode) {
        switch (mode) {
          case SessionType.sitting:
            context.read<HomeScreenCubit>().setSessionType(SessionType.sitting);
            break;
          case SessionType.chanting:
            context.read<HomeScreenCubit>().setSessionType(SessionType.chanting);
            break;
        }
      },
    );
  }

  Widget buildBody(BuildContext context, HomeScreenStateLoaded state) {
    return AnimatedSwitcher(
      duration: Durations.medium4,
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      // layoutBuilder: (currentChild, previousChildren) {
      //   return Stack(
      //     alignment: Alignment.center,
      //     children: [
      //       ...previousChildren,
      //       if (currentChild != null) currentChild,
      //     ],
      //   );
      // },
      child: switch (state.sessionType) {
        SessionType.sitting => buildTimerSettingsView(context, state),
        SessionType.chanting => buildChantingSettingsView(context),
      },
    );
  }

  Widget buildTimerSettingsView(BuildContext context, HomeScreenStateLoaded state) {
    return SafeProfileSettings(
      key: ValueKey('timer_settings_branch'),
      builder: (context, profileSettings) => TimerSettingsCubitProvider(
        onCreate: (cubit) => cubit.loadTimerSettings(timerSettings: state.timerSettings),
        builder: (context, state) {
          return switch (state) {
            TimerSettingsDataErrorState() => const AppErrorDisplay(),
            TimerSettingsDataLoadingState() => const AppLoadingDisplay(),
            TimerSettingsDataLoadedState() => TimerSettingsView(
              timerSettings: state.timerSettings,
              profileSettings: profileSettings,
            ),
          };
        }
      )
    );
  }

  Widget buildChantingSettingsView(BuildContext context) {
    return SafeProfileSettings(
      key: ValueKey('chanting_settings_branch'),
      builder: (context, profileSettings) => ChantingSettingsCubitProvider(
        builder: (context, state) => ChantingSettingsView(
          chants: [],
          onReorder: (int oldIndex, int newIndex) {  },
        )
      )
    );
  }
}
