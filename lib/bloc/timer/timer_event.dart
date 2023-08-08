part of 'timer_bloc.dart';

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
