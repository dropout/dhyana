import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/timer_settings_history_data_provider.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/model/timer_settings_query_options.dart';

import 'firebase_data_provider.dart';
import 'firebase_model_extension.dart';

class FirebaseTimerSettingsHistoryDataProvider
  extends FirebaseDataProvider<TimerSettings>
  implements TimerSettingsHistoryDataProvider {

  FirebaseTimerSettingsHistoryDataProvider(
    FirebaseFirestore fireStore,
    String profileId,
  ) : super(
      fireStore
          .collection('profiles')
          .doc(profileId)
          .collection('timerSettings')
          .withConverter<TimerSettings>(
        fromFirestore: (snapshot, _) => fromFireStore(snapshot, TimerSettings.fromJson),
        toFirestore: (timerSettings, _) => timerSettings.toFireStore(),
      )
  );

  @override
  Future<List<TimerSettings>> query(TimerSettingsHistoryQueryOptions queryOptions) {
    // TODO: implement query
    throw UnimplementedError();
  }

  @override
  Stream<List<TimerSettings>> queryStream(TimerSettingsHistoryQueryOptions queryOptions) {
    // TODO: implement queryStream
    throw UnimplementedError();
  }

  static String generateId(String profileId) {
    return FirebaseFirestore.instance
      .collection('profiles')
      .doc(profileId)
      .collection('timerSettings')
      .doc().id;
  }

}
