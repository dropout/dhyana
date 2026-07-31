import 'package:dhyana/core/domain/entity/location.dart';

class SocialProfileData {
  final String id;
  final String firstName;
  final String lastName;
  final String? photoBlurhash;
  final Location? location;

  const SocialProfileData({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.photoBlurhash,
    this.location,
  });
}

abstract interface class SocialProfileDataProvider {
  Future<SocialProfileData> getSocialProfileData(String profileId);
}
