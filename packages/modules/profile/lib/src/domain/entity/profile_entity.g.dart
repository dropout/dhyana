// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileEntity _$ProfileEntityFromJson(Map<String, dynamic> json) =>
    _ProfileEntity(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String?,
      photoBlurhash: json['photoBlurhash'] as String?,
      settings: json['settings'] == null
          ? const ProfileSettingsEntity()
          : ProfileSettingsEntity.fromJson(
              json['settings'] as Map<String, dynamic>,
            ),
      signupDate: const DateTimeConverter().fromJson(
        (json['signupDate'] as num).toInt(),
      ),
      statsReport: ProfileStatsReportEntity.fromJson(
        json['statsReport'] as Map<String, dynamic>,
      ),
      completed: json['completed'] as bool,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileEntityToJson(_ProfileEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'photoBlurhash': instance.photoBlurhash,
      'settings': instance.settings.toJson(),
      'signupDate': const DateTimeConverter().toJson(instance.signupDate),
      'statsReport': instance.statsReport.toJson(),
      'completed': instance.completed,
      'location': instance.location?.toJson(),
    };
