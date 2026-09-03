import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/core.dart';
import 'package:timer/src/data/mapper/timer_settings_mapper.dart';
import 'package:timer/src/domain/entity/playback_state_entity.dart';
import 'package:timer/src/domain/entity/timer_state_entity.dart';
import 'package:timer/src/domain/enum/timer_stage.dart';
import 'package:timer/src/domain/enum/timer_status.dart';
import 'package:timer/src/domain/service/timer_audio_service.dart';
import 'package:timer/src/domain/usecase/complete_timer_use_case.dart';
import 'package:timer/src/domain/usecase/configure_event_scheduler_use_case.dart';
import 'package:timer/src/domain/usecase/start_timer_use_case.dart';
import 'package:timer/src/domain/usecase/playback_state_change_use_case.dart';
import 'package:timer/src/public/model/timer_settings.dart';

/// A source of elapsed time that is based
/// on the playback state of a [TimerAudioService].
/// To keep the timer running in the background we must rely on audio playback,
/// so we use the playback state of the audio service that plays a silent sound
/// to determine the elapsed time.
class TimerAudioServiceElapsedTimeSource implements ElapsedTimeSource {
  final TimerAudioService timerAudioService;

  const TimerAudioServiceElapsedTimeSource(this.timerAudioService);

  @override
  Stream<Duration> get elapsedTimeStream => timerAudioService
      .playbackStateStream
      .map((playbackState) => playbackState.position)
      .distinct();
}

/// Cubit that manages the state of a timer,
/// including its settings, status, and elapsed time.
/// In this viewmodel, we skip usecases that would
/// contain a single line service calßl for pragmatic reasons.
class TimerCubit extends Cubit<TimerStateEntity> with LoggerMixin {
  
  // Services
  final SessionNavigator sessionNavigator;
  final TimerAudioService audioService;
  final TimerEventScheduler eventScheduler;
  final CrashlyticsService crashlyticsService;

  // Use cases
  final ConfigureEventSchedulerUseCase configureEventSchedulerUseCase;
  final StartTimerUseCase startTimerUseCase;
  final PlaybackStateChangeUseCase playbackStateChangeUseCase;
  final CompleteTimerUseCase completeTimerUseCase;

  // Subscription to the playback state stream of the audio service.
  StreamSubscription? _playbackStateSub;

  TimerCubit({
    required TimerSettings timerSettings,
    required this.sessionNavigator,
    required this.audioService,
    required this.eventScheduler,
    required this.crashlyticsService,
    required this.configureEventSchedulerUseCase,
    required this.startTimerUseCase,
    required this.playbackStateChangeUseCase,
    required this.completeTimerUseCase,
  }) : super(
         TimerStateEntity.initial(timerSettings: timerSettings.toDomain()),
       ) {
    configureEventSchedulerUseCase.execute(
      timerSettings: state.timerSettings,
      onWarmupCompleted: _warmupCompleted,
      onInterval: _onInterval,
      onTimerCompleted: _onTimerCompleted,
    );

    // Frame the subscription to start after the timer is started, to avoid reacting
    // to playback state changes before the timer starts running.
    // Also, only listen to playback state changes until the timer is completed,
    // to avoid reacting to any playback state changes after the timer is done
    _playbackStateSub = audioService.playbackStateStream
        .skipWhile((_) => state.startTime == null)
        .takeWhile((_) => state.timerStatus != TimerStatus.completed)
        .listen((pbState) => _onPlaybackStateChanged(pbState));
  }

  Future<void> start() async {
    try {
      emit(await startTimerUseCase.execute(state));
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to setup timer session',
      );
      emit(state.copyWith(timerStatus: TimerStatus.error));
    }
  }

  void pause() {
    logger.t('Pausing timer - ${clock.now()}');
    audioService.pause();
  }

  void resume() {
    logger.t('Resuming timer - ${clock.now()}');
    audioService.resume();
  }

  void finish() {
    final n = clock.now();
    logger.t('Finishing timer - $n');
    audioService.stop();
    eventScheduler.stop();
    emit(state.copyWith(timerStatus: TimerStatus.completed, endTime: n));
  }

  /// Updates time values, and playing/paused status based on [playbackState]
  /// changes from the audio service.
  void _onPlaybackStateChanged(PlaybackStateEntity playbackState) {
    emit(playbackStateChangeUseCase.execute(playbackState, state));
    // Avoid noisy logs
  }

  /// Handles warmup completion by playing the starting sound and transitioning
  /// to the timer stage.
  /// No usecase for this one liner for pragmatic reasons.
  void _warmupCompleted(Duration elapsedWarmupTime) {
    audioService.playSound(state.timerSettings.startingSound);
    emit(state.copyWith(timerStage: TimerStage.timer));
    logger.t('Warmup completed - ${clock.now()}');
  }

  /// Handles interval events by playing the interval sound.
  /// No usecase for this one liner for pragmatic reasons.
  void _onInterval(Duration elapsedTime) {
    audioService.playSound(state.timerSettings.intervalSound);
    logger.t(
      'Interval reached, playing interval sound: ${state.timerSettings.intervalSound.name} - Elapsed time: ${elapsedTime.formatHHmmss()}',
    );
  }

  /// Handles timer completion by executing the complete timer use case
  /// and navigating to the session completed screen with the completed session data.
  void _onTimerCompleted(Duration elapsedTime) async {
    final result = await completeTimerUseCase.execute(state, elapsedTime);
    emit(result.timerState);
    logger.t('Navigating to session completed screen');

    sessionNavigator.navigateToSessionCompletedScreen(
      startTime: 
          state.startTime ?? DateTime.now().subtract(state.elapsedTime),
      endTime: state.endTime ?? DateTime.now(),
      duration: state.elapsedTime,
      sessionType: .chanting,
    );
  }

  @override
  Future<void> close() {
    _playbackStateSub?.cancel();
    _playbackStateSub = null;
    eventScheduler.stop();
    eventScheduler.dispose();
    audioService.stop();

    return super.close();
  }
}
