import 'package:core/core.dart';
import 'package:timer/src/public/view/timer_settings/warmup_input.dart';
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

  group('WarmupTimeInput', () {

    testWidgets('render with initial value', (WidgetTester tester) async {

      MockOverlayService mockOverlayService = MockOverlayService();

      await tester.pumpWidget(
        withAllContextProviders(
          WarmupInput(
            label: 'Test label',
            value: Duration(minutes: 3),
            overlayService: mockOverlayService
          )
        )
      );

      await tester.pumpAndSettle();

      expect(find.text('3'), findsOneWidget);
      expect(
        find.byKey(Key('warmup_input_button')),
        findsOneWidget
      );
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
      when(() => mockServices.hapticsService).thenReturn(mockHapticsService);

      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>(
            create: (_) => mockServices,
            child: MaterialApp(
              home: Scaffold(
                body: WarmupInput(
                  label: 'Test label',
                  value: Duration(minutes: 3),
                  overlayService: mockOverlayService,
                )
              )
            )
          )
        )
      );

      await tester.tap(find.byKey(Key('warmup_input_button')));
      await tester.pumpAndSettle();

      verify(() => mockOverlayService.showModalBottomSheet(
        any(that: isA<BuildContext>()),
        any(that: isA<WidgetBuilder>()),
        enableDrag: false,
      )).called(1);
    });

  });

}
