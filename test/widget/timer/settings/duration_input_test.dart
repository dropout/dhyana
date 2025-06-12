import 'package:dhyana/widget/timer/settings/duration_input.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_context_providers.dart';

void main() {
  group('DurationInput', () {
    testWidgets('renders with initial value', (WidgetTester tester) async {

      await tester.pumpWidget(
        getAllTestContextProviders(
          DurationInput(
            label: 'Test Duration',
            value: const Duration(minutes: 5),
            onChange: (Duration duration) {
              // Handle change
            },
          ),
        ),
      );

      expect(find.byType(DurationInput), findsOneWidget);
      expect(find.text('5'), findsOneWidget); // Adjust if your widget displays differently
    });


  });
}
