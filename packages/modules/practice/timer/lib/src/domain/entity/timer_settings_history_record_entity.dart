import 'package:core/core.dart';
import 'package:timer/src/domain/entity/timer_settings_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_settings_history_record_entity.freezed.dart';
part 'timer_settings_history_record_entity.g.dart';

@freezed
sealed class TimerSettingsHistoryRecordEntity with _$TimerSettingsHistoryRecordEntity implements SerializableEntity {

  const TimerSettingsHistoryRecordEntity._();

  const factory TimerSettingsHistoryRecordEntity({
    required String id,
    required TimerSettingsEntity timerSettings,
    required int useCount,
    required DateTime lastUsed,
  }) = _TimerSettingsHistoryRecordEntity;

  factory TimerSettingsHistoryRecordEntity.fromJson(Map<String, Object?> json) =>
      _$TimerSettingsHistoryRecordEntityFromJson(json);
}
