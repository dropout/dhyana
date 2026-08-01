import 'package:dhyana/core/data/datasource/data_provider.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings_history_record.dart';

abstract interface class TimerSettingsHistoryDataProvider
    implements DataProvider<TimerSettingsHistoryRecord> {

  Future<List<TimerSettingsHistoryRecord>> query({int limit = 20});
  Stream<List<TimerSettingsHistoryRecord>> queryStream({int limit = 20});

}
