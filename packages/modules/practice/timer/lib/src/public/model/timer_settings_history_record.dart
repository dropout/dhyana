import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timer/src/public/model/timer_settings.dart';

part 'timer_settings_history_record.freezed.dart';
part 'timer_settings_history_record.g.dart';

@freezed
sealed class TimerSettingsHistoryRecord with _$TimerSettingsHistoryRecord implements SerializableEntity {

  const TimerSettingsHistoryRecord._();

  @JsonSerializable(explicitToJson: true)
  const factory TimerSettingsHistoryRecord({
    required String id,
    required TimerSettings timerSettings,
    required int useCount,
    required DateTime lastUsed,
  }) = _TimerSettingsHistoryRecord;

  factory TimerSettingsHistoryRecord.fromJson(Map<String, Object?> json) =>
      _$TimerSettingsHistoryRecordFromJson(json);

}
