enum AppScreen {
  home,
  login,
  profile,
  editProfile,
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
        return '/profile/';
      case AppScreen.editProfile:
        return '/editProfile';
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
      case AppScreen.editProfile:
        return 'EDIT_PROFILE';
      case AppScreen.settings:
        return 'SETTINGS';
      case AppScreen.timerRunning:
        return 'TIMER_RUNNING';
    }
  }

}
