import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:core/core.dart';
import 'package:timer/src/domain/entity/timer_settings_entity.dart';
import 'package:timer/src/domain/entity/timer_state_entity.dart';
import 'package:timer/src/domain/enum/timer_stage.dart';
import 'package:timer/src/domain/enum/timer_status.dart';
import 'package:timer/src/domain/usecase/start_timer_use_case.dart';

import '../timer_mock_definitions.dart';

void main() {
  late MockAuthPublicApi authPublicApi;
  late MockProfilePublicApi profilePublicApi;
  late MockSocialPublicApi socialPublicApi;
  late MockTimerAudioService timerAudioService;
  late MockTimerEventScheduler eventScheduler;
  late MockTimerSettingsHistoryRepository timerSettingsHistoryRepository;
  late MockCrashlyticsService crashlyticsService;
  late StartTimerUseCase useCase;

  setUpAll(() {
    registerFallbackValue(const TimerSettingsEntity());
    registerFallbackValue(Sound.none);
  });

  setUp(() {
    authPublicApi = MockAuthPublicApi();
    profilePublicApi = MockProfilePublicApi();
    socialPublicApi = MockSocialPublicApi();
    timerAudioService = MockTimerAudioService();
    eventScheduler = MockTimerEventScheduler();
    timerSettingsHistoryRepository = MockTimerSettingsHistoryRepository();
    crashlyticsService = MockCrashlyticsService();

    useCase = StartTimerUseCase(
      authPublicApi: authPublicApi,
      profilePublicApi: profilePublicApi,
      socialPublicApi: socialPublicApi,
      timerAudioService: timerAudioService,
      eventScheduler: eventScheduler,
      timerSettingsHistoryRepository: timerSettingsHistoryRepository,
      crashlyticsService: crashlyticsService,
    );

    when(() => timerAudioService.start(any())).thenAnswer((_) => Future.value());
    when(() => timerAudioService.playSound(any())).thenAnswer((_) => Future.value());
    when(
      () => timerSettingsHistoryRepository.recordTimerSettingsHistory(any(), any()),
    ).thenAnswer((_) async {});
    when(
      () => socialPublicApi.showPresence(
        profileId: any(named: 'profileId'),
        firstName: any(named: 'firstName'),
        lastName: any(named: 'lastName'),
        photoBlurhash: any(named: 'photoBlurhash'),
        location: any(named: 'location'),
        startedAt: any(named: 'startedAt'),
      ),
    ).thenAnswer((_) async {});
  });

  Profile createProfile({bool usePresenceFeature = true}) {
    return Profile(
      id: 'profile-1',
      firstName: 'Ada',
      lastName: 'Lovelace',
      email: 'ada@dhyana.app',
      photoUrl: null,
      photoBlurhash: null,
      settings: ProfileSettings(usePresenceFeature: usePresenceFeature),
      signupDate: DateTime(2026, 1, 1),
      statsReport: const ProfileStatsReport(),
      completed: true,
    );
  }

  TimerStateEntity createState({required TimerSettingsEntity timerSettings}) {
    return TimerStateEntity.initial(timerSettings: timerSettings);
  }

  test('starts the audio service with the current timer settings', () async {
    const timerSettings = TimerSettingsEntity(warmup: Duration(minutes: 1));
    when(() => authPublicApi.authSessionStream).thenAnswer(
      (_) => Stream.value((isAuthenticated: false, userId: null)),
    );

    await useCase.execute(createState(timerSettings: timerSettings));

    verify(() => timerAudioService.start(timerSettings)).called(1);
  });

  test('resets and starts the event scheduler', () async {
    when(() => authPublicApi.authSessionStream).thenAnswer(
      (_) => Stream.value((isAuthenticated: false, userId: null)),
    );

    await useCase.execute(
      createState(timerSettings: const TimerSettingsEntity()),
    );

    verifyInOrder([
      () => eventScheduler.reset(),
      () => eventScheduler.start(),
    ]);
  });

  test('does not play the starting sound immediately when there is a warmup', () async {
    const timerSettings = TimerSettingsEntity(warmup: Duration(minutes: 1));
    when(() => authPublicApi.authSessionStream).thenAnswer(
      (_) => Stream.value((isAuthenticated: false, userId: null)),
    );

    final result = await useCase.execute(
      createState(timerSettings: timerSettings),
    );

    expect(result.timerStage, TimerStage.warmup);
    verifyNever(() => timerAudioService.playSound(timerSettings.startingSound));
  });

  test('plays the starting sound immediately when there is no warmup', () async {
    const timerSettings = TimerSettingsEntity(warmup: Duration.zero);
    when(() => authPublicApi.authSessionStream).thenAnswer(
      (_) => Stream.value((isAuthenticated: false, userId: null)),
    );

    final result = await useCase.execute(
      createState(timerSettings: timerSettings),
    );

    expect(result.timerStage, TimerStage.timer);
    verify(() => timerAudioService.playSound(timerSettings.startingSound)).called(1);
  });

  test('returns the state as running with the start time set', () async {
    final fixedTime = DateTime(2026, 3, 1, 8, 0);
    when(() => authPublicApi.authSessionStream).thenAnswer(
      (_) => Stream.value((isAuthenticated: false, userId: null)),
    );

    final result = await withClock(
      Clock.fixed(fixedTime),
      () => useCase.execute(
        createState(timerSettings: const TimerSettingsEntity()),
      ),
    );

    expect(result.timerStatus, TimerStatus.running);
    expect(result.startTime, fixedTime);
  });

  test('skips history and presence when the user is not authenticated', () async {
    when(() => authPublicApi.authSessionStream).thenAnswer(
      (_) => Stream.value((isAuthenticated: false, userId: null)),
    );

    await useCase.execute(
      createState(timerSettings: const TimerSettingsEntity()),
    );
    await Future.delayed(Duration.zero); // let the fire-and-forget task settle

    verifyNever(
      () => timerSettingsHistoryRepository.recordTimerSettingsHistory(any(), any()),
    );
    verifyNever(
      () => socialPublicApi.showPresence(
        profileId: any(named: 'profileId'),
        firstName: any(named: 'firstName'),
        lastName: any(named: 'lastName'),
        startedAt: any(named: 'startedAt'),
      ),
    );
  });

  test('skips history and presence when authenticated but userId is null', () async {
    when(() => authPublicApi.authSessionStream).thenAnswer(
      (_) => Stream.value((isAuthenticated: true, userId: null)),
    );

    await useCase.execute(
      createState(timerSettings: const TimerSettingsEntity()),
    );
    await Future.delayed(Duration.zero); // let the fire-and-forget task settle

    verifyNever(
      () => timerSettingsHistoryRepository.recordTimerSettingsHistory(any(), any()),
    );
  });

  test('records timer settings history and shows presence when authenticated', () async {
    const timerSettings = TimerSettingsEntity(warmup: Duration.zero);
    final profile = createProfile();

    when(() => authPublicApi.authSessionStream).thenAnswer(
      (_) => Stream.value((isAuthenticated: true, userId: profile.id)),
    );
    when(
      () => profilePublicApi.getProfile(profile.id, preferCache: true),
    ).thenAnswer((_) async => profile);

    await useCase.execute(createState(timerSettings: timerSettings));
    await Future.delayed(Duration.zero); // let the fire-and-forget task settle

    verify(
      () => timerSettingsHistoryRepository.recordTimerSettingsHistory(
        profile.id,
        timerSettings,
      ),
    ).called(1);
    verify(
      () => socialPublicApi.showPresence(
        profileId: profile.id,
        firstName: profile.firstName,
        lastName: profile.lastName,
        photoBlurhash: profile.photoBlurhash,
        location: profile.location,
        startedAt: any(named: 'startedAt'),
      ),
    ).called(1);
  });

  test('records history but skips presence when the presence feature is disabled', () async {
    const timerSettings = TimerSettingsEntity(warmup: Duration.zero);
    final profile = createProfile(usePresenceFeature: false);

    when(() => authPublicApi.authSessionStream).thenAnswer(
      (_) => Stream.value((isAuthenticated: true, userId: profile.id)),
    );
    when(
      () => profilePublicApi.getProfile(profile.id, preferCache: true),
    ).thenAnswer((_) async => profile);

    await useCase.execute(createState(timerSettings: timerSettings));
    await Future.delayed(Duration.zero); // let the fire-and-forget task settle

    verify(
      () => timerSettingsHistoryRepository.recordTimerSettingsHistory(
        profile.id,
        timerSettings,
      ),
    ).called(1);
    verifyNever(
      () => socialPublicApi.showPresence(
        profileId: any(named: 'profileId'),
        firstName: any(named: 'firstName'),
        lastName: any(named: 'lastName'),
        startedAt: any(named: 'startedAt'),
      ),
    );
  });

  test('records the error via crashlytics when the additional tasks throw', () async {
    when(() => authPublicApi.authSessionStream).thenAnswer(
      (_) => Stream.value((isAuthenticated: true, userId: 'profile-1')),
    );
    final exception = Exception('profile lookup failed');
    when(
      () => profilePublicApi.getProfile('profile-1', preferCache: true),
    ).thenThrow(exception);

    await useCase.execute(
      createState(timerSettings: const TimerSettingsEntity()),
    );
    await Future.delayed(Duration.zero); // let the fire-and-forget task settle

    verify(
      () => crashlyticsService.recordError(
        exception: exception,
        stackTrace: any(named: 'stackTrace'),
        reason: any(named: 'reason'),
      ),
    ).called(1);
  });
}
