import 'package:timer/src/domain/entity/timer_state_entity.dart';
import 'package:timer/src/domain/entity/timer_settings_entity.dart';
import 'package:timer/src/presentation/view/timer/timer_running_time.dart';
import 'package:timer/src/presentation/view/timer/timer_running_title.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:core/src/testing/test_context_providers.dart';

void main() {

  group('TimerRunningTitle', () {

    setUp(() async {

    });

    testWidgets('shows warmup text when there is warmup time', (WidgetTester tester) async {

      final TimerStateEntity timerState = TimerStateEntity.initial(
        timerSettings: TimerSettingsEntity(
        )
      );

      await tester.pumpWidget(
        withAllContextProviders(
          TimerRunningTitle(
            timerState: timerState,
            positionOffset: Offset.zero,
          ),
        )
      );
      await tester.pumpAndSettle();

      expect(
        find.byKey(const Key('timer_running_title_warmup_title_text')),
        findsOneWidget
      );

    });

    testWidgets('does not show warmup text when timer running', (WidgetTester tester) async {

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

      expect(
        find.byKey(const Key('timer_running_title_warmup_title_text')),
        findsNothing
      );
    });

  }); // eof group
} // eof main
