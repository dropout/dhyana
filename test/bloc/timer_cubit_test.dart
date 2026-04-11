import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:clock/clock.dart';
import 'package:dhyana/bloc/timer/timer_cubit.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/model/factory/timer_settings_factory.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/service/logging_crashlytics_service.dart';
import 'package:dhyana/util/timer_event_scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock_definitions.dart';

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

    // late TimerCubit timerCubit;
    late TimerSettings defaultTimerSettings;
    late MockTimerAudioService mockAudioService;
    late TimerEventScheduler eventScheduler;
    late CrashlyticsService loggingCrashlyticsService;

    late StreamController<PlaybackState> playbackStateStreamController;

    setUpAll(() {
      defaultTimerSettings = TimerSettingsFactory.withUuid();
      playbackStateStreamController =
        StreamController<PlaybackState>.broadcast();
    });

    setUp(() {
      mockAudioService = MockTimerAudioService();
      loggingCrashlyticsService = LoggingCrashlyticsService();
      eventScheduler = TimerEventScheduler(
        source: TimerAudioServiceElapsedTimeSource(mockAudioService),
      );

      when(
        () => mockAudioService.playbackStateStream,
      ).thenAnswer((_) => playbackStateStreamController.stream);

      when(
        () => mockAudioService.release(),
      ).thenAnswer((_) => Future.value(null));
    });

    tearDownAll(() {
      playbackStateStreamController.close();
    });

    test('can be created with its default values', () async {
      final timerCubit = TimerCubit(
        timerSettings: defaultTimerSettings,
        audioService: mockAudioService,
        eventScheduler: eventScheduler,
        crashlyticsService: loggingCrashlyticsService,
      );

      expect(timerCubit.state, isA<TimerCubitState>());
      expect(timerCubit.state.timerSettings, defaultTimerSettings);
      expect(timerCubit.state.timerStatus, TimerStatus.idle);
      expect(timerCubit.state.elapsedTime, Duration.zero);
      expect(eventScheduler.hasListeners, true);
      expect(eventScheduler.isRunning, false);
      expect(eventScheduler.listenerCount, 1);

      // close the cubit to clean up resources and avoid affecting other tests
      await timerCubit.close();
    });

    test('can close resources', () async {
      final timerCubit = TimerCubit(
        timerSettings: defaultTimerSettings,
        eventScheduler: eventScheduler,
        audioService: mockAudioService,
        crashlyticsService: loggingCrashlyticsService,
      );

      await timerCubit.close();

      expect(playbackStateStreamController.hasListener, false);

      expect(eventScheduler.hasListeners, false);
      expect(eventScheduler.isRunning, false);
      expect(eventScheduler.listenerCount, 0);

      verify(() => mockAudioService.release()).called(1);
    });

    blocTest<TimerCubit, TimerCubitState>(
      'can start a timer session when there is a warmup time',
      build: () {
        when(
          () => mockAudioService.setupSession(defaultTimerSettings),
        ).thenAnswer((_) => Future.value(null));
        when(
          () => mockAudioService.start(),
        ).thenAnswer((_) => Future.value(null));

        final timerCubit = TimerCubit(
          timerSettings: defaultTimerSettings,
          eventScheduler: eventScheduler,
          audioService: mockAudioService,
          crashlyticsService: loggingCrashlyticsService,
        );
        return timerCubit;
      },
      act: (cubit) async {
        await withClock(Clock.fixed(fixedTime), () async {
          await cubit.start();

          // assert in act because in verify the cubit is already closed
          expect(eventScheduler.hasListeners, true);
          expect(eventScheduler.isRunning, true);

          // 1 for timer completed, 1 for warmup completed
          expect(eventScheduler.listenerCount, 2);
        });
      },
      expect: () => [
        TimerCubitState(
          timerSettings: defaultTimerSettings,
          timerStatus: TimerStatus.running,
          timerStage: TimerStage.warmup,
          elapsedWarmupTime: Duration.zero,
          elapsedTime: Duration.zero,
          startTime: fixedTime,
        ),
      ],
      verify: (cubit) {
        verifyInOrder([
          () => mockAudioService.setupSession(cubit.state.timerSettings),
          () => mockAudioService.start(),
        ]);
      },
    );

    blocTest<TimerCubit, TimerCubitState>(
      'start handles error when setupSession throws',
      build: () {
        when(
          () => mockAudioService.setupSession(defaultTimerSettings),
        ).thenThrow(Exception('setup failed'));

        final timerCubit = TimerCubit(
          timerSettings: defaultTimerSettings,
          eventScheduler: eventScheduler,
          audioService: mockAudioService,
          crashlyticsService: loggingCrashlyticsService,
        );
        return timerCubit;
      },
      act: (cubit) async {
        await withClock(Clock.fixed(fixedTime), () async {
          await cubit.start();

          expect(eventScheduler.hasListeners, true);
          expect(eventScheduler.isRunning, false);
          // one for timer completed
          expect(eventScheduler.listenerCount, 1);
        });
      },
      expect: () => <TimerCubitState>[
        TimerCubitState(
          timerSettings: defaultTimerSettings,
          timerStatus: TimerStatus.error,
          timerStage: TimerStage.warmup,
          elapsedWarmupTime: Duration.zero,
          elapsedTime: Duration.zero,
        ),
      ],
      verify: (timerCubit) {
        verify(
          () => mockAudioService.setupSession(defaultTimerSettings),
        ).called(1);
        verifyNever(() => mockAudioService.start());

        expect(timerCubit.state.timerStatus, TimerStatus.error);
      },
    );

    blocTest<TimerCubit, TimerCubitState>(
      'can start a timer session when there is no warmup time',
      build: () {
        when(
          () => mockAudioService.setupSession(
            defaultTimerSettings.copyWith(warmup: Duration.zero),
          ),
        ).thenAnswer((_) => Future.value(null));
        when(
          () => mockAudioService.start(),
        ).thenAnswer((_) => Future.value(null));
        when(
          () => mockAudioService.playSound(defaultTimerSettings.startingSound),
        ).thenAnswer((_) => Future.value(null));

        final timerCubit = TimerCubit(
          timerSettings: defaultTimerSettings.copyWith(warmup: Duration.zero),
          eventScheduler: eventScheduler,
          audioService: mockAudioService,
          crashlyticsService: loggingCrashlyticsService,
        );
        return timerCubit;
      },
      act: (cubit) async {
        await withClock(Clock.fixed(fixedTime), () async {
          await cubit.start();
        });
      },
      expect: () => [
        TimerCubitState(
          timerSettings: defaultTimerSettings.copyWith(warmup: Duration.zero),
          timerStatus: TimerStatus.running,
          timerStage: TimerStage.timer,
          elapsedWarmupTime: Duration.zero,
          elapsedTime: Duration.zero,
          startTime: fixedTime,
        ),
      ],
      verify: (timerCubit) {
        verifyInOrder([
          () => mockAudioService.setupSession(
            defaultTimerSettings.copyWith(warmup: Duration.zero),
          ),
          () => mockAudioService.start(),
          () => mockAudioService.playSound(defaultTimerSettings.startingSound),
        ]);
      },
    );

    blocTest<TimerCubit, TimerCubitState>(
      'can pause',
      build: () {
        when(
          () => mockAudioService.pause(),
        ).thenAnswer((_) => Future.value(null));
        final timerCubit = TimerCubit(
          timerSettings: defaultTimerSettings,
          eventScheduler: eventScheduler,
          audioService: mockAudioService,
          crashlyticsService: loggingCrashlyticsService,
        );
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

    blocTest<TimerCubit, TimerCubitState>(
      'can resume',
      build: () {
        when(
          () => mockAudioService.resume(),
        ).thenAnswer((_) => Future.value(null));
        final timerCubit = TimerCubit(
          timerSettings: defaultTimerSettings,
          eventScheduler: eventScheduler,
          audioService: mockAudioService,
          crashlyticsService: loggingCrashlyticsService,
        );
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

    blocTest<TimerCubit, TimerCubitState>(
      'can finish timer',
      build: () {
        when(
          () => mockAudioService.stop(),
        ).thenAnswer((_) => Future.value(null));

        final timerCubit = TimerCubit(
          timerSettings: defaultTimerSettings,
          eventScheduler: eventScheduler,
          audioService: mockAudioService,
          crashlyticsService: loggingCrashlyticsService,
        );
        return timerCubit;
      },
      act: (cubit) async {
        withClock(Clock.fixed(fixedTime), () {
          cubit.finish();
        });
      },
      expect: () => [
        TimerCubitState(
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
      },
    );

    blocTest<TimerCubit, TimerCubitState>(
      'can handle playbackstate change with idle processing state',
      build: () {
        final timerCubit = TimerCubit(
          timerSettings: defaultTimerSettings,
          eventScheduler: eventScheduler,
          audioService: mockAudioService,
          crashlyticsService: loggingCrashlyticsService,
        );
        return timerCubit;
      },
      act: (cubit) async {
        playbackStateStreamController.add(
          PlaybackState(processingState: AudioProcessingState.idle),
        );
        await Future.delayed(Duration.zero); // allow stream to process
      },
      expect: () => [
        TimerCubitState(
          timerSettings: defaultTimerSettings,
          timerStatus: TimerStatus.idle,
          timerStage: TimerStage.warmup,
          elapsedWarmupTime: Duration.zero,
          elapsedTime: Duration.zero,
        ),
      ],
      verify: (timerCubit) {},
    );

    blocTest<TimerCubit, TimerCubitState>(
      'can handle playbackstate change when processing state is not idle and playing is true',
      build: () {
        final timerCubit = TimerCubit(
          timerSettings: defaultTimerSettings,
          eventScheduler: eventScheduler,
          audioService: mockAudioService,
          crashlyticsService: loggingCrashlyticsService,
        );
        return timerCubit;
      },
      act: (cubit) async {
        playbackStateStreamController.add(
          PlaybackState(
            processingState: AudioProcessingState.ready,
            playing: true,
          ),
        );
      },
      expect: () => [
        TimerCubitState(
          timerSettings: defaultTimerSettings,
          timerStatus: TimerStatus.running,
          timerStage: TimerStage.warmup,
          elapsedWarmupTime: Duration.zero,
          elapsedTime: Duration.zero,
        ),
      ],
      verify: (cubit) {},
    );

    // It seems like its impossible to assert for exact state because of how
    // the position is calculated in the audio_service package
    // PlaybackState implementation
    blocTest<TimerCubit, TimerCubitState>(
      'can measure elapsed warmup time correctly in warmup stage',
      build: () {
        when(
          () => mockAudioService.setupSession(defaultTimerSettings),
        ).thenAnswer((_) => Future.value(null));
        when(
          () => mockAudioService.start(),
        ).thenAnswer((_) => Future.value(null));
        when(
          () => mockAudioService.playSound(defaultTimerSettings.startingSound),
        ).thenAnswer((_) => Future.value(null));

        final timerCubit = TimerCubit(
          timerSettings: defaultTimerSettings,
          eventScheduler: eventScheduler,
          audioService: mockAudioService,
          crashlyticsService: loggingCrashlyticsService,
        );
        return timerCubit;
      },
      act: (cubit) => withClock(Clock(() => fixedTime), () async {
        await cubit.start();
        playbackStateStreamController.add(
          PlaybackState(
            processingState: AudioProcessingState.ready,
            playing: true,
            updateTime: fixedTime.add(Duration(seconds: 1)),
            updatePosition: Duration(seconds: 2),
          ),
        );
      }),

      expect: () => [
        // When starting the timer there is a state emitted
        TimerCubitState(
          timerSettings: defaultTimerSettings,
          timerStatus: TimerStatus.running,
          timerStage: TimerStage.warmup,
          elapsedWarmupTime: Duration.zero,
          elapsedTime: Duration.zero,
          startTime: fixedTime,
        ),

        // Emitted when playback state change received and the elapsed time
        // calculated
        isA<TimerCubitState>()
            .having(
              (state) => state.elapsedWarmupTime.inSeconds,
              'elapsedWarmupTime.inSeconds',
              1,
            )
            .having(
              (state) => state.timerStatus,
              'timerStatus',
              TimerStatus.running,
            )
            .having(
              (state) => state.timerStage,
              'timerStage',
              TimerStage.warmup,
            ),
      ],
      verify: (cubit) {},
    );

    blocTest<TimerCubit, TimerCubitState>(
      'can measure elapsed warmup time correctly in timer stage',
      build: () {
        when(
          () => mockAudioService.setupSession(defaultTimerSettings),
        ).thenAnswer((_) => Future.value(null));
        when(
          () => mockAudioService.start(),
        ).thenAnswer((_) => Future.value(null));
        when(
          () => mockAudioService.playSound(defaultTimerSettings.startingSound),
        ).thenAnswer((_) => Future.value(null));

        final timerCubit = TimerCubit(
          timerSettings: defaultTimerSettings,
          eventScheduler: eventScheduler,
          audioService: mockAudioService,
          crashlyticsService: loggingCrashlyticsService,
        );

        return timerCubit;
      },
      act: (cubit) => withClock(Clock(() => fixedTime), () async {
        await cubit.start();

        expect(eventScheduler.hasListeners, true);
        expect(eventScheduler.isRunning, true);
        expect(eventScheduler.listenerCount, 2);

        // Fire the warmup completed listener to move to timer stage
        playbackStateStreamController.add(
          PlaybackState(
            processingState: AudioProcessingState.ready,
            playing: true,
            updatePosition: defaultTimerSettings.warmup,
          ),
        );

        playbackStateStreamController.add(
          PlaybackState(
            processingState: AudioProcessingState.ready,
            playing: true,
            updateTime: fixedTime,
            updatePosition: Duration(seconds: 60 + 5),
          ),
        );
      }),
      expect: () => [
        // When starting the timer there is a state emitted
        TimerCubitState(
          timerSettings: defaultTimerSettings,
          timerStatus: TimerStatus.running,
          timerStage: TimerStage.warmup,
          elapsedWarmupTime: Duration.zero,
          elapsedTime: Duration.zero,
          startTime: fixedTime,
        ),

        // Emitted when playback state change received and the elapsed time
        // calculated in warmup stage
        TimerCubitState(
          timerSettings: defaultTimerSettings,
          timerStatus: TimerStatus.running,
          timerStage: TimerStage.warmup,
          elapsedWarmupTime: defaultTimerSettings.warmup,
          elapsedTime: Duration.zero,
          startTime: fixedTime,
        ),

        // This state is emitted from scheduler when warmup completed listener
        // is fired, transitioning to the timer stage
        TimerCubitState(
          timerSettings: defaultTimerSettings,
          timerStatus: TimerStatus.running,
          timerStage: TimerStage.timer,
          elapsedWarmupTime: defaultTimerSettings.warmup,
          elapsedTime: Duration.zero,
          startTime: fixedTime,
        ),

        // This is the result of the second playback state change from act,
        // with position 1 min 5 sec
        isA<TimerCubitState>()
            .having(
              (state) => state.elapsedWarmupTime.inSeconds,
              'elapsedWarmupTime.inSeconds',
              defaultTimerSettings.warmup.inSeconds,
            )
            .having(
              (state) => state.elapsedTime.inSeconds,
              'elapsedTime.inSeconds',
              5,
            )
            .having(
              (state) => state.timerStatus,
              'timerStatus',
              TimerStatus.running,
            )
            .having(
              (state) => state.timerStage,
              'timerStage',
              TimerStage.timer,
            ),
      ],
      verify: (timerCubit) {
        verify(
          () => mockAudioService.playSound(defaultTimerSettings.startingSound),
        ).called(1);
      },
    );

    blocTest<TimerCubit, TimerCubitState>(
      'can handle timer completed',
      build: () {
        when(
          () => mockAudioService.setupSession(defaultTimerSettings),
        ).thenAnswer((_) => Future.value(null));
        when(
          () => mockAudioService.start(),
        ).thenAnswer((_) => Future.value(null));
        when(
          () => mockAudioService.playSound(defaultTimerSettings.endingSound),
        ).thenAnswer((_) => Future.value(null));

        final timerCubit = TimerCubit(
          timerSettings: defaultTimerSettings,
          eventScheduler: eventScheduler,
          audioService: mockAudioService,
          crashlyticsService: loggingCrashlyticsService,
        );
        return timerCubit;
      },
      act: (cubit) => withClock(Clock(() => fixedTime), () async {
        // Fire the timer completed listener
        await cubit.start();

        playbackStateStreamController.add(
          PlaybackState(
            processingState: AudioProcessingState.ready,
            playing: true,
            updatePosition: defaultTimerSettings.totalTime,
          ),
        );
      }),
      expect: () => [
        TimerCubitState(
          timerSettings: defaultTimerSettings,
          timerStatus: TimerStatus.running,
          timerStage: TimerStage.warmup,
          elapsedWarmupTime: Duration.zero,
          elapsedTime: Duration.zero,
          startTime: fixedTime,
        ),
        TimerCubitState(
          timerSettings: defaultTimerSettings,
          timerStatus: TimerStatus.running,
          timerStage: TimerStage.warmup,
          elapsedWarmupTime: defaultTimerSettings.warmup,
          elapsedTime: Duration.zero,
          startTime: fixedTime,
        ),
        TimerCubitState(
          timerSettings: defaultTimerSettings,
          timerStatus: TimerStatus.completed,
          timerStage: TimerStage.warmup,
          elapsedWarmupTime: defaultTimerSettings.warmup,
          elapsedTime: defaultTimerSettings.duration,
          startTime: fixedTime,
          endTime: fixedTime,
        ),
        TimerCubitState(
          timerSettings: defaultTimerSettings,
          timerStatus: TimerStatus.completed,
          timerStage: TimerStage.timer,
          elapsedWarmupTime: defaultTimerSettings.warmup,
          elapsedTime: defaultTimerSettings.duration,
          startTime: fixedTime,
          endTime: fixedTime,
        ),
      ],
      verify: (timerCubit) {
        verifyInOrder([
          () => mockAudioService.playSound(defaultTimerSettings.startingSound),
          () => mockAudioService.playSound(defaultTimerSettings.endingSound),          
        ]);
      },
    );


  }); // eof group
} // eof main
