import 'package:core/core.dart';
import 'package:timer/src/domain/entity/timer_settings_history_record_entity.dart';

abstract interface class TimerSettingsHistoryDataProvider
    implements DataProvider<TimerSettingsHistoryRecordEntity> {

  Future<List<TimerSettingsHistoryRecordEntity>> query({int limit = 20});
  Stream<List<TimerSettingsHistoryRecordEntity>> queryStream({int limit = 20});

}
