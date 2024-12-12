import 'package:dhyana/enum/stats_interval_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_interval.freezed.dart';
part 'stats_interval.g.dart';

@freezed
class StatsInterval with _$StatsInterval {

  const StatsInterval._();

  const factory StatsInterval({
    required StatsIntervalType intervalType,
    required DateTime from,
    required DateTime to,
  }) = _StatsInterval;

  Duration get duration => from.difference(to);

  factory StatsInterval.fromJson(Map<String, Object?> json) =>
      _$StatsIntervalFromJson(json);
}
