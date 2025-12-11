part of 'session_completed_cubit.dart';

@freezed
class SessionCompletedState with _$SessionCompletedState {

  const SessionCompletedState._();

  const factory SessionCompletedState.initial() = SessionCompletedInitialState;
  const factory SessionCompletedState.loading() = SessionCompletedLoadingState;
  const factory SessionCompletedState.error() = SessionCompletedErrorState;

  const factory SessionCompletedState.saving({
    required UpdateProfileStatsResult updateResult,
  }) = SessionCompletedSavingState;

  const factory SessionCompletedState.saved({
    required UpdateProfileStatsResult updateResult,

  }) = SessionCompletedSavedState;

}
