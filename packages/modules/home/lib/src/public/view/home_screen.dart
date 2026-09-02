import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:core/core.dart';
import 'package:home/src/public/enum/home_screen_view_state.dart';
import 'package:home/src/public/viewmodel/home_screen_cubit.dart';
import 'package:timer/timer.dart';
import 'package:chanting/chanting.dart';
import 'home_screen_appbar.dart';
import 'home_screen_bottom_menu.dart';

/// A screen that allows the user to configure and start
/// a sitting or chanting session.
class HomeScreen extends StatelessWidget {
  /// Optional [TimerSettings] to pre-configure the sitting session branch of
  /// the home screen. If provided, the home screen will start in the
  /// [HomeScreenViewState.sitting] branch with the given settings pre-loaded.
  final TimerSettings? timerSettings;

  const HomeScreen({this.timerSettings, super.key});

  void _onSessionTypeChange(
    BuildContext context,
    HomeScreenViewState sessionType,
  ) {
    context.read<HomeScreenCubit>().setSessionType(sessionType);
  }

  /// Builds the root widget tree for the home screen.
  @override
  Widget build(BuildContext context) {
    return SmartBlocProvider<HomeScreenCubit, HomeScreenState>(
      create: (_) => GetIt.I.get<HomeScreenCubit>(
        param1: (timerSettings != null) ? HomeScreenViewState.sitting : null,
      ),
      builder: (context, state) => buildScaffolding(context, state),
    );
  }

  /// Builds the [Scaffold] that wraps the loaded home screen content.
  Widget buildScaffolding(BuildContext context, HomeScreenState state) {
    return Scaffold(
      key: const Key('home_screen_scaffold'),
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
    return BlocBuilder<AuthStateCubit, AuthState>(
      builder: (context, authState) {
        HomeScreenViewState sessionType = state.sessionType;
        // TODO: Move this logic to usecase or cubit
        if (authState is! AuthStateSignedIn) {
          sessionType = .sitting;
        }
        return AnimatedSwitcher(
          key: ValueKey(sessionType),
          duration: Durations.long4,
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: switch (sessionType) {
            HomeScreenViewState.sitting => buildTimerSettingsView(
              context,
              state,
            ),
            HomeScreenViewState.chanting => buildChantingSettingsView(context),
          },
        );
      },
    );
  }

  /// Builds the bottom menu that allows the user to switch between
  /// sitting and chanting session types.
  Widget buildBottomMenu(BuildContext context, HomeScreenState state) =>
      HomeScreenBottomMenu(
        sessionType: state.sessionType,
        onSessionTypeChange: (newType) {
          _onSessionTypeChange(context, newType);
        },
      );

  /// Builds the sitting-session branch of the home screen.
  Widget buildTimerSettingsView(BuildContext context, HomeScreenState state) =>
      TimerSettingsView.withCubit(timerSettings: timerSettings);

  /// Builds the chanting-session branch of the home screen.
  Widget buildChantingSettingsView(BuildContext context) =>
      ChantingSettingsView.withCubit();
}
