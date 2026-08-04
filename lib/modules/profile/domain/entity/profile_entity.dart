import 'package:dhyana/core/domain/entity/converter/date_time_converter.dart';
import 'package:dhyana/core/domain/entity/location.dart';
import 'package:dhyana/core/domain/entity/profile/profile_model.dart';
import 'package:dhyana/core/domain/entity/profile/profile_settings.dart';
import 'package:dhyana/core/domain/entity/profile/profile_statistics_report.dart';
import 'package:dhyana/core/util/default_profile_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

part 'profile_entity.freezed.dart';

// When editing profile make sure to check the profile model
// in firebase functions, because thats where the
// initial profile db record is created.

@freezed
abstract class ProfileEntity with _$ProfileEntity implements ProfileModel {

  const ProfileEntity._();

  const factory ProfileEntity({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required String? photoUrl,
    required String? photoBlurhash,
    @Default(ProfileSettings()) ProfileSettings settings,
    @DateTimeConverter() required DateTime signupDate,
    required ProfileStatisticsReport statsReport,
    required bool completed,
    Location? location,
  }) = _ProfileEntity;

  factory ProfileEntity.anonymous() {
    return ProfileEntity(
      id: Uuid().v4(),
      firstName: DefaultProfileData.firstName,
      lastName: DefaultProfileData.lastName,
      email: '',
      photoUrl: DefaultProfileData.photoUrl,
      photoBlurhash: DefaultProfileData.photoBlurhash,
      signupDate: DateTime.now(),
      statsReport: const ProfileStatisticsReport(),
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
  String get profileImagePath =>
    '/profiles/$id/photo.jpg';  

  @override
  bool get hasProfileImage =>
    photoUrl != null && photoUrl!.isNotEmpty;
  
}
