// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicProfileImpl _$$PublicProfileImplFromJson(Map<String, dynamic> json) =>
    _$PublicProfileImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      photoUrl: json['photoUrl'] as String,
      photoBlurhash: json['photoBlurhash'] as String,
    );

Map<String, dynamic> _$$PublicProfileImplToJson(_$PublicProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'photoUrl': instance.photoUrl,
      'photoBlurhash': instance.photoBlurhash,
    };
