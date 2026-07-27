import 'package:dhyana/core/domain/entity/presence/presence.dart';
import 'package:dhyana/core/domain/entity/presence/presence_query_options.dart';
import 'package:dhyana/core/domain/repository/presence_repository.dart';

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