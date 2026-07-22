import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/modules/practice/timer/data/timer_settings_history_data_provider.dart';
import 'package:dhyana/modules/practice/timer/domain/model/timer_settings_history_record.dart';
import 'package:dhyana/modules/practice/timer/domain/model/timer_settings_history_record_query_options.dart';

import '../../../../data_provider/firebase/firebase_data_provider.dart';
import '../../../../data_provider/firebase/firebase_model_extension.dart';

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

  Query<TimerSettingsHistoryRecord> _buildQuery(TimerSettingsHistoryRecordQueryOptions queryOptions) {
    return collectionRef
      .orderBy('lastUsed', descending: true)
      .limit(queryOptions.limit);
  }

  @override
  Future<List<TimerSettingsHistoryRecord>> query(TimerSettingsHistoryRecordQueryOptions queryOptions) =>
      buildListFromQuery(_buildQuery(queryOptions));

  @override
  Stream<List<TimerSettingsHistoryRecord>> queryStream(TimerSettingsHistoryRecordQueryOptions queryOptions) =>
    buildStreamFromQuery(_buildQuery(queryOptions));

  static String generateId(String profileId) {
    return FirebaseFirestore.instance
      .collection('profiles')
      .doc(profileId)
      .collection('timerSettings')
      .doc().id;
  }

}
