part of 'session_logger_bloc.dart';

@freezed
class SessionLoggerEvent with _$SessionLoggerEvent {

  const factory SessionLoggerEvent.logSession({
    required String profileId,
    required DateTime startTime,
    required DateTime endTime,
    required Duration duration,
    required TimerSettings timerSettings,
  }) = LogSessionEvent;

}
