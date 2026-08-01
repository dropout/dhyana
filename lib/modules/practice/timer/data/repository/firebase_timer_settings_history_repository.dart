import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/core/data/datasource/data_provider_exception.dart';
import 'package:dhyana/modules/practice/timer/data/datasource/firebase_timer_settings_history_data_provider.dart';
import 'package:dhyana/core/domain/entity/timer_settings.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings_history_record.dart';
import 'package:dhyana/modules/practice/timer/domain/repository/timer_settings_history_repository.dart';

class FirebaseTimerSettingsHistoryRepository
    implements TimerSettingsHistoryRepository {

  final FirebaseFirestore fireStore;

  FirebaseTimerSettingsHistoryRepository(this.fireStore);

  @override
  Future<void> recordTimerSettingsHistory(
    String profileId,
    TimerSettings timerSettings,
  ) async {
    final timerSettingsHistoryDataProvider =
      FirebaseTimerSettingsHistoryDataProvider(
        fireStore,
        profileId,
      );

    try {
      final timerSettingsHistoryRecord = await
        timerSettingsHistoryDataProvider.read(timerSettings.id);
      await timerSettingsHistoryDataProvider.update(
        timerSettingsHistoryRecord.copyWith(
          useCount: timerSettingsHistoryRecord.useCount + 1,
          lastUsed: DateTime.now(),
        )
      );
    } on DocumentNotFoundException {
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
    {int limit = 20}
  ) {
    final timerSettingsHistoryDataProvider =
      FirebaseTimerSettingsHistoryDataProvider(
        fireStore,
        profileId,
      );
    return timerSettingsHistoryDataProvider.query(limit: limit);
  }

  @override
  Stream<List<TimerSettingsHistoryRecord>> queryStream(
    String profileId,
    {int limit = 20}
  ) {
    final timerSettingsHistoryDataProvider =
      FirebaseTimerSettingsHistoryDataProvider(
        fireStore,
        profileId,
      );
    return timerSettingsHistoryDataProvider.queryStream(limit: limit);
  }

}
