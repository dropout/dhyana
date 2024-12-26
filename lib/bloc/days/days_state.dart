part of 'days_bloc.dart';

@freezed
sealed class DaysState with _$DaysState {

  const factory DaysState.loading() = DaysLoadingState;
  const factory DaysState.loaded({
    required DateTime from,
    required DateTime to,
    required List<Day> days,
    required CalculatedStats calculatedStats,
  }) = DaysLoadedState;
  const factory DaysState.error() = DaysLoadingErrorState;

}
