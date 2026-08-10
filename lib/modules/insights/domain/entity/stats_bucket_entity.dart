import 'package:dhyana/core/data/converter/date_time_converter.dart';
import 'package:dhyana/core/domain/entity/entity.dart';
import 'package:dhyana/modules/insights/domain/enum/stats_entity_granularity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_bucket_entity.freezed.dart';
part 'stats_bucket_entity.g.dart';

@Freezed(
  unionKey: 'granularity',
  unionValueCase: FreezedUnionCase.none,
)
sealed class StatsBucketEntity with _$StatsBucketEntity implements Dto {

  const StatsBucketEntity._();

  const factory StatsBucketEntity.day({
    required String id,
    @DateTimeConverter() required DateTime startDate,
    @Default(0) int minutesCount,
    @Default(0) int sessionCount,
  }) = DayStatsBucketEntity;

  const factory StatsBucketEntity.week({
    required String id,
    @DateTimeConverter() required DateTime startDate,
    @Default(0) int minutesCount,
    @Default(0) int sessionCount,
  }) = WeekStatsBucketEntity;

  const factory StatsBucketEntity.month({
    required String id,
    @DateTimeConverter() required DateTime startDate,
    @Default(0) int minutesCount,
    @Default(0) int sessionCount,
  }) = MonthStatsBucketEntity;

  const factory StatsBucketEntity.year({
    required String id,
    @DateTimeConverter() required DateTime startDate,
    @Default(0) int minutesCount,
    @Default(0) int sessionCount,
  }) = YearStatsBucketEntity;

  StatsEntityGranularity get granularity => map(
    day: (_) => StatsEntityGranularity.day,
    week: (_) => StatsEntityGranularity.week,
    month: (_) => StatsEntityGranularity.month,
    year: (_) => StatsEntityGranularity.year,
  );

  factory StatsBucketEntity.fromJson(Map<String, Object?> json) =>
    _$StatsBucketEntityFromJson(json);

}