import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/widget/timer/settings/duration_input_view.dart';

import '../../../test_context_providers.dart';

void main() {
  group('DurationInputView', () {

    testWidgets('renders with initial value', (WidgetTester tester) async {
      await tester.pumpWidget(
        withAllContextProviders(
          DurationInputView(
            availableValues: const [
              Duration(minutes: 1),
              Duration(minutes: 5),
              Duration(minutes: 10),
              Duration(minutes: 15),
            ],
            initialValue: Duration(minutes: 5),
          ),
        )
      );

      expect(find.text('5 perc', skipOffstage: false), findsOneWidget);
    });

    testWidgets('calls onChanged when value changes', (WidgetTester tester) async {
      final Completer<Duration> completer = Completer<Duration>();
      Duration changedValue = Duration.zero;
      await tester.pumpWidget(
        withAllContextProviders(
          DurationInputView(
            availableValues: const [
              Duration(minutes: 1),
              Duration(minutes: 2),
              Duration(minutes: 3),
              Duration(minutes: 4),
              Duration(minutes: 5),
              Duration(minutes: 6),
              Duration(minutes: 7),
              Duration(minutes: 8),
              Duration(minutes: 9),
              Duration(minutes: 10),
            ],
            initialValue: Duration(minutes: 5),
            onSelect: (Duration duration) {
              completer.complete(duration);
              changedValue = duration;
            },
          ),
        )
      );


      await tester.drag(
        find.byType(ListWheelScrollView),
        const Offset(0, -50), // Scroll one item up
      );

      await tester.tap(find.byKey(const Key('input_view_save_button')));
      await tester.pumpAndSettle();

      expect(changedValue.inMinutes, 6);
      expect(completer.isCompleted, isTrue);

    });

  });
}
