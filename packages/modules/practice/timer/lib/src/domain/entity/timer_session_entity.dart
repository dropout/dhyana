import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_session_entity.freezed.dart';
part 'timer_session_entity.g.dart';


enum TimerSessionEntityType {
  sitting,
  chanting,
}

/// Domain-owned representation of a completed timer session,
/// independent of the session module's [SessionEntity].
@freezed
sealed class TimerSessionEntity with _$TimerSessionEntity implements SerializableEntity {

  const TimerSessionEntity._();

  const factory TimerSessionEntity({
    required String id,
    required TimerSessionEntityType type,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime endTime,
    @DurationConverter() required Duration duration,
  }) = _TimerSessionEntity;

  factory TimerSessionEntity.fromJson(Map<String, Object?> json) =>
    _$TimerSessionEntityFromJson(json);

}
