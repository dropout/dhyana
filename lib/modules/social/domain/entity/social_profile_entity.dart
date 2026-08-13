import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:dhyana/core/domain/entity/location.dart';
import 'package:dhyana/core/util/default_profile_data.dart';

import 'package:dhyana/modules/profile/profile_module.dart';



part 'social_profile_entity.freezed.dart';
part 'social_profile_entity.g.dart';

@freezed
sealed class SocialProfileEntity with _$SocialProfileEntity {

  const SocialProfileEntity._();

  const factory SocialProfileEntity({
    required String id,
    required String firstName,
    required String lastName,
    required String? photoUrl,
    required String? photoBlurhash,
    Location? location,
  }) = _SocialProfileEntity;

  factory SocialProfileEntity.fromProfile({
    required Profile profile,
  }) {
    return SocialProfileEntity(
      id: profile.id,
      firstName: profile.firstName,
      lastName: profile.lastName,
      photoUrl: profile.photoUrl,
      photoBlurhash: profile.photoBlurhash,
      location: profile.location,
    );
  }

  factory SocialProfileEntity.anonymous() {
    return SocialProfileEntity(
      id: const Uuid().v4(),
      firstName: DefaultProfileData.firstName,
      lastName: DefaultProfileData.lastName,
      photoUrl: DefaultProfileData.photoUrl,
      photoBlurhash: DefaultProfileData.photoBlurhash,
    );
  }

  factory SocialProfileEntity.fromJson(Map<String, Object?> json) =>
    _$SocialProfileEntityFromJson(json);  

}
