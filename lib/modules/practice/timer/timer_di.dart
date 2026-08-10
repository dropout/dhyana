import 'package:dhyana/modules/auth/public/api/auth_public_api.dart';
import 'package:dhyana/modules/practice/timer/public/viewmodel/timer_settings_cubit.dart';
import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';
import 'package:dhyana/modules/social/public/api/social_public_api.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/core/util/timer_event_scheduler.dart';
import 'package:dhyana/core/audio/app_audio_handler.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/service/id_generator_service.dart';
import 'package:dhyana/modules/practice/timer/timer_module.dart';

import 'package:dhyana/modules/practice/timer/data/service/default_timer_audio_service.dart';
import 'package:dhyana/modules/practice/timer/data/repository/firebase_timer_settings_history_repository.dart';
import 'package:dhyana/modules/practice/timer/domain/repository/timer_settings_history_repository.dart';
import 'package:dhyana/modules/practice/timer/domain/service/timer_audio_service.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/complete_timer_use_case.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/configure_event_scheduler_use_case.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/playback_state_change_use_case.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/start_timer_use_case.dart';
import 'package:dhyana/modules/practice/timer/presentation/viewmodel/timer_cubit.dart';
import 'package:dhyana/modules/practice/timer/presentation/viewmodel/timer_settings_history/timer_settings_history_cubit.dart';

void registerTimerModuleDependencies() {  
  _registerRepositories();
  _registerServices();
  _registerUseCases();
  _registerViewModels();
}

void _registerRepositories() {
  GetIt.I.registerLazySingleton<TimerSettingsHistoryRepository>(
    () => FirebaseTimerSettingsHistoryRepository(
      GetIt.I.get<FirebaseProvider>().firestore,
    ),
  );

}

void _registerServices() {
  GetIt.I.registerFactory<DefaultTimerAudioService>(
    () => DefaultTimerAudioService(GetIt.I.get<AppAudioHandler>()),
  );
}

void _registerUseCases() {
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
      authPublicApi: GetIt.I.get<AuthPublicApi>(),
      profilePublicApi: GetIt.I.get<ProfilePublicApi>(),
      socialPublicApi: GetIt.I.get<SocialPublicApi>(),
      timerAudioService: GetIt.I.get<DefaultTimerAudioService>(),
      eventScheduler: eventScheduler,
      timerSettingsHistoryRepository: GetIt.I.get<TimerSettingsHistoryRepository>(),      
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

void _registerViewModels() {

  // Timer Settings History Cubit
  GetIt.I.registerFactory<TimerSettingsHistoryCubit>(() => TimerSettingsHistoryCubit(
    timerSettingsHistoryRepository: GetIt.I.get<TimerSettingsHistoryRepository>(),
    crashlyticsService: GetIt.I.get<CrashlyticsService>(),
  ));

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
