part of 'timer_bloc.dart';

enum TimerStatus {
  idle,
  running,
  paused,
  completed,
  error,
}

enum TimerStage {
  warmup,
  timer
}

@freezed
sealed class TimerState with _$TimerState {

  const TimerState._();

  const factory TimerState({
    required TimerSettings timerSettings,
    required TimerStatus timerStatus,
    required TimerStage timerStage,
    required Duration elapsedWarmupTime,
    required Duration elapsedTime,
    DateTime? startTime,
    DateTime? endTime,
  }) = _TimerState;

  factory TimerState.initial({required TimerSettings timerSettings}) {
    return TimerState(
      timerSettings: timerSettings,
      timerStatus: TimerStatus.idle,
      timerStage: (timerSettings.warmup != Duration.zero) ? TimerStage.warmup : TimerStage.timer,
      elapsedWarmupTime: Duration.zero,
      elapsedTime: Duration.zero,
    );
  }

  factory TimerState.completed({
    required TimerSettings timerSettings,
    required DateTime startTime,
    required DateTime endTime,
    required Duration elapsedTime,
    required Duration elapsedWarmupTime,
  }) {
    return TimerState(
      timerSettings: timerSettings,
      timerStatus: TimerStatus.completed,
      timerStage: TimerStage.timer,
      elapsedWarmupTime: elapsedWarmupTime,
      elapsedTime: elapsedTime,
      startTime: startTime,
      endTime: endTime,
    );
  }







}
