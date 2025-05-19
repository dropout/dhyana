part of 'timer_bloc.dart';

@freezed
sealed class TimerEvent with _$TimerEvent {

  const TimerEvent._();

  const factory TimerEvent.warmupTicked({
    required int ticks,
  }) = WarmupTicked;

  const factory TimerEvent.warmupCompleted() = WarmupCompleted;
  const factory TimerEvent.started({
    required DateTime startTime,
  }) = TimerStarted;
  const factory TimerEvent.paused() = TimerPaused;
  const factory TimerEvent.resumed() = TimerResumed;
  const factory TimerEvent.completed() = TimerCompleted;
  const factory TimerEvent.timerTicked({
    required int ticks,
  }) = TimerTicked;
  const factory TimerEvent.reset() = TimerReset;
  const factory TimerEvent.error({
    Object? error,
    required StackTrace stackTrace,
  }) = TimerErrorOccurred;
  const factory TimerEvent.finished() = TimerFinished;

}
