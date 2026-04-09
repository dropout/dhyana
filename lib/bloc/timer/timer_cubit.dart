import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/crashlytics_service.dart';
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
  Stream<Duration> get elapsedTimeStream =>
    timerAudioService.playbackStateStream.map((playbackState) {
      return playbackState.position;
    });
}

class TimerCubit extends Cubit<TimerCubitState> with LoggerMixin {
  final TimerSettings timerSettings;
  final TimerAudioService audioService;
  final CrashlyticsService crashlyticsService;

  StreamSubscription? _playbackStateSub;
  late final TimerEventScheduler _eventScheduler;

  TimerCubit({
    required this.timerSettings,
    required this.audioService,
    required this.crashlyticsService,
  }) : super(TimerCubitState.initial(timerSettings: timerSettings)) {
    _eventScheduler = TimerEventScheduler(
      source: TimerAudioServiceElapsedTimeSource(audioService),
    );
    
    _eventScheduler.addListener(timerSettings.totalTime, _onTimerCompleted);

    _playbackStateSub = audioService.playbackStateStream.listen(
      _onPlaybackStateChanged,
    );
  }

  Future<void> start() async {
    try {
      await audioService.setupSession(timerSettings);
      audioService.start();
      _eventScheduler.reset();      

      TimerStage initialStage = timerSettings.hasWarmupTime
        ? TimerStage.warmup
        : TimerStage.timer;

      if (timerSettings.hasWarmupTime) {
        _eventScheduler.addListener(timerSettings.warmup, _warmupCompleted);
      } else {
        audioService.playSound(timerSettings.startingSound);
      }
      _eventScheduler.start();

      emit(
        state.copyWith(
          startTime: DateTime.now(),
          timerStatus: TimerStatus.running,
          timerStage: initialStage,
        ),
      );
      logger.t('Timer started - ${DateTime.now()}');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to setup sounds for timer session',
      );
      emit(state.copyWith(timerStatus: TimerStatus.error));
    }
  }

  void pause() {
    logger.t('Pausing timer - ${DateTime.now()}');
    audioService.pause();
  }

  void resume() {
    logger.t('Resuming timer - ${DateTime.now()}');
    audioService.resume();
  }

  void finish() {
    final n = DateTime.now();
    logger.t('Finishing timer - $n');
    audioService.stop();
    emit(
      state.copyWith(
        timerStatus: TimerStatus.completed,
        endTime: n,
      ),
    );
  }

  void _onPlaybackStateChanged(PlaybackState playbackState) {
    final position = playbackState.position;

    late final TimerStatus timerStatus;
    if (playbackState.processingState == AudioProcessingState.idle) {
      timerStatus = TimerStatus.idle;
      return;
    } else {
      timerStatus = playbackState.playing
        ? TimerStatus.running
        : TimerStatus.paused;      
    }    
    emit(
      state.copyWith(
        timerStatus: timerStatus,
        elapsedTime: position - timerSettings.warmup,
        elapsedWarmupTime: position >= timerSettings.warmup
          ? timerSettings.warmup
          : position,
      ),
    );
  }

  void _warmupCompleted(Duration elapsedWarmupTime) {
    logger.t('Warmup completed - ${DateTime.now()}');    
    audioService.playSound(timerSettings.startingSound);
    emit(
      state.copyWith(
        timerStatus: TimerStatus.running,
        timerStage: TimerStage.timer,
        elapsedTime: Duration.zero,
      ),
    );
  }

  void _onTimerCompleted(Duration elapsedTime) {
    final n = DateTime.now();
    logger.t('Timer completed - $n');
    final r = audioService.playSound(timerSettings.endingSound);

    r.then((_) {
      print('Sound finished playing, stopping audio service');
    });

    
    emit(
      state.copyWith(
        timerStatus: TimerStatus.completed,
        elapsedTime: elapsedTime - timerSettings.warmup,
        endTime: n,
      ),
    );
  }

  @override
  Future<void> close() {
    _playbackStateSub?.cancel();
    _playbackStateSub = null;
    _eventScheduler.dispose();
    audioService.release();
    
    return super.close();
  }

}
