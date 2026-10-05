import 'package:core/core.dart';
import 'package:timer/src/timer_routes.dart';

class DefaultTimerNavigator extends TimerNavigator {

   DefaultTimerNavigator(super.router);

   @override
   Future<void> navigateToTimer({NavigationType type = .push}) async =>
        navigateTo(TimerRoute(), type: type);

  @override
  Future<void> navigateToTimerSettingsHistory(String profileId, {NavigationType type = .push}) =>
      navigateTo(TimerSettingsHistoryRoute(profileId: profileId), type: type);
   
}