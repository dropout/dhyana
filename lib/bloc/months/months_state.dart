part of 'months_bloc.dart';

@freezed
class MonthState with _$MonthState {
  const factory MonthState.loading() = MonthLoading;
  const factory MonthState.loaded({
    required List<Month> months,
  }) = MonthLoaded;
  const factory MonthState.error() = MonthLoadingError;
}
