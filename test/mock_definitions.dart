import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/util/launch_url.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:mocktail/mocktail.dart';

// BLoCs -----------------------------------------------------------------------

class MockAuthBloc
    extends MockBloc<AuthEvent, AuthState>
    implements AuthBloc {}

class MockProfileBloc
    extends MockBloc<ProfileEvent, ProfileState>
    implements ProfileBloc {}

// Services --------------------------------------------------------------------

class MockServices
  extends Mock
  implements Services {}

class MockCacheManagerService
  extends Mock
  implements CacheManagerService {}

class MockCrashlyticsService
  extends Mock
  implements CrashlyticsService {}

class MockTimerSettingsSharedPrefsService
  extends Mock
  implements TimerSettingsSharedPrefsService {}

class MockOverlayService
  extends Mock
  implements OverlayService {}

class MockAnalyticsService
  extends Mock
  implements AnalyticsService {}

class MockHapticsService
  extends Mock
  implements HapticsService {}

class MockUrlLauncher
  extends Mock
  implements UrlLauncher {}

class MockCacheManager
  extends Mock
  implements BaseCacheManager {}
