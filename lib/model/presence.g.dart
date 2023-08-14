// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Presence _$$_PresenceFromJson(Map<String, dynamic> json) => _$_Presence(
      id: json['id'] as String,
      who: PublicProfile.fromJson(json['who'] as Map<String, dynamic>),
      startedAt: DateTime.parse(json['startedAt'] as String),
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
    );

Map<String, dynamic> _$$_PresenceToJson(_$_Presence instance) =>
    <String, dynamic>{
      'id': instance.id,
      'who': instance.who.toJson(),
      'startedAt': instance.startedAt.toIso8601String(),
      'finishedAt': instance.finishedAt?.toIso8601String(),
    };
