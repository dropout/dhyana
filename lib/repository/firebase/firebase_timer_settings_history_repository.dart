import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/firebase/firebase_timer_settings_history_data_provider.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/model/timer_settings_query_options.dart';
import 'package:dhyana/repository/timer_settings_history_repository.dart';

class FirebaseTimerSettingsHistoryRepository
    implements TimerSettingsHistoryRepository {

  final FirebaseFirestore fireStore;

  FirebaseTimerSettingsHistoryRepository(this.fireStore);

  @override
  Future<void> saveSettings(String profileId, TimerSettings timerSettings) async {
    FirebaseTimerSettingsHistoryDataProvider timerSettingsHistoryDataProvider =
      FirebaseTimerSettingsHistoryDataProvider(
        fireStore,
        profileId,
      );

    bool exists = await timerSettingsHistoryDataProvider.exists(timerSettings.id);
    if (exists) {
      await timerSettingsHistoryDataProvider.update(timerSettings);
    } else {
      await timerSettingsHistoryDataProvider.create(timerSettings);
    }
  }

  @override
  Future<List<TimerSettings>> query(
    String profileId,
    TimerSettingsHistoryQueryOptions queryOptions
  ) {
    FirebaseTimerSettingsHistoryDataProvider timerSettingsHistoryDataProvider =
      FirebaseTimerSettingsHistoryDataProvider(
        fireStore,
        profileId,
      );
    return timerSettingsHistoryDataProvider.query(queryOptions);
  }

  @override
  Stream<List<TimerSettings>> queryStream(
    String profileId,
    TimerSettingsHistoryQueryOptions queryOptions,
  ) {
    FirebaseTimerSettingsHistoryDataProvider timerSettingsHistoryDataProvider =
      FirebaseTimerSettingsHistoryDataProvider(
        fireStore,
        profileId,
      );
    return timerSettingsHistoryDataProvider.queryStream(queryOptions);
  }




}
