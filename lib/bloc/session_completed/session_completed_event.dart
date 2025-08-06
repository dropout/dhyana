part of 'session_completed_bloc.dart';

@freezed
sealed class SessionCompletedEvent with _$SessionCompletedEvent {

  const SessionCompletedEvent._();

  const factory SessionCompletedEvent.logSession({
    required String profileId,
    required Session session,
    void Function(UpdateProfileStatsResult updateResults)? onComplete,
    void Function(Object? error, StackTrace stack)? onError,
  }) = LogSessionEvent;

}
