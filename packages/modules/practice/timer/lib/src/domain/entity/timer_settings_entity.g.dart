// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_settings_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimerSettingsEntity _$TimerSettingsEntityFromJson(Map<String, dynamic> json) =>
    _TimerSettingsEntity(
      warmup: json['warmup'] == null
          ? const Duration(minutes: 1)
          : const DurationConverter().fromJson((json['warmup'] as num).toInt()),
      duration: json['duration'] == null
          ? const Duration(minutes: 10)
          : const DurationConverter().fromJson(
              (json['duration'] as num).toInt(),
            ),
      intervalCount: (json['intervalCount'] as num?)?.toInt() ?? 0,
      intervalSound:
          $enumDecodeNullable(_$SoundEnumMap, json['intervalSound']) ??
          Sound.triangle,
      startingSound:
          $enumDecodeNullable(_$SoundEnumMap, json['startingSound']) ??
          Sound.smallBell,
      endingSound:
          $enumDecodeNullable(_$SoundEnumMap, json['endingSound']) ??
          Sound.smallBell,
      lastUsed: const DateTimeOrNullConverter().fromJson(
        (json['lastUsed'] as num?)?.toInt(),
      ),
    );

Map<String, dynamic> _$TimerSettingsEntityToJson(
  _TimerSettingsEntity instance,
) => <String, dynamic>{
  'warmup': const DurationConverter().toJson(instance.warmup),
  'duration': const DurationConverter().toJson(instance.duration),
  'intervalCount': instance.intervalCount,
  'intervalSound': _$SoundEnumMap[instance.intervalSound]!,
  'startingSound': _$SoundEnumMap[instance.startingSound]!,
  'endingSound': _$SoundEnumMap[instance.endingSound]!,
  'lastUsed': const DateTimeOrNullConverter().toJson(instance.lastUsed),
};

const _$SoundEnumMap = {
  Sound.none: 'none',
  Sound.vibrate: 'vibrate',
  Sound.smallBell: 'smallBell',
  Sound.triangle: 'triangle',
};
