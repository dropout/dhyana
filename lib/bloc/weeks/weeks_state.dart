part of 'weeks_bloc.dart';

@freezed
sealed class WeeksState with _$WeeksState {

  const factory WeeksState.loading() = WeeksLoading;
  const factory WeeksState.loaded({
    required List<Week> weeks,
  }) = WeeksLoaded;
  const factory WeeksState.error() = WeeksLoadingError;

}
