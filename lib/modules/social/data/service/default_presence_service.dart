import 'package:dhyana/core/domain/entity/location.dart';
import 'package:dhyana/modules/social/domain/repository/presence_repository.dart';
import 'package:dhyana/modules/social/domain/entity/presence.dart';
import 'package:dhyana/modules/social/domain/entity/public_profile.dart';
import 'package:dhyana/core/service/presence_service.dart';

class DefaultPresenceService implements PresenceService {

  final PresenceRepository presenceRepository;

  const DefaultPresenceService({
    required this.presenceRepository,
  });

  @override
  Future<void> showPresence({
    required String profileId,
    required String firstName,
    required String lastName,
    String? photoBlurhash,
    Location? location,
    required DateTime startedAt,
  }) async {
    return presenceRepository.create(
      Presence(
        id: profileId,
        profile: PublicProfile(
          id: profileId,
          firstName: firstName,
          lastName: lastName,
          photoUrl: null,
          photoBlurhash: photoBlurhash,
          location: location,
        ),
        startedAt: startedAt,
        location: location,
      ),
    );      
  }
}
