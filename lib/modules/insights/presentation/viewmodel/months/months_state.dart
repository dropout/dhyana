part of 'months_cubit.dart';

@freezed
class MonthsState with _$MonthsState {
  const factory MonthsState.loading() = MonthsLoadingState;
  const factory MonthsState.loaded({
    required List<Month> months,
  }) = MonthsLoadedState;
  const factory MonthsState.error() = MonthsLoadingErrorState;
}
