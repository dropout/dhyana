import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings_entity.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/configure_event_scheduler_use_case.dart';

import '../../../../mock_definitions.dart';

void main() {
  late MockTimerEventScheduler eventScheduler;
  late ConfigureEventSchedulerUseCase useCase;

  void onWarmupCompleted(Duration elapsed) {}
  void onInterval(Duration elapsed) {}
  void onTimerCompleted(Duration elapsed) {}

  setUpAll(() {
    registerFallbackValue(Duration.zero);
    registerFallbackValue(onWarmupCompleted);
  });

  setUp(() {
    eventScheduler = MockTimerEventScheduler();
    useCase = ConfigureEventSchedulerUseCase(eventScheduler: eventScheduler);

    when(() => eventScheduler.addListener(any(), any())).thenReturn(null);
  });

  void execute(TimerSettingsEntity timerSettings) {
    useCase.execute(
      timerSettings: timerSettings,
      onWarmupCompleted: onWarmupCompleted,
      onInterval: onInterval,
      onTimerCompleted: onTimerCompleted,
    );
  }

  test('schedules the warmup completion event when there is a warmup time', () {
    const timerSettings = TimerSettingsEntity(
      warmup: Duration(minutes: 1),
      duration: Duration(minutes: 10),
    );

    execute(timerSettings);

    verify(
      () => eventScheduler.addListener(timerSettings.warmup, onWarmupCompleted),
    ).called(1);
  });

  test('does not schedule the warmup completion event when there is no warmup time', () {
    const timerSettings = TimerSettingsEntity(
      warmup: Duration.zero,
      duration: Duration(minutes: 10),
    );

    execute(timerSettings);

    verifyNever(() => eventScheduler.addListener(any(), onWarmupCompleted));
  });

  test('schedules an interval event for each configured interval', () {
    const timerSettings = TimerSettingsEntity(
      warmup: Duration(minutes: 1),
      duration: Duration(minutes: 9),
      intervalCount: 3,
    );

    execute(timerSettings);

    final sectionDuration = Duration(
      milliseconds: (timerSettings.duration.inMilliseconds /
              (timerSettings.intervalCount + 1))
          .round(),
    );
    for (var i = 0; i < timerSettings.intervalCount; i++) {
      final intervalTime = timerSettings.warmup + (sectionDuration * (i + 1));
      verify(() => eventScheduler.addListener(intervalTime, onInterval)).called(1);
    }
  });

  test('does not schedule any interval events when there are none configured', () {
    const timerSettings = TimerSettingsEntity(
      warmup: Duration(minutes: 1),
      duration: Duration(minutes: 10),
    );

    execute(timerSettings);

    verifyNever(() => eventScheduler.addListener(any(), onInterval));
  });

  test('always schedules the timer completion event at the total time', () {
    const timerSettings = TimerSettingsEntity(
      warmup: Duration(minutes: 1),
      duration: Duration(minutes: 10),
    );

    execute(timerSettings);

    verify(
      () => eventScheduler.addListener(timerSettings.totalTime, onTimerCompleted),
    ).called(1);
  });

  test('schedules the expected total number of events', () {
    const timerSettings = TimerSettingsEntity(
      warmup: Duration(minutes: 1),
      duration: Duration(minutes: 9),
      intervalCount: 3,
    );

    execute(timerSettings);

    // 1 warmup event + 3 interval events + 1 completion event
    verify(() => eventScheduler.addListener(any(), any())).called(5);
  });
}
