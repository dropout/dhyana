// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_stats_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateProfileStatsResult _$UpdateProfileStatsResultFromJson(
  Map<String, dynamic> json,
) => _UpdateProfileStatsResult(
  oldProfile: Profile.fromJson(json['oldProfile'] as Map<String, dynamic>),
  updatedProfile: Profile.fromJson(
    json['updatedProfile'] as Map<String, dynamic>,
  ),
  session: Session.fromJson(json['session'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateProfileStatsResultToJson(
  _UpdateProfileStatsResult instance,
) => <String, dynamic>{
  'oldProfile': instance.oldProfile.toJson(),
  'updatedProfile': instance.updatedProfile.toJson(),
  'session': instance.session.toJson(),
};
