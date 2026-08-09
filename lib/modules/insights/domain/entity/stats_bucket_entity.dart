import 'package:dhyana/core/data/converter/date_time_converter.dart';
import 'package:dhyana/core/domain/entity/entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_bucket_entity.freezed.dart';
part 'stats_bucket_entity.g.dart';

@freezed
sealed class StatsBucketEntity with _$StatsBucketEntity implements Dto {

  const StatsBucketEntity._();

  const factory StatsBucketEntity({
    required String id,
    @DateTimeConverter() required DateTime startDate,
    @Default(0) int minutesCount,
    @Default(0) int sessionCount,
  }) = _StatsBucketEntity;

  factory StatsBucketEntity.fromJson(Map<String, Object?> json) =>
      _$StatsBucketEntityFromJson(json);

}