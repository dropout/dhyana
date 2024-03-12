import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/service/timer_settings_shared_prefs_service.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';

// import 'timer_settings_bloc_test.mocks.dart';

// @GenerateNiceMocks([
//   MockSpec<TimerSettingsSharedPrefsService>(),
//   MockSpec<CrashlyticsService>(),
// ])

void main() async {

  group('TimerBloc', () {

    late TimerSettingsBloc timerSettingsBloc;
    // late MockTimerSettingsSharedPrefsService mockTimerSettingsSharedPrefsService;
    // late MockCrashlyticsService mockCrashlyticsService;

    setUp(() {
      // tickerStreamController = StreamController();
      // finishedStreamController = StreamController();
      //
      // mockTimerService = MockTimerService();
      // mockTimerAudioService = MockTimerAudioService();
      // mockTimerSettingsSharedPrefsService = MockTimerSettingsSharedPrefsService();
      // mockCrashlyticsService = MockCrashlyticsService();
      //
      // when(mockTimerService.tickStream)
      //     .thenAnswer((_) => tickerStreamController.stream);
      //
      // when(mockTimerService.finishedStream)
      //     .thenAnswer((_) => finishedStreamController.stream);

      // timerSettingsBloc = TimerSettingsBloc(
      //   crashlyticsService: mockCrashlyticsService,
      //   timerSettingsSharedPrefsService: mockTimerSettingsSharedPrefsService
      // );
    });

    tearDown(() {
      // tickerStreamController.close();
      // finishedStreamController.close();
      // timerSettingsBloc.close();
    });

    test('can be created with its default values', () async {

    });
  });

}

  //     TimerSettings timerSettings = const TimerSettings(
  //       duration: Duration(seconds: 10),
  //     );
  //
  //     timerBloc = TimerBloc(
  //       timerSettings: timerSettings,
  //       timerService: mockTimerService,
  //       timerAudioService: mockTimerAudioService,
  //       sessionLoggerService: mockSessionLoggerService,
  //       crashlyticsService: mockCrashlyticsService,
  //     );
  //
  //     expect(tickerStreamController.hasListener, true);
  //     expect(finishedStreamController.hasListener, true);
  //
  //     expect(timerBloc.state.timerSettings.duration, const Duration(seconds: 10));
  //     expect(timerBloc.state.timerStatus, TimerStatus.idle);
  //     expect(timerBloc.state.elapsedTime, Duration.zero);
  //
  //     verifyInOrder([
  //       mockTimerService.tickStream,
  //       mockTimerService.finishedStream,
  //     ]);
  //   });
  //
  //   test('can close resources', () async {
  //     TimerSettings timerSettings = const TimerSettings(
  //       duration: Duration(seconds: 10),
  //     );
  //
  //     timerBloc = TimerBloc(
  //       timerSettings: timerSettings,
  //       timerService: mockTimerService,
  //       timerAudioService: mockTimerAudioService,
  //       sessionLoggerService: mockSessionLoggerService,
  //       crashlyticsService: mockCrashlyticsService,
  //     );
  //
  //     expect(tickerStreamController.hasListener, true);
  //     expect(finishedStreamController.hasListener, true);
  //
  //     await timerBloc.close();
  //
  //     verifyInOrder([
  //       mockTimerService.tickStream,
  //       mockTimerService.finishedStream,
  //       mockTimerService.close(),
  //       mockTimerAudioService.close()
  //     ]);
  //
  //     expect(tickerStreamController.hasListener, false);
  //     expect(finishedStreamController.hasListener, false);
  //
  //   });
  //
  //   blocTest<TimerBloc, TimerState>('can start, pause, resume',
  //       build: () {
  //
  //         when(mockTimerService.elapsedTime)
  //             .thenReturn(const Duration(seconds: 1));
  //
  //         TimerSettings timerSettings = const TimerSettings(
  //           duration: Duration(seconds: 10),
  //         );
  //
  //         timerBloc = TimerBloc(
  //           timerSettings: timerSettings,
  //           timerService: mockTimerService,
  //           timerAudioService: mockTimerAudioService,
  //           sessionLoggerService: mockSessionLoggerService,
  //           crashlyticsService: mockCrashlyticsService,
  //         );
  //
  //         return timerBloc;
  //       },
  //       act: (bloc) {
  //         bloc.add(TimerStarted());
  //         bloc.add(TimerPaused());
  //         bloc.add(TimerResumed());
  //       },
  //       expect: ()  => const [
  //         TimerState(
  //           timerSettings: TimerSettings(
  //             duration: Duration(seconds: 10),
  //           ),
  //           timerStatus: TimerStatus.running,
  //         ),
  //         TimerState(
  //           timerSettings: TimerSettings(
  //             duration: Duration(seconds: 10),
  //           ),
  //           timerStatus: TimerStatus.paused,
  //           elapsedTime: Duration(seconds: 1),
  //         ),
  //         TimerState(
  //           timerSettings: TimerSettings(
  //             duration: Duration(seconds: 10),
  //           ),
  //           timerStatus: TimerStatus.running,
  //           elapsedTime: Duration(seconds: 1),
  //         ),
  //       ],
  //       verify: (timerBloc) {
  //
  //         verifyInOrder([
  //           mockTimerAudioService.setup(),
  //           mockTimerAudioService.start(),
  //           mockTimerService.start(),
  //           mockTimerAudioService.pause(),
  //           mockTimerService.stop(),
  //           mockTimerService.start(),
  //           mockTimerAudioService.resume(),
  //         ]);
  //
  //       }
  //   );
  //
  //   blocTest<TimerBloc, TimerState>('can tick no fadeout',
  //       build: () {
  //
  //         when(mockTimerService.elapsedTime)
  //             .thenReturn(const Duration(seconds: 159));
  //
  //         TimerSettings timerSettings = const TimerSettings(
  //           duration: Duration(minutes: 3),
  //         );
  //
  //         timerBloc = TimerBloc(
  //           timerSettings: timerSettings,
  //           timerService: mockTimerService,
  //           timerAudioService: mockTimerAudioService,
  //           sessionLoggerService: mockSessionLoggerService,
  //           crashlyticsService: mockCrashlyticsService,
  //         );
  //
  //         return timerBloc;
  //       },
  //       act: (bloc) {
  //         bloc.add(TimerStarted());
  //         bloc.add(const TimerTicked(ticks: 1));
  //       },
  //       expect: ()  => const [
  //         TimerState(
  //           timerSettings: TimerSettings(
  //             duration: Duration(minutes: 3),
  //           ),
  //           timerStatus: TimerStatus.running,
  //         ),
  //         TimerState(
  //             timerSettings: TimerSettings(
  //               duration: Duration(minutes: 3),
  //             ),
  //             timerStatus: TimerStatus.running,
  //             elapsedTime: Duration(seconds: 159)
  //         ),
  //       ],
  //       verify: (timerBloc) {
  //
  //         verifyInOrder([
  //           mockTimerAudioService.setup(),
  //           mockTimerAudioService.start(),
  //           mockTimerService.start(),
  //           mockTimerAudioService.updatePosition(const Duration(seconds: 159))
  //         ]);
  //
  //         verifyNever(mockTimerAudioService.setVolume(any));
  //
  //       }
  //   );
  //
  //   blocTest<TimerBloc, TimerState>('can tick with fadeout',
  //       build: () {
  //
  //         when(mockTimerService.elapsedTime)
  //             .thenReturn(const Duration(seconds: 190));
  //
  //         TimerSettings timerSettings = const TimerSettings(
  //           duration: Duration(minutes: 3),
  //         );
  //
  //         timerBloc = TimerBloc(
  //           timerSettings: timerSettings,
  //           timerService: mockTimerService,
  //           timerAudioService: mockTimerAudioService,
  //           sessionLoggerService: mockSessionLoggerService,
  //           crashlyticsService: mockCrashlyticsService,
  //         );
  //
  //         return timerBloc;
  //       },
  //       act: (bloc) {
  //         bloc.add(TimerStarted());
  //         bloc.add(const TimerTicked(ticks: 1));
  //       },
  //       expect: ()  => const [
  //         TimerState(
  //           timerSettings: TimerSettings(
  //             duration: Duration(minutes: 3),
  //           ),
  //           timerStatus: TimerStatus.running,
  //         ),
  //         TimerState(
  //             timerSettings: TimerSettings(
  //               duration: Duration(minutes: 3),
  //             ),
  //             timerStatus: TimerStatus.running,
  //             elapsedTime: Duration(seconds: 190)
  //         ),
  //       ],
  //       verify: (timerBloc) {
  //
  //         verifyInOrder([
  //           mockTimerAudioService.setup(),
  //           mockTimerAudioService.start(),
  //           mockTimerService.start(),
  //           mockTimerAudioService.setVolume(0.5),
  //           mockTimerAudioService.updatePosition(const Duration(seconds: 190))
  //         ]);
  //
  //       }
  //   );
  //
  //   blocTest<TimerBloc, TimerState>('can complete with endingsound',
  //       build: () {
  //
  //         when(mockTimerService.startTime)
  //             .thenReturn(DateTime(2022,1,1,0,0,0));
  //
  //         when(mockTimerService.endTime)
  //             .thenReturn(DateTime(2022,1,1,0,3,0));
  //
  //         when(mockTimerService.elapsedTime)
  //             .thenReturn(const Duration(seconds: 190));
  //
  //         TimerSettings timerSettings = TimerSettings(
  //           duration: const Duration(minutes: 3),
  //           endingSound: getTestSound(soundType: SoundType.endingSound),
  //         );
  //
  //         timerBloc = TimerBloc(
  //           timerSettings: timerSettings,
  //           timerService: mockTimerService,
  //           timerAudioService: mockTimerAudioService,
  //           sessionLoggerService: mockSessionLoggerService,
  //           crashlyticsService: mockCrashlyticsService,
  //         );
  //
  //         return timerBloc;
  //       },
  //       act: (bloc) {
  //         bloc.add(TimerStarted());
  //         bloc.add(const TimerTicked(ticks: 1));
  //         bloc.add(TimerCompleted());
  //       },
  //       expect: ()  => [
  //         TimerState(
  //           timerSettings: TimerSettings(
  //             duration: const Duration(minutes: 3),
  //             endingSound: getTestSound(soundType: SoundType.endingSound),
  //           ),
  //           timerStatus: TimerStatus.running,
  //         ),
  //         TimerState(
  //             timerSettings: TimerSettings(
  //               duration: const Duration(minutes: 3),
  //               endingSound: getTestSound(soundType: SoundType.endingSound),
  //             ),
  //             timerStatus: TimerStatus.running,
  //             elapsedTime: const Duration(seconds: 190)
  //         ),
  //         TimerState(
  //             timerSettings: TimerSettings(
  //               duration: const Duration(minutes: 3),
  //               endingSound: getTestSound(soundType: SoundType.endingSound),
  //             ),
  //             timerStatus: TimerStatus.completed,
  //             elapsedTime: const Duration(seconds: 190)
  //         ),
  //       ],
  //       verify: (timerBloc) {
  //
  //         verifyInOrder([
  //           mockTimerAudioService.setup(),
  //           mockTimerAudioService.start(),
  //           mockTimerService.start(),
  //           mockTimerAudioService.setVolume(0.5),
  //           mockTimerAudioService.updatePosition(const Duration(seconds: 190)),
  //           mockTimerAudioService.playEndingSound(),
  //           mockSessionLoggerService.logTimerSession(
  //               timerSettings: TimerSettings(
  //                 duration: const Duration(minutes: 3),
  //                 endingSound: getTestSound(soundType: SoundType.endingSound),
  //               ),
  //               startTime: DateTime(2022,1,1,0,0,0),
  //               endTime: DateTime(2022,1,1,0,3,0),
  //               duration: const Duration(seconds: 190)
  //           )
  //         ]);
  //
  //       }
  //   );
  //
  //
  // });

// }
