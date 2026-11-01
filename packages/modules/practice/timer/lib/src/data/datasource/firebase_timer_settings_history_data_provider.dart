import 'package:core/core.dart';
import 'package:firebase_provider/firebase_provider.dart';
import 'package:timer/src/data/datasource/timer_settings_history_data_provider.dart';
import 'package:timer/src/domain/entity/timer_settings_entity.dart';
import 'package:timer/src/domain/entity/timer_settings_history_record_entity.dart';


class FirebaseTimerSettingsHistoryDataProvider
  extends FirebaseDataProvider<TimerSettingsHistoryRecordEntity>
  implements TimerSettingsHistoryDataProvider {

  // Untyped reference so writes can use FieldValue sentinels.
  final CollectionReference<Map<String, dynamic>> _rawCollectionRef;

  FirebaseTimerSettingsHistoryDataProvider(
    FirebaseFirestore fireStore,
    String profileId,
  ) : this._(
    fireStore
      .collection('profiles')
      .doc(profileId)
      .collection('timerSettingsHistory'),
  );

  FirebaseTimerSettingsHistoryDataProvider._(this._rawCollectionRef) : super(
    _rawCollectionRef.withConverter<TimerSettingsHistoryRecordEntity>(
      fromFirestore: (snapshot, _) => fromFireStore(snapshot, TimerSettingsHistoryRecordEntity.fromJson),
      toFirestore: (timerSettings, _) => timerSettings.toFireStore(),
    )
  );

  /// Upserts the record in a single write, so it is atomic and works offline.
  @override
  Future<void> recordUse(TimerSettingsEntity timerSettings, DateTime usedAt) async {
    await _rawCollectionRef.doc(timerSettings.id).set({
      'id': timerSettings.id,
      'timerSettings': timerSettings.toJson(),
      'useCount': FieldValue.increment(1),
      'lastUsed': usedAt.toIso8601String(),
    }, SetOptions(merge: true));
  }

  Query<TimerSettingsHistoryRecordEntity> _buildQuery({int limit = 20}) {
    return collectionRef
      .orderBy('lastUsed', descending: true)
      .limit(limit);
  }

  @override
  Future<List<TimerSettingsHistoryRecordEntity>> query({int limit = 20}) =>
      buildListFromQuery(_buildQuery(limit: limit));

  @override
  Stream<List<TimerSettingsHistoryRecordEntity>> queryStream({int limit = 20}) =>
    buildStreamFromQuery(_buildQuery(limit: limit));

}
