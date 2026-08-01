import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/core/audio/app_audio_handler.dart';
import 'package:dhyana/core/service/auth_service.dart';
import 'package:dhyana/core/service/insights_service.dart';
import 'package:dhyana/core/service/mindful_minutes_service.dart';
import 'package:dhyana/core/service/profile_service.dart';
import 'package:dhyana/modules/auth/domain/repository/auth_repository.dart';
import 'package:dhyana/modules/profile/domain/service/profile_stats_updater_service.dart';
import 'package:dhyana/core/presentation/viewmodel/auth_cubit.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session_completed_data.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_state.dart';
import 'package:dhyana/modules/social/presentation/viewmodel/presence/presence_cubit.dart';
import 'package:dhyana/modules/practice/session/presentation/viewmodel/session_completed/session_completed_cubit.dart';
import 'package:dhyana/modules/practice/timer/presentation/viewmodel/timer/timer_cubit.dart';
import 'package:dhyana/core/presentation/viewmodel/timer_settings_cubit.dart';
import 'package:dhyana/modules/practice/timer/presentation/viewmodel/timer_settings_history/timer_settings_history_cubit.dart';
import 'package:dhyana/core/di/repositories.dart';
import 'package:dhyana/core/di/services.dart';
import 'package:dhyana/modules/social/domain/repository/presence_repository.dart';
import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';
import 'package:dhyana/modules/practice/timer/domain/repository/timer_settings_history_repository.dart';
import 'package:dhyana/core/service/analytics_service.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/chanting_audio_service.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/service/haptics_service.dart';
import 'package:dhyana/core/service/id_generator_service.dart';
import 'package:dhyana/core/service/overlay_service.dart';
import 'package:dhyana/core/service/resource_resolver.dart';
import 'package:dhyana/core/service/shared_preferences_service.dart';
import 'package:dhyana/modules/practice/timer/data/service/default_timer_audio_service.dart';
import 'package:dhyana/modules/practice/timer/domain/service/timer_service.dart';
import 'package:dhyana/core/service/wakelock_service.dart';
import 'package:dhyana/core/domain/repository/storage_repository.dart';
import 'package:dhyana/core/util/launch_url.dart';
import 'package:dhyana/core/util/timer_event_scheduler.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

export 'modules/profile/profile_mock_definitions.dart';

class MockGoRouter extends Mock implements GoRouter {}

// BLoCs & Cubits --------------------------------------------------------------

class MockAuthCubit
  extends MockCubit<AuthState>
  implements AuthCubit {}

class MockTimerSettingsCubit
  extends MockCubit<TimerSettingsState>
  implements TimerSettingsCubit {}

class MockTimerSettingsHistoryCubit
  extends MockCubit<TimerSettingsHistoryState>
  implements TimerSettingsHistoryCubit {}

class MockPresenceBloc
  extends MockCubit<PresenceState>
  implements PresenceCubit {}

class MockTimerCubit
  extends MockCubit<TimerState> 
  implements TimerCubit {}

class MockTimerEventScheduler 
  extends Mock 
  implements TimerEventScheduler {}

class MockSessionCompletedCubit
  extends MockCubit<SessionCompletedData>
  implements SessionCompletedCubit {}

// Services --------------------------------------------------------------------

class MockServices
  extends Mock
  implements Services {}

class MockCacheManager
  extends Mock
  implements BaseCacheManager {}

class MockCrashlyticsService
  extends Mock
  implements CrashlyticsService {}

class MockSharedPreferencesService
  extends Mock
  implements SharedPreferencesService {}

class MockOverlayService
  extends Mock
  implements OverlayService {}

class MockAnalyticsService
  extends Mock
  implements AnalyticsService {}

class MockHapticsService
  extends Mock
  implements HapticsService {}

class MockAppAudioHandler
  extends Mock
  implements AppAudioHandler {}

class MockTimerAudioService
  extends Mock
  implements DefaultTimerAudioService {}

class MockChantingAudioService
  extends Mock
  implements ChantingAudioService {}

class MockUrlLauncher
  extends Mock
  implements UrlLauncher {}

class MockWakelockService
  extends Mock
  implements WakelockService {}

class MockIdGeneratorService
  extends Mock
  implements IdGeneratorService {}

class MockTimerService
  extends Mock
  implements TimerService {}

class MockResourceResolver
  extends Mock
  implements ResourceResolver {}

class MockProfileStatsUpdaterService
  extends Mock
  implements ProfileStatsUpdaterService {}

class MockProfileService  
  extends Mock
  implements ProfileService {}

class MockAuthService
  extends Mock
  implements AuthService {}

class MockInsightsService
  extends Mock
  implements InsightsService {}

class MockMindfulMinutesService
  extends Mock
  implements MindfulMinutesService {}

// Repositories ----------------------------------------------------------------

class MockRepositories
  extends Mock
  implements Repositories {}

class MockPresenceRepository
  extends Mock
  implements PresenceRepository {}

class MockTimerSettingsHistoryRepository
  extends Mock
  implements TimerSettingsHistoryRepository {}

class MockStatisticsRepository
  extends Mock
  implements StatisticsRepository {}

class MockAuthRepository 
  extends Mock 
  implements AuthRepository {}

class MockStorageRepository
  extends Mock
  implements StorageRepository {}

