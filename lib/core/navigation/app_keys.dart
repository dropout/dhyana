import 'package:flutter/widgets.dart';

sealed class AppWidgetKeys {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
}

sealed class AppSharedPrefsKeys {
  static const timerSettings = 'timer_settings';
}

sealed class AppRemoteConfigKeys {
  static const presenceViewEnabled = 'presence_view_enabled';
}
