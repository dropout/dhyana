import 'package:core/core.dart';

abstract class SocialNavigator extends BaseNavigator {
  SocialNavigator(super.router);

  Future<void> navigateToPresence({NavigationType type = .push});

}
