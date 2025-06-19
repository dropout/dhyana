import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/service/default_shader_service.dart';
import 'package:dhyana/service/shader_service.dart';
import 'package:dhyana/widget/timer/all.dart';
import 'package:dhyana/widget/timer/settings/duration_input.dart';
import 'package:dhyana/widget/timer/settings/sound_input.dart';
import 'package:dhyana/widget/timer/settings/timer_start_button.dart';
import 'package:dhyana/widget/timer/settings/warmup_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  group('WarmupTimeInput', () {

    testWidgets('render with initial value', (WidgetTester tester) async {

      MockOverlayService mockOverlayService = MockOverlayService();

      await tester.pumpWidget(
        getAllTestContextProviders(
          WarmupTimeInput(
            label: 'Test label',
            value: Duration(minutes: 3),
            overlayService: mockOverlayService
          )
        )
      );

      await tester.pumpAndSettle();

      expect(find.text('3'), findsOneWidget);
      expect(
        find.byKey(Key('warmup_time_duration_input_button')),
        findsOneWidget
      );
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
                body: WarmupTimeInput(
                  label: 'Test label',
                  value: Duration(minutes: 3),
                  overlayService: mockOverlayService,
                )
              )
            )
          )
        )
      );

      await tester.tap(find.byKey(Key('warmup_time_duration_input_button')));
      await tester.pumpAndSettle();

      verify(() => mockOverlayService.showModalBottomSheet(
        any(that: isA<BuildContext>()),
        any(that: isA<WidgetBuilder>()),
      )).called(1);
    });

  });

}
