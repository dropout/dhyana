part of 'weeks_bloc.dart';

@freezed
class WeeksEvent with _$WeeksEvent {

  const factory WeeksEvent.started() = _Started;

  const factory WeeksEvent.queryWeeks({
    required String profileId,
    required DateTime from,
    DateTime? to,
    @Default(false) bool useStream,
  }) = GetWeeksEvent;

  const factory WeeksEvent.receiveUpdate({
    required List<Week> weeks,
  }) = ReceiveUpdateWeeksEvent;

  const factory WeeksEvent.error() = WeeksErrorEvent;

}
