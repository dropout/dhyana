part of 'months_bloc.dart';

@freezed
sealed class MonthsState with _$MonthsState {

  const factory MonthsState.loading() = MonthsLoadingState;
  const factory MonthsState.loaded({
    required List<Month> months,
  }) = MonthsLoadedState;
  const factory MonthsState.error() = MonthsLoadingErrorState;
}
