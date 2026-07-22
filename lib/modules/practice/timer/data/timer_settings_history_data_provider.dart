import 'package:dhyana/modules/practice/timer/domain/model/timer_settings_history_record.dart';
import 'package:dhyana/modules/practice/timer/domain/model/timer_settings_history_record_query_options.dart';

import '../../../../core/data/data_provider.dart';

abstract interface class TimerSettingsHistoryDataProvider
    implements DataProvider<TimerSettingsHistoryRecord> {

  Future<List<TimerSettingsHistoryRecord>> query(
    TimerSettingsHistoryRecordQueryOptions queryOptions
  );

  Stream<List<TimerSettingsHistoryRecord>> queryStream(
    TimerSettingsHistoryRecordQueryOptions queryOptions
  );

}
