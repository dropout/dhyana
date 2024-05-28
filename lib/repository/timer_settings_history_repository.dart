import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/model/timer_settings_query_options.dart';

abstract interface class TimerSettingsHistoryRepository {

  Future<void> saveSettings(
    String profileId,
    TimerSettings timerSettings
  );

  Future<List<TimerSettings>> query(
    String profileId,
    TimerSettingsHistoryQueryOptions queryOptions
  );

  Stream<List<TimerSettings>> queryStream(
    String profileId,
    TimerSettingsHistoryQueryOptions queryOptions
  );

}
