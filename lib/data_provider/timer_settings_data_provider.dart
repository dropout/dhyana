import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/model/timer_settings_query_options.dart';

import 'data_provider.dart';

abstract interface class TimerSettingsDataProvider
    implements DataProvider<TimerSettings> {

  Future<List<TimerSettings>> query(TimerSettingsQueryOptions queryOptions);
  Stream<List<TimerSettings>> queryStream(TimerSettingsQueryOptions queryOptions);

}
