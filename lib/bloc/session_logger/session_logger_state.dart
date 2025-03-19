part of 'session_logger_bloc.dart';

@freezed
class SessionLoggerState with _$SessionLoggerState {

  const SessionLoggerState._();

  const factory SessionLoggerState.initial() = SessionLoggerInitialState;

  factory SessionLoggerState.updated({
    required Profile oldProfile,
    required Session session,
    required Profile updatedProfile,
  }) = SessionLoggerUpdatedState;

  const factory SessionLoggerState.saving({
    required Profile oldProfile,
    required Session session,
    required Profile updatedProfile,
  }) = SessionLoggerSavingState;

  factory SessionLoggerState.saved({
    required Profile oldProfile,
    required Session session,
    required Profile updatedProfile,
  }) = SessionLoggerSavedState;

  factory SessionLoggerState.error() = SessionLoggerErrorState;
}
