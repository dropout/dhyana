// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialProfileEntity _$SocialProfileEntityFromJson(Map<String, dynamic> json) =>
    _SocialProfileEntity(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      photoUrl: json['photoUrl'] as String?,
      photoBlurhash: json['photoBlurhash'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SocialProfileEntityToJson(
  _SocialProfileEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'photoUrl': instance.photoUrl,
  'photoBlurhash': instance.photoBlurhash,
  'location': instance.location?.toJson(),
};
