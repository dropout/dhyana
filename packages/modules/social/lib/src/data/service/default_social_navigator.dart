import 'package:core/core.dart';
import 'package:social/src/social_routes.dart';

class DefaultSocialNavigator extends SocialNavigator {

  DefaultSocialNavigator(super.router);

  @override
  Future<void> navigateToPresence({NavigationType type = .push}) => 
      navigateTo(PresenceRoute(), type: type);
}
