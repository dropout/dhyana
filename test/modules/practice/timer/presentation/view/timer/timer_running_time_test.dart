import 'package:dhyana/modules/practice/timer/domain/entity/timer_state_entity.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings_entity.dart';
import 'package:dhyana/modules/practice/timer/presentation/view/timer/timer_running_time.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../test_context_providers.dart';

void main() {

  group('TimerRunningTime', () {

    setUp(() async {

    });

    testWidgets('can show warmup remaining time', (WidgetTester tester) async {

      final TimerStateEntity timerState = TimerStateEntity.initial(
        timerSettings: TimerSettingsEntity(
        )
      );

      await tester.pumpWidget(
        withAllContextProviders(
          TimerRunningTime(
            timerState: timerState,
          ),
        )
      );
      await tester.pumpAndSettle();

      expect(find.text('01:00'), findsOneWidget);
    });

    testWidgets('can show timer remaining time', (WidgetTester tester) async {

      final TimerStateEntity timerState = TimerStateEntity.initial(
        timerSettings: TimerSettingsEntity(
          warmup: Duration.zero,
        )
      );

            await tester.pumpWidget(
        withAllContextProviders(
          TimerRunningTime(
            timerState: timerState,
          ),
        )
      );
      await tester.pumpAndSettle();

      expect(find.text('10:00'), findsOneWidget);
    });

  }); // eof group
} // eof main
