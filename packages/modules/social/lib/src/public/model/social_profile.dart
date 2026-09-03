import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core/core.dart';
import 'package:profile/profile.dart';


part 'social_profile.freezed.dart';

@freezed
sealed class SocialProfile with _$SocialProfile implements ProfileDisplayable {

  const SocialProfile._();

  const factory SocialProfile({
    required String id,
    required String firstName,
    required String lastName,
    required String? photoUrl,
    required String? photoBlurhash,
    Location? location,
  }) = _SocialProfile;

  factory SocialProfile.fromProfile({
    required Profile profile,
  }) {
    return SocialProfile(
      id: profile.id,
      firstName: profile.firstName,
      lastName: profile.lastName,
      photoUrl: profile.photoUrl,
      photoBlurhash: profile.photoBlurhash,
      location: profile.location,
    );
  }

  factory SocialProfile.anonymous() {
    return SocialProfile(
      id: const Uuid().v4(),
      firstName: DefaultProfileData.firstName,
      lastName: DefaultProfileData.lastName,
      photoUrl: DefaultProfileData.photoUrl,
      photoBlurhash: DefaultProfileData.photoBlurhash,
    );
  }

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
