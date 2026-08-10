import 'package:dhyana/core/domain/entity/location.dart';

abstract interface class SocialPublicApi {
  Future<void> showPresence({
    required String profileId,
    required String firstName,
    required String lastName,
    String? photoBlurhash,
    Location? location,
    required DateTime startedAt,
  });
}
