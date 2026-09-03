import 'package:stats/src/domain/entity/stats_session_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core/core.dart';

part 'day_details_entity.freezed.dart';
part 'day_details_entity.g.dart';

@freezed
sealed class DayDetailsEntity with _$DayDetailsEntity implements SerializableEntity {

  const DayDetailsEntity._();

  const factory DayDetailsEntity({
    required String id,
    required DateTime startDate,    
    @Default([]) List<StatsSessionEntity> sessions,
    @Default(0) int consecutiveDaysCount,
  }) = _DayDetailsEntity;

  factory DayDetailsEntity.fromJson(Map<String, Object?> json) =>
      _$DayDetailsEntityFromJson(json);

}