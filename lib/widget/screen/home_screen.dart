import 'package:dhyana/bloc/chanting_settings/chanting_settings_cubit.dart';
import 'package:dhyana/widget/context/smart_bloc_provider.dart';
import 'package:dhyana/widget/home/home_screen_appbar.dart';
import 'package:dhyana/bloc/home_screen/home_screen_cubit.dart';
import 'package:dhyana/bloc/timer_settings/timer_settings_cubit.dart';
import 'package:dhyana/enum/session_type.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/context/safe_profile_settings.dart';
import 'package:dhyana/widget/chanting/chanting_settings_view.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/home/session_type_toggle.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:dhyana/widget/util/signed_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/widget/timer/timer_settings_view.dart';

/// The main entry-point screen of the app, allowing users to choose between
/// a sitting meditation session and a chanting session, and configure settings
/// for either before starting.
///
/// [HomeScreen] is driven by [HomeScreenCubit].
/// On creation the cubit is initialised with an
/// optional [timerSettings] value so that callers can deep-link directly into a
/// pre-configured sitting session (e.g. from a notification or a history entry).
///
/// ## State machine
///
/// | [HomeScreenState]          | Rendered widget                        |
/// |----------------------------|----------------------------------------|
/// | [HomeScreenStateLoading]   | [AppLoadingDisplay] (full-screen)      |
/// | [HomeScreenStateLoaded]    | Full [Scaffold] with body and app-bar  |
///
/// ## Layout
///
/// Once loaded, the screen renders:
/// - A [HomeScreenAppbar] at the top (extends behind the app-bar area).
/// - A body area that switches between [buildTimerSettingsView] and
///   [buildChantingSettingsView] depending on the active [SessionType].
/// - A [SessionTypeToggle] anchored to the bottom-right corner, allowing
///   the user to switch between [SessionType.timer] and
///   [SessionType.chanting] at any time.
///
/// Transitions between the two session views are animated using an
/// [AnimatedSwitcher].
///
/// ## Data flow
///
/// ```
/// HomeScreen
///   └─ HomeScreenCubitProvider  (creates & owns HomeScreenCubit)
///        └─ HomeScreenStateLoaded
///             ├─ buildTimerSettingsView
///             │    ├─ SafeProfileSettings  (reads ProfileSettings from ProfileCubit)
///             │    └─ TimerSettingsCubitProvider → TimerSettingsView
///             └─ buildChantingSettingsView
///                  ├─ SafeProfileSettings
///                  └─ ChantingSettingsCubitProvider → ChantingSettingsView
/// ```
class HomeScreen extends StatelessWidget {
  /// Optional pre-configured timer settings to seed the sitting session with.
  ///
  /// When non-null, [HomeScreenCubit.init] uses this value to skip loading
  /// persisted settings and jumps straight to [SessionType.timer] with the
  /// supplied configuration. This is used, for example, when navigating from a
  /// history entry or from a notification that carries a specific session
  /// configuration.
  ///
  /// When null, the cubit loads the last-used settings from
  /// [SharedPreferencesService].
  final TimerSettings? timerSettings;

  const HomeScreen({this.timerSettings, super.key});

  /// Builds the root widget tree for the home screen.
  ///
  /// Initialises [HomeScreenCubit], passing
  /// [timerSettings] to [HomeScreenCubit.init]. While the cubit is loading
  /// [AppLoadingDisplay] is shown; once loaded, [buildScaffolding] is called.
  @override
  Widget build(BuildContext context) {
    return SmartBlocProvider<HomeScreenCubit, HomeScreenState>(
      create: (context) => HomeScreenCubit(
        sharedPreferencesService: context.services.sharedPreferencesService,
        crashlyticsService: context.services.crashlyticsService,
      )..init(timerSettings),
      builder: (context, state) {
        return switch (state) {
          HomeScreenStateLoading() => const AppLoadingDisplay(),
          HomeScreenStateLoaded() => buildScaffolding(context, state),
        };
      },
    );
  }

  /// Builds the [Scaffold] that wraps the loaded home screen content.
  ///
  /// The scaffold contains:
  /// - A [HomeScreenAppbar] that is extended behind the app-bar region.
  /// - A full-expand [Stack] with [buildBody] filling the background and
  ///   a bottom-right-anchored [SessionTypeToggle] floating above it.
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
            bottom: DesignSpec.spacingLg - 2,
            right: DesignSpec.spacingXl,
            child: SafeArea(child: buildToggle(context, state)),
          ),
        ],
      ),
    );
  }

  /// Builds the [SessionTypeToggle] that lets the user switch between
  /// [SessionType.timer] and [SessionType.chanting].
  ///
  /// Mode changes are forwarded to [HomeScreenCubit.setSessionType], which
  /// persists the selection via [SharedPreferencesService] and emits a new
  /// [HomeScreenStateLoaded] with the updated [SessionType].
  Widget buildToggle(BuildContext context, HomeScreenStateLoaded state) {
    return SignedIn(
      yes: (context, uid) => SessionTypeToggle(
        activeMode: state.sessionType,
        onModeChanged: (mode) {
          final hsCubit = context.read<HomeScreenCubit>();
          switch (mode) {
            case SessionType.timer:
              hsCubit.setSessionType(SessionType.timer);
              break;
            case SessionType.chanting:
              hsCubit.setSessionType(SessionType.chanting);
              break;
          }
        },
      ),
      no: const SizedBox.shrink(),
    );
  }

  /// Builds the animated body that switches between the sitting and chanting
  /// settings views based on [HomeScreenStateLoaded.sessionType].
  ///
  /// Uses an [AnimatedSwitcher] with [Durations.medium4] and cubic easing
  /// curves to provide a smooth cross-fade transition whenever the active
  /// [SessionType] changes.
  Widget buildBody(BuildContext context, HomeScreenStateLoaded state) {
    return AnimatedSwitcher(
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
      child: switch (state.sessionType) {
        SessionType.timer => buildTimerSettingsView(context, state),
        SessionType.chanting => buildChantingSettingsView(context),
      },
    );
  }

  /// Builds the sitting-session branch of the home screen.
  ///
  /// Wraps [TimerSettingsView] in a [SafeProfileSettings] provider:
  ///
  /// 1. [SafeProfileSettings] — resolves the current [ProfileSettings] from
  ///    the ambient [ProfileCubit], falling back to an anonymous profile when
  ///    none is available.
  ///
  /// The inner state switch shows:
  /// - [AppLoadingDisplay] while settings are loading.
  /// - [AppErrorDisplay] if an error occurred.
  /// - [TimerSettingsView] once settings are available.
  Widget buildTimerSettingsView(
    BuildContext context,
    HomeScreenStateLoaded state,
  ) {
    return SafeProfileSettings(
      key: ValueKey('timer_settings_branch'),
      builder: (context, profileSettings) =>
          SmartBlocProvider<TimerSettingsCubit, TimerSettingsState>(
            create: (context) => TimerSettingsCubit(
              crashlyticsService: context.services.crashlyticsService,
              timerSettingsSharedPrefsService:
                  context.services.timerSettingsSharedPrefsService,
            )..loadTimerSettings(timerSettings: timerSettings),
            builder: (context, state) {
              return switch (state) {
                TimerSettingsDataErrorState() => const AppErrorDisplay(),
                TimerSettingsDataLoadingState() => const AppLoadingDisplay(),
                TimerSettingsDataLoadedState() => TimerSettingsView(
                  timerSettings: state.timerSettings,
                  profileSettings: profileSettings,
                ),
              };
            },
          ),
    );
  }

  /// Builds the chanting-session branch of the home screen.
  ///
  /// Wraps [ChantingSettingsView] in a [SafeProfileSettings] provider:
  ///
  /// 1. [SafeProfileSettings] — resolves the current [ProfileSettings] from
  ///    the ambient [ProfileCubit], falling back to an anonymous profile.
  ///
  Widget buildChantingSettingsView(BuildContext context) {
    return SafeProfileSettings(
      key: ValueKey('chanting_settings_branch'),
      builder: (context, profileSettings) =>
          SmartBlocProvider<ChantingSettingsCubit, ChantingSettingsState>(
            create: (context) => ChantingSettingsCubit(
              chantsRepository: context.repos.chantsRepository,
              sharedPreferencesService:
                  context.services.sharedPreferencesService,
              crashlyticsService: context.services.crashlyticsService,
            )..loadAvailableChants(),
            builder: (context, state) => ChantingSettingsView(
              availableChants: state.availableChants,
              profileSettings: profileSettings,
            ),
          ),
    );
  }
}
