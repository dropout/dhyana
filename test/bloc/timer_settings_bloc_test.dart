import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTimerSettingsSharedPrefsService
    extends Mock
    implements TimerSettingsSharedPrefsService {}

class MockCrashlyticsService
    extends Mock
    implements CrashlyticsService {}

void main() async {

  group('TimerBloc', () {

    late TimerSettingsBloc timerSettingsBloc;
    late MockTimerSettingsSharedPrefsService mockTimerSettingsSharedPrefsService;
    late MockCrashlyticsService mockCrashlyticsService;

    setUp(() {
      mockTimerSettingsSharedPrefsService = MockTimerSettingsSharedPrefsService();
      mockCrashlyticsService = MockCrashlyticsService();
      timerSettingsBloc = TimerSettingsBloc(
          crashlyticsService: mockCrashlyticsService,
          timerSettingsSharedPrefsService: mockTimerSettingsSharedPrefsService
      );
    });

    test('can be created with its default values', () async {
      expect(timerSettingsBloc.state, isA<TimerSettingsDataLoadingState>());
    });

    blocTest<TimerSettingsBloc, TimerSettingsState>('can load timersettings from shared preferences',
      build: () {
        TimerSettings timerSettings = TimerSettings(
          warmup: const Duration(minutes: 1),
          duration: const Duration(minutes: 5),
          startingSound: Sound.smallBell,
          endingSound: Sound.smallBell,
          lastUsed: DateTime(2025, 1, 1),
        );
        when(() => mockTimerSettingsSharedPrefsService.getTimerSettings())
            .thenAnswer((_) => timerSettings);
        return timerSettingsBloc;
      },
      act: (bloc) {
        bloc.add(const TimerSettingsEvent.load());
      },
      expect: ()  => [
        const TimerSettingsState.loading(),
        TimerSettingsState.loaded(
          timerSettings: TimerSettings(
            warmup: const Duration(minutes: 1),
            duration: const Duration(minutes: 5),
            startingSound: Sound.smallBell,
            endingSound: Sound.smallBell,
            lastUsed: DateTime(2025, 1, 1),
          )
        )
      ],
      verify: (timerBloc) {
        verify(() => mockTimerSettingsSharedPrefsService.getTimerSettings()).called(1);
      }
    );

    blocTest<TimerSettingsBloc, TimerSettingsState>('can load the timersettings specified in the event',
        build: () {
          return timerSettingsBloc;
        },
        act: (bloc) {
          bloc.add(TimerSettingsEvent.load(
            timerSettings: TimerSettings(
              warmup: const Duration(minutes: 5),
              duration: const Duration(minutes: 20),
              startingSound: Sound.none,
              endingSound: Sound.smallBell,
              lastUsed: DateTime(2025, 1, 1),
            )
          ));
        },
        expect: ()  => [
          TimerSettingsState.loaded(
            timerSettings: TimerSettings(
              warmup: const Duration(minutes: 5),
              duration: const Duration(minutes: 20),
              startingSound: Sound.none,
              endingSound: Sound.smallBell,
              lastUsed: DateTime(2025, 1, 1),
            )
          )
        ],
        verify: (timerBloc) {
          verifyNever(() => mockTimerSettingsSharedPrefsService.getTimerSettings());
        }
    );

    blocTest<TimerSettingsBloc, TimerSettingsState>('can save timersettings to shared preferences',
        build: () {
          when(() => mockTimerSettingsSharedPrefsService.setTimerSettings(
            TimerSettings(
              warmup: const Duration(minutes: 5),
              duration: const Duration(minutes: 20),
              startingSound: Sound.none,
              endingSound: Sound.smallBell,
              lastUsed: DateTime(2025, 1, 1),
            )
          )).thenAnswer((_) => Future.value(null));
          return timerSettingsBloc;
        },
        act: (bloc) {
          bloc.add(TimerSettingsEvent.changed(
            timerSettings: TimerSettings(
              warmup: const Duration(minutes: 5),
              duration: const Duration(minutes: 20),
              startingSound: Sound.none,
              endingSound: Sound.smallBell,
              lastUsed: DateTime(2025, 1, 1),
            )
          ));
        },
        expect: ()  => [
          TimerSettingsState.loaded(
            timerSettings: TimerSettings(warmup: const Duration(minutes: 5),
              duration: const Duration(minutes: 20),
              startingSound: Sound.none,
              endingSound: Sound.smallBell,
              lastUsed: DateTime(2025, 1, 1),
            )
          )
        ],
        verify: (timerBloc) {
          verifyNever(() => mockTimerSettingsSharedPrefsService.getTimerSettings());
          verify(() => mockTimerSettingsSharedPrefsService.setTimerSettings(
             TimerSettings(
              warmup: const Duration(minutes: 5),
              duration: const Duration(minutes: 20),
              startingSound: Sound.none,
              endingSound: Sound.smallBell,
              lastUsed: DateTime(2025, 1, 1),
            )
          ));
        }
    );

  }); // eof group

} // eof main
