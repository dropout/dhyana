import 'package:core/src/navigator/base_navigator.dart';

abstract class ProfileNavigator extends BaseNavigator {
  const ProfileNavigator(super.router);

  Future<void> navigateToProfile(String profileId, {NavigationType navigationType = .push});
  Future<void> navigateToProfileWizard(String profileId, {NavigationType navigationType = .push});
  Future<void> navigateToProfileSettings(String profileId, {NavigationType navigationType = .push});
  Future<void> navigateToProfileEdit(String profileId, {NavigationType navigationType = .push});

}
