import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dhyana/widget/timer/running/timer_running_cover.dart';

import '../../../test_context_providers.dart';

void main() {

  group('TimerRunningCover', () {

    testWidgets('can show a child in front of gesture detector', (tester) async {

      await tester.pumpWidget(
        withAllContextProviders(
          TimerRunningCover(
            child: Center(
              child: Container(
                color: Colors.red,
                width: 100,
                height: 100,
                child: const Text('Test Child'),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      tester.ensureVisible(find.text('Test Child'));

      expect(
        find.byKey(TimerRunningCover.animatedContainerKey),
        findsNothing,
      );
    });

    testWidgets('can show overlay when click target tapped', (tester) async {
      await tester.pumpWidget(
        withAllContextProviders(
          TimerRunningCover(
            child: Center(
              child: Container(
                color: Colors.red,
                width: 200,
                height: 200,
                child: const Text('Test Child'),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Freestyle tap because cannot make the tap work
      // with the transparent click target
      await tester.tapAt(Offset(20,20));

      await tester.pumpAndSettle();

      // Colors.black is the default overlay color
      expect(
        tester.widget(find.byKey(TimerRunningCover.animatedContainerKey)),
        isA<Container>().having(
          (t) => t.color,
          'color',
          Colors.black,
        ),
      );

    });

    testWidgets('can hide overlay when click target tapped', (tester) async {
      await tester.pumpWidget(
        withAllContextProviders(
          TimerRunningCover(
            child: Center(
              child: Container(
                color: Colors.red,
                width: 200,
                height: 200,
                child: const Text('Test Child'),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Show the overlay first
      await tester.tapAt(Offset(20,20));
      await tester.pumpAndSettle();

      // Now tap again to hide it
      await tester.tapAt(Offset(20,20));
      await tester.pumpAndSettle();

      // Colors.black is the default overlay color
      expect(
        find.byKey(TimerRunningCover.animatedContainerKey),
        findsNothing,
      );
    });

  }); // eof group
} // eof main
