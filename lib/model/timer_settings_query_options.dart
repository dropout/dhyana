import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_settings_query_options.freezed.dart';
part 'timer_settings_query_options.g.dart';

@freezed
class TimerSettingsHistoryQueryOptions with _$TimerSettingsHistoryQueryOptions {

  const TimerSettingsHistoryQueryOptions._();

  const factory TimerSettingsHistoryQueryOptions({
    @Default(20) int limit,
  }) = _TimerSettingsHistoryQueryOptions;

  factory TimerSettingsHistoryQueryOptions.fromJson(Map<String, Object?> json) =>
      _$TimerSettingsHistoryQueryOptionsFromJson(json);

}
