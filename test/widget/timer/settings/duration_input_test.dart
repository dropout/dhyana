import 'package:dhyana/init/services.dart';
import 'package:dhyana/service/haptics_service.dart';
import 'package:dhyana/service/overlay_service.dart';
import 'package:dhyana/widget/timer/settings/duration_input.dart';
import 'package:dhyana/widget/timer/settings/duration_input_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../test_context_providers.dart';

class MockServices
    extends Mock
    implements Services {}

class MockOverlayService
    extends Mock
    implements OverlayService {}

class MockHapticsService
    extends Mock
    implements HapticsService {}

class FakeBuildContext
  extends Fake
  implements BuildContext {}

void main() {

  setUpAll(() {
    // to be able to use WidgetBuilder
    // in modal content with fake context
    registerFallbackValue(FakeBuildContext());
  });

  group('DurationInput', () {

    MockOverlayService mockOverlayService = MockOverlayService();

    testWidgets('renders with initial value', (WidgetTester tester) async {
      await tester.pumpWidget(
        getAllTestContextProviders(
          DurationInput(
            label: 'Test Duration',
            value: const Duration(minutes: 5),
            overlayService: mockOverlayService,
            onChange: (Duration duration) {
              // Handle change
            },
          ),
        ),
      );

      expect(find.byType(DurationInputButton), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('opens modal on button tap', (WidgetTester tester) async {

      MockOverlayService mockOverlayService = MockOverlayService();
      when(() => mockOverlayService.showModalBottomSheet(
        any(that: isA<BuildContext>()),
        any(that: isA<WidgetBuilder>()),
      )).thenAnswer((_) async => null);

      MockHapticsService mockHapticsService = MockHapticsService();

      MockServices mockServices = MockServices();
      when(() => mockServices.hapticsService).thenReturn(mockHapticsService);

      await tester.pumpWidget(
        getAllTestContextProviders(
          Provider<Services>(
            create: (_) => mockServices,
            child: MaterialApp(
              home: Scaffold(
                body: DurationInput(
                  label: 'Test Duration',
                  value: const Duration(minutes: 5),
                  overlayService: mockOverlayService,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byKey(const Key('timer_duration_input_button')));
      await tester.pumpAndSettle();

      verify(() => mockOverlayService.showModalBottomSheet(
        any(that: isA<BuildContext>()),
        any(that: isA<WidgetBuilder>()),
      )).called(1);

    });




  });
}
