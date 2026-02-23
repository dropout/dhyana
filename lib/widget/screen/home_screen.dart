import 'package:dhyana/widget/home/home_screen_appbar.dart';
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

/// The main entry-point screen of the app, allowing users to choose between
/// a sitting meditation session and a chanting session, and configure settings
/// for either before starting.
///
/// [HomeScreen] is driven by [HomeScreenCubit], which is provided via
/// [HomeScreenCubitProvider]. On creation the cubit is initialised with an
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
///   the user to switch between [SessionType.sitting] and
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
  /// persisted settings and jumps straight to [SessionType.sitting] with the
  /// supplied configuration. This is used, for example, when navigating from a
  /// history entry or from a notification that carries a specific session
  /// configuration.
  ///
  /// When null, the cubit loads the last-used settings from
  /// [SharedPreferencesService].
  final TimerSettings? timerSettings;

  const HomeScreen({
    this.timerSettings,
    super.key,
  });

  /// Builds the root widget tree for the home screen.
  ///
  /// Initialises [HomeScreenCubit] via [HomeScreenCubitProvider], passing
  /// [timerSettings] to [HomeScreenCubit.init]. While the cubit is loading
  /// [AppLoadingDisplay] is shown; once loaded, [buildScaffolding] is called.
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
            bottom: DesignSpec.spacingLg,
            right: DesignSpec.spacingLg,
            child: SafeArea(child: buildToggle(context, state)),
          ),
        ],
      )
    );
  }

  /// Builds the [SessionTypeToggle] that lets the user switch between
  /// [SessionType.sitting] and [SessionType.chanting].
  ///
  /// Mode changes are forwarded to [HomeScreenCubit.setSessionType], which
  /// persists the selection via [SharedPreferencesService] and emits a new
  /// [HomeScreenStateLoaded] with the updated [SessionType].
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

  /// Builds the animated body that switches between the sitting and chanting
  /// settings views based on [HomeScreenStateLoaded.sessionType].
  ///
  /// Uses an [AnimatedSwitcher] with [Durations.medium4] and cubic easing
  /// curves to provide a smooth cross-fade transition whenever the active
  /// [SessionType] changes.
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

  /// Builds the sitting-session branch of the home screen.
  ///
  /// Wraps [TimerSettingsView] in two providers:
  ///
  /// 1. [SafeProfileSettings] — resolves the current [ProfileSettings] from
  ///    the ambient [ProfileCubit], falling back to an anonymous profile when
  ///    none is available.
  /// 2. [TimerSettingsCubitProvider] — creates a [TimerSettingsCubit] and
  ///    immediately calls [TimerSettingsCubit.loadTimerSettings] with the
  ///    [TimerSettings] carried in [state] (which may itself originate from
  ///    the [timerSettings] constructor parameter).
  ///
  /// The inner state switch shows:
  /// - [AppLoadingDisplay] while settings are loading.
  /// - [AppErrorDisplay] if an error occurred.
  /// - [TimerSettingsView] once settings are available.
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

  /// Builds the chanting-session branch of the home screen.
  ///
  /// Wraps [ChantingSettingsView] in two providers:
  ///
  /// 1. [SafeProfileSettings] — resolves the current [ProfileSettings] from
  ///    the ambient [ProfileCubit], falling back to an anonymous profile.
  /// 2. [ChantingSettingsCubitProvider] — creates a [ChantingSettingsCubit]
  ///    that manages the list of chants for the session.
  ///
  /// > **Note:** The chanting feature is under active development. The chant
  /// > list and reorder callback are currently stubs.
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
