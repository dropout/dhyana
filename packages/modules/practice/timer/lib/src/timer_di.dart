import 'package:dhyana/modules/auth/public/api/auth_public_api.dart';
import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';
import 'package:dhyana/modules/social/public/api/social_public_api.dart';

import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:firebase_provider/firebase_provider.dart';
import 'package:core/core.dart';
import 'package:timer/src/audio/so_timer_audio_handler.dart';
import 'package:timer/src/domain/entity/timer_state_entity.dart';
import 'package:timer/src/public/viewmodel/timer_settings_cubit.dart';
import 'package:timer/src/data/service/default_timer_audio_service.dart';
import 'package:timer/src/data/repository/firebase_timer_settings_history_repository.dart';
import 'package:timer/src/domain/repository/timer_settings_history_repository.dart';
import 'package:timer/src/domain/service/timer_audio_service.dart';
import 'package:timer/src/domain/usecase/complete_timer_use_case.dart';
import 'package:timer/src/domain/usecase/configure_event_scheduler_use_case.dart';
import 'package:timer/src/domain/usecase/playback_state_change_use_case.dart';
import 'package:timer/src/domain/usecase/start_timer_use_case.dart';
import 'package:timer/src/presentation/viewmodel/timer_cubit.dart';
import 'package:timer/src/presentation/viewmodel/timer_settings_history/timer_settings_history_cubit.dart';

extension TimerModuleDependencyInjection on GetIt {
  void registerTimerModuleDependencies() {

    // Audio handler
    registerFactory<SoTimerAudioHandler>(
      () => SoTimerAudioHandler(
        soloud: SoLoud.instance,
      )
    );

    // Repositories
    registerLazySingleton<TimerSettingsHistoryRepository>(
      () => FirebaseTimerSettingsHistoryRepository(
        GetIt.I.get<FirebaseProvider>().firestore,
      ),
    );

    // Services
    registerFactory<DefaultTimerAudioService>(
      () => DefaultTimerAudioService(GetIt.I.get<AppAudioHandler>()),
    );

    // Use Cases
    registerFactoryParam<
      ConfigureEventSchedulerUseCase,
      TimerEventScheduler,
      void
    >((eventScheduler, _) {
      return ConfigureEventSchedulerUseCase(eventScheduler: eventScheduler);
    });

    registerFactoryParam<StartTimerUseCase, TimerEventScheduler, void>((
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

    registerFactoryParam<CompleteTimerUseCase, TimerAudioService, TimerEventScheduler>((
      timerAudioService,
      eventScheduler,    
    ) {
      return CompleteTimerUseCase(
        timerAudioService: timerAudioService,
        eventScheduler: eventScheduler,
        idGeneratorService: GetIt.I.get<IdGeneratorService>(),
      );
    });


    // ViewModels
    // Timer Settings History Cubit
    registerFactory<TimerSettingsHistoryCubit>(() => TimerSettingsHistoryCubit(
      timerSettingsHistoryRepository: GetIt.I.get<TimerSettingsHistoryRepository>(),
      crashlyticsService: GetIt.I.get<CrashlyticsService>(),
    ));

    // Timer Settings Cubit
    registerFactory<TimerSettingsCubit>(() => TimerSettingsCubit(
      crashlyticsService: GetIt.I.get<CrashlyticsService>(),
    ));

    // Timer Cubit with parameterized TimerSettings
    registerFactoryParam<TimerCubit, TimerStateEntity, void>((
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
}
