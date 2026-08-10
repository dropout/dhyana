import 'package:dhyana/modules/stats/domain/entity/insights_session_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dhyana/core/domain/entity/entity.dart';

part 'day_details_entity.freezed.dart';
part 'day_details_entity.g.dart';

@freezed
sealed class DayDetailsEntity with _$DayDetailsEntity implements Dto {

  const DayDetailsEntity._();

  const factory DayDetailsEntity({
    required String id,
    required DateTime startDate,    
    @Default([]) List<InsightsSessionEntity> sessions,
    @Default(0) int consecutiveDaysCount,
  }) = _DayDetailsEntity;

  factory DayDetailsEntity.fromJson(Map<String, Object?> json) =>
      _$DayDetailsEntityFromJson(json);

}