// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimerSettings _$TimerSettingsFromJson(Map<String, dynamic> json) =>
    _TimerSettings(
      warmup: json['warmup'] == null
          ? const Duration(minutes: 1)
          : const DurationConverter().fromJson((json['warmup'] as num).toInt()),
      duration: json['duration'] == null
          ? const Duration(minutes: 10)
          : const DurationConverter().fromJson(
              (json['duration'] as num).toInt(),
            ),
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

Map<String, dynamic> _$TimerSettingsToJson(_TimerSettings instance) =>
    <String, dynamic>{
      'warmup': const DurationConverter().toJson(instance.warmup),
      'duration': const DurationConverter().toJson(instance.duration),
      'startingSound': _$SoundEnumMap[instance.startingSound]!,
      'endingSound': _$SoundEnumMap[instance.endingSound]!,
      'lastUsed': const DateTimeOrNullConverter().toJson(instance.lastUsed),
    };

const _$SoundEnumMap = {Sound.none: 'none', Sound.smallBell: 'smallBell'};
