import 'package:dhyana/core/presentation/viewmodel/auth_cubit.dart';
import 'package:dhyana/modules/practice/chanting/presentation/bloc/chanting_settings/chanting_settings_cubit.dart';
import 'package:dhyana/core/presentation/view/smart_bloc_provider.dart';
import 'package:dhyana/core/presentation/view/home/home_screen_appbar.dart';
import 'package:dhyana/core/presentation/viewmodel/home_screen_cubit.dart';
import 'package:dhyana/core/presentation/viewmodel/timer_settings_cubit.dart';
import 'package:dhyana/core/domain/enum/session_type.dart';
import 'package:dhyana/core/domain/entity/timer_settings.dart';
import 'package:dhyana/modules/practice/chanting/presentation/widget/chanting_settings_view.dart';
import 'package:dhyana/core/presentation/view/home/home_screen_bottom_menu.dart';
import 'package:dhyana/core/presentation/view/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/core/presentation/view/timer_settings/timer_settings_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

/// A screen that allows the user to configure and start 
/// a sitting or chanting session.
class HomeScreen extends StatelessWidget {

  /// Optional [TimerSettings] to pre-configure the sitting session branch of
  /// the home screen. If provided, the home screen will start in the
  /// [SessionType.sitting] branch with the given settings pre-loaded.
  final TimerSettings? timerSettings;

  const HomeScreen({this.timerSettings, super.key});

  /// Builds the root widget tree for the home screen.
  @override
  Widget build(BuildContext context) {
    return SmartBlocProvider<HomeScreenCubit, HomeScreenState>(
      create: (_) => GetIt.I.get<HomeScreenCubit>(
        param1: timerSettings != null
            ? SessionType.sitting
            : SessionType.chanting,
      ),
      builder: (context, state) => buildScaffolding(context, state),
    );
  }

  /// Builds the [Scaffold] that wraps the loaded home screen content.
  Widget buildScaffolding(BuildContext context, HomeScreenState state) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: HomeScreenAppbar(homeScreenState: state),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [buildBody(context, state), buildBottomMenu(context, state)],
      ),
    );
  }

  /// Builds the animated body that switches between the sitting and chanting
  /// settings views based on [HomeScreenState.sessionType].
  Widget buildBody(BuildContext context, HomeScreenState state) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        SessionType sessionType = state.sessionType;
        // TODO: Move this logic to usecase or cubit
        if (authState is! AuthStateSignedIn) {
          sessionType = .sitting;
        }
        return AnimatedSwitcher(
          key: ValueKey(sessionType),
          duration: Durations.medium4,
          // switchInCurve: Curves.fastLinearToSlowEaseIn,
          // switchOutCurve: Curves.fastLinearToSlowEaseIn,
          // layoutBuilder: (currentChild, previousChildren) {
          //   return Stack(
          //     alignment: Alignment.center,
          //     children: [
          //       ...previousChildren,
          //       if (currentChild != null) currentChild,
          //     ],
          //   );
          // },
          child: switch (sessionType) {
            SessionType.sitting => buildTimerSettingsView(context, state),
            SessionType.chanting => buildChantingSettingsView(context),
          },
        );
      },
    );
  }

  /// Builds the bottom menu that allows the user to switch between
  /// sitting and chanting session types.
  Widget buildBottomMenu(BuildContext context, HomeScreenState state) {
    return HomeScreenBottomMenu(
      sessionType: state.sessionType,
      onSessionTypeChange: (newType) {
        context.read<HomeScreenCubit>().setSessionType(newType);
      },
    );
  }

  /// Builds the sitting-session branch of the home screen.
  Widget buildTimerSettingsView(BuildContext context, HomeScreenState state) {
    return SmartBlocProvider<TimerSettingsCubit, TimerSettingsState>(
      create: (context) {
        final cubit = GetIt.instance.get<TimerSettingsCubit>();
        if (timerSettings != null) {
          cubit.timerSettingsChanged(timerSettings!);
        }
        return cubit;
      },
      builder: (context, state) {
        return TimerSettingsView(timerSettings: state.timerSettings);
      },
    );
  }

  /// Builds the chanting-session branch of the home screen.
  Widget buildChantingSettingsView(BuildContext context) {
    return SmartBlocProvider<ChantingSettingsCubit, ChantingSettingsState>(
      create: (context) => ChantingSettingsCubit(
        chantsRepository: context.repos.chantsRepository,
        sharedPreferencesService: context.services.sharedPreferencesService,
        crashlyticsService: context.services.crashlyticsService,
      )..loadAvailableChants(),
      builder: (context, state) => ChantingSettingsView(
        availableChants: state.availableChants,
      ),
    );
  }
}
