import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/model/timer_settings.dart';

class TimerSettingsFactory {

  static TimerSettings withUuid({
    Duration warmup = const Duration(minutes: 1),
    Duration duration = const Duration(minutes: 10),
    startingSound = Sound.none,
    endingSound = Sound.none,
  }) {
    return TimerSettings(
      warmup: warmup,
      duration: duration,
      startingSound: startingSound,
      endingSound: endingSound,
      lastUsed: DateTime.now(),
    );
  }

}
