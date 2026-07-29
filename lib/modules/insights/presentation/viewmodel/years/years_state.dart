part of 'years_cubit.dart';

@freezed
sealed class YearsState with _$YearsState {
  const factory YearsState.loading() = YearsLoadingState;
  const factory YearsState.loaded({
    required List<Year> years,
  }) = YearsLoadedState;
  const factory YearsState.error() = YearsLoadingErrorState;
}
