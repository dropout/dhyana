import 'package:dhyana/bloc/timer/timer_cubit.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/bloc_provider/timer_context.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock_definitions.dart';

void main() {
  group('TimerContext.defaultInitHook', () {

    late MockTimerCubit mockTimerCubit;
    late MockPresenceBloc mockPresenceCubit;
    late MockTimerSettingsHistoryCubit mockTimerSettingsHistoryCubit;
    late TimerSettings timerSettings;

    setUpAll(() {
      registerFallbackValue(TimerSettings());
    });

    setUp(() {
      mockTimerCubit = MockTimerCubit();
      mockPresenceCubit = MockPresenceBloc();
      mockTimerSettingsHistoryCubit = MockTimerSettingsHistoryCubit();
      timerSettings = TimerSettings();

      when(
        () => mockTimerCubit.state,
      ).thenReturn(TimerCubitState.initial(timerSettings: timerSettings));
      when(() => mockTimerCubit.start()).thenAnswer((_) async {});
      when(
        () => mockPresenceCubit.showPresence(any()),
      ).thenAnswer((_) async {});
      when(
        () => mockTimerSettingsHistoryCubit.saveSettings(any(), any()),
      ).thenAnswer((_) async {});
    });

    test(
      'starts timer and initializes presence and history when profileId exists',
      () {
        const String profileId = 'profile-123';

        TimerContext.defaultInitHook(
          mockTimerCubit,
          mockPresenceCubit,
          mockTimerSettingsHistoryCubit,
          profileId,
        );

        verifyInOrder([
          () => mockTimerCubit.start(),
          () => mockPresenceCubit.showPresence(profileId),
          () => mockTimerCubit.state,
          () => mockTimerSettingsHistoryCubit.saveSettings(
            profileId,
            timerSettings,
          ),
        ]);
        verifyNoMoreInteractions(mockTimerCubit);
        verifyNoMoreInteractions(mockPresenceCubit);
        verifyNoMoreInteractions(mockTimerSettingsHistoryCubit);
      },
    );

    test('starts timer only when profileId is null', () {
      TimerContext.defaultInitHook(
        mockTimerCubit,
        mockPresenceCubit,
        mockTimerSettingsHistoryCubit,
        null,
      );

      verify(() => mockTimerCubit.start()).called(1);
      verifyNever(() => mockPresenceCubit.showPresence(any()));
      verifyNever(
        () => mockTimerSettingsHistoryCubit.saveSettings(any(), any()),
      );
      verifyNoMoreInteractions(mockTimerCubit);
      verifyNoMoreInteractions(mockPresenceCubit);
      verifyNoMoreInteractions(mockTimerSettingsHistoryCubit);
    });
  });
}
