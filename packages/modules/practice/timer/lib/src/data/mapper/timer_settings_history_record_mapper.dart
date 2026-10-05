import 'package:timer/src/data/mapper/timer_settings_mapper.dart';
import 'package:timer/src/domain/entity/timer_settings_history_record_entity.dart';
import 'package:timer/src/public/model/timer_settings_history_record.dart';

extension TimerSettingsHistoryRecordToDomain on TimerSettingsHistoryRecord {
  TimerSettingsHistoryRecordEntity toDomain() {
    return TimerSettingsHistoryRecordEntity(
      id: id,
      timerSettings: timerSettings.toDomain(),
      useCount: useCount,
      lastUsed: lastUsed,
    );
  }
}

extension TimerSettingsHistoryRecordToPublic
    on TimerSettingsHistoryRecordEntity {
  TimerSettingsHistoryRecord toApi() {
    return TimerSettingsHistoryRecord(
      id: id,
      timerSettings: timerSettings.toApi(),
      useCount: useCount,
      lastUsed: lastUsed,
    );
  }
}
