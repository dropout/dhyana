import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/model/session.dart';

class SessionFactory {

  static Session withFirebaseId({
    required String profileId,
    required DateTime startTime,
    required DateTime endTime,
    required Duration duration,
    required TimerSettings timerSettings,
  }) {
    return Session(
      id: FirebaseSessionDataProvider.generateId(profileId),
      startTime: startTime,
      endTime: endTime,
      duration: duration,
      timerSettings: timerSettings,
    );
  }

}
