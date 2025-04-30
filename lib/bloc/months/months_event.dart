part of 'months_bloc.dart';

@freezed
class MonthsEvent with _$MonthsEvent {
  const factory MonthsEvent.queryMonths({
    required String profileId,
    required DateTime from,
    DateTime? to,
  }) = QueryMonthsEvent;
}
