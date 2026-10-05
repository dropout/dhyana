import 'package:core/core.dart';
import 'package:stats/src/domain/enum/stats_entity_granularity.dart';
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

  StatsEntityGranularity get granularity => map(
    day: (_) => StatsEntityGranularity.days,
    week: (_) => StatsEntityGranularity.weeks,
    month: (_) => StatsEntityGranularity.months,
    year: (_) => StatsEntityGranularity.years,
  );

}