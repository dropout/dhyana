// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Presence _$$_PresenceFromJson(Map<String, dynamic> json) => _$_Presence(
      id: json['id'] as String,
      profile: PublicProfile.fromJson(json['profile'] as Map<String, dynamic>),
      startedAt: DateTime.parse(json['startedAt'] as String),
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
    );

Map<String, dynamic> _$$_PresenceToJson(_$_Presence instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile.toJson(),
      'startedAt': instance.startedAt.toIso8601String(),
      'finishedAt': instance.finishedAt?.toIso8601String(),
    };
