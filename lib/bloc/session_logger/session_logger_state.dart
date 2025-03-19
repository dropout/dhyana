part of 'session_logger_bloc.dart';

@freezed
class SessionLoggerState with _$SessionLoggerState {

  const SessionLoggerState._();

  const factory SessionLoggerState.initial() = SessionLoggerInitialState;
  const factory SessionLoggerState.loading() = SessionLoggerLoadingState;
  const factory SessionLoggerState.error() = SessionLoggerErrorState;

  const factory SessionLoggerState.saving({
    required Profile oldProfile,
    required Session session,
    required Profile updatedProfile,
  }) = SessionLoggerSavingState;

  const factory SessionLoggerState.saved({
    required Profile oldProfile,
    required Session session,
    required Profile updatedProfile,
  }) = SessionLoggerSavedState;

}
