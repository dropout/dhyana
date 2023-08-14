import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:dhyana/enum/sound.dart';

part 'timer_settings.freezed.dart';
part 'timer_settings.g.dart';

@freezed
class TimerSettings with _$TimerSettings {

  const TimerSettings._();

  const factory TimerSettings({
    required Duration warmup,
    required Duration duration,
    required Sound startingSound,
    required Sound endingSound,
  }) = _TimerSettings;

  factory TimerSettings.initial() {
    return const TimerSettings(
      warmup: Duration(minutes: 1),
      duration: Duration(minutes: 10),
      startingSound: Sound.none,
      endingSound: Sound.none,
    );
  }

  factory TimerSettings.fromJson(Map<String, Object?> json) =>
    _$TimerSettingsFromJson(json);

}
