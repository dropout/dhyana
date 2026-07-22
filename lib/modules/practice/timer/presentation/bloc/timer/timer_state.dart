part of 'timer_cubit.dart';

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
sealed class TimerCubitState with _$TimerCubitState {

  const TimerCubitState._();

  const factory TimerCubitState({
    required TimerSettings timerSettings,
    required TimerStatus timerStatus,
    required TimerStage timerStage,
    required Duration elapsedWarmupTime,
    required Duration elapsedTime,
    DateTime? startTime,
    DateTime? endTime,
  }) = _TimerCubitState;

  factory TimerCubitState.initial({required TimerSettings timerSettings}) {
    return TimerCubitState(
      timerSettings: timerSettings,
      timerStatus: TimerStatus.idle,
      timerStage: (timerSettings.warmup != Duration.zero) 
        ? TimerStage.warmup 
        : TimerStage.timer,
      elapsedWarmupTime: Duration.zero,
      elapsedTime: Duration.zero,
    );
  }

  factory TimerCubitState.completed({
    required TimerSettings timerSettings,
    required DateTime startTime,
    required DateTime endTime,
    required Duration elapsedTime,
    required Duration elapsedWarmupTime,
  }) {
    return TimerCubitState(
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
