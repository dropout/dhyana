// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Location _$LocationFromJson(Map<String, dynamic> json) => _Location(
  name: json['name'] as String,
  latLng: LatLng.fromJson(json['latLng'] as Map<String, dynamic>),
  geoHash: json['geoHash'] as String,
);

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
  'name': instance.name,
  'latLng': instance.latLng.toJson(),
  'geoHash': instance.geoHash,
};
