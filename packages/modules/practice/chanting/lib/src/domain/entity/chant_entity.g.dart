// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chant_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChantEntity _$ChantEntityFromJson(Map<String, dynamic> json) => _ChantEntity(
  id: json['id'] as String,
  name: json['name'] as String,
  metaData: ChantMetaDataEntity.fromJson(
    json['metaData'] as Map<String, dynamic>,
  ),
  blurHash: json['blurHash'] as String,
  order: (json['order'] as num?)?.toInt() ?? 0,
  length: const DurationConverter().fromJson((json['length'] as num).toInt()),
);

Map<String, dynamic> _$ChantEntityToJson(_ChantEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'metaData': instance.metaData,
      'blurHash': instance.blurHash,
      'order': instance.order,
      'length': const DurationConverter().toJson(instance.length),
    };
