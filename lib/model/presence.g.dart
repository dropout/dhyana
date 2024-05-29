// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PresenceImpl _$$PresenceImplFromJson(Map<String, dynamic> json) =>
    _$PresenceImpl(
      id: json['id'] as String,
      profile: PublicProfile.fromJson(json['profile'] as Map<String, dynamic>),
      startedAt: const DateTimeConverter()
          .fromJson((json['startedAt'] as num).toInt()),
    );

Map<String, dynamic> _$$PresenceImplToJson(_$PresenceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile.toJson(),
      'startedAt': const DateTimeConverter().toJson(instance.startedAt),
    };
