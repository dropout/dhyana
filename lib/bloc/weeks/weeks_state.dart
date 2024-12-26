part of 'weeks_bloc.dart';

@freezed
sealed class WeeksState with _$WeeksState {

  const factory WeeksState.loading() = WeeksLoadingState;
  const factory WeeksState.loaded({
    required DateTime from,
    required DateTime to,
    required List<Week> weeks,
    required CalculatedStats calculatedStats,
  }) = WeeksLoadedState;
  const factory WeeksState.error() = WeeksErrorState;

}
