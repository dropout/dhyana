part of 'years_bloc.dart';

@freezed
class YearsEvent with _$YearsEvent {
  const factory YearsEvent.getYear({
    required String profileId,
    required DateTime from,
    DateTime? to,
  }) = GetYearsEvent;
}
