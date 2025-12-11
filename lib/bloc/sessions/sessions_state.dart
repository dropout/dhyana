part of 'sessions_cubit.dart';

@freezed
class SessionsState with _$SessionsState {

  const factory SessionsState.initial() = _Initial;

  const factory SessionsState.loading() = SessionsLoading;
  const factory SessionsState.loaded({
    required List<Session> sessions,
  }) = SessionsLoaded;
  const factory SessionsState.error() = SessionsLoadingError;

}
