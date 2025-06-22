import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/service/haptics_service.dart';
import 'package:dhyana/service/overlay_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/widget/timer/settings/sound_input.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../test_context_providers.dart';

class MockOverlayService
  extends Mock
  implements OverlayService {}

class MockHapticsService
  extends Mock
  implements HapticsService {}

class MockServices
  extends Mock
  implements Services {}

class FakeBuildContext
  extends Fake
  implements BuildContext {}

void main() {

  setUpAll(() {
    registerFallbackValue(FakeBuildContext());
  });

  group('SoundInput', () {

    testWidgets('displays and selects sound', (WidgetTester tester) async {

      MockOverlayService mockOverlayService = MockOverlayService();

      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>(
            create: (_) => MockServices(),
            child: SoundInput(
              label: 'Label for sound input',
              overlayService: mockOverlayService,
              value: Sound.none,
            )
          )
        )
      );

      // Verify initial value
      expect(find.text('Nincs hang'), findsOneWidget);
      expect(
          find.byKey(Key('sound_input_button')),
          findsOneWidget
      );

      verifyNever(
        () => mockOverlayService.showModalBottomSheet(
          any(that: isA<BuildContext>()),
          any(that: isA<WidgetBuilder>()),
        )
      );

    });

    testWidgets('opens modal bottom sheet on tap', (WidgetTester tester) async {

      MockOverlayService mockOverlayService = MockOverlayService();
      when(() => mockOverlayService.showModalBottomSheet(
        any(that: isA<BuildContext>()),
        any(that: isA<WidgetBuilder>()),
      )).thenAnswer((_) async {});

      MockHapticsService mockHapticsService = MockHapticsService();

      MockServices mockServices = MockServices();
      when(() => mockServices.hapticsService).thenReturn(mockHapticsService);

      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>(
            create: (_) => mockServices,
            child: SoundInput(
              label: 'Label for sound input',
              overlayService: mockOverlayService,
              value: Sound.none,
            )
          )
        )
      );

      // Tap the input button
      await tester.tap(find.byKey(Key('sound_input_button')));
      await tester.pumpAndSettle();

      // Verify that the modal bottom sheet was opened
      verify(() => mockOverlayService.showModalBottomSheet(
        any(that: isA<BuildContext>()),
        any(that: isA<WidgetBuilder>()),
      )).called(1);
    });

  });

}
