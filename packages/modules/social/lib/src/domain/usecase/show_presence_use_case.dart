import 'package:core/core.dart';
import 'package:social/src/domain/entity/presence_entity.dart';
import 'package:social/src/domain/entity/social_profile_entity.dart';
import 'package:social/src/domain/repository/presence_repository.dart';

/// Will create a presence record for the given data.
/// This is used to show the presence of a user in the app, 
/// e.g. when they are practicing.
class ShowPresenceUseCase {
  final PresenceRepository presenceRepository;

  ShowPresenceUseCase(this.presenceRepository);

  Future<void> execute({
    required String profileId,
    required String firstName,
    required String lastName,
    String? photoBlurhash,
    Location? location,
    required DateTime startedAt,  
  }) async => presenceRepository.create(
      PresenceEntity(
        id: profileId,
        profile: SocialProfileEntity(
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