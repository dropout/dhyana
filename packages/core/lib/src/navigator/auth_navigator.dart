import 'package:core/src/navigator/base_navigator.dart';


abstract class AuthNavigator extends BaseNavigator {
  const AuthNavigator(super.router);

  Future<void> navigateToLogin({NavigationType type = .push}); 

}
