import 'package:core/core.dart';
import 'package:firebase_provider/firebase_provider.dart';
import 'package:timer/src/data/datasource/firebase_timer_settings_history_data_provider.dart';
import 'package:timer/src/domain/entity/timer_settings_entity.dart';
import 'package:timer/src/domain/entity/timer_settings_history_record_entity.dart';
import 'package:timer/src/domain/repository/timer_settings_history_repository.dart';

class FirebaseTimerSettingsHistoryRepository
    implements TimerSettingsHistoryRepository {

  final FirebaseFirestore fireStore;

  FirebaseTimerSettingsHistoryRepository(this.fireStore);

  @override
  Future<void> recordTimerSettingsHistory(
    String profileId,
    TimerSettingsEntity timerSettings,
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
        TimerSettingsHistoryRecordEntity(
          id: timerSettings.id,
          timerSettings: timerSettings,
          useCount: 1,
          lastUsed: DateTime.now(),
        )
      );
    }
  }

  @override
  Future<List<TimerSettingsHistoryRecordEntity>> query(
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
  Stream<List<TimerSettingsHistoryRecordEntity>> queryStream(
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
