import 'package:core/core.dart';
import 'package:firebase_provider/firebase_provider.dart';
import 'package:timer/src/data/datasource/timer_settings_history_data_provider.dart';
import 'package:timer/src/domain/entity/timer_settings_history_record_entity.dart';


class FirebaseTimerSettingsHistoryDataProvider
  extends FirebaseDataProvider<TimerSettingsHistoryRecordEntity>
  implements TimerSettingsHistoryDataProvider {

  FirebaseTimerSettingsHistoryDataProvider(
    FirebaseFirestore fireStore,
    String profileId,
  ) : super(
    fireStore
      .collection('profiles')
      .doc(profileId)
      .collection('timerSettingsHistory')
      .withConverter<TimerSettingsHistoryRecordEntity>(
        fromFirestore: (snapshot, _) => fromFireStore(snapshot, TimerSettingsHistoryRecordEntity.fromJson),
        toFirestore: (timerSettings, _) => timerSettings.toFireStore(),
      )
  );

  

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

  static String generateId(String profileId) {
    return FirebaseFirestore.instance
      .collection('profiles')
      .doc(profileId)
      .collection('timerSettings')
      .doc().id;
  }

}
