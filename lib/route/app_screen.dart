enum AppScreen {
  home,
  login,
  profile,
  profileWizard,
  profileStats,
  editProfile,
  activity,
  settings,
  timerRunning,
  timerSettingsHistory,
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
        return '/profileWizard/:profileId';
      case AppScreen.profileStats:
        return '/profileStats/:profileId';
      case AppScreen.editProfile:
        return '/editProfile';
      case AppScreen.activity:
        return '/activity';
      case AppScreen.settings:
        return '/settings';
      case AppScreen.timerRunning:
        return '/timerRunning';
      case AppScreen.timerSettingsHistory:
        return '/timerSettingsHistory';
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
      case AppScreen.profileStats:
        return 'PROFILE_STATS';
      case AppScreen.editProfile:
        return 'EDIT_PROFILE';
      case AppScreen.activity:
        return 'ACTIVITY';
      case AppScreen.settings:
        return 'SETTINGS';
      case AppScreen.timerRunning:
        return 'TIMER_RUNNING';
      case AppScreen.timerSettingsHistory:
        return 'TIMER_SETTINGS_HISTORY';
    }
  }

}
