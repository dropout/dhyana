import 'package:core/src/navigator/base_navigator.dart';

abstract class DonateNavigator extends BaseNavigator {
  DonateNavigator(super.router);

  Future<void> navigateToDonateScreen({
    NavigationType type = NavigationType.push,
  });
}
