import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/presence/presence_cubit.dart';
import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/bloc/session_completed/session_completed_cubit.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/bloc/timer_settings/timer_settings_cubit.dart';
import 'package:dhyana/bloc/timer_settings_history/timer_settings_history_cubit.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/repository/presence_repository.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:dhyana/repository/settings_repository.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/repository/timer_settings_history_repository.dart';
import 'package:dhyana/service/analytics_service.dart';
import 'package:dhyana/service/audio_service.dart';
import 'package:dhyana/service/cache_manager_service.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/service/haptics_service.dart';
import 'package:dhyana/service/id_generator_service.dart';
import 'package:dhyana/service/overlay_service.dart';
import 'package:dhyana/service/profile_stats_report_updater.dart';
import 'package:dhyana/service/timer_service.dart';
import 'package:dhyana/service/timer_service_factory.dart';
import 'package:dhyana/service/timer_settings_shared_prefs_service.dart';
import 'package:dhyana/service/wakelock_service.dart';
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

class MockTimerServiceFactory
  extends Mock
  implements TimerServiceFactory {}

class MockTimerService
  extends Mock
  implements TimerService {}

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
