// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PresenceEntity _$PresenceEntityFromJson(Map<String, dynamic> json) =>
    _PresenceEntity(
      id: json['id'] as String,
      profile: SocialProfileEntity.fromJson(
        json['profile'] as Map<String, dynamic>,
      ),
      startedAt: const DateTimeConverter().fromJson(
        (json['startedAt'] as num).toInt(),
      ),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PresenceEntityToJson(_PresenceEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
      'startedAt': const DateTimeConverter().toJson(instance.startedAt),
      'location': instance.location,
    };
