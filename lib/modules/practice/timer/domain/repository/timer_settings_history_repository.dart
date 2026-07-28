import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings_history_record.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings_history_record_query_options.dart';

/// An interface for a repository that manages the history of timer settings changes.
abstract interface class TimerSettingsHistoryRepository {

  Future<void> recordTimerSettingsHistory(
    String profileId,
    TimerSettings timerSettings,
  );

  Future<List<TimerSettingsHistoryRecord>> query(
    String profileId,
    TimerSettingsHistoryRecordQueryOptions queryOptions
  );

  Stream<List<TimerSettingsHistoryRecord>> queryStream(
    String profileId,
    TimerSettingsHistoryRecordQueryOptions queryOptions
  );

}
