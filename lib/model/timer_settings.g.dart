// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerSettingsImpl _$$TimerSettingsImplFromJson(Map<String, dynamic> json) =>
    _$TimerSettingsImpl(
      id: json['id'] as String,
      warmup: Duration(microseconds: (json['warmup'] as num).toInt()),
      duration:
          const DurationConverter().fromJson((json['duration'] as num).toInt()),
      startingSound: $enumDecode(_$SoundEnumMap, json['startingSound']),
      endingSound: $enumDecode(_$SoundEnumMap, json['endingSound']),
      createdAt: const DateTimeConverter()
          .fromJson((json['createdAt'] as num).toInt()),
    );

Map<String, dynamic> _$$TimerSettingsImplToJson(_$TimerSettingsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'warmup': instance.warmup.inMicroseconds,
      'duration': const DurationConverter().toJson(instance.duration),
      'startingSound': _$SoundEnumMap[instance.startingSound]!,
      'endingSound': _$SoundEnumMap[instance.endingSound]!,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };

const _$SoundEnumMap = {
  Sound.none: 'none',
  Sound.smallBell: 'smallBell',
};
