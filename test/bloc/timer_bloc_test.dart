import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/model/factory/timer_settings_factory.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCrashlyticsService
  extends Mock
  implements CrashlyticsService {}

class MockTimerServiceFactory
  extends Mock
  implements TimerServiceFactory {}

class MockTimerService
  extends Mock
  implements TimerService {}

class MockAudioService
  extends Mock
  implements AudioService {}

void main() async {

  group('TimerBloc', () {

    late StreamController<int> warmupTickerStreamController;
    late StreamController<void> warmupFinishedStreamController;

    late StreamController<int> timerTickerStreamController;
    late StreamController<void> timerFinishedStreamController;

    late TimerBloc timerBloc;
    late TimerSettings defaultTimerSettings;
    late DateTime startTime;
    late MockTimerServiceFactory mockTimerServiceFactory;
    late MockTimerService mockWarmupTimerService;
    late MockTimerService mockTimerService;
    late MockAudioService mockAudioService;
    late MockCrashlyticsService mockCrashlyticsService;

    setUpAll(() {
      registerFallbackValue(Duration.zero);
      registerFallbackValue(Sound.none);
    });

    setUp(() {
      defaultTimerSettings = TimerSettingsFactory.withUuid();
      startTime = DateTime(2024,1,1,0,0,0);

      warmupTickerStreamController = StreamController();
      warmupFinishedStreamController = StreamController(sync: true);

      timerTickerStreamController = StreamController();
      timerFinishedStreamController = StreamController(sync: true);

      mockTimerServiceFactory = MockTimerServiceFactory();
      mockWarmupTimerService = MockTimerService();
      mockTimerService = MockTimerService();
      mockAudioService = MockAudioService();
      mockCrashlyticsService = MockCrashlyticsService();

      when(() => mockAudioService.play(any()))
          .thenAnswer((_) => Future.value(null));

      when(() => mockWarmupTimerService.tickStream)
          .thenAnswer((_) => warmupTickerStreamController.stream);
      when(() => mockWarmupTimerService.finishedStream)
          .thenAnswer((_) => warmupFinishedStreamController.stream);
      when(() => mockWarmupTimerService.elapsedTime)
          .thenReturn(Duration.zero);
      when(() => mockWarmupTimerService.finished)
          .thenReturn(false);

      when(() => mockTimerService.tickStream)
          .thenAnswer((_) => timerTickerStreamController.stream);
      when(() => mockTimerService.finishedStream)
          .thenAnswer((_) => timerFinishedStreamController.stream);
      when(() => mockTimerService.elapsedTime)
          .thenReturn(Duration.zero);
      when(() => mockTimerService.finished)
          .thenReturn(false);
    });

    tearDown(() {
      warmupTickerStreamController.close();
      warmupFinishedStreamController.close();
      timerTickerStreamController.close();
      timerFinishedStreamController.close();
    });

    test('can be created with its default values', () async {
      _stubTimerServiceFactory(
        defaultTimerSettings,
        mockTimerServiceFactory,
        mockWarmupTimerService,
        mockTimerService
      );
      timerBloc = TimerBloc(
        timerSettings: defaultTimerSettings,
        timerServiceFactory: mockTimerServiceFactory,
        audioService: mockAudioService,
        crashlyticsService: mockCrashlyticsService,
      );

      expect(timerTickerStreamController.hasListener, true);
      expect(timerFinishedStreamController.hasListener, true);
      expect(warmupTickerStreamController.hasListener, true);
      expect(warmupFinishedStreamController.hasListener, true);

      expect(timerBloc.state, isA<TimerState>());
      expect(timerBloc.state.timerSettings, defaultTimerSettings);
      expect(timerBloc.state.timerStatus, TimerStatus.idle);
      expect(timerBloc.state.elapsedTime, Duration.zero);
    });

    test('can close resources', () async {
      _stubTimerServiceFactory(
        defaultTimerSettings,
        mockTimerServiceFactory,
        mockWarmupTimerService,
        mockTimerService
      );
      timerBloc = TimerBloc(
        timerSettings: defaultTimerSettings,
        timerServiceFactory: mockTimerServiceFactory,
        audioService: mockAudioService,
        crashlyticsService: mockCrashlyticsService,
      );

      await timerBloc.close();

      expect(timerTickerStreamController.hasListener, false);
      expect(timerFinishedStreamController.hasListener, false);
      expect(warmupTickerStreamController.hasListener, false);
      expect(warmupFinishedStreamController.hasListener, false);
    });

    blocTest<TimerBloc, TimerState>('can start, pause, resume warmup time',
        build: () {
          _stubTimerServiceFactory(
            defaultTimerSettings,
            mockTimerServiceFactory,
            mockWarmupTimerService,
            mockTimerService
          );
          timerBloc = TimerBloc(
            timerSettings: defaultTimerSettings,
            timerServiceFactory: mockTimerServiceFactory,
            audioService: mockAudioService,
            crashlyticsService: mockCrashlyticsService,
          );
          return timerBloc;
        },
        act: (bloc) {
          // start
          when(() => mockWarmupTimerService.startTime)
            .thenReturn(startTime);
          when(() => mockWarmupTimerService.elapsedTime)
            .thenReturn(const Duration(seconds: 0));
          bloc.add(TimerStarted(startTime: startTime));

          // pause
          when(() => mockWarmupTimerService.elapsedTime)
            .thenReturn(const Duration(seconds: 2));
          bloc.add(TimerPaused());

          // resume
          bloc.add(TimerResumed());
        },
        expect: ()  => [
          TimerState(
            timerSettings: timerBloc.timerSettings,
            timerStatus: TimerStatus.running,
            timerStage: TimerStage.warmup,
            elapsedWarmupTime: Duration.zero,
            elapsedTime: Duration.zero,
            startTime: startTime,
          ),
          TimerState(
            timerSettings: timerBloc.timerSettings,
            timerStatus: TimerStatus.paused,
            timerStage: TimerStage.warmup,
            elapsedWarmupTime: const Duration(seconds: 2),
            elapsedTime: Duration.zero,
            startTime: startTime,
          ),
          TimerState(
            timerSettings: defaultTimerSettings,
            timerStatus: TimerStatus.running,
            timerStage: TimerStage.warmup,
            elapsedWarmupTime: const Duration(seconds: 2),
            elapsedTime: Duration.zero,
            startTime: startTime,
          ),
        ],
        verify: (timerBloc) {
          verifyInOrder([
            () => mockWarmupTimerService.start(),
            () => mockWarmupTimerService.stop(),
            () => mockWarmupTimerService.start(),
          ]);
        },
    );

    blocTest<TimerBloc, TimerState>('can finish warmup time',
        build: () {
          _stubTimerServiceFactory(
            defaultTimerSettings,
            mockTimerServiceFactory,
            mockWarmupTimerService,
            mockTimerService
          );
          timerBloc = TimerBloc(
            timerSettings: defaultTimerSettings,
            timerServiceFactory: mockTimerServiceFactory,
            audioService: mockAudioService,
            crashlyticsService: mockCrashlyticsService,
          );
          return timerBloc;
        },
        act: (bloc) {
          when(() => mockWarmupTimerService.startTime)
            .thenReturn(startTime);
          when(() => mockWarmupTimerService.elapsedTime)
            .thenReturn(const Duration(seconds: 0));
          bloc.add(TimerStarted(startTime: startTime));

          when(() => mockWarmupTimerService.elapsedTime)
              .thenReturn(timerBloc.timerSettings.warmup);
          when(() => mockWarmupTimerService.finished)
              .thenReturn(true);
          warmupFinishedStreamController.add(null);
        },
        expect: ()  => [
          TimerState(
            timerSettings: timerBloc.timerSettings,
            timerStatus: TimerStatus.running,
            timerStage: TimerStage.warmup,
            elapsedWarmupTime: Duration.zero,
            elapsedTime: Duration.zero,
            startTime: startTime,
          ),
          TimerState(
            timerSettings: timerBloc.timerSettings,
            timerStatus: TimerStatus.running,
            timerStage: TimerStage.timer,
            elapsedWarmupTime: timerBloc.timerSettings.warmup,
            elapsedTime: Duration.zero,
            startTime: startTime,
          ),
        ],
        verify: (timerBloc) {
          verifyInOrder([
            () => mockWarmupTimerService.start(),
            () => mockWarmupTimerService.elapsedTime,
            () => mockTimerService.start(),
          ]);
          expect(timerBloc.activeTimer.duration, timerBloc.timerSettings.duration);
          verifyNever(() => mockAudioService.play(any()));
        },
    );


    blocTest<TimerBloc, TimerState>('can start, pause, resume session time',
        build: () {
          TimerSettings timerSettings = defaultTimerSettings.copyWith(
            warmup: Duration.zero,
          );
          _stubTimerServiceFactory(
              timerSettings,
              mockTimerServiceFactory,
              mockWarmupTimerService,
              mockTimerService
          );
          timerBloc =  TimerBloc(
            timerSettings: timerSettings,
            timerServiceFactory: mockTimerServiceFactory,
            audioService: mockAudioService,
            crashlyticsService: mockCrashlyticsService,
          );
          return timerBloc;
        },
        act: (bloc) {
          // start
          when(() => mockTimerService.startTime)
              .thenReturn(DateTime(2024,1,1,0,0,0));
          when(() => mockTimerService.elapsedTime)
              .thenReturn(const Duration(seconds: 0));
          bloc.add(TimerStarted(startTime: startTime));

          // pause
          when(() => mockTimerService.elapsedTime)
              .thenReturn(const Duration(seconds: 2));
          bloc.add(TimerPaused());

          // resume
          bloc.add(TimerResumed());
        },
        expect: ()  => [
          TimerState(
            timerSettings: timerBloc.timerSettings,
            timerStatus: TimerStatus.running,
            timerStage: TimerStage.timer,
            elapsedWarmupTime: Duration.zero,
            elapsedTime: Duration.zero,
            startTime: startTime,
          ),
          TimerState(
            timerSettings: timerBloc.timerSettings,
            timerStatus: TimerStatus.paused,
            timerStage: TimerStage.timer,
            elapsedWarmupTime: Duration.zero,
            elapsedTime: const Duration(seconds: 2),
            startTime: startTime,
          ),
          TimerState(
            timerSettings: timerBloc.timerSettings,
            timerStatus: TimerStatus.running,
            timerStage: TimerStage.timer,
            elapsedWarmupTime: Duration.zero,
            elapsedTime: const Duration(seconds: 2),
            startTime: startTime,
          ),
        ],
        verify: (timerBloc) {
          verifyInOrder([
            () => mockTimerService.start(),
            () => mockTimerService.stop(),
            () => mockTimerService.start(),
          ]);
        },
    );

    blocTest<TimerBloc, TimerState>('can finish session time',
        build: () {
          TimerSettings timerSettings = defaultTimerSettings.copyWith(
            warmup: Duration.zero,
          );
          _stubTimerServiceFactory(
            timerSettings,
            mockTimerServiceFactory,
            mockWarmupTimerService,
            mockTimerService
          );
          timerBloc = TimerBloc(
            timerSettings: timerSettings,
            timerServiceFactory: mockTimerServiceFactory,
            audioService: mockAudioService,
            crashlyticsService: mockCrashlyticsService,
          );
          return timerBloc;
        },
        act: (bloc) {
          // start
          when(() => mockTimerService.startTime)
            .thenReturn(startTime);
          when(() => mockTimerService.elapsedTime)
            .thenReturn(const Duration(seconds: 0));
          bloc.add(TimerStarted(startTime: startTime));

          when(() => mockTimerService.elapsedTime)
            .thenReturn(timerBloc.timerSettings.duration);
          when(() => mockTimerService.finished)
            .thenReturn(true);
          when(() => mockTimerService.endTime)
            .thenReturn(startTime.add(timerBloc.timerSettings.duration));

          timerFinishedStreamController.add(null);
        },
        expect: ()  => [
          TimerState(
            timerSettings: timerBloc.timerSettings,
            timerStatus: TimerStatus.running,
            timerStage: TimerStage.timer,
            elapsedWarmupTime: Duration.zero,
            elapsedTime: Duration.zero,
            startTime: startTime,
          ),
          TimerState(
            timerSettings: timerBloc.timerSettings,
            timerStatus: TimerStatus.completed,
            timerStage: TimerStage.timer,
            elapsedWarmupTime: Duration.zero,
            elapsedTime: timerBloc.timerSettings.duration,
            startTime: startTime,
            endTime: startTime.add(timerBloc.timerSettings.duration)
          ),
        ],
        verify: (timerBloc) {
          verifyInOrder([
            () => mockTimerService.start(),
            () => mockTimerService.elapsedTime,
          ]);
          verifyNever(() => mockAudioService.play(any()));
        },
    );

    blocTest<TimerBloc, TimerState>('can play starting sound with warmup',
        build: () {
          TimerSettings timerSettings = defaultTimerSettings.copyWith(
            startingSound: Sound.smallBell
          );
          _stubTimerServiceFactory(
              timerSettings,
              mockTimerServiceFactory,
              mockWarmupTimerService,
              mockTimerService
          );
          timerBloc = TimerBloc(
            timerSettings: timerSettings,
            timerServiceFactory: mockTimerServiceFactory,
            audioService: mockAudioService,
            crashlyticsService: mockCrashlyticsService,
          );
          return timerBloc;
        },
        act: (bloc) {
          // start
          when(() => mockWarmupTimerService.startTime)
              .thenReturn(startTime);
          when(() => mockWarmupTimerService.elapsedTime)
              .thenReturn(const Duration(seconds: 0));
          bloc.add(TimerStarted(startTime: startTime));

          when(() => mockWarmupTimerService.elapsedTime)
              .thenReturn(timerBloc.timerSettings.warmup);
          when(() => mockWarmupTimerService.finished)
              .thenReturn(true);
          warmupFinishedStreamController.add(null);
        },
        expect: ()  => [
          TimerState(
            timerSettings: timerBloc.timerSettings,
            timerStatus: TimerStatus.running,
            timerStage: TimerStage.warmup,
            elapsedWarmupTime: Duration.zero,
            elapsedTime: Duration.zero,
            startTime: startTime,
          ),
          TimerState(
            timerSettings: timerBloc.timerSettings,
            timerStatus: TimerStatus.running,
            timerStage: TimerStage.timer,
            elapsedWarmupTime: timerBloc.timerSettings.warmup,
            elapsedTime: Duration.zero,
            startTime: startTime,
          ),
        ],
        verify: (timerBloc) {
          verifyInOrder([
            () => mockWarmupTimerService.start(),
            () => mockWarmupTimerService.elapsedTime,
            () => mockAudioService.play(Sound.smallBell),
          ]);
        },
    );

    blocTest<TimerBloc, TimerState>('can play starting sound without warmup',
        build: () {
          TimerSettings timerSettings = defaultTimerSettings.copyWith(
            warmup: Duration.zero,
            startingSound: Sound.smallBell,
          );
          _stubTimerServiceFactory(
            timerSettings,
            mockTimerServiceFactory,
            mockWarmupTimerService,
            mockTimerService
          );
          timerBloc = TimerBloc(
            timerSettings: timerSettings,
            timerServiceFactory: mockTimerServiceFactory,
            audioService: mockAudioService,
            crashlyticsService: mockCrashlyticsService,
          );
          return timerBloc;
        },
        act: (bloc) {
          // start
          when(() => mockTimerService.startTime)
              .thenReturn(startTime);
          when(() => mockTimerService.elapsedTime)
              .thenReturn(const Duration(seconds: 0));
          bloc.add(TimerStarted(startTime: startTime));
        },
        expect: ()  => [
          TimerState(
            timerSettings: timerBloc.timerSettings,
            timerStatus: TimerStatus.running,
            timerStage: TimerStage.timer,
            elapsedWarmupTime: Duration.zero,
            elapsedTime: Duration.zero,
            startTime: DateTime(2024,1,1,0,0,0),
          ),
        ],
        verify: (timerBloc) {
          verifyInOrder([
            () => mockTimerService.start(),
            () => mockAudioService.play(timerBloc.timerSettings.startingSound),
          ]);
        },
    );

    blocTest<TimerBloc, TimerState>('can play ending sound',
        build: () {
          TimerSettings timerSettings = defaultTimerSettings.copyWith(
            warmup: Duration.zero,
            startingSound: Sound.smallBell,
            endingSound: Sound.smallBell,
          );
          _stubTimerServiceFactory(
              timerSettings,
              mockTimerServiceFactory,
              mockWarmupTimerService,
              mockTimerService
          );
          timerBloc = TimerBloc(
            timerSettings: timerSettings,
            timerServiceFactory: mockTimerServiceFactory,
            audioService: mockAudioService,
            crashlyticsService: mockCrashlyticsService,
          );
          return timerBloc;
        },
        act: (bloc) {

          // start
          when(() => mockTimerService.startTime)
            .thenReturn(startTime);
          when(() => mockTimerService.elapsedTime)
            .thenReturn(const Duration(seconds: 0));
          bloc.add(TimerStarted(startTime: startTime));

          when(() => mockTimerService.elapsedTime)
            .thenReturn(timerBloc.timerSettings.duration);
          when(() => mockTimerService.finished)
            .thenReturn(true);
          when(() => mockTimerService.endTime)
            .thenReturn(startTime.add(timerBloc.timerSettings.duration));

          timerFinishedStreamController.add(null);

        },
        expect: ()  => [
          TimerState(
            timerSettings: timerBloc.timerSettings,
            timerStatus: TimerStatus.running,
            timerStage: TimerStage.timer,
            elapsedWarmupTime: Duration.zero,
            elapsedTime: Duration.zero,
            startTime: startTime,
          ),
          TimerState(
            timerSettings: timerBloc.timerSettings,
            timerStatus: TimerStatus.completed,
            timerStage: TimerStage.timer,
            elapsedWarmupTime: Duration.zero,
            elapsedTime: timerBloc.timerSettings.duration,
            startTime: startTime,
            endTime: startTime.add(timerBloc.timerSettings.duration)
          ),
        ],
        verify: (timerBloc) {
          verifyInOrder([
            () => mockTimerService.start(),
            () => mockAudioService.play(timerBloc.timerSettings.endingSound),
          ]);
        },
    );

  }); // eof group

} // eof main

// stub timer factory specific to test case to return correct results
// for each actual test
void _stubTimerServiceFactory(
  TimerSettings timerSettings,
  MockTimerServiceFactory mockTimerServiceFactory,
  MockTimerService mockWarmupTimerService,
  MockTimerService mockTimerService,
) {

  when(() => mockWarmupTimerService.duration)
    .thenReturn(timerSettings.warmup);
  when(() => mockTimerServiceFactory.getTimerService(timerSettings.warmup))
    .thenReturn(mockWarmupTimerService);

  when(() => mockTimerService.duration)
    .thenReturn(timerSettings.duration);
  when(() => mockTimerServiceFactory.getTimerService(timerSettings.duration))
    .thenReturn(mockTimerService);

}
