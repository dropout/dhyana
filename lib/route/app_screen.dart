enum AppScreen {
  home,
  login,
  profile,
  profileWizard,
  editProfile,
  activity,
  settings,
  timerRunning,
}

extension AppScreenExtension on AppScreen {

  String get path {
    switch (this) {
      case AppScreen.home:
        return '/';
      case AppScreen.login:
        return '/login';
      case AppScreen.profile:
        return '/profile/:profileId';
      case AppScreen.profileWizard:
        return '/profileWizard';
      case AppScreen.editProfile:
        return '/editProfile';
      case AppScreen.activity:
        return '/activity';
      case AppScreen.settings:
        return '/settings';
      case AppScreen.timerRunning:
        return '/timerRunning';
    }
  }

  String get name {
    switch (this) {
      case AppScreen.home:
        return 'HOME';
      case AppScreen.login:
        return 'LOGIN';
      case AppScreen.profile:
        return 'PROFILE';
      case AppScreen.profileWizard:
        return 'PROFILE_WIZARD';
      case AppScreen.editProfile:
        return 'EDIT_PROFILE';
      case AppScreen.activity:
        return 'ACTIVITY';
      case AppScreen.settings:
        return 'SETTINGS';
      case AppScreen.timerRunning:
        return 'TIMER_RUNNING';
    }
  }

}
