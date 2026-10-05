import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_started_event.freezed.dart';


@freezed
sealed class TimerStartedEvent with _$TimerStartedEvent implements AppEvent {

  const TimerStartedEvent._();

  factory TimerStartedEvent({
    required DateTime timestamp,
  }) = _TimerStartedEvent;

}
