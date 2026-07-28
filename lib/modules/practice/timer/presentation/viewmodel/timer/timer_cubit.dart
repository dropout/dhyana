import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:clock/clock.dart';
import 'package:dhyana/core/domain/enum/sound.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings.dart';
import 'package:dhyana/core/domain/service/crashlytics_service.dart';
import 'package:dhyana/core/domain/service/haptics_service.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_state.dart';
import 'package:dhyana/modules/practice/timer/domain/enum/timer_stage.dart';
import 'package:dhyana/modules/practice/timer/domain/enum/timer_status.dart';
import 'package:dhyana/modules/practice/timer/domain/service/timer_audio_service.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/configure_event_scheduler_use_case.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/start_timer_use_case.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/playback_state_change_use_case.dart';
import 'package:dhyana/util/duration.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:dhyana/util/timer_event_scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// part 'timer_state.dart';
part 'timer_cubit.freezed.dart';

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
class TimerCubit extends Cubit<TimerState> with LoggerMixin {
  // Services
  final TimerAudioService audioService;
  final HapticsService hapticsService;
  final TimerEventScheduler eventScheduler;
  final CrashlyticsService crashlyticsService;

  // Use cases  
  final ConfigureEventSchedulerUseCase configureEventSchedulerUseCase;
  final StartTimerUseCase startTimerUseCase;
  final PlaybackStateChangeUseCase playbackStateChangeUseCase;
  

  StreamSubscription? _playbackStateSub;

  TimerCubit({
    required TimerSettings timerSettings,
    required this.audioService,
    required this.hapticsService,
    required this.eventScheduler,
    required this.crashlyticsService,
    required this.configureEventSchedulerUseCase,
    required this.startTimerUseCase,
    required this.playbackStateChangeUseCase,
  }) : super(TimerState.initial(timerSettings: timerSettings)) {
    // _configureEventScheduler(state.timerSettings);

    // TODO: Execute event scheduler configuration from usecase

    // Frame the subscription to start after the timer is started, to avoid reacting 
    // to playback state changes before the timer starts running.
    // Also, only listen to playback state changes until the timer is completed, 
    // to avoid reacting to any playback state changes after the timer is done 
    _playbackStateSub = audioService.playbackStateStream
      .skipWhile((_) => state.startTime == null)
      .takeWhile((_) => state.timerStatus != TimerStatus.completed)
      .listen(_onPlaybackStateChanged);
  }

  Future<void> start() async {
    try {
      // logger.t('Starting timer - ${clock.now()}');
      // final startFuture = audioService.start(state.timerSettings);
      // eventScheduler.reset();      

      // TimerStage initialStage = state.timerSettings.hasWarmupTime
      //     ? TimerStage.warmup
      //     : TimerStage.timer;

      // // Play starting sound immediately if there is no warmup time
      // // otherwise, it will be played when the warmup is completed
      // Future playSoundFuture = Future.value(null);
      // if (state.timerSettings.hasWarmupTime == false) {
      //   playSoundFuture = audioService.playSound(
      //     state.timerSettings.startingSound,
      //   );
      // }

      // // Start the event scheduler
      // eventScheduler.start();

      // // Wait for the audio service to finish setting up the timer session
      // await startFuture;
      // emit(
      //   state.copyWith(
      //     startTime: clock.now(),
      //     timerStatus: TimerStatus.running,
      //     timerStage: initialStage,
      //   ),
      // );
      // logger.t('Timer started - ${clock.now()}');

      // // After waiting for the timer session to be setup, 
      // // wait for the starting sound to be played
      // // then let the method terminate
      // await playSoundFuture;
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
  void _onPlaybackStateChanged(PlaybackState playbackState) {
    final position = playbackState.position;

    // This is important so that on starting, there won't be a
    // brief flash of the paused state before the timer starts running
    late final TimerStatus timerStatus;
    if (playbackState.processingState == AudioProcessingState.idle) {
      timerStatus = TimerStatus.idle;
    } else {
      timerStatus = playbackState.playing
          ? TimerStatus.running
          : TimerStatus.paused;
    }

    emit(
      state.copyWith(
        timerStatus: timerStatus,
        elapsedWarmupTime: position >= state.timerSettings.warmup
            ? state.timerSettings.warmup
            : position,
        elapsedTime: state.timerStage == TimerStage.warmup
            ? Duration.zero
            : position - state.timerSettings.warmup,
      ),
    );
  }

  /// Handles warmup completion by playing the starting sound and transitioning
  /// to the timer stage.
  void _warmupCompleted(Duration elapsedWarmupTime) {    
    audioService.playSound(state.timerSettings.startingSound);
    emit(state.copyWith(timerStage: TimerStage.timer));
    logger.t('Warmup completed - ${clock.now()}');
  }

  /// Handles interval events by playing the interval sound.
  void _onInterval(Duration elapsedTime) {
    audioService.playSound(state.timerSettings.intervalSound);
    logger.t('Interval reached, playing interval sound: ${state.timerSettings.intervalSound.name} - Elapsed time: ${elapsedTime.formatHHmmss()}');
  }

  /// Handles timer completion by playing the ending sound
  /// and setting end time.
  void _onTimerCompleted(Duration elapsedTime) {
    final n = clock.now();
    logger.t('Timer completed - $n');

    late Future r;
    if (state.timerSettings.endingSound == .vibrate) {
      hapticsService.patternFromData(state.timerSettings.endingSound.assetPath);
      r = Future.value(null);
    } else {
      r = audioService.playSound(state.timerSettings.endingSound);      
    }

    // Only stop 'background' player after the ending sound is played,
    // to ensure the ending sound is not cut off.
    // for maintaining the OS media session, so that the 'audio' player
    // can still play the ending sound without being cut off
    r.then((_) => audioService.stop());

    emit(
      state.copyWith(
        timerStatus: TimerStatus.completed,
        elapsedTime: elapsedTime - state.timerSettings.warmup,
        endTime: n,
      ),
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
