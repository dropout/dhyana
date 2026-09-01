// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CitySearchResult _$CitySearchResultFromJson(Map<String, dynamic> json) =>
    _CitySearchResult(
      placeId: json['placeId'] as String,
      name: json['name'] as String,
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      location: json['location'] == null
          ? null
          : LatLng.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CitySearchResultToJson(_CitySearchResult instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'name': instance.name,
      'types': instance.types,
      'location': instance.location?.toJson(),
    };
