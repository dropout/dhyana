part of 'days_bloc.dart';

@freezed
class DaysEvent with _$DaysEvent {

  const factory DaysEvent.started() = _Started;

  const factory DaysEvent.getDays({
    required String profileId,
    required DateTime from,
    DateTime? to,
  }) = GetDaysEvent;

}
