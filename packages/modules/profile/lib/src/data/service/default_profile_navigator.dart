import 'package:core/core.dart';

import 'package:profile/src/profile_routes.dart';

class DefaultProfileNavigator extends ProfileNavigator {

  DefaultProfileNavigator(super.router);

  @override
  Future<void> navigateToProfile(String profileId, {NavigationType navigationType = NavigationType.push}) =>
    navigateTo(ProfileRoute(profileId: profileId), type: navigationType);
  
  @override
  Future<void> navigateToProfileEdit(String profileId, {NavigationType navigationType = NavigationType.push}) =>
    navigateTo(ProfileEditRoute(profileId: profileId), type: navigationType);  

  @override
  Future<void> navigateToProfileSettings(String profileId, {NavigationType navigationType = NavigationType.push}) =>
    navigateTo(ProfileSettingsRoute(profileId: profileId), type: navigationType);
  
  @override
  Future<void> navigateToProfileWizard(String profileId, {NavigationType navigationType = NavigationType.push}) async =>
    navigateTo(ProfileWizardRoute(profileId: profileId), type: navigationType);

}
