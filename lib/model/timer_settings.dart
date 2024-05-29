import 'package:dhyana/model/converter/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:dhyana/enum/sound.dart';

import 'converter/duration_converter.dart';
import 'model.dart';

part 'timer_settings.freezed.dart';
part 'timer_settings.g.dart';

@freezed
class TimerSettings with _$TimerSettings implements Model {

  const TimerSettings._();

  const factory TimerSettings({
    required String id,
    required Duration warmup,
    @DurationConverter() required Duration duration,
    required Sound startingSound,
    required Sound endingSound,
    @DateTimeConverter() required DateTime createdAt,
  }) = _TimerSettings;

  factory TimerSettings.fromJson(Map<String, Object?> json) =>
    _$TimerSettingsFromJson(json);

}
