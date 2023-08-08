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

class TimerState extends Equatable {

  final TimerSettings timerSettings;
  final TimerStatus timerStatus;
  final TimerStage timerStage;
  final Duration elapsedWarmupTime;
  final Duration elapsedTime;

  const TimerState({
    this.timerSettings = const TimerSettings(duration: Duration.zero),
    this.timerStatus = TimerStatus.idle,
    this.timerStage = TimerStage.warmup,
    this.elapsedWarmupTime = Duration.zero,
    this.elapsedTime = Duration.zero,
  });

  TimerState copyWith({
    TimerSettings? timerSettings,
    TimerStatus? timerStatus,
    TimerStage? timerStage,
    Duration? elapsedWarmupTime,
    Duration? elapsedTime,
  }) {
    return TimerState(
      timerSettings: timerSettings ?? this.timerSettings,
      timerStatus: timerStatus ?? this.timerStatus,
      timerStage: timerStage ?? this.timerStage,
      elapsedWarmupTime: elapsedWarmupTime ?? this.elapsedWarmupTime,
      elapsedTime: elapsedTime ?? this.elapsedTime,
    );
  }

  @override
  List<Object> get props => [
    timerSettings,
    timerStatus,
    timerStage,
    elapsedWarmupTime,
    elapsedTime,
  ];

  @override
  String toString() {
    return 'TimerState { '
      'timerSettings: $timerSettings '
      'timerStatus: $timerStatus '
      'timerStage: $timerStage '
      'elapsedTime: $elapsedTime '
      'elapsedWarmupTime: $elapsedWarmupTime'
    ' }';
  }

}
