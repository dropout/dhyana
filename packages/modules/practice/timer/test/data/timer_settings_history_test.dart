import 'package:flutter_test/flutter_test.dart';
import 'package:core/core.dart';
import 'package:timer/src/data/mapper/timer_settings_mapper.dart';
import 'package:timer/src/data/repository/firebase_timer_settings_history_repository.dart';
import 'package:timer/src/domain/entity/timer_settings_entity.dart';
import 'package:timer/src/domain/entity/timer_settings_history_record_entity.dart';

void main() {

  group('TimerSettingsEntity.id', () {
    const base = TimerSettingsEntity();

    test('changes when any identity field changes', () {
      final variants = [
        base.copyWith(warmup: const Duration(seconds: 30)),
        base.copyWith(duration: const Duration(minutes: 20)),
        base.copyWith(intervalCount: 3),
        base.copyWith(intervalSound: Sound.smallBell),
        base.copyWith(startingSound: Sound.triangle),
        base.copyWith(endingSound: Sound.none),
      ];
      final ids = {base.id, ...variants.map((s) => s.id)};
      expect(ids.length, variants.length + 1);
    });

    test('ignores lastUsed', () {
      expect(base.copyWith(lastUsed: DateTime(2026)).id, base.id);
    });

    test('matches the public model id', () {
      const entity = TimerSettingsEntity(intervalCount: 2, endingSound: Sound.triangle);
      expect(entity.toApi().id, entity.id);
    });
  });

  group('TimerSettingsEntity.fromJson', () {
    test('falls back to defaults for removed sounds', () {
      final settings = TimerSettingsEntity.fromJson({
        'warmup': 30,
        'duration': 600,
        'intervalSound': 'vibrate',
        'startingSound': 'vibrate',
        'endingSound': 'triangle',
      });
      expect(settings.intervalSound, Sound.triangle);
      expect(settings.startingSound, Sound.smallBell);
      expect(settings.endingSound, Sound.triangle);
    });
  });

  group('dedupeTimerSettingsHistory', () {
    test('merges records resolving to the same settings, keeping the most recent', () {
      final newer = TimerSettingsHistoryRecordEntity(
        id: 'v1_60_600_0_3_2_2',
        timerSettings: const TimerSettingsEntity(),
        useCount: 2,
        lastUsed: DateTime(2026, 10, 2),
      );
      final legacy = newer.copyWith(id: '60-2-600-2', useCount: 5, lastUsed: DateTime(2026, 10, 1));
      final other = newer.copyWith(
        id: 'other',
        timerSettings: const TimerSettingsEntity(intervalCount: 1),
      );

      final result = dedupeTimerSettingsHistory([newer, legacy, other]);

      expect(result, [newer.copyWith(useCount: 7), other]);
    });
  });

}
