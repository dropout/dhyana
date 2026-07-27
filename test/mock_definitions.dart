import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/audio/app_audio_handler.dart';
import 'package:dhyana/core/domain/repository/auth_repository.dart';
import 'package:dhyana/core/presentation/bloc/auth/auth_bloc.dart';
import 'package:dhyana/modules/social/presentation/viewmodel/presence/presence_cubit.dart';
import 'package:dhyana/modules/practice/session/presentation/bloc/session_completed/session_completed_cubit.dart';
import 'package:dhyana/modules/practice/timer/presentation/viewmodel/timer/timer_cubit.dart';
import 'package:dhyana/modules/practice/timer/presentation/viewmodel/timer_settings/timer_settings_cubit.dart';
import 'package:dhyana/modules/practice/timer/presentation/viewmodel/timer_settings_history/timer_settings_history_cubit.dart';
import 'package:dhyana/core/di/repositories.dart';
import 'package:dhyana/core/di/services.dart';
import 'package:dhyana/core/domain/repository/presence_repository.dart';
import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';
import 'package:dhyana/modules/practice/timer/domain/repository/timer_settings_history_repository.dart';
import 'package:dhyana/core/domain/service/analytics_service.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/chanting_audio_service.dart';
import 'package:dhyana/core/domain/service/crashlytics_service.dart';
import 'package:dhyana/core/domain/service/haptics_service.dart';
import 'package:dhyana/core/domain/service/id_generator_service.dart';
import 'package:dhyana/core/domain/service/overlay_service.dart';
import 'package:dhyana/core/domain/service/resource_resolver.dart';
import 'package:dhyana/core/domain/service/shared_preferences_service.dart';
import 'package:dhyana/modules/practice/timer/infrastructure/default_timer_audio_service.dart';
import 'package:dhyana/modules/practice/timer/domain/service/timer_service.dart';
import 'package:dhyana/core/domain/service/wakelock_service.dart';
import 'package:dhyana/core/domain/repository/storage_repository.dart';
import 'package:dhyana/util/launch_url.dart';
import 'package:dhyana/util/timer_event_scheduler.dart';
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
  extends MockCubit<TimerCubitState> 
  implements TimerCubit {}

class MockTimerEventScheduler 
  extends Mock 
  implements TimerEventScheduler {}

class MockSessionCompletedCubit
  extends MockCubit<SessionCompletedState>
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

