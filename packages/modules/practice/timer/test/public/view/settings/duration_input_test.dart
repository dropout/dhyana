import 'package:core/core.dart';
import 'package:timer/src/public/view/timer_settings/duration_input.dart';
import 'package:timer/src/public/view/timer_settings/input_button.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';



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

    testWidgets('renders with initial value', (WidgetTester tester) async {
      MockOverlayService mockOverlayService = MockOverlayService();
      await tester.pumpWidget(
        withAllContextProviders(
          DurationInput(
            label: 'Test Duration',
            value: const Duration(minutes: 5),
            preparationTime: const Duration(minutes: 0),
            overlayService: mockOverlayService,
            onChange: (Duration duration) {
              // Handle change
            },
          ),
        ),
      );

      expect(find.byType(InputButton), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('opens modal on button tap', (WidgetTester tester) async {

      MockOverlayService mockOverlayService = MockOverlayService();
      when(() => mockOverlayService.showModalBottomSheet(
        any(that: isA<BuildContext>()),
        any(that: isA<WidgetBuilder>()),
        enableDrag: false,
      )).thenAnswer((_) async => null);

      MockHapticsService mockHapticsService = MockHapticsService();

      MockServices mockServices = MockServices();
      when(() => mockServices.hapticsService)
        .thenReturn(mockHapticsService);

      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>(
            create: (_) => mockServices,
            child: MaterialApp(
              home: Scaffold(
                body: DurationInput(
                  label: 'Test Duration',
                  value: const Duration(minutes: 5),
                  preparationTime: const Duration(minutes: 0),
                  overlayService: mockOverlayService,
                  onChange: (Duration duration) {
                    // Handle change
                  },
                ),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byKey(const Key('timer_duration_input_button')));
      await tester.pump();

      verify(() => mockOverlayService.showModalBottomSheet(
        any(that: isA<BuildContext>()),
        any(that: isA<WidgetBuilder>()),
        enableDrag: false,
      )).called(1);

    });




  });
}
