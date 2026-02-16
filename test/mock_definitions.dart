import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/util/launch_url.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class MockGoRouter extends Mock implements GoRouter {}

// BLoCs & Cubits --------------------------------------------------------------

class MockAuthCubit
  extends MockCubit<AuthState>
  implements AuthCubit {}

class MockProfileCubit
  extends MockCubit<ProfileState>
  implements ProfileCubit {}

class MockTimerSettingsCubit
  extends MockCubit<TimerSettingsState>
  implements TimerSettingsCubit {}

class MockTimerSettingsHistoryCubit
  extends MockCubit<TimerSettingsHistoryState>
  implements TimerSettingsHistoryCubit {}

class MockPresenceBloc
  extends MockCubit<PresenceState>
  implements PresenceCubit {}

class MockTimerBloc
  extends MockBloc<TimerEvent, TimerState>
  implements TimerBloc {}

class MockSessionCompletedCubit
  extends MockCubit<SessionCompletedState>
  implements SessionCompletedCubit {}

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

class MockWakelockService
  extends Mock
  implements WakelockService {}

class MockIdGeneratorService
  extends Mock
  implements IdGeneratorService {}

class MockProfileStatsUpdater
  extends Mock
  implements ProfileStatsReportUpdater {}

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

class MockStatisticsRepository
  extends Mock
  implements StatisticsRepository {}

class MockSettingsRepository
  extends Mock
  implements SettingsRepository {}
