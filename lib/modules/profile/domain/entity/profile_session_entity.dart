import 'package:dhyana/core/data/converter/date_time_converter.dart';
import 'package:dhyana/core/data/converter/duration_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_session_entity.freezed.dart';
part 'profile_session_entity.g.dart';

enum ProfileSessionEntityType {
  sitting,
  chanting,
}

@freezed
sealed class ProfileSessionEntity with _$ProfileSessionEntity {
  const factory ProfileSessionEntity({
    required String id,
    required ProfileSessionEntityType type,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime endTime,
    @DurationConverter() required Duration duration,
  }) = _ProfileSessionEntity;

  factory ProfileSessionEntity.fromJson(Map<String, Object?> json) =>
      _$ProfileSessionEntityFromJson(json);
}