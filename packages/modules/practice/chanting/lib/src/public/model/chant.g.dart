// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Chant _$ChantFromJson(Map<String, dynamic> json) => _Chant(
  id: json['id'] as String,
  name: json['name'] as String,
  metaData: ChantMetaData.fromJson(json['metaData'] as Map<String, dynamic>),
  blurHash: json['blurHash'] as String,
  order: (json['order'] as num?)?.toInt() ?? 0,
  length: const DurationConverter().fromJson((json['length'] as num).toInt()),
);

Map<String, dynamic> _$ChantToJson(_Chant instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'metaData': instance.metaData,
  'blurHash': instance.blurHash,
  'order': instance.order,
  'length': const DurationConverter().toJson(instance.length),
};
