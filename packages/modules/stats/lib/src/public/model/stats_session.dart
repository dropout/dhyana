import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:core/core.dart';
import 'package:stats/src/public/enum/stats_session_type.dart';


part 'stats_session.freezed.dart';

@freezed
sealed class StatsSession with _$StatsSession {

  const StatsSession._();

  const factory StatsSession({
    required String id,
    required StatsSessionType type,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime endTime,
    @DurationConverter() required Duration duration,
  }) = _StatsSession;

}
