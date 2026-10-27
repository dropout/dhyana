import 'package:core/core.dart';
import 'package:session/src/public/model/session.dart';
import 'package:session/src/session_routes.dart';

class DefaultSessionNavigator extends SessionNavigator {
  final IdGeneratorService idGeneratorService;

  DefaultSessionNavigator(super.router, {
  required this.idGeneratorService});

  @override
  Future<void> navigateToSessionCompletedScreen({
    required DateTime startTime,
    required DateTime endTime,
    required Duration duration,
    required SessionType sessionType,
    NavigationType navigationType = NavigationType.push,
  }) async { 
    final session = Session(
      id: idGeneratorService.sessionId(),
      startTime: startTime,
      endTime: endTime,
      duration: duration,
      type: sessionType,
    );
    navigateTo(
      SessionCompletedRoute(
        $extra: session,
      ),
      type: navigationType,
      extra: session,
    );
  }

  @override
  Future<void> navigateToSessionHistory(
    String profileId, {
    NavigationType type = .push,
  }) async => navigateTo(SessionHistoryRoute(profileId: profileId), type: type);
}
