import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/presence/presence_cubit.dart';
import 'package:dhyana/bloc/timer/timer_cubit.dart';
import 'package:dhyana/bloc/timer_settings_history/timer_settings_history_cubit.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/timer_audio_service.dart';
import 'package:dhyana/util/timer_event_scheduler.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef TimerContextHook =
  void Function(
    TimerCubit timerCubit,
    PresenceCubit presenceCubit,
    TimerSettingsHistoryCubit timerSettingsHistoryCubit,
    String? profileId,
  );

/// A widget that provides the necessary BLoCs for the timer screen and handles 
/// their initialization and disposal.
class TimerContext extends StatefulWidget {
  
  /// The default initialization hook for the timer context. This will start the timer
  /// and initialize presence and timer settings history if a profile ID is provided.
  static void defaultInitHook(
    TimerCubit timerCubit,
    PresenceCubit presenceCubit,
    TimerSettingsHistoryCubit timerSettingsHistoryCubit,
    String? profileId,
  ) {
    timerCubit.start();
    if (profileId != null) {
      presenceCubit.showPresence(profileId);
      timerSettingsHistoryCubit.saveSettings(profileId, timerCubit.state.timerSettings);
    }
  }

  /// The timer settings to initialize the timer with.
  final TimerSettings timerSettings;

  /// An optional initialization hook that can be used to customize the initialization
  final TimerContextHook? onInit;
  
  /// The child widget that will have access to the provided BLoCs.
  final Widget child;

  const TimerContext({
    required this.timerSettings,
    this.onInit,
    required this.child,
    super.key,
  });

  @override
  State<TimerContext> createState() => _TimerContextState();
}

class _TimerContextState extends State<TimerContext> {
  late final TimerCubit timerCubit;
  late final PresenceCubit presenceCubit;
  late final TimerSettingsHistoryCubit timerSettingsHistoryCubit;

  @override
  void initState() {
    final profileId = context.read<AuthCubit>().state.maybeWhen(
      signedIn: (user) => user.uid,
      orElse: () => null,
    );

    timerCubit = createTimerCubit(
      widget.timerSettings, 
      context.services
    );
    
    presenceCubit = createPresenceCubit(
      context.services, 
      context.repos
    );
    timerSettingsHistoryCubit = createTimerSettingsHistoryCubit(
      context.services, 
      context.repos
    );

    widget.onInit?.call(
      timerCubit,
      presenceCubit,
      timerSettingsHistoryCubit,
      profileId,
    );

    super.initState();
  }

  @override
  void dispose() {
    timerCubit.close();
    presenceCubit.close();
    timerSettingsHistoryCubit.close();
    super.dispose();
  }

  TimerCubit createTimerCubit(TimerSettings timerSettings, Services services) {
    final TimerAudioService timerAudioService = TimerAudioService(
      services.audioHandler,
    );
    final timerCubit = TimerCubit(
      timerSettings: timerSettings,
      audioService: timerAudioService,
      eventScheduler: TimerEventScheduler(
        source: TimerAudioServiceElapsedTimeSource(timerAudioService),
      ),
      crashlyticsService: services.crashlyticsService,
    );
    return timerCubit;
  }

  PresenceCubit createPresenceCubit(Services services, Repositories repos) {
    final presenceCubit = PresenceCubit(
      presenceRepository: repos.presenceRepository,
      profileRepository: repos.profileRepository,
      crashlyticsService: services.crashlyticsService,
    );
    return presenceCubit;
  }

  TimerSettingsHistoryCubit createTimerSettingsHistoryCubit(
    Services services,
    Repositories repos,
  ) {
    final timerSettingsHistoryCubit = TimerSettingsHistoryCubit(
      timerSettingsHistoryRepository: repos.timerSettingsHistoryRepository,
      timerSettingsSharedPrefsService: services.timerSettingsSharedPrefsService,
      crashlyticsService: services.crashlyticsService,
    );
    return timerSettingsHistoryCubit;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: timerCubit),
        BlocProvider.value(value: presenceCubit),
        BlocProvider.value(value: timerSettingsHistoryCubit),
      ],
      child: widget.child,
    );
  }
}
