// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Presence _$$_PresenceFromJson(Map<String, dynamic> json) => _$_Presence(
      id: json['id'] as String,
      profile: PublicProfile.fromJson(json['profile'] as Map<String, dynamic>),
      startedAt:
          const DateTimeConverter().fromJson(json['startedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_PresenceToJson(_$_Presence instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile.toJson(),
      'startedAt': const DateTimeConverter().toJson(instance.startedAt),
    };
