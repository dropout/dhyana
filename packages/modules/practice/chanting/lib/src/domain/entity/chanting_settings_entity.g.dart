// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chanting_settings_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChantingSettingsEntity _$ChantingSettingsEntityFromJson(
  Map<String, dynamic> json,
) => _ChantingSettingsEntity(
  id: json['id'] as String,
  selectedChants:
      (json['selectedChants'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  lastUsed: const DateTimeOrNullConverter().fromJson(
    (json['lastUsed'] as num?)?.toInt(),
  ),
);

Map<String, dynamic> _$ChantingSettingsEntityToJson(
  _ChantingSettingsEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'selectedChants': instance.selectedChants,
  'lastUsed': const DateTimeOrNullConverter().toJson(instance.lastUsed),
};
