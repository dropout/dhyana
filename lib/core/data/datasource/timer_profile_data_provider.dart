import 'package:dhyana/core/domain/entity/location.dart';

class TimerProfileData {
  final String profileId;
  final String firstName;
  final String lastName;
  final bool usePresenceFeature;
  final String? photoBlurhash;
  final Location? location;

  const TimerProfileData({
    required this.profileId,
    required this.firstName,
    required this.lastName,
    required this.usePresenceFeature,
    this.photoBlurhash,
    this.location,
  });
}

abstract interface class TimerProfileDataProvider {
  Future<TimerProfileData> getTimerProfileData(String profileId);
}
