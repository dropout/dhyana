import 'package:profile/src/domain/entity/stats_audit_entry_entity.dart';

/// Does not provide methods for reading or querying audit entries; 
/// it only supports saving them.
abstract interface class StatsAuditRepository {
  Future<void> saveAll(String profileId, List<StatsAuditEntryEntity> entries);
}
