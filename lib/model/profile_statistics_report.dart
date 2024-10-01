import 'package:dhyana/model/converter/date_time_or_null_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'profile_statistics_report.freezed.dart';
part 'profile_statistics_report.g.dart';

@freezed
class ProfileStatisticsReport with _$ProfileStatisticsReport {

  const factory ProfileStatisticsReport({
    required int consecutiveDays,
    required int completedMinutesCount,
    required int completedSessionsCount,
    required int completedDaysCount,
    @DateTimeOrNullConverter() DateTime? lastSessionDate,
  }) = _ProfileStatisticsReport;

  factory ProfileStatisticsReport.empty() => const ProfileStatisticsReport(
    consecutiveDays: 0,
    completedMinutesCount: 0,
    completedSessionsCount: 0,
    completedDaysCount: 0,
  );

  factory ProfileStatisticsReport.fromJson(Map<String, Object?> json) =>
      _$ProfileStatisticsReportFromJson(json);

}
