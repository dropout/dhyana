import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/model/converter/date_time_converter.dart';
import 'package:dhyana/model/profile_stats.dart';
import 'package:dhyana/util/default_profile_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'model.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

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
    required ProfileStats stats,
    required bool completed,
  }) = _Profile;

  factory Profile.generateId({
    required String firstName,
    required String lastName,
    required String email,
    required String photoUrl,
    required String photoBlurhash,
    required DateTime signupDate,
    required ProfileStats stats,
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
      stats: stats,
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
      stats: ProfileStats.empty(),
      completed: false,
    );
  }


  factory Profile.fromJson(Map<String, Object?> json) =>
    _$ProfileFromJson(json);

  factory Profile.fromFireStore(DocumentSnapshot snapshot) =>
    Profile.fromJson(snapshot.data() as Map<String, dynamic>);

  @override
  Map<String, Object?> toFireStore() => toJson();

  String get displayName {
    return '$firstName $lastName';
  }

}
