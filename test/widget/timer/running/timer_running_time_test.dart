import 'package:dhyana/modules/practice/timer/domain/entity/timer_state.dart';
import 'package:dhyana/core/domain/entity/timer_settings.dart';
import 'package:dhyana/modules/practice/timer/presentation/view/timer/timer_running_time.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_context_providers.dart';

void main() {

  group('TimerRunningTime', () {

    setUp(() async {

    });

    testWidgets('can show warmup remaining time', (WidgetTester tester) async {

      final TimerState timerState = TimerState.initial(
        timerSettings: TimerSettings(
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

      final TimerState timerState = TimerState.initial(
        timerSettings: TimerSettings(
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
