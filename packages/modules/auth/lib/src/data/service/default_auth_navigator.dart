import 'package:auth/src/auth_routes.dart';
import 'package:core/core.dart';

class DefaultAuthNavigator extends AuthNavigator {

  DefaultAuthNavigator(super.router);

  @override
  Future<void> navigateToLogin({
    NavigationType type = NavigationType.push
  }) async => navigateTo(LoginRoute(), type: type);

}
