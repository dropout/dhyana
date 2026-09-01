import 'package:core/src/navigator/base_navigator.dart';

abstract class HomeNavigator extends BaseNavigator {
  const HomeNavigator(super.router);

  Future<void> navigateToHome({NavigationType type = .push});

}
