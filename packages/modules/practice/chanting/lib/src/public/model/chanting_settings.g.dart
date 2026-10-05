// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chanting_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChantingSettings _$ChantingSettingsFromJson(Map<String, dynamic> json) =>
    _ChantingSettings(
      selectedChants:
          (json['selectedChants'] as List<dynamic>?)
              ?.map(
                (e) => ChantPlaylistItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <ChantPlaylistItem>[],
      lastUsed: const DateTimeOrNullConverter().fromJson(
        (json['lastUsed'] as num?)?.toInt(),
      ),
    );

Map<String, dynamic> _$ChantingSettingsToJson(_ChantingSettings instance) =>
    <String, dynamic>{
      'selectedChants': instance.selectedChants,
      'lastUsed': const DateTimeOrNullConverter().toJson(instance.lastUsed),
    };
