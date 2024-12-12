part of 'stats_interval_bloc.dart';

@freezed
class StatsIntervalEvent with _$StatsIntervalEvent {

  const factory StatsIntervalEvent.changed({
    required StatsInterval statsInterval,
  }) = StatsIntervalChangedEvent;


}
