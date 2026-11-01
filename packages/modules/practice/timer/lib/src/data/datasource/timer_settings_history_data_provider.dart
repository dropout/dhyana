import 'package:core/core.dart';
import 'package:timer/src/domain/entity/timer_settings_entity.dart';
import 'package:timer/src/domain/entity/timer_settings_history_record_entity.dart';

abstract interface class TimerSettingsHistoryDataProvider
    implements DataProvider<TimerSettingsHistoryRecordEntity> {

  /// Creates the record or increments its use count.
  Future<void> recordUse(TimerSettingsEntity timerSettings, DateTime usedAt);

  Future<List<TimerSettingsHistoryRecordEntity>> query({int limit = 20});
  Stream<List<TimerSettingsHistoryRecordEntity>> queryStream({int limit = 20});

}
