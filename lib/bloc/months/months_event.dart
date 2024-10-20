part of 'months_bloc.dart';

@freezed
class MonthEvent with _$MonthEvent {
  const factory MonthEvent.getMonths({
    required String profileId,
    required DateTime from,
    DateTime? to,
  }) = GetMonthEvent;
}
