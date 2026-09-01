import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_session_started_event.freezed.dart';

@freezed
sealed class TimerSessionStartedEvent with _$TimerSessionStartedEvent implements AppEvent {
  const factory TimerSessionStartedEvent({
    required DateTime timestamp,
  }) = _TimerSessionStartedEvent;
}