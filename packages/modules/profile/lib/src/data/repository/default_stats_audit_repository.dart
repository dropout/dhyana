import 'package:firebase_provider/firebase_provider.dart';
import 'package:profile/src/domain/entity/stats_audit_entry_entity.dart';
import 'package:profile/src/domain/repository/stats_audit_repository.dart';


class DefaultStatsAudioRepository implements StatsAuditRepository {

  final FirebaseFirestore fireStore;

  DefaultStatsAudioRepository(this.fireStore);

  @override
  Future<void> saveAll(
    String profileId,
    List<StatsAuditEntryEntity> entries,
  ) async {
    final collection = fireStore
      .collection('profiles')
      .doc(profileId)
      .collection('statsAudit');
    final batch = fireStore.batch();
    for (final entry in entries) {
      batch.set(collection.doc(entry.id), {
        ...entry.toJson(),
        // Firestore TTL policies require a Timestamp field.
        'expireAt': Timestamp.fromDate(entry.expireAt),
      });
    }
    await batch.commit();
  }

}
