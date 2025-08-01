import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/repository/all.dart';
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

class MockTimerSettingsHistoryBloc
  extends MockBloc<TimerSettingsHistoryEvent, TimerSettingsHistoryState>
  implements TimerSettingsHistoryBloc {}

class MockPresenceBloc
  extends MockBloc<PresenceEvent, PresenceState>
  implements PresenceBloc {}

// Services --------------------------------------------------------------------

class MockServices
  extends Mock
  implements Services {}

class MockCacheManagerService
  extends Mock
  implements CacheManagerService {}

class MockCacheManager
  extends Mock
  implements BaseCacheManager {}

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

class MockAudioService
  extends Mock
  implements AudioService {}

class MockUrlLauncher
  extends Mock
  implements UrlLauncher {}

// Repositories ----------------------------------------------------------------

class MockRepositories
  extends Mock
  implements Repositories {}

class MockPresenceRepository
  extends Mock
  implements PresenceRepository {}

class MockProfileRepository
  extends Mock
  implements ProfileRepository {}

class MockTimerSettingsHistoryRepository
  extends Mock
  implements TimerSettingsHistoryRepository {}
