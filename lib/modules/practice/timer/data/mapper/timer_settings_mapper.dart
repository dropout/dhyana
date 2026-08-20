import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings_entity.dart' as domain;
import 'package:dhyana/modules/practice/timer/timer_module.dart' as api;

/// Maps between the module's public [api.TimerSettings] DTO and the domain model.
extension TimerSettingsToDomain on api.TimerSettings {
  domain.TimerSettingsEntity toDomain() {
    return domain.TimerSettingsEntity(
      warmup: warmup,
      duration: duration,
      intervalCount: intervalCount,
      intervalSound: intervalSound,
      startingSound: startingSound,
      endingSound: endingSound,
      lastUsed: lastUsed,
    );
  }
}

extension TimerSettingsToPublic on domain.TimerSettingsEntity {
  api.TimerSettings toApi() {
    return api.TimerSettings(
      warmup: warmup,
      duration: duration,
      intervalCount: intervalCount,
      intervalSound: intervalSound,
      startingSound: startingSound,
      endingSound: endingSound,
      lastUsed: lastUsed,
    );
  }
}
