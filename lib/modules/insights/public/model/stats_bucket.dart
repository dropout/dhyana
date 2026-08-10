import 'package:dhyana/core/data/converter/date_time_converter.dart';
import 'package:dhyana/modules/insights/domain/entity/stats_granularity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_bucket.freezed.dart';

@Freezed(
  unionKey: 'granularity',
  unionValueCase: FreezedUnionCase.none,
)
sealed class StatsBucket with _$StatsBucket {

  const StatsBucket._();

  const factory StatsBucket.day({
    required String id,
    @DateTimeConverter() required DateTime startDate,
    @Default(0) int minutesCount,
    @Default(0) int sessionCount,
  }) = DayStatsBucket;

  const factory StatsBucket.week({
    required String id,
    @DateTimeConverter() required DateTime startDate,
    @Default(0) int minutesCount,
    @Default(0) int sessionCount,
  }) = WeekStatsBucket;

  const factory StatsBucket.month({
    required String id,
    @DateTimeConverter() required DateTime startDate,
    @Default(0) int minutesCount,
    @Default(0) int sessionCount,
  }) = MonthStatsBucket;

  const factory StatsBucket.year({
    required String id,
    @DateTimeConverter() required DateTime startDate,
    @Default(0) int minutesCount,
    @Default(0) int sessionCount,
  }) = YearStatsBucket;

  StatsGranularity get granularity => map(
    day: (_) => StatsGranularity.day,
    week: (_) => StatsGranularity.week,
    month: (_) => StatsGranularity.month,
    year: (_) => StatsGranularity.year,
  );

}