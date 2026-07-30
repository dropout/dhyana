import 'package:dhyana/modules/social/domain/entity/presence.dart';
import 'package:dhyana/modules/social/domain/entity/presence_query_options.dart';
import 'package:dhyana/modules/social/domain/repository/presence_repository.dart';

/// Use case for loading presence data with optional location based filtering.
class LoadPresenceDataUseCase {

  final PresenceRepository presenceRepository;

  LoadPresenceDataUseCase({
    required this.presenceRepository,
  });

  Future<List<Presence>> execute(PresenceQueryOptions queryOptions) {
    return presenceRepository.query(queryOptions);
  }
}