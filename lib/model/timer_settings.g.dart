// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimerSettings _$$_TimerSettingsFromJson(Map<String, dynamic> json) =>
    _$_TimerSettings(
      warmup: Duration(microseconds: json['warmup'] as int),
      duration: Duration(microseconds: json['duration'] as int),
      startingSound: $enumDecode(_$SoundEnumMap, json['startingSound']),
      endingSound: $enumDecode(_$SoundEnumMap, json['endingSound']),
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
