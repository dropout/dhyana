import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'timer_completed_event.freezed.dart';

enum CompletedSessionType {
  sitting,
  chanting,
}

@freezed
sealed class TimerCompletedEvent with _$TimerCompletedEvent implements AppEvent {

  const TimerCompletedEvent._();

  factory TimerCompletedEvent({
    required String profileId,
    required String sessionId,
    required CompletedSessionType type,
    required DateTime timestamp,
  }) = _TimerCompletedEvent;

}
