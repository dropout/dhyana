import 'package:dhyana/core/domain/entity/location.dart';
import 'package:dhyana/modules/social/public/model/presence.dart';

abstract interface class SocialPublicApi {
  
  Future<void> showPresence({
    required String profileId,
    required String firstName,
    required String lastName,
    String? photoBlurhash,
    Location? location,
    required DateTime startedAt,
  });

  Future<List<Presence>> queryPresence({
    Duration windowSize = const Duration(hours: 3),
    int limit = 20,
    double rangeInKm = 100,
    String? ownProfileId,
    String? lastDocumentId,
    Location? location,    
  });

}
