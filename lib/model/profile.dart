import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/model/converter/date_time_converter.dart';
import 'package:dhyana/model/profile_statistics_report.dart';
import 'package:dhyana/util/default_profile_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'model.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

// When editing profile make sure to check the profile model
// in firebase functions, because thats where the
// initial profile db record is created.

@freezed
class Profile with _$Profile implements Model {

  const Profile._();

  const factory Profile({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required String photoUrl,
    required String photoBlurhash,
    @DateTimeConverter() required DateTime signupDate,
    required ProfileStatisticsReport statsReport,
    required bool completed,
  }) = _Profile;

  factory Profile.generateId({
    required String firstName,
    required String lastName,
    required String email,
    required String photoUrl,
    required String photoBlurhash,
    required DateTime signupDate,
    required ProfileStatisticsReport statsReport,
    required bool completed,
  }) {
    return Profile(
      id: FirebaseFirestore.instance.collection('profiles').doc().id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      photoUrl: photoUrl,
      photoBlurhash: photoBlurhash,
      signupDate: signupDate,
      statsReport: statsReport,
      completed: completed,
    );
  }

  factory Profile.anonymous() {
    return Profile(
      id: FirebaseFirestore.instance.collection('profiles').doc().id,
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

  factory Profile.fromJson(Map<String, Object?> json) =>
    _$ProfileFromJson(json);

  String get displayName {
    return '$firstName $lastName';
  }

  bool consecutiveDaysProgressCheck(Profile oldProfile) {
    return (oldProfile.statsReport.consecutiveDays.current
      < statsReport.consecutiveDays.current);
  }

}
