import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/model/timer_settings_query_options.dart';

import 'data_provider.dart';

abstract interface class TimerSettingsHistoryDataProvider
    implements DataProvider<TimerSettings> {

  Future<List<TimerSettings>> query(
    TimerSettingsHistoryQueryOptions queryOptions
  );

  Stream<List<TimerSettings>> queryStream(
    TimerSettingsHistoryQueryOptions queryOptions
  );

}
