import 'package:core/core.dart';

abstract class SessionNavigator extends BaseNavigator {
  SessionNavigator(super.router);

  Future<void> navigateToSessionCompletedScreen({
    NavigationType type = NavigationType.push,
  });

  Future<void> navigateToSessionHistory(
    String profileId, {
    NavigationType type = NavigationType.push,
  });
  
}
