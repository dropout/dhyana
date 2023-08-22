// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String,
      photoBlurhash: json['photoBlurhash'] as String,
      signupDate:
          const DateTimeConverter().fromJson(json['signupDate'] as Timestamp),
      stats: ProfileStats.fromJson(json['stats'] as Map<String, dynamic>),
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'photoBlurhash': instance.photoBlurhash,
      'signupDate': const DateTimeConverter().toJson(instance.signupDate),
      'stats': instance.stats.toJson(),
      'completed': instance.completed,
    };
