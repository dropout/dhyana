import 'package:dhyana/core/domain/entity/entity.dart';
import 'package:dhyana/core/domain/entity/timer_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'timer_settings_history_record.freezed.dart';
part 'timer_settings_history_record.g.dart';

@freezed
sealed class TimerSettingsHistoryRecord with _$TimerSettingsHistoryRecord implements Entity {

  const TimerSettingsHistoryRecord._();

  const factory TimerSettingsHistoryRecord({
    required String id,
    required TimerSettings timerSettings,
    required int useCount,
    required DateTime lastUsed,
  }) = _TimerSettingsHistoryRecord;

  factory TimerSettingsHistoryRecord.fromJson(Map<String, Object?> json) =>
      _$TimerSettingsHistoryRecordFromJson(json);
}
