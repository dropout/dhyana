// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerSettingsImpl _$$TimerSettingsImplFromJson(Map<String, dynamic> json) =>
    _$TimerSettingsImpl(
      warmup: Duration(microseconds: (json['warmup'] as num).toInt()),
      duration:
          const DurationConverter().fromJson((json['duration'] as num).toInt()),
      startingSound: $enumDecode(_$SoundEnumMap, json['startingSound']),
      endingSound: $enumDecode(_$SoundEnumMap, json['endingSound']),
    );

Map<String, dynamic> _$$TimerSettingsImplToJson(_$TimerSettingsImpl instance) =>
    <String, dynamic>{
      'warmup': instance.warmup.inMicroseconds,
      'duration': const DurationConverter().toJson(instance.duration),
      'startingSound': _$SoundEnumMap[instance.startingSound]!,
      'endingSound': _$SoundEnumMap[instance.endingSound]!,
    };

const _$SoundEnumMap = {
  Sound.none: 'none',
  Sound.smallBell: 'smallBell',
};
