// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence_query_options_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PresenceQueryOptionsEntity _$PresenceQueryOptionsEntityFromJson(
  Map<String, dynamic> json,
) => _PresenceQueryOptionsEntity(
  windowSize: json['windowSize'] == null
      ? const Duration(hours: 3)
      : Duration(microseconds: (json['windowSize'] as num).toInt()),
  limit: (json['limit'] as num?)?.toInt() ?? 20,
  ownProfileId: json['ownProfileId'] as String?,
  lastDocumentId: json['lastDocumentId'] as String?,
  location: json['location'] == null
      ? null
      : Location.fromJson(json['location'] as Map<String, dynamic>),
  rangeInKm: (json['rangeInKm'] as num?)?.toDouble() ?? 100,
);

Map<String, dynamic> _$PresenceQueryOptionsEntityToJson(
  _PresenceQueryOptionsEntity instance,
) => <String, dynamic>{
  'windowSize': instance.windowSize.inMicroseconds,
  'limit': instance.limit,
  'ownProfileId': instance.ownProfileId,
  'lastDocumentId': instance.lastDocumentId,
  'location': instance.location,
  'rangeInKm': instance.rangeInKm,
};
