import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/util/logger_factory.dart';

part 'timer_event.dart';
part 'timer_state.dart';
part 'timer_bloc.freezed.dart';

/*

    Manages business logic of a session.

    Details:
    1. phase (optional): warmup timer
    2. phase: actual session timer

    Functionality:
    - Timer: start, pause, resume, finish, reset
    - Audio: play starting sound, play ending sound

 */
class TimerBloc extends Bloc<TimerEvent, TimerState> {

  final Logger logger = getLogger('TimerBloc');

  final TimerSettings timerSettings;
  final TimerServiceFactory timerServiceFactory;
  final AudioService audioService;

  final CrashlyticsService crashlyticsService;

  TimerService? warmupTimer;
  StreamSubscription? _warmupTickerSub;
  StreamSubscription? _warmupFinishedSub;

  late final TimerService durationTimer;
  late final StreamSubscription _durationTickerSub;
  late final StreamSubscription _durationFinishedSub;

  TimerBloc({
    required this.timerSettings,
    required this.timerServiceFactory,
    required this.audioService,
    required this.crashlyticsService,
  }) : super(TimerState.initial(timerSettings: timerSettings)) {

    // Prepare warmup timer
    if (hasWarmupTime) {
      warmupTimer = timerServiceFactory
        .getTimerService(timerSettings.warmup);
      _warmupTickerSub = warmupTimer!.tickStream.listen(
        (t) => add(WarmupTicked(ticks: t))
      );
      _warmupFinishedSub = warmupTimer!.finishedStream.listen(
        (t) => add(WarmupCompleted())
      );
    }

    // Prepare the timer for the session
    durationTimer = timerServiceFactory
      .getTimerService(timerSettings.duration);
    _durationTickerSub = durationTimer.tickStream.listen(
      (t) => add(TimerTicked(ticks: t))
    );
    _durationFinishedSub = durationTimer.finishedStream.listen(
      (t) => add(TimerCompleted())
    );

    on<TimerStarted>(_onTimerStarted);
    on<WarmupTicked>(_onWarmupTicked);
    on<WarmupCompleted>(_onWarmupCompleted);
    on<TimerTicked>(_onTimerTicked);
    on<TimerPaused>(_onTimerPaused);
    on<TimerResumed>(_onTimerResumed);
    on<TimerReset>(_onTimerReset);
    on<TimerCompleted>(_onTimerCompleted);
    on<TimerFinished>(_onFinishTimer);
    on<TimerErrorOccurred>(_onTimerErrorOccurred);
  }

  bool get hasWarmupTime {
    return (timerSettings.warmup != Duration.zero);
  }

  TimerService get activeTimer {
    if (hasWarmupTime && warmupTimer!.finished != true) {
      return warmupTimer!;
    } else {
      return durationTimer;
    }
  }

  Duration get elapsedWarmupTime {
    if (warmupTimer != null) {
      return warmupTimer!.elapsedTime;
    } else {
      return Duration.zero;
    }
  }

  void _onTimerStarted(TimerStarted start, emit) async {
    try {
      logger.t('Starting timer');
      TimerStage stage;
      if (hasWarmupTime) {
        logger.t('Has warmup time');
        warmupTimer!.start();
        stage = TimerStage.warmup;
      } else {
        logger.t('No Warmup time');
        durationTimer.start();
        if (timerSettings.startingSound != Sound.none) {
          audioService.play(timerSettings.startingSound);
        }
        stage = TimerStage.timer;
      }
      emit(state.copyWith(
        startTime: DateTime.now(),
        timerStatus: TimerStatus.running,
        timerStage: stage,
      ));
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to setup sounds for timer session'
      );
      emit(state.copyWith(
        timerStatus: TimerStatus.error,
      ));
    }
  }

  void _onTimerPaused(TimerPaused pause, emit) {
    if (state.timerStatus == TimerStatus.running) {
      logger.t('Pause timer');
      activeTimer.stop();
      emit(state.copyWith(
        timerStatus: TimerStatus.paused,
        elapsedWarmupTime: elapsedWarmupTime,
        elapsedTime: durationTimer.elapsedTime
      ));
    } else {
      logger.t('Timer is not running, nothing to pause');
    }
  }

  void _onTimerResumed(TimerResumed resume, emit) {
    if (state.timerStatus == TimerStatus.paused) {
      logger.t('Resume timer');
      activeTimer.start();
      emit(state.copyWith(
        timerStatus: TimerStatus.running
      ));
    } else {
      logger.t('Timer is running, nothing to resume');
    }
  }

  void _onTimerReset(TimerReset reset, emit) {
    logger.t('Reset timer');
    if (hasWarmupTime) {
      warmupTimer!.reset();
    }
    durationTimer.reset();
    emit(TimerState.initial(timerSettings: timerSettings));
  }

  void _onWarmupTicked(WarmupTicked event, emit) {
    final Duration elapsedWarmupTime = warmupTimer!.elapsedTime;
    emit(state.copyWith(
      elapsedWarmupTime: elapsedWarmupTime,
    ));
  }

  void _onWarmupCompleted(WarmupCompleted event, emit) {
    logger.t('Warmup completed');
    final Duration elapsedWarmupTime = warmupTimer!.elapsedTime;

    if (timerSettings.startingSound != Sound.none) {
      audioService.play(timerSettings.startingSound);
    }

    durationTimer.start();

    emit(state.copyWith(
      timerStatus: TimerStatus.running,
      timerStage: TimerStage.timer,
      elapsedWarmupTime: elapsedWarmupTime,
      elapsedTime: durationTimer.elapsedTime,
    ));
  }

  // Tick every 500ms as a default setting in timer service
  void _onTimerTicked(TimerTicked event, emit) {
    emit(state.copyWith(
      elapsedTime: durationTimer.elapsedTime,
    ));
  }

  // The timer has reached it's end
  void _onTimerCompleted(TimerCompleted completed, emit) async {
    logger.t('Timer completed');
    if (timerSettings.endingSound != Sound.none) {
      audioService.play(timerSettings.endingSound);
    }
    emit(state.copyWith(
      timerStatus: TimerStatus.completed,
      elapsedWarmupTime: elapsedWarmupTime,
      elapsedTime: durationTimer.elapsedTime,
      endTime: durationTimer.endTime,
    ));
  }

  // User wants to finish before timer ends
  void _onFinishTimer(TimerFinished event, emit) async {
    logger.t('Timer finished');
    warmupTimer?.stop();
    durationTimer.stop();
    emit(state.copyWith(
      timerStatus: TimerStatus.completed,
      elapsedWarmupTime: elapsedWarmupTime,
      elapsedTime: durationTimer.elapsedTime,
      endTime: activeTimer.endTime,
    ));
  }

  void _onTimerErrorOccurred(TimerErrorOccurred event, emit) {
    activeTimer.stop();
    emit(state.copyWith(
      timerStatus: TimerStatus.error,
    ));
    crashlyticsService.recordError(
      exception: event.error,
      stackTrace: event.stackTrace,
      reason: 'An error occurred while the timer was running'
    );
  }

  @override
  Future<void> close() {
    logger.t('Closing resources');

    _warmupFinishedSub?.cancel();
    _warmupTickerSub?.cancel();
    warmupTimer?.close();

    _durationTickerSub.cancel();
    _durationFinishedSub.cancel();
    durationTimer.close();

    audioService.close();

    return super.close();
  }

}
