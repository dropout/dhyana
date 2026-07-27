import 'package:dhyana/audio/app_audio_handler.dart';
import 'package:dhyana/core/domain/service/crashlytics_service.dart';
import 'package:dhyana/core/domain/service/haptics_service.dart';
import 'package:dhyana/modules/practice/timer/data/repository/firebase_timer_settings_history_repository.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings.dart';
import 'package:dhyana/modules/practice/timer/infrastructure/default_timer_audio_service.dart';
import 'package:dhyana/modules/practice/timer/presentation/viewmodel/timer/timer_cubit.dart';
import 'package:dhyana/util/firebase_provider.dart';
import 'package:dhyana/util/timer_event_scheduler.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureTimerModuleDependencies() {
  _configureDataProviders();
  _configureRepositories();
  _configureServices();
  _configureUseCases();
  _configureViewModels();
}

void _configureDataProviders() {

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

}

void _configureViewModels() {
  getIt.registerFactoryParam<TimerCubit, TimerSettings, void>((
    timerSettings,
    _,
  ) {
    final audioService = getIt.get<DefaultTimerAudioService>();
    return TimerCubit(
      timerSettings: timerSettings,
      audioService: audioService,
      hapticsService: getIt.get<HapticsService>(),
      eventScheduler: TimerEventScheduler(
        source: TimerAudioServiceElapsedTimeSource(audioService),
      ),
      crashlyticsService: getIt.get<CrashlyticsService>(),
    );
  });


}
