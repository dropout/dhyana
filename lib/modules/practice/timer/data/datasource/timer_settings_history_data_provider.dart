import 'package:dhyana/core/data/datasource/data_provider.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings_history_record_entity.dart';

abstract interface class TimerSettingsHistoryDataProvider
    implements DataProvider<TimerSettingsHistoryRecordEntity> {

  Future<List<TimerSettingsHistoryRecordEntity>> query({int limit = 20});
  Stream<List<TimerSettingsHistoryRecordEntity>> queryStream({int limit = 20});

}
