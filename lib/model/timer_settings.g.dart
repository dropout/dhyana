// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimerSettings _$$_TimerSettingsFromJson(Map<String, dynamic> json) =>
    _$_TimerSettings(
      warmup: json['warmup'] == null
          ? const Duration(minutes: 1)
          : Duration(microseconds: json['warmup'] as int),
      duration: json['duration'] == null
          ? const Duration(minutes: 10)
          : Duration(microseconds: json['duration'] as int),
      startingSound:
          $enumDecodeNullable(_$SoundEnumMap, json['startingSound']) ??
              Sound.none,
      endingSound: $enumDecodeNullable(_$SoundEnumMap, json['endingSound']) ??
          Sound.none,
    );

Map<String, dynamic> _$$_TimerSettingsToJson(_$_TimerSettings instance) =>
    <String, dynamic>{
      'warmup': instance.warmup.inMicroseconds,
      'duration': instance.duration.inMicroseconds,
      'startingSound': _$SoundEnumMap[instance.startingSound]!,
      'endingSound': _$SoundEnumMap[instance.endingSound]!,
    };

const _$SoundEnumMap = {
  Sound.none: 'none',
  Sound.smallBell: 'smallBell',
};
