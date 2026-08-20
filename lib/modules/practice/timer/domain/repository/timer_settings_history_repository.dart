import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings_entity.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings_history_record_entity.dart';

/// An interface for a repository that manages the history of timer settings changes.
abstract interface class TimerSettingsHistoryRepository {

  Future<void> recordTimerSettingsHistory(
    String profileId,
    TimerSettingsEntity timerSettings,
  );

  Future<List<TimerSettingsHistoryRecordEntity>> query(
    String profileId,
    {int limit = 20}
  );

  Stream<List<TimerSettingsHistoryRecordEntity>> queryStream(
    String profileId,
    {int limit = 20}
  );

}
