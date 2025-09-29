import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/wakelock_service.dart';
import 'package:dhyana/widget/timer/running/timer_running_controls.dart';
import 'package:dhyana/widget/timer/running/timer_running_time.dart';
import 'package:dhyana/widget/timer/running/timer_running_title.dart';
import 'package:dhyana/widget/timer/timer_running_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_context_providers.dart';
import '../../../mock_definitions.dart';

void main() {

  group('TimerRunningView', () {

    late MockServices mockServices;
    late MockWakelockService mockWakelockService;

    setUp(() async {

      // Services
      mockServices = MockServices();
      mockWakelockService = MockWakelockService();

      when(() => mockServices.wakelockService)
        .thenReturn(mockWakelockService);
      when(() => mockWakelockService.enable())
        .thenAnswer((_) async => {});
      when(() => mockWakelockService.disable())
        .thenAnswer((_) async => {});

    });

    testWidgets('can display all necessary widgets', (WidgetTester tester) async {

      final TimerState timerState = TimerState.initial(
        timerSettings: TimerSettings()
      );

        await tester.pumpWidget(
          withAllContextProviders(
            TimerRunningView(
              timerState: timerState,
              wakelockService: mockWakelockService,
            ),
          )
        );
        await tester.pumpAndSettle();

        expect(find.byType(TimerRunningTitle), findsOneWidget);
        expect(find.byType(TimerRunningTime), findsOneWidget);
        expect(find.byType(TimerRunningControls), findsOneWidget);
    });

    testWidgets('can enable wakelock service when initialized', (WidgetTester tester) async {

      final TimerState timerState = TimerState.initial(
        timerSettings: TimerSettings()
      );

      final WakelockService wakelockService = MockWakelockService();

      when(() => wakelockService.enable())
        .thenAnswer((_) async => {});

      when(() => wakelockService.disable())
        .thenAnswer((_) async => {});

        await tester.pumpWidget(
          withAllContextProviders(
            TimerRunningView(
              timerState: timerState,
              wakelockService: wakelockService,
            ),
          )
        );
        await tester.pumpAndSettle();
        verify(() => wakelockService.enable()).called(1);
    });

    testWidgets('can disable wakelock service disposed', (WidgetTester tester) async {

      final TimerState timerState = TimerState.initial(
        timerSettings: TimerSettings()
      );

      final WakelockService wakelockService = MockWakelockService();

      when(() => wakelockService.enable())
        .thenAnswer((_) async => {});

      when(() => wakelockService.disable())
        .thenAnswer((_) async => {});

        await tester.pumpWidget(
          withAllContextProviders(
            TimerRunningView(
              timerState: timerState,
              wakelockService: wakelockService,
            ),
          )
        );
        await tester.pumpAndSettle();
        verifyNever(() => wakelockService.disable()).called(0);
        await tester.pumpWidget(SizedBox.shrink());
        verify(() => wakelockService.disable()).called(1);
    });


  }); // eof group
} // eof main
