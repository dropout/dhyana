import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_settings_history_record_query_options.freezed.dart';
part 'timer_settings_history_record_query_options.g.dart';

@freezed
sealed class TimerSettingsHistoryRecordQueryOptions
  with _$TimerSettingsHistoryRecordQueryOptions {

  const TimerSettingsHistoryRecordQueryOptions._();

  const factory TimerSettingsHistoryRecordQueryOptions({
    @Default(20) int limit,
  }) = _TimerSettingsHistoryRecordQueryOptions;

  factory TimerSettingsHistoryRecordQueryOptions.fromJson(Map<String, Object?> json) =>
      _$TimerSettingsHistoryRecordQueryOptionsFromJson(json);

}
