import 'package:dhyana/modules/social/domain/entity/social_profile_entity.dart';
import 'package:dhyana/modules/social/public/model/social_profile.dart';

extension SocialProfileMapper on SocialProfileEntity {
  SocialProfile toApi() {
    return SocialProfile(
      id: id,
      firstName: firstName,
      lastName: lastName,
      photoUrl: photoUrl,
      photoBlurhash: photoBlurhash,
      location: location,
    );
  }
}

extension SocialProfileEntityMapper on SocialProfile {
  SocialProfileEntity toEntity() {
    return SocialProfileEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      photoUrl: photoUrl,
      photoBlurhash: photoBlurhash,
      location: location,
    );
  }
}