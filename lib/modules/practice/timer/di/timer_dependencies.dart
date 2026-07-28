import 'package:dhyana/audio/app_audio_handler.dart';
import 'package:dhyana/core/domain/repository/auth_repository.dart';
import 'package:dhyana/core/domain/repository/presence_repository.dart';
import 'package:dhyana/core/domain/service/crashlytics_service.dart';
import 'package:dhyana/core/domain/service/id_generator_service.dart';
import 'package:dhyana/modules/practice/timer/data/repository/firebase_timer_settings_history_repository.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings.dart';
import 'package:dhyana/modules/practice/timer/domain/service/timer_audio_service.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/complete_timer_use_case.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/configure_event_scheduler_use_case.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/playback_state_change_use_case.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/start_timer_use_case.dart';
import 'package:dhyana/modules/practice/timer/infrastructure/default_timer_audio_service.dart';
import 'package:dhyana/modules/practice/timer/presentation/viewmodel/timer/timer_cubit.dart';
import 'package:dhyana/core/domain/repository/profile_repository.dart';
import 'package:dhyana/modules/practice/timer/presentation/viewmodel/timer_settings/timer_settings_cubit.dart';
import 'package:dhyana/util/firebase_provider.dart';
import 'package:dhyana/util/timer_event_scheduler.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final getIt = GetIt.instance;

void configureTimerModuleDependencies() {
  _configureRepositories();
  _configureServices();
  _configureUseCases();
  _configureViewModels();
}

void _configureRepositories() {
  getIt.registerLazySingleton(
    () => FirebaseTimerSettingsHistoryRepository(
      getIt.get<FirebaseProvider>().firestore,
    ),
  );
}

void _configureServices() {
  getIt.registerFactory<DefaultTimerAudioService>(
    () => DefaultTimerAudioService(getIt.get<AppAudioHandler>()),
  );
}

void _configureUseCases() {
  getIt.registerFactoryParam<
    ConfigureEventSchedulerUseCase,
    TimerEventScheduler,
    void
  >((eventScheduler, _) {
    return ConfigureEventSchedulerUseCase(eventScheduler: eventScheduler);
  });

  getIt.registerFactoryParam<StartTimerUseCase, TimerEventScheduler, void>((
    eventScheduler,
    _,
  ) {
    return StartTimerUseCase(
      timerAudioService: getIt.get<DefaultTimerAudioService>(),
      eventScheduler: eventScheduler,
      authRepository: getIt.get<AuthRepository>(),
      timerSettingsHistoryRepository: getIt.get<FirebaseTimerSettingsHistoryRepository>(),
      profileRepository: getIt.get<ProfileRepository>(),
      presenceRepository: getIt.get<PresenceRepository>(),
      crashlyticsService: getIt.get<CrashlyticsService>(),
    );
  });

  getIt.registerFactoryParam<CompleteTimerUseCase, TimerAudioService, TimerEventScheduler>((
    timerAudioService,
    eventScheduler,    
  ) {
    return CompleteTimerUseCase(
      timerAudioService: timerAudioService,
      eventScheduler: eventScheduler,
      idGeneratorService: getIt.get<IdGeneratorService>(),
    );
  });
}

void _configureViewModels() {

  // Timer Settings Cubit
  getIt.registerFactory<TimerSettingsCubit>(() => TimerSettingsCubit(
    crashlyticsService: getIt.get<CrashlyticsService>(),
  ));

  // Timer Cubit with parameterized TimerSettings
  getIt.registerFactoryParam<TimerCubit, TimerSettings, void>((
    timerSettings,
    _,
  ) {
    final audioService = getIt.get<DefaultTimerAudioService>();
    final timerEventScheduler = TimerEventScheduler(
      source: TimerAudioServiceElapsedTimeSource(audioService),
    );
    return TimerCubit(
      timerSettings: timerSettings,
      audioService: audioService,
      eventScheduler: timerEventScheduler,
      router: getIt.get<GoRouter>(),
      crashlyticsService: getIt.get<CrashlyticsService>(),
      configureEventSchedulerUseCase: ConfigureEventSchedulerUseCase(
        eventScheduler: timerEventScheduler,
      ),
      startTimerUseCase: getIt.get<StartTimerUseCase>(
        param1: timerEventScheduler,
      ),
      playbackStateChangeUseCase: PlaybackStateChangeUseCase(),
      completeTimerUseCase: getIt.get<CompleteTimerUseCase>(
        param1: audioService,
        param2: timerEventScheduler,
      ),
    );
  });
}
