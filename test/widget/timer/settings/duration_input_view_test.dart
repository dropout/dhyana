import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/widget/timer/settings/duration_input_view.dart';

import '../../../test_context_providers.dart';

void main() {
  group('DurationInputView', () {

    testWidgets('renders with initial value', (WidgetTester tester) async {
      await tester.pumpWidget(
        getAllTestContextProviders(
          DurationInputView(
            availableValues: [3, 5, 10, 15],
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
        getAllTestContextProviders(
          DurationInputView(
            availableValues: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
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
