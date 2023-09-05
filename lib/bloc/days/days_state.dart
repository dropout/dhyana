part of 'days_bloc.dart';

@freezed
sealed class DaysState with _$DaysState {

  const factory DaysState.loading() = DaysLoading;
  const factory DaysState.loaded({
    required List<Day> days,
  }) = DaysLoaded;
  const factory DaysState.error() = DaysLoadingError;

}
