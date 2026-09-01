import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:timer/src/public/view/timer_settings/duration_input_view.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import 'package:core/core.dart';


void main() {
  group('DurationInputView', () {
    testWidgets('renders with initial value', (WidgetTester tester) async {
      await tester.pumpWidget(
        withAllContextProviders(
          DurationInputView(minMinutes: 1, maxMinutes: 15, initialValue: 5),
        ),
      );

      await tester.pumpAndSettle();

      // find the label for the dial input and verify it contains the initial value

      final RichText label = tester.widget(
        find.byKey(const ValueKey('dial_input_label')),
      );

      expect(label.text.toPlainText(), contains('5'));
      expect(label.text.toPlainText(), contains('perc'));
    });

    testWidgets('calls onChanged when value changes', (
      WidgetTester tester,
    ) async {
      final Completer<Duration> completer = Completer<Duration>();
      Duration changedValue = Duration.zero;

      final mockServices = MockServices();
      final hapticsService = MockHapticsService();

      when(() => mockServices.hapticsService).thenReturn(hapticsService);

      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>.value(
            value: mockServices,
            child: DurationInputView(
              minMinutes: 1,
              maxMinutes: 10,
              initialValue: 1,
              onSelect: (Duration duration) {
                completer.complete(duration);
                changedValue = duration;
              },
            ),
          ),
        ),
      );

      // await tester.drag(
      //   find.byType(ListWheelScrollView),
      //   const Offset(0, -50), // Scroll one item up
      // );

      await dragAroundDial(
        tester,
        find.byType(IntDialInput),
        radius: 80,
        steps: 32,
        sweepAngle: math.pi / 2, // quarter turn
      );

      await tester.tap(find.byKey(const Key('input_view_save_button')));
      await tester.pumpAndSettle();

      expect(changedValue.inMinutes, 6);
      expect(completer.isCompleted, isTrue);
    });
  });
}

Future<void> dragAroundDial(
  WidgetTester tester,
  Finder dialFinder, {
  double radius = 80,
  int steps = 24,
  double startAngle = 0,
  double sweepAngle = 2 * math.pi,
}) async {
  final center = tester.getCenter(dialFinder);

  Offset pointAt(double angle) {
    return center + Offset(radius * math.cos(angle), radius * math.sin(angle));
  }

  final gesture = await tester.startGesture(pointAt(startAngle));

  for (var step = 1; step <= steps; step++) {
    final progress = step / steps;
    await gesture.moveTo(pointAt(startAngle + sweepAngle * progress));
    await tester.pump();
  }

  await gesture.up();
  await tester.pumpAndSettle();
}
