import 'package:core/core.dart';

import 'package:profile/src/profile_routes.dart';

class DefaultProfileNavigator extends ProfileNavigator {

  DefaultProfileNavigator(super.router);

  @override
  Future<void> navigateToProfile(String profileId, {NavigationType type = NavigationType.push}) =>
    navigateTo(ProfileRoute(profileId: profileId), type: type);
  
  @override
  Future<void> navigateToProfileEdit(String profileId, {NavigationType type = NavigationType.push}) =>
    navigateTo(ProfileEditRoute(profileId: profileId), type: type);  

  @override
  Future<void> navigateToProfileSettings(String profileId, {NavigationType type = NavigationType.push}) =>
    navigateTo(ProfileSettingsRoute(profileId: profileId), type: type);
  
  @override
  Future<void> navigateToProfileWizard(String profileId, {NavigationType type = NavigationType.push}) async =>
    navigateTo(ProfileWizardRoute(profileId: profileId), type: type);

  @override
  Future<void> navigateToProfileDelete(String profileId, {NavigationType type = .push}) async =>
    navigateTo(ProfileDeleteRoute(profileId: profileId), type: type);
}
