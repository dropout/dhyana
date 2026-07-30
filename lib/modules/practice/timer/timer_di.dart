import 'package:dhyana/core/audio/app_audio_handler.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/service/id_generator_service.dart';
import 'package:dhyana/modules/practice/timer/data/datasource/timer_auth_data_provider.dart';
import 'package:dhyana/modules/practice/timer/data/datasource/timer_profile_data_provider.dart';
import 'package:dhyana/modules/practice/timer/data/repository/default_timer_data_repository.dart';
import 'package:dhyana/modules/practice/timer/data/repository/firebase_timer_settings_history_repository.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings.dart';
import 'package:dhyana/modules/practice/timer/domain/repository/timer_settings_history_repository.dart';
import 'package:dhyana/modules/practice/timer/domain/service/timer_audio_service.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/complete_timer_use_case.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/configure_event_scheduler_use_case.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/playback_state_change_use_case.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/start_timer_use_case.dart';
import 'package:dhyana/modules/practice/timer/data/service/default_timer_audio_service.dart';
import 'package:dhyana/modules/practice/timer/presentation/viewmodel/timer/timer_cubit.dart';
import 'package:dhyana/modules/practice/timer/presentation/viewmodel/timer_settings/timer_settings_cubit.dart';
import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/core/util/timer_event_scheduler.dart';
import 'package:dhyana/core/service/presence_service.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

void configureTimerModuleDependencies() {  
  _configureRepositories();
  _configureServices();
  _configureUseCases();
  _configureViewModels();
}

void _configureRepositories() {
  GetIt.I.registerLazySingleton<TimerSettingsHistoryRepository>(
    () => FirebaseTimerSettingsHistoryRepository(
      GetIt.I.get<FirebaseProvider>().firestore,
    ),
  );

  GetIt.I.registerLazySingleton<DefaultTimerDataRepository>(
    () => DefaultTimerDataRepository(
      timerAuthDataProvider: GetIt.I.get<TimerAuthDataProvider>(),
      timerProfileDataProvider: GetIt.I.get<TimerProfileDataProvider>(),
    ),
  );

}

void _configureServices() {
  GetIt.I.registerFactory<DefaultTimerAudioService>(
    () => DefaultTimerAudioService(GetIt.I.get<AppAudioHandler>()),
  );
}

void _configureUseCases() {
  GetIt.I.registerFactoryParam<
    ConfigureEventSchedulerUseCase,
    TimerEventScheduler,
    void
  >((eventScheduler, _) {
    return ConfigureEventSchedulerUseCase(eventScheduler: eventScheduler);
  });

  GetIt.I.registerFactoryParam<StartTimerUseCase, TimerEventScheduler, void>((
    eventScheduler,
    _,
  ) {
    return StartTimerUseCase(
      timerDataRepository: GetIt.I.get<DefaultTimerDataRepository>(),
      timerAudioService: GetIt.I.get<DefaultTimerAudioService>(),
      eventScheduler: eventScheduler,
      timerSettingsHistoryRepository: GetIt.I.get<TimerSettingsHistoryRepository>(),
      presenceService: GetIt.I.get<PresenceService>(),
      crashlyticsService: GetIt.I.get<CrashlyticsService>(),       
    );
  });

  GetIt.I.registerFactoryParam<CompleteTimerUseCase, TimerAudioService, TimerEventScheduler>((
    timerAudioService,
    eventScheduler,    
  ) {
    return CompleteTimerUseCase(
      timerAudioService: timerAudioService,
      eventScheduler: eventScheduler,
      idGeneratorService: GetIt.I.get<IdGeneratorService>(),
    );
  });
}

void _configureViewModels() {

  // Timer Settings Cubit
  GetIt.I.registerFactory<TimerSettingsCubit>(() => TimerSettingsCubit(
    crashlyticsService: GetIt.I.get<CrashlyticsService>(),
  ));

  // Timer Cubit with parameterized TimerSettings
  GetIt.I.registerFactoryParam<TimerCubit, TimerSettings, void>((
    timerSettings,
    _,
  ) {
    final audioService = GetIt.I.get<DefaultTimerAudioService>();
    final timerEventScheduler = TimerEventScheduler(
      source: TimerAudioServiceElapsedTimeSource(audioService),
    );
    return TimerCubit(
      timerSettings: timerSettings,
      audioService: audioService,
      eventScheduler: timerEventScheduler,
      router: GetIt.I.get<GoRouter>(),
      crashlyticsService: GetIt.I.get<CrashlyticsService>(),
      configureEventSchedulerUseCase: ConfigureEventSchedulerUseCase(
        eventScheduler: timerEventScheduler,
      ),
      startTimerUseCase: GetIt.I.get<StartTimerUseCase>(
        param1: timerEventScheduler,
      ),
      playbackStateChangeUseCase: PlaybackStateChangeUseCase(),
      completeTimerUseCase: GetIt.I.get<CompleteTimerUseCase>(
        param1: audioService,
        param2: timerEventScheduler,
      ),
    );
  });
}
