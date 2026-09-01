import 'package:core/core.dart';

abstract class TimerNavigator extends BaseNavigator {
  TimerNavigator(super.router);

  Future<void> navigateToTimer({NavigationType type = .push});

}
