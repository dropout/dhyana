import 'package:dhyana/modules/social/domain/entity/presence_entity.dart';
import 'package:dhyana/modules/social/domain/entity/presence_query_options_entity.dart';
import 'package:dhyana/modules/social/domain/repository/presence_repository.dart';

/// Use case for loading presence data with optional location based filtering.
class QueryPresenceUseCase {

  final PresenceRepository presenceRepository;

  QueryPresenceUseCase({
    required this.presenceRepository,
  });

  Future<List<PresenceEntity>> execute(PresenceQueryOptionsEntity queryOptions) {
    return presenceRepository.query(queryOptions);
  }
}