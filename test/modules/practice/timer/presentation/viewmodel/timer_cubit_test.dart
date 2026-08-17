import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:clock/clock.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/util/timer_event_scheduler.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_state_entity.dart';
import 'package:dhyana/modules/practice/timer/domain/enum/timer_stage.dart';
import 'package:dhyana/modules/practice/timer/domain/enum/timer_status.dart';
import 'package:dhyana/modules/practice/timer/presentation/viewmodel/timer_cubit.dart';
import 'package:dhyana/modules/practice/timer/timer_module.dart';
import 'package:dhyana/core/infrastructure/platform/logging_crashlytics_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mock_definitions.dart' hide MockTimerAudioService;
import '../../timer_mock_definitions.dart';

void main() async {
  group('TimerAudioServiceElapsedTimeSource', () {
    late MockTimerAudioService mockAudioService;
    late TimerAudioServiceElapsedTimeSource elapsedTimeSource;

    setUp(() {
      mockAudioService = MockTimerAudioService();
      elapsedTimeSource = TimerAudioServiceElapsedTimeSource(mockAudioService);
    });

    test('emits elapsed time based on audio service playback state', () async {
      final StreamController<PlaybackState> playbackStateStreamController =
          StreamController<PlaybackState>();

      when(
        () => mockAudioService.playbackStateStream,
      ).thenAnswer((_) => playbackStateStreamController.stream);

      final List<Duration> emittedDurations = [];
      final subscription = elapsedTimeSource.elapsedTimeStream.listen(
        emittedDurations.add,
      );

      // Emit a playback state with position 5 seconds
      playbackStateStreamController.add(
        PlaybackState(updatePosition: Duration(seconds: 5)),
      );

      // Emit another playback state with position 10 seconds
      playbackStateStreamController.add(
        PlaybackState(updatePosition: Duration(seconds: 10)),
      );

      await Future.delayed(Duration.zero); // Allow stream to process

      expect(emittedDurations, [Duration(seconds: 5), Duration(seconds: 10)]);

      await subscription.cancel();
      await playbackStateStreamController.close();
    });
  });

  group('TimerCubit', () {
    final DateTime fixedTime = clock.now();

    late TimerSettings defaultTimerSettings;
    late MockTimerAudioService mockAudioService;
    late MockGoRouter mockRouter;
    late MockConfigureEventSchedulerUseCase mockConfigureEventSchedulerUseCase;
    late MockStartTimerUseCase mockStartTimerUseCase;
    late MockPlaybackStateChangeUseCase mockPlaybackStateChangeUseCase;
    late MockCompleteTimerUseCase mockCompleteTimerUseCase;
    late TimerEventScheduler eventScheduler;
    late CrashlyticsService loggingCrashlyticsService;

    late StreamController<PlaybackState> playbackStateStreamController;

    TimerCubit createTimerCubit({TimerSettings? timerSettings}) => TimerCubit(
      timerSettings: timerSettings ?? defaultTimerSettings,
      audioService: mockAudioService,
      eventScheduler: eventScheduler,
      router: mockRouter,
      crashlyticsService: loggingCrashlyticsService,
      configureEventSchedulerUseCase: mockConfigureEventSchedulerUseCase,
      startTimerUseCase: mockStartTimerUseCase,
      playbackStateChangeUseCase: mockPlaybackStateChangeUseCase,
      completeTimerUseCase: mockCompleteTimerUseCase,
    );

    setUpAll(() {
      defaultTimerSettings = TimerSettings();
      registerFallbackValue(TimerSettings());
      playbackStateStreamController =
          StreamController<PlaybackState>.broadcast();

      registerFallbackValue(  
        TimerStateEntity(
          timerSettings: TimerSettings(),
          timerStatus: TimerStatus.idle,
          timerStage: TimerStage.warmup,
          elapsedWarmupTime: Duration.zero,
          elapsedTime: Duration.zero,
        ),
      );

      registerFallbackValue(PlaybackState());
    });

    setUp(() {
      mockAudioService = MockTimerAudioService();
      loggingCrashlyticsService = LoggingCrashlyticsService();
      eventScheduler = TimerEventScheduler(
        source: TimerAudioServiceElapsedTimeSource(mockAudioService),
      );

      mockRouter = MockGoRouter();
      mockConfigureEventSchedulerUseCase = MockConfigureEventSchedulerUseCase();
      mockStartTimerUseCase = MockStartTimerUseCase();
      mockPlaybackStateChangeUseCase = MockPlaybackStateChangeUseCase();
      mockCompleteTimerUseCase = MockCompleteTimerUseCase();

      when(
        () => mockAudioService.playbackStateStream,
      ).thenAnswer((_) => playbackStateStreamController.stream);

      when(() => mockAudioService.stop()).thenAnswer((_) => Future.value(null));
    });

    tearDownAll(() {
      playbackStateStreamController.close();
    });

    test('can be created with its default values', () async {
      final timerCubit = createTimerCubit();

      expect(timerCubit.state, isA<TimerStateEntity>());
      expect(timerCubit.state.timerSettings, defaultTimerSettings);
      expect(timerCubit.state.timerStatus, TimerStatus.idle);
      expect(timerCubit.state.elapsedTime, Duration.zero);

      verify(
        () => mockConfigureEventSchedulerUseCase.execute(
          timerSettings: defaultTimerSettings,
          onWarmupCompleted: any(named: 'onWarmupCompleted'),
          onInterval: any(named: 'onInterval'),
          onTimerCompleted: any(named: 'onTimerCompleted'),
        ),
      ).called(1);

      // close the cubit to clean up resources
      await timerCubit.close();
    });

    test('can close resources', () async {
      final timerCubit = createTimerCubit();

      await timerCubit.close();

      expect(playbackStateStreamController.hasListener, false);

      expect(eventScheduler.hasListeners, false);
      expect(eventScheduler.isRunning, false);
      expect(eventScheduler.listenerCount, 0);

      verify(() => mockAudioService.stop()).called(1);
    });

    blocTest<TimerCubit, TimerStateEntity>(
      'can start a timer session',
      build: () {
        final timerCubit = createTimerCubit();

        when(() => mockStartTimerUseCase.execute(timerCubit.state)).thenAnswer(
          (_) async => TimerStateEntity(
            timerSettings: defaultTimerSettings,
            timerStatus: TimerStatus.running,
            timerStage: TimerStage.warmup,
            elapsedWarmupTime: Duration.zero,
            elapsedTime: Duration.zero,
            startTime: fixedTime,
          ),
        );

        return timerCubit;
      },
      act: (cubit) async {
        await withClock(Clock.fixed(fixedTime), () async {
          await cubit.start();
        });
      },
      expect: () => [
        TimerStateEntity(
          timerSettings: defaultTimerSettings,
          timerStatus: TimerStatus.running,
          timerStage: TimerStage.warmup,
          elapsedWarmupTime: Duration.zero,
          elapsedTime: Duration.zero,
          startTime: fixedTime,
        ),
      ],
      verify: (cubit) {
        verify(
          () => mockStartTimerUseCase.execute(
            TimerStateEntity(
              timerSettings: defaultTimerSettings,
              timerStatus: TimerStatus.idle,
              timerStage: TimerStage.warmup,
              elapsedWarmupTime: Duration.zero,
              elapsedTime: Duration.zero,
            ),
          ),
        ).called(1);
      },
    );

    blocTest<TimerCubit, TimerStateEntity>(
      'can pause',
      build: () {
        when(
          () => mockAudioService.pause(),
        ).thenAnswer((_) => Future.value(null));
        final timerCubit = createTimerCubit();
        return timerCubit;
      },
      act: (cubit) async {
        cubit.pause();
      },
      expect: () => [],
      verify: (timerCubit) {
        verifyInOrder([() => mockAudioService.pause()]);
      },
    );

    blocTest<TimerCubit, TimerStateEntity>(
      'can resume',
      build: () {
        when(
          () => mockAudioService.resume(),
        ).thenAnswer((_) => Future.value(null));
        final timerCubit = createTimerCubit();
        return timerCubit;
      },
      act: (cubit) async {
        cubit.resume();
      },
      expect: () => [],
      verify: (timerCubit) {
        verifyInOrder([() => mockAudioService.resume()]);
      },
    );

    blocTest<TimerCubit, TimerStateEntity>(
      'can finish timer',
      build: () {
        when(
          () => mockAudioService.stop(),
        ).thenAnswer((_) => Future.value(null));

        final timerCubit = createTimerCubit();
        return timerCubit;
      },
      act: (cubit) async {
        withClock(Clock.fixed(fixedTime), () {
          cubit.finish();
        });
      },
      expect: () => [
        TimerStateEntity(
          timerSettings: defaultTimerSettings,
          timerStatus: TimerStatus.completed,
          timerStage: TimerStage.warmup,
          elapsedWarmupTime: Duration.zero,
          elapsedTime: Duration.zero,
          endTime: fixedTime,
        ),
      ],
      verify: (timerCubit) {
        verifyInOrder([() => mockAudioService.stop()]);
        verifyInOrder([() => eventScheduler.stop()]);
      },
    );

    blocTest<TimerCubit, TimerStateEntity>(
      'can handle playbackstate change when not yet started',
      build: () {
        final timerCubit = createTimerCubit();
        return timerCubit;
      },
      act: (cubit) async {
        playbackStateStreamController.add(
          PlaybackState(
            processingState: AudioProcessingState.ready,
            playing: true,
            updateTime: fixedTime,
          ),
        );
        await Future.delayed(Duration.zero); // allow stream to process
      },
      expect: () => [],
      verify: (timerCubit) {
        verifyNever(() => mockPlaybackStateChangeUseCase.execute(any(), any()));
      },
    );

    blocTest<TimerCubit, TimerStateEntity>(
      'can handle playbackstate change when already started',
      build: () {
        final timerCubit = createTimerCubit();
        return timerCubit;
      },
      act: (cubit) async {
        playbackStateStreamController.add(
          PlaybackState(
            processingState: AudioProcessingState.ready,
            playing: true,
            updateTime: fixedTime,
          ),
        );
        await Future.delayed(Duration.zero); // allow stream to process
      },
      expect: () => [],
      verify: (timerCubit) {
        verifyNever(() => mockPlaybackStateChangeUseCase.execute(any(), any()));
      },
    );    

    blocTest<TimerCubit, TimerStateEntity>(
      'can handle playbackstate change when completed',
      build: () {
        return createTimerCubit();
      },
      act: (cubit) async {
        await withClock(Clock.fixed(fixedTime), () async {
          cubit.finish();

          playbackStateStreamController.add(
            PlaybackState(
              processingState: AudioProcessingState.ready,
              playing: true,
              updateTime: fixedTime,
            ),
          );
          await Future.delayed(Duration.zero); // allow stream to process
        });

      },
      expect: () => [
        TimerStateEntity(
          timerSettings: defaultTimerSettings,
          timerStatus: TimerStatus.completed,
          timerStage: TimerStage.warmup,
          elapsedWarmupTime: Duration.zero,
          elapsedTime: Duration.zero,
          endTime: fixedTime,
        ),
      ],
      verify: (timerCubit) {
        verifyNever(() => mockPlaybackStateChangeUseCase.execute(any(), any()));
      },
    );

  });
  // eof group
} // eof main
