import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:clock/clock.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/service/haptics_service.dart';
import 'package:dhyana/service/timer_audio_service.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:dhyana/util/timer_event_scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_state.dart';
part 'timer_cubit.freezed.dart';

class TimerAudioServiceElapsedTimeSource implements ElapsedTimeSource {
  final TimerAudioService timerAudioService;

  TimerAudioServiceElapsedTimeSource(this.timerAudioService);

  @override
  Stream<Duration> get elapsedTimeStream => timerAudioService
      .playbackStateStream
      .map((playbackState) => playbackState.position)
      .distinct();
}

class TimerCubit extends Cubit<TimerCubitState> with LoggerMixin {
  final TimerAudioService audioService;
  final HapticsService hapticsService;
  final TimerEventScheduler eventScheduler;
  final CrashlyticsService crashlyticsService;

  StreamSubscription? _playbackStateSub;

  TimerCubit({
    required TimerSettings timerSettings,
    required this.audioService,
    required this.hapticsService,
    required this.eventScheduler,
    required this.crashlyticsService,
  }) : super(TimerCubitState.initial(timerSettings: timerSettings)) {
    eventScheduler.addListener(timerSettings.totalTime, _onTimerCompleted);

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
      logger.t('Starting timer - ${clock.now()}');
      final startFuture = audioService.start(state.timerSettings);
      eventScheduler.reset();

      TimerStage initialStage = state.timerSettings.hasWarmupTime
          ? TimerStage.warmup
          : TimerStage.timer;

      Future playSoundFuture = Future.value(null);
      if (state.timerSettings.hasWarmupTime) {
        eventScheduler.addListener(
          state.timerSettings.warmup,
          _warmupCompleted,
        );
      } else {
        playSoundFuture = audioService.playSound(
          state.timerSettings.startingSound,
        );
      }
      eventScheduler.start();

      // Wait for the audio service to settle down after setting the
      // audio source and starting, before emitting the running state,
      // to avoid the brief flash of paused state on timer launch.
      await startFuture;
      emit(
        state.copyWith(
          startTime: clock.now(),
          timerStatus: TimerStatus.running,
          timerStage: initialStage,
        ),
      );
      logger.t('Timer started - ${clock.now()}');

      // Wait for the starting sound to finish
      await playSoundFuture;
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
    logger.t('Warmup completed - ${clock.now()}');
    audioService.playSound(state.timerSettings.startingSound);
    emit(state.copyWith(timerStage: TimerStage.timer));
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
