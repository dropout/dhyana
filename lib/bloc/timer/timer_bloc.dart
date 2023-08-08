import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/service/timer_service_factory.dart';
import 'package:dhyana/util/logger_factory.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {

  final Logger logger = getLogger('TimerBloc');

  final TimerSettings timerSettings;
  final AudioService audioService;
  final CrashlyticsService crashlyticsService;
  final TimerServiceFactory timerServiceFactory;

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
  }) : super(TimerState(timerSettings: timerSettings)) {

    if (hasWarmupTime) {
      warmupTimer = timerServiceFactory.getTimerService(
        timerSettings.warmup
      );
      _warmupTickerSub = warmupTimer!.tickStream.listen(
        (t) => add(WarmupTicked(ticks: t))
      );
      _warmupFinishedSub = warmupTimer!.finishedStream.listen(
        (t) => add(WarmupCompleted())
      );
    }
    durationTimer = timerServiceFactory.getTimerService(
      timerSettings.duration
    );
    _durationTickerSub = durationTimer.tickStream.listen(
      (t) => add(TimerTicked(ticks: t))
    );
    _durationFinishedSub = durationTimer.finishedStream.listen(
      (_) => add(TimerCompleted())
    );

    on<TimerStarted>(_onTimerStarted);
    on<WarmupTicked>(_onWarmupTicked);
    on<WarmupCompleted>(_onWarmupCompleted);
    on<TimerTicked>(_onTimerTicked);
    on<TimerPaused>(_onTimerPaused);
    on<TimerResumed>(_onTimerResumed);
    on<TimerReset>(_onTimerReset);
    on<TimerCompleted>(_onTimerCompleted);
    on<FinishTimer>(_onFinishTimer);
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

  void _onTimerStarted(TimerStarted start, emit) async {
    try {
      logger.v('Starting timer');

      if (hasWarmupTime) {
        logger.v('Warming up');
        warmupTimer!.start();
        emit(state.copyWith(
          timerStatus: TimerStatus.running,
          timerStage: TimerStage.warmup,
        ));
      } else {
        logger.v('No Warmup');
        if (timerSettings.startingSound != Sound.none) {
          audioService.play(timerSettings.startingSound);
        }
        emit(state.copyWith(
          timerStatus: TimerStatus.running,
          timerStage: TimerStage.timer,
        ));
      }

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
      logger.v('Pause timer');
      activeTimer.stop();
      emit(state.copyWith(
        timerStatus: TimerStatus.paused,
        elapsedWarmupTime: (hasWarmupTime) ? warmupTimer!.elapsedTime : null,
        elapsedTime: durationTimer.elapsedTime
      ));
    } else {
      logger.v('Timer is not running, nothing to pause');
    }
  }

  void _onTimerResumed(TimerResumed resume, emit) {
    if (state.timerStatus == TimerStatus.paused) {
      logger.v('Resume timer');
      activeTimer.start();
      emit(state.copyWith(
        timerStatus: TimerStatus.running
      ));
    } else {
      logger.v('Timer is running, nothing to resume');
    }
  }

  void _onTimerReset(TimerReset reset, emit) {
    logger.v('Reset timer');
    if (hasWarmupTime) {
      warmupTimer!.reset();
    }
    durationTimer.reset();
    emit(state.copyWith(
      elapsedWarmupTime: Duration.zero,
      elapsedTime: Duration.zero,
      timerStatus: TimerStatus.idle
    ));
  }

  void _onWarmupTicked(WarmupTicked event, emit) {
    final Duration elapsedWarmupTime = warmupTimer!.elapsedTime;
    emit(state.copyWith(
      elapsedWarmupTime: elapsedWarmupTime,
    ));
  }

  void _onWarmupCompleted(WarmupCompleted event, emit) {
    logger.v('Warmup completed');
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
    logger.v('Timer completed');
    if (timerSettings.endingSound != Sound.none) {
      audioService.play(timerSettings.endingSound);
    }

    emit(state.copyWith(
      timerStatus: TimerStatus.completed,
      elapsedTime: durationTimer.elapsedTime,
    ));
  }

  // User wants to finish before timer ends
  void _onFinishTimer(FinishTimer event, emit) async {
    logger.v('Timer finished');
    warmupTimer?.stop();
    durationTimer.stop();
    emit(state.copyWith(
      timerStatus: TimerStatus.completed,
      elapsedWarmupTime: (hasWarmupTime) ? warmupTimer!.elapsedTime : null,
      elapsedTime: durationTimer.elapsedTime,
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
    logger.v('Closing resources');

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
