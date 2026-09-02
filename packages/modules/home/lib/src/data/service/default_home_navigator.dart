import 'package:core/core.dart';
import 'package:home/src/home_routes.dart';

class DefaultHomeNavigator extends HomeNavigator {
  
  DefaultHomeNavigator(super.router);

  @override
  Future<void> navigateToHome({int? refresh, NavigationType type = .push}) async =>
    navigateTo(HomeRoute(refresh: refresh), type: type);

}