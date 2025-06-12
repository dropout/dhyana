import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dhyana/widget/timer/settings/duration_input_button.dart';


void main() {
  group('DurationInputButton', () {

    testWidgets('renders child into a rawmaterialbutton', (WidgetTester tester) async {
      const testKey = Key('test-child');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DurationInputButton(
              onTap: () {},
              child: Container(key: testKey),
            ),
          ),
        )
      );
      expect(find.byType(RawMaterialButton), findsOneWidget);
      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (WidgetTester tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DurationInputButton(
              onTap: () {
                tapped = true;
              },
              child: const Text('Tap me'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Tap me'));
      expect(tapped, isTrue);
    });
  });
}
