import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_settings_query_options.freezed.dart';
part 'timer_settings_query_options.g.dart';

@freezed
class TimerSettingsQueryOptions with _$TimerSettingsQueryOptions {

  const TimerSettingsQueryOptions._();

  const factory TimerSettingsQueryOptions({
    @Default(20) int limit,
  }) = _TimerSettingsQueryOptions;

  factory TimerSettingsQueryOptions.fromJson(Map<String, Object?> json) =>
      _$TimerSettingsQueryOptionsFromJson(json);

}
