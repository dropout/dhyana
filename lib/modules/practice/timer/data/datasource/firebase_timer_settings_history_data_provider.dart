import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/modules/practice/timer/data/datasource/timer_settings_history_data_provider.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings_history_record.dart';

import '../../../../../core/data/datasource/firebase_data_provider.dart';
import '../../../../../core/data/datasource/firebase_model_extension.dart';

class FirebaseTimerSettingsHistoryDataProvider
  extends FirebaseDataProvider<TimerSettingsHistoryRecord>
  implements TimerSettingsHistoryDataProvider {

  FirebaseTimerSettingsHistoryDataProvider(
    FirebaseFirestore fireStore,
    String profileId,
  ) : super(
    fireStore
      .collection('profiles')
      .doc(profileId)
      .collection('timerSettingsHistory')
      .withConverter<TimerSettingsHistoryRecord>(
        fromFirestore: (snapshot, _) => fromFireStore(snapshot, TimerSettingsHistoryRecord.fromJson),
        toFirestore: (timerSettings, _) => timerSettings.toFireStore(),
      )
  );

  

  Query<TimerSettingsHistoryRecord> _buildQuery({int limit = 20}) {
    return collectionRef
      .orderBy('lastUsed', descending: true)
      .limit(limit);
  }

  @override
  Future<List<TimerSettingsHistoryRecord>> query({int limit = 20}) =>
      buildListFromQuery(_buildQuery(limit: limit));

  @override
  Stream<List<TimerSettingsHistoryRecord>> queryStream({int limit = 20}) =>
    buildStreamFromQuery(_buildQuery(limit: limit));

  static String generateId(String profileId) {
    return FirebaseFirestore.instance
      .collection('profiles')
      .doc(profileId)
      .collection('timerSettings')
      .doc().id;
  }

}
