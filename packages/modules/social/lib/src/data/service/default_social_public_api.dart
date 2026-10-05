import 'package:core/core.dart';
import 'package:social/src/data/mapper/presence_mapper.dart';
import 'package:social/src/domain/entity/presence_query_options_entity.dart';
import 'package:social/src/domain/repository/presence_repository.dart';
import 'package:social/src/domain/usecase/show_presence_use_case.dart';
import 'package:social/src/public/api/social_public_api.dart';
import 'package:social/src/public/model/presence.dart';


class DefaultSocialPublicApi implements SocialPublicApi {

  final PresenceRepository presenceRepository;

  const DefaultSocialPublicApi({
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
  }) async => ShowPresenceUseCase(presenceRepository).execute(
      profileId: profileId,
      firstName: firstName,
      lastName: lastName,
      photoBlurhash: photoBlurhash,
      location: location,
      startedAt: startedAt,
    );

  @override
  Future<List<Presence>> queryPresence({
    Duration windowSize = const Duration(hours: 3),
    int limit = 20,
    double rangeInKm = 100,
    String? ownProfileId,
    String? lastDocumentId,
    Location? location,
  }) async => (await presenceRepository.query(
      PresenceQueryOptionsEntity(
        windowSize: windowSize,
        limit: limit,
        rangeInKm: rangeInKm,
        ownProfileId: ownProfileId,
        lastDocumentId: lastDocumentId,
        location: location,
      )
    )).map((e) => e.toApi()).toList();
      
}
