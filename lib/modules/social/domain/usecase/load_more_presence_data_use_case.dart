import 'package:dhyana/core/domain/entity/presence/presence.dart';
import 'package:dhyana/core/domain/entity/presence/presence_query_options.dart';
import 'package:dhyana/core/domain/repository/presence_repository.dart';

/// Use case for loading the next page of presence results.
class LoadMorePresenceDataUseCase {

  final PresenceRepository presenceRepository;

  LoadMorePresenceDataUseCase({
    required this.presenceRepository,
  });

  Future<List<Presence>> execute({
    required String lastDocumentId,
    int batchSize = 18,
  }) {
    final queryOptions = PresenceQueryOptions(
      limit: batchSize,
      lastDocumentId: lastDocumentId,
    );
    return presenceRepository.query(queryOptions);
  }
}