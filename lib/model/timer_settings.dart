import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:dhyana/enum/sound.dart';

import 'converter/date_time_or_null_converter.dart';
import 'converter/duration_converter.dart';
import 'model.dart';

part 'timer_settings.freezed.dart';
part 'timer_settings.g.dart';

@freezed
class TimerSettings with _$TimerSettings implements Model {

  const TimerSettings._();

  const factory TimerSettings({
    @DurationConverter() @Default(Duration(minutes: 1)) Duration warmup,
    @DurationConverter() @Default(Duration(minutes: 10)) Duration duration,
    @Default(Sound.smallBell) Sound startingSound,
    @Default(Sound.smallBell) Sound endingSound,
    @DateTimeOrNullConverter() DateTime? lastUsed,
  }) = _TimerSettings;

  factory TimerSettings.fromJson(Map<String, Object?> json) =>
    _$TimerSettingsFromJson(json);
  
  factory TimerSettings.fromIdString(String idString) {
    try {
      List<String> parts = idString.split('-');
      Duration warmup = Duration(seconds: int.parse(parts[0], radix: 10));
      Sound startingSound = getSoundById(int.parse(parts[2], radix: 10));
      Duration duration = Duration(seconds: int.parse(parts[1], radix: 10));
      Sound endingSound = getSoundById(int.parse(parts[2], radix: 10));
      return TimerSettings(
        warmup: warmup,
        duration: duration,
        startingSound: startingSound,
        endingSound: endingSound,
      );
    } catch(e, _) {
      throw Exception('Unable to convert idString: $idString to TimerSettings');
    }
  }
  

  @override
  String get id {
    return '${warmup.inSeconds}-${startingSound.id}-${duration.inSeconds}-${endingSound.id}';
  }

}
