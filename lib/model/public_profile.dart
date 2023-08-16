import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/util/default_profile_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'profile.dart';

part 'public_profile.freezed.dart';
part 'public_profile.g.dart';

@freezed
class PublicProfile with _$PublicProfile {

  const factory PublicProfile({
    required String id,
    required String firstName,
    required String lastName,
    required String photoUrl,
    required String photoBlurhash,
  }) = _PublicProfile;

  factory PublicProfile.fromProfile({
    required Profile profile,
  }) {
    return PublicProfile(
      id: profile.id,
      firstName: profile.firstName,
      lastName: profile.lastName,
      photoUrl: profile.photoUrl,
      photoBlurhash: profile.photoBlurhash,
    );
  }

  factory PublicProfile.anonymous() {
    return PublicProfile(
      id: const Uuid().v4(),
      firstName: DefaultProfileData.firstName,
      lastName: DefaultProfileData.lastName,
      photoUrl: DefaultProfileData.photoUrl,
      photoBlurhash: DefaultProfileData.photoBlurhash,
    );
  }

  factory PublicProfile.fromJson(Map<String, Object?> json) =>
    _$PublicProfileFromJson(json);

  factory PublicProfile.fromFirstore(DocumentSnapshot snapshot) =>
    PublicProfile.fromJson(snapshot.data() as Map<String, dynamic>);

}
