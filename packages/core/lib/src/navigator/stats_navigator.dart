import 'package:core/core.dart';

abstract class StatsNavigator extends BaseNavigator {
  StatsNavigator(super.router);

  Future<void> navigateToProfileStats(String profileId, {NavigationType type = .push});

}
