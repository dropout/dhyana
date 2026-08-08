import 'package:dhyana/core/domain/entity/entity.dart';
import 'package:dhyana/modules/practice/timer/timer_module.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'timer_settings_history_record_entity.freezed.dart';
part 'timer_settings_history_record_entity.g.dart';

@freezed
sealed class TimerSettingsHistoryRecordEntity with _$TimerSettingsHistoryRecordEntity implements Dto {

  const TimerSettingsHistoryRecordEntity._();

  const factory TimerSettingsHistoryRecordEntity({
    required String id,
    required TimerSettings timerSettings,
    required int useCount,
    required DateTime lastUsed,
  }) = _TimerSettingsHistoryRecordEntity;

  factory TimerSettingsHistoryRecordEntity.fromJson(Map<String, Object?> json) =>
      _$TimerSettingsHistoryRecordEntityFromJson(json);
}
