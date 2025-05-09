import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'model.dart';
import 'timer_settings.dart';

part 'timer_settings_history_record.freezed.dart';
part 'timer_settings_history_record.g.dart';

@freezed
class TimerSettingsHistoryRecord with _$TimerSettingsHistoryRecord implements Model {

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
