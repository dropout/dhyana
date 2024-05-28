import 'package:dhyana/data_provider/firebase/firebase_timer_settings_data_provider.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:uuid/uuid.dart';

class TimerSettingsFactory {

  static TimerSettings withUuid({
    Duration warmup = const Duration(minutes: 1),
    Duration duration = const Duration(minutes: 10),
    startingSound = Sound.none,
    endingSound = Sound.none,
  }) {

    return TimerSettings(
      id: const Uuid().v4(),
      warmup: warmup,
      duration: duration,
      startingSound: startingSound,
      endingSound: endingSound,
    );
  }

  static TimerSettings withFirebaseId({
    required String profileId,
    Duration warmup = const Duration(minutes: 1),
    Duration duration = const Duration(minutes: 10),
    startingSound = Sound.none,
    endingSound = Sound.none,
  }) {

    return TimerSettings(
      id: FirebaseTimerSettingsDataProvider.generateId(profileId),
      warmup: warmup,
      duration: duration,
      startingSound: startingSound,
      endingSound: endingSound,
    );
  }

}
