part of 'sessions_bloc.dart';

@freezed
class SessionsEvent with _$SessionsEvent {

  const factory SessionsEvent.started() = _Started;

  const factory SessionsEvent.addSession({
    required String profileId,
    required DateTime startTime,
    required DateTime endTime,
    required TimerSettings timerSettings,
  }) = AddSessionEvent;

  const factory SessionsEvent.loadSessions({
    required Profile profile,
  }) = LoadSessionsEvent;

}
