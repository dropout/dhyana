import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dhyana/core/domain/enum/home_screen_view_state.dart';
import 'package:dhyana/core/domain/enum/sound.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings_entity.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_state_entity.dart';
import 'package:dhyana/modules/practice/timer/domain/enum/timer_stage.dart';
import 'package:dhyana/modules/practice/timer/domain/enum/timer_status.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/complete_timer_use_case.dart';

import '../../../../mock_definitions.dart' hide MockTimerAudioService;
import '../timer_mock_definitions.dart';

void main() {
  const timerSettings = TimerSettingsEntity(
    warmup: Duration(minutes: 1),
    duration: Duration(minutes: 10),
  );

  late MockTimerAudioService timerAudioService;
  late MockTimerEventScheduler eventScheduler;
  late MockIdGeneratorService idGeneratorService;
  late CompleteTimerUseCase useCase;

  setUpAll(() {
    registerFallbackValue(Sound.none);
  });

  setUp(() {
    timerAudioService = MockTimerAudioService();
    eventScheduler = MockTimerEventScheduler();
    idGeneratorService = MockIdGeneratorService();

    useCase = CompleteTimerUseCase(
      timerAudioService: timerAudioService,
      eventScheduler: eventScheduler,
      idGeneratorService: idGeneratorService,
    );

    when(() => timerAudioService.playSound(any())).thenAnswer((_) => Future.value());
    when(() => timerAudioService.stop()).thenAnswer((_) => Future.value());
    when(() => idGeneratorService.sessionId()).thenReturn('session-1');
  });

  TimerStateEntity createState({
    DateTime? startTime,
    DateTime? endTime,
    Duration elapsedTime = const Duration(minutes: 5),
  }) {
    return TimerStateEntity.initial(timerSettings: timerSettings).copyWith(
      timerStatus: TimerStatus.running,
      timerStage: TimerStage.timer,
      startTime: startTime,
      endTime: endTime,
      elapsedTime: elapsedTime,
    );
  }

  test('plays the ending sound', () async {
    await useCase.execute(createState(), const Duration(minutes: 5));

    verify(() => timerAudioService.playSound(timerSettings.endingSound)).called(1);
  });

  test('stops the audio service only after the ending sound finishes playing', () async {
    final soundCompleter = Completer<void>();
    when(() => timerAudioService.playSound(any())).thenAnswer((_) => soundCompleter.future);

    final resultFuture = useCase.execute(createState(), const Duration(minutes: 5));

    // The use case doesn't await the sound itself, so it can complete...
    await resultFuture;
    // ...while the audio service is not stopped until the sound finishes.
    verifyNever(() => timerAudioService.stop());

    soundCompleter.complete();
    await Future.delayed(Duration.zero);

    verify(() => timerAudioService.stop()).called(1);
  });

  test('stops the event scheduler', () async {
    await useCase.execute(createState(), const Duration(minutes: 5));

    verify(() => eventScheduler.stop()).called(1);
  });

  test('assembles a sitting timer session with a generated id and the elapsed time', () async {
    final startTime = DateTime(2026, 3, 1, 8, 0);
    final endTime = DateTime(2026, 3, 1, 8, 10);

    final result = await useCase.execute(
      createState(startTime: startTime, endTime: endTime),
      const Duration(minutes: 5),
    );

    expect(result.session.id, 'session-1');
    expect(result.session.type, HomeScreenViewState.sitting);
    expect(result.session.startTime, startTime);
    expect(result.session.endTime, endTime);
    expect(result.session.duration, const Duration(minutes: 5));
  });

  test('derives the session start time from the elapsed time when not started', () async {
    final before = DateTime.now();

    final result = await useCase.execute(
      createState(elapsedTime: const Duration(minutes: 5)),
      const Duration(minutes: 5),
    );

    // Production code derives this from a raw DateTime.now(), not the injected clock.
    final expectedStartTime = before.subtract(const Duration(minutes: 5));
    final difference = result.session.startTime.difference(expectedStartTime).abs();
    expect(difference, lessThan(const Duration(seconds: 1)));
  });

  test('uses the current time for the session end time when not completed', () async {
    final before = DateTime.now();

    final result = await useCase.execute(createState(), const Duration(minutes: 5));

    // Production code derives this from a raw DateTime.now(), not the injected clock.
    final difference = result.session.endTime.difference(before).abs();
    expect(difference, lessThan(const Duration(seconds: 1)));
  });

  test('returns the timer state marked as completed with the end time set', () async {
    final fixedTime = DateTime(2026, 3, 1, 8, 10);

    final result = await withClock(
      Clock.fixed(fixedTime),
      () => useCase.execute(createState(), const Duration(minutes: 5)),
    );

    expect(result.timerState.timerStatus, TimerStatus.completed);
    expect(result.timerState.timerStage, TimerStage.timer);
    expect(result.timerState.endTime, fixedTime);
  });
}
