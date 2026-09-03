import 'package:auth/auth.dart';

import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:firebase_provider/firebase_provider.dart';
import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:social/social.dart';
import 'package:timer/src/audio/so_timer_audio_handler.dart';
import 'package:timer/src/data/service/default_timer_app_port.dart';
import 'package:timer/src/domain/entity/timer_state_entity.dart';
import 'package:timer/src/domain/service/timer_app_port.dart';
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
      () => DefaultTimerAudioService(get<AppAudioHandler>()),
    );

    registerFactory<TimerAppPort>(
      () => DefaultTimerAppPort(
        authPublicApi: get<AuthPublicApi>(),
        profilePublicApi: get<ProfilePublicApi>(),
        socialPublicApi: get<SocialPublicApi>(),
      ),
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
        timerAppPort: GetIt.I.get<TimerAppPort>(),
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
      timerSettingsHistoryRepository: get<TimerSettingsHistoryRepository>(),
      crashlyticsService: get<CrashlyticsService>(),
    ));

    // Timer Settings Cubit
    registerFactory<TimerSettingsCubit>(() => TimerSettingsCubit(
      crashlyticsService: get<CrashlyticsService>(),
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
        sessionNavigator: get<SessionNavigator>(),
        audioService: audioService,
        eventScheduler: timerEventScheduler,
        router: get<GoRouter>(),
        crashlyticsService: get<CrashlyticsService>(),
        configureEventSchedulerUseCase: ConfigureEventSchedulerUseCase(
          eventScheduler: timerEventScheduler,
        ),
        startTimerUseCase: get<StartTimerUseCase>(
          param1: timerEventScheduler,
        ),
        playbackStateChangeUseCase: PlaybackStateChangeUseCase(),
        completeTimerUseCase: get<CompleteTimerUseCase>(
          param1: audioService,
          param2: timerEventScheduler,
        ),
      );
    });

    
  }
}
