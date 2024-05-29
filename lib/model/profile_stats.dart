import 'package:dhyana/model/converter/date_time_or_null_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'profile_stats.freezed.dart';
part 'profile_stats.g.dart';

@freezed
class ProfileStats with _$ProfileStats {

  const factory ProfileStats({
    required int consecutiveDays,
    required int completedMinutesCount,
    required int completedSessionsCount,
    required int completedDaysCount,
    @DateTimeOrNullConverter() DateTime? lastSessionDate,
  }) = _ProfileStats;

  factory ProfileStats.empty() => const ProfileStats(
    consecutiveDays: 0,
    completedMinutesCount: 0,
    completedSessionsCount: 0,
    completedDaysCount: 0,
  );

  factory ProfileStats.fromJson(Map<String, Object?> json) =>
      _$ProfileStatsFromJson(json);

}
