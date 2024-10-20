part of 'years_bloc.dart';

@freezed
class YearsState with _$YearsState {
  const factory YearsState.loading() = YearsLoading;
  const factory YearsState.loaded({
    required List<Year> years,
  }) = YearsLoaded;
  const factory YearsState.error() = YearsLoadingError;
}
