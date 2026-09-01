import 'package:flutter_test/flutter_test.dart';

import 'package:timer/src/domain/entity/playback_state_entity.dart';
import 'package:timer/src/domain/entity/timer_settings_entity.dart';
import 'package:timer/src/domain/entity/timer_state_entity.dart';
import 'package:timer/src/domain/enum/playback_status.dart';
import 'package:timer/src/domain/enum/timer_stage.dart';
import 'package:timer/src/domain/enum/timer_status.dart';
import 'package:timer/src/domain/usecase/playback_state_change_use_case.dart';

void main() {
  late PlaybackStateChangeUseCase useCase;

  const timerSettings = TimerSettingsEntity(
    warmup: Duration(minutes: 1),
    duration: Duration(minutes: 10),
  );

  setUp(() {
    useCase = PlaybackStateChangeUseCase();
  });

  TimerStateEntity createState({
    required TimerStage timerStage,
    TimerStatus timerStatus = TimerStatus.running,
  }) {
    return TimerStateEntity.initial(timerSettings: timerSettings).copyWith(
      timerStage: timerStage,
      timerStatus: timerStatus,
    );
  }

  group('timer status mapping', () {
    test('maps PlaybackStatus.idle to TimerStatus.idle', () {
      final result = useCase.execute(
        const PlaybackStateEntity(status: PlaybackStatus.idle, position: Duration.zero),
        createState(timerStage: TimerStage.warmup),
      );

      expect(result.timerStatus, TimerStatus.idle);
    });

    test('maps PlaybackStatus.playing to TimerStatus.running', () {
      final result = useCase.execute(
        const PlaybackStateEntity(status: PlaybackStatus.playing, position: Duration.zero),
        createState(timerStage: TimerStage.warmup),
      );

      expect(result.timerStatus, TimerStatus.running);
    });

    test('maps PlaybackStatus.paused to TimerStatus.paused', () {
      final result = useCase.execute(
        const PlaybackStateEntity(status: PlaybackStatus.paused, position: Duration.zero),
        createState(timerStage: TimerStage.warmup),
      );

      expect(result.timerStatus, TimerStatus.paused);
    });
  });

  group('during the warmup stage', () {
    test('elapsedWarmupTime tracks position while below the warmup duration', () {
      final result = useCase.execute(
        const PlaybackStateEntity(status: PlaybackStatus.playing, position: Duration(seconds: 30)),
        createState(timerStage: TimerStage.warmup),
      );

      expect(result.elapsedWarmupTime, const Duration(seconds: 30));
    });

    test('elapsedWarmupTime is capped at the warmup duration', () {
      final result = useCase.execute(
        const PlaybackStateEntity(status: PlaybackStatus.playing, position: Duration(minutes: 2)),
        createState(timerStage: TimerStage.warmup),
      );

      expect(result.elapsedWarmupTime, timerSettings.warmup);
    });

    test('elapsedTime stays zero regardless of position', () {
      final result = useCase.execute(
        const PlaybackStateEntity(status: PlaybackStatus.playing, position: Duration(minutes: 2)),
        createState(timerStage: TimerStage.warmup),
      );

      expect(result.elapsedTime, Duration.zero);
    });
  });

  group('during the timer stage', () {
    test('elapsedWarmupTime remains capped at the warmup duration', () {
      final result = useCase.execute(
        const PlaybackStateEntity(status: PlaybackStatus.playing, position: Duration(minutes: 3)),
        createState(timerStage: TimerStage.timer),
      );

      expect(result.elapsedWarmupTime, timerSettings.warmup);
    });

    test('elapsedTime is the position minus the warmup duration', () {
      final result = useCase.execute(
        const PlaybackStateEntity(status: PlaybackStatus.playing, position: Duration(minutes: 3)),
        createState(timerStage: TimerStage.timer),
      );

      expect(result.elapsedTime, const Duration(minutes: 2));
    });
  });

  test('preserves timer settings and stage while updating status and elapsed time', () {
    final state = createState(timerStage: TimerStage.timer, timerStatus: TimerStatus.paused);

    final result = useCase.execute(
      const PlaybackStateEntity(status: PlaybackStatus.playing, position: Duration(minutes: 1, seconds: 30)),
      state,
    );

    expect(result.timerSettings, timerSettings);
    expect(result.timerStage, TimerStage.timer);
    expect(result.timerStatus, TimerStatus.running);
    expect(result.startTime, state.startTime);
    expect(result.endTime, state.endTime);
  });
}
