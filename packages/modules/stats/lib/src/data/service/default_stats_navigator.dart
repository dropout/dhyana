import 'package:core/core.dart';
import 'package:stats/src/stats_routes.dart';

class DefaultStatsNavigator extends StatsNavigator {

  DefaultStatsNavigator(super.router);

  @override
  Future<void> navigateToProfileStats(String profileId, {NavigationType type = .push}) async => 
    navigateTo(ProfileStatsRoute(profileId: profileId), type: type);

}
