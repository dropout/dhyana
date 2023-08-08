import 'package:dhyana/service/timer_service.dart';

class TimerServiceFactory<T extends TimerService> {

  T Function({required Duration duration}) constructor;

  TimerServiceFactory(this.constructor);

  T getTimerService(Duration duration) {
    return constructor(duration: duration);
  }

}
