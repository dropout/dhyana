import 'package:core/core.dart';
import 'package:profile/src/domain/entity/profile_settings_entity.dart';
import 'package:profile/src/domain/entity/profile_stats_report_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

part 'profile_entity.freezed.dart';
part 'profile_entity.g.dart';

// When editing profile make sure to check the profile model
// in firebase functions, because thats where the
// initial profile db record is created.

// TODO: Cleanup ProfileModel interface and its usage

@freezed
abstract class ProfileEntity with _$ProfileEntity implements SerializableEntity, ProfileDisplayable {

  const ProfileEntity._();

  const factory ProfileEntity({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required String? photoUrl,
    required String? photoBlurhash,
    @Default(ProfileSettingsEntity()) ProfileSettingsEntity settings,
    @DateTimeConverter() required DateTime signupDate,
    required ProfileStatsReportEntity statsReport,
    required bool completed,
    Location? location,
  }) = _ProfileEntity;

  factory ProfileEntity.fromJson(Map<String, Object?> json) =>
    _$ProfileEntityFromJson(json);

  factory ProfileEntity.anonymous() {
    return ProfileEntity(
      id: Uuid().v4(),
      firstName: DefaultProfileData.firstName,
      lastName: DefaultProfileData.lastName,
      email: '',
      photoUrl: DefaultProfileData.photoUrl,
      photoBlurhash: DefaultProfileData.photoBlurhash,
      signupDate: DateTime.now(),
      statsReport: const ProfileStatsReportEntity(),
      completed: false,
    );
  }

  bool consecutiveDaysProgressCheck(ProfileEntity oldProfile) =>
    (oldProfile.statsReport.consecutiveDays.current
      < statsReport.consecutiveDays.current);

  @override
  String get displayName => 
    '$firstName $lastName';

  @override
  String get profileImageStoragePath =>
    '/profiles/$id/photo.jpg';  

  @override
  bool get hasProfileImage =>
    photoUrl != null && photoUrl!.isNotEmpty;
  
}
