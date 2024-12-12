part of 'stats_interval_bloc.dart';

@freezed
class StatsIntervalState with _$StatsIntervalState {

  const StatsIntervalState._();

  factory StatsIntervalState.loaded({
    required StatsInterval statsInterval,
  }) = _StatsIntervalState;

  // factory StatsIntervalState.loaded({
  //   required StatsInterval statsInterval,
  // }) = StatsIntervalLoadedState;

  // const factory ProfileStatsState.initial() = _Initial;
  // const ProfileState._();
  //
  // const factory ProfileState.initial() = ProfileStateInitial;
  // const factory ProfileState.loading() = ProfileLoadingState;
  // const factory ProfileState.loaded({
  //   required Profile profile
  // }) = ProfileLoadedState;
  // const factory ProfileState.error() = ProfileErrorState;

}
