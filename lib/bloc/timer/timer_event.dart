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

/*

abstract class TimerEvent extends Equatable {
  const TimerEvent();
}

class WarmupTicked extends TimerEvent {
  final int ticks;

  const WarmupTicked({
    required this.ticks,
  });

  @override
  List<Object?> get props => [ticks];

  @override
  String toString() => 'WarmupTicked { ticks: $ticks }';
}

class WarmupCompleted extends TimerEvent {
  @override
  List<Object?> get props => [];
}

class TimerStarted extends TimerEvent {
  @override
  List<Object> get props => [];
}

class TimerPaused extends TimerEvent {
  @override
  List<Object> get props => [];
}

class TimerResumed extends TimerEvent {
  @override
  List<Object> get props => [];
}

class TimerReset extends TimerEvent {
  @override
  List<Object> get props => [];
}

class TimerCompleted extends TimerEvent {
  @override
  List<Object> get props => [];
}

class TimerTicked extends TimerEvent {
  final int ticks;

  const TimerTicked({required this.ticks});

  @override
  List<Object> get props => [ticks];

  @override
  String toString() => 'TimerTicked { ticks: $ticks }';
}

class FinishTimer extends TimerEvent {
  @override
  List<Object> get props => [];
}

class TimerErrorOccurred extends TimerEvent {

  final Object? error;
  final StackTrace stackTrace;

  const TimerErrorOccurred({
    required this.stackTrace,
    this.error,
  });

  @override
  List<Object?> get props => [error, stackTrace];
}

*/
