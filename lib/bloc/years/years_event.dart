part of 'years_bloc.dart';

@freezed
class YearsEvent with _$YearsEvent {
  const factory YearsEvent.queryYears({
    required String profileId,
    required DateTime from,
    DateTime? to,
  }) = QueryYearsEvent;
}
