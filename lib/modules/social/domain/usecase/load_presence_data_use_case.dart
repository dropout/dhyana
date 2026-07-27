import 'package:dhyana/core/domain/entity/location.dart';
import 'package:dhyana/core/domain/entity/presence/presence.dart';
import 'package:dhyana/core/domain/entity/presence/presence_query_options.dart';
import 'package:dhyana/core/domain/repository/presence_repository.dart';

/// Use case for loading presence data with optional location based filtering.
class LoadPresenceDataUseCase {

  final PresenceRepository presenceRepository;

  LoadPresenceDataUseCase({
    required this.presenceRepository,
  });

  Future<List<Presence>> execute({
    String? ownProfileId,
    Location? location,
    double rangeInKm = 100.0,
    Duration interval = const Duration(minutes: 60),
    int limit = 18,
  }) {
    return presenceRepository.query(
      PresenceQueryOptions(
        limit: limit,
        ownProfileId: ownProfileId,
        location: location,
        rangeInKm: rangeInKm,
        windowSize: interval,
      ),
    );
  }
}