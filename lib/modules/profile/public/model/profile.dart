import 'package:dhyana/core/data/converter/date_time_converter.dart';
import 'package:dhyana/core/domain/entity/location.dart';
import 'package:dhyana/core/domain/entity/profile/profile_model.dart';
import 'package:dhyana/core/util/default_profile_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'profile_settings.dart';
import 'profile_stats_report.dart';

part 'profile.freezed.dart';

// When editing profile make sure to check the profile model
// in firebase functions, because thats where the
// initial profile db record is created.

@freezed
abstract class Profile with _$Profile implements ProfileModel {

  const Profile._();

  const factory Profile({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required String? photoUrl,
    required String? photoBlurhash,
    @Default(ProfileSettings()) ProfileSettings settings,
    @DateTimeConverter() required DateTime signupDate,
    required ProfileStatsReport statsReport,
    required bool completed,
    Location? location,
  }) = _Profile;

  factory Profile.anonymous() {
    return Profile(
      id: Uuid().v4(),
      firstName: DefaultProfileData.firstName,
      lastName: DefaultProfileData.lastName,
      email: '',
      photoUrl: DefaultProfileData.photoUrl,
      photoBlurhash: DefaultProfileData.photoBlurhash,
      signupDate: DateTime.now(),
      statsReport: const ProfileStatsReport(),
      completed: false,
    );
  }

  bool consecutiveDaysProgressCheck(Profile oldProfile) =>
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
