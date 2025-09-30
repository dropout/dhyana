import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/timer/running/timer_running_time.dart';
import 'package:dhyana/widget/timer/running/timer_running_title.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_context_providers.dart';

void main() {

  group('TimerRunningTitle', () {

    setUp(() async {

    });

    testWidgets('shows warmup text when there is warmup time', (WidgetTester tester) async {

      final TimerState timerState = TimerState.initial(
        timerSettings: TimerSettings(
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

      expect(
        find.byKey(const Key('timer_running_title_warmup_title_text')),
        findsNothing
      );
    });

  }); // eof group
} // eof main
