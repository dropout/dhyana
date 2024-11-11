part of 'days_bloc.dart';

@freezed
class DaysEvent with _$DaysEvent {

  const factory DaysEvent.started() = _Started;

  const factory DaysEvent.queryDays({
    required String profileId,
    required DateTime from,
    DateTime? to,
    @Default(false) bool useStream,
  }) = QueryDaysEvent;

  const factory DaysEvent.receiveUpdate({
    required List<Day> days,
  }) = ReceiveUpdateDaysEvent;

  const factory DaysEvent.error() = DaysErrorEvent;

}
