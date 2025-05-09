import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/model/timer_settings_history_record.dart';
import 'package:dhyana/model/timer_settings_history_record_query_options.dart';
import 'package:dhyana/repository/timer_settings_history_repository.dart';

class FirebaseTimerSettingsHistoryRepository
    implements TimerSettingsHistoryRepository {

  final FirebaseFirestore fireStore;

  FirebaseTimerSettingsHistoryRepository(this.fireStore);

  @override
  Future<void> recordTimerSettingsHistory(
    String profileId,
    TimerSettings timerSettings,
  ) async {
    FirebaseTimerSettingsHistoryDataProvider timerSettingsHistoryDataProvider =
      FirebaseTimerSettingsHistoryDataProvider(
        fireStore,
        profileId,
      );

    try {
      TimerSettingsHistoryRecord timerSettingsHistoryRecord = await
        timerSettingsHistoryDataProvider.read(timerSettings.id);
      await timerSettingsHistoryDataProvider.update(
        timerSettingsHistoryRecord.copyWith(
          useCount: timerSettingsHistoryRecord.useCount + 1,
          lastUsed: DateTime.now(),
        )
      );
    } on FirebaseDocumentNotFoundException {
      await timerSettingsHistoryDataProvider.create(
        TimerSettingsHistoryRecord(
          id: timerSettings.id,
          timerSettings: timerSettings,
          useCount: 1,
          lastUsed: DateTime.now(),
        )
      );
    }
  }

  @override
  Future<List<TimerSettingsHistoryRecord>> query(
    String profileId,
    TimerSettingsHistoryRecordQueryOptions queryOptions
  ) {
    FirebaseTimerSettingsHistoryDataProvider timerSettingsHistoryDataProvider =
      FirebaseTimerSettingsHistoryDataProvider(
        fireStore,
        profileId,
      );
    return timerSettingsHistoryDataProvider.query(queryOptions);
  }

  @override
  Stream<List<TimerSettingsHistoryRecord>> queryStream(
    String profileId,
    TimerSettingsHistoryRecordQueryOptions queryOptions,
  ) {
    FirebaseTimerSettingsHistoryDataProvider timerSettingsHistoryDataProvider =
      FirebaseTimerSettingsHistoryDataProvider(
        fireStore,
        profileId,
      );
    return timerSettingsHistoryDataProvider.queryStream(queryOptions);
  }

}
