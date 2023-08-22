part of 'timer_bloc.dart';

@freezed
sealed class TimerEvent with _$TimerEvent {

  const TimerEvent._();

  factory TimerEvent.warmupTicked({
    required int ticks,
  }) = WarmupTicked;

  factory TimerEvent.warmupCompleted() = WarmupCompleted;
  factory TimerEvent.started() = TimerStarted;
  factory TimerEvent.paused() = TimerPaused;
  factory TimerEvent.resumed() = TimerResumed;
  factory TimerEvent.completed() = TimerCompleted;
  factory TimerEvent.timerTicked({
    required int ticks,
  }) = TimerTicked;
  factory TimerEvent.reset() = TimerReset;
  factory TimerEvent.error({
    Object? error,
    required StackTrace stackTrace,
  }) = TimerErrorOccurred;
  factory TimerEvent.timerStarted() = FinishTimer;

}
