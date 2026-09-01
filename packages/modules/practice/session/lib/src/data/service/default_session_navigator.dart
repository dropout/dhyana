import 'package:core/core.dart';
import 'package:session/src/session_routes.dart';

class DefaultSessionNavigator extends SessionNavigator {
  DefaultSessionNavigator(super.router);

  @override
  Future<void> navigateToSessionCompletedScreen({
    NavigationType type = NavigationType.push,
  }) async {
  
  }

  @override
  Future<void> navigateToSessionHistory(
    String profileId, {
    NavigationType type = .push,
  }) async =>
    navigateTo(SessionHistoryRoute(profileId: profileId), type: type);  

}
