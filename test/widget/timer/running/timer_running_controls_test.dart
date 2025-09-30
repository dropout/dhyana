import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/timer/running/timer_running_controls.dart';
import 'package:dhyana/widget/timer/running/timer_running_time.dart';
import 'package:dhyana/widget/timer/running/timer_running_title.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../mock_definitions.dart';
import '../../../test_context_providers.dart';

void main() {

  group('TimerRunningControls', () {

    late MockTimerBloc mockTimerBloc;
    late MockServices mockServices;
    late MockHapticsService mockHapticsService;
    late MockAnalyticsService mockAnalyticsService;

    setUp(() async {
      mockTimerBloc = MockTimerBloc();
      mockServices = MockServices();
      mockHapticsService = MockHapticsService();
      mockAnalyticsService = MockAnalyticsService();

      when(() => mockServices.hapticsService)
        .thenReturn(mockHapticsService);

      when(() => mockServices.analyticsService)
        .thenReturn(mockAnalyticsService);

    });

    testWidgets('main button shows play icon when TimerStatus.idle', (WidgetTester tester) async {

      final TimerState timerState = TimerState.initial(
        timerSettings: TimerSettings(
        )
      );

      await tester.pumpWidget(
        withAllContextProviders(
          BlocProvider<TimerBloc>.value(
            value: mockTimerBloc,
            child: TimerRunningControls(
              timerState: timerState,
            ),
          )
        )
      );
      await tester.pumpAndSettle();

      expect(
        find.byIcon(Icons.play_arrow_rounded),
        findsOneWidget
      );

    });

    testWidgets('main button shows pause icon when TimerStatus.running', (WidgetTester tester) async {

      final TimerState timerState = TimerState.initial(
        timerSettings: TimerSettings()
      ).copyWith(
        timerStatus: TimerStatus.running,
      );

      await tester.pumpWidget(
        withAllContextProviders(
          BlocProvider<TimerBloc>.value(
            value: mockTimerBloc,
            child: TimerRunningControls(
              timerState: timerState,
            ),
          )
        )
      );
      await tester.pumpAndSettle();

      expect(
        find.byIcon(Icons.pause_rounded),
        findsOneWidget
      );

    });

    testWidgets('main button shows play icon when TimerStatus.paused', (WidgetTester tester) async {

      final TimerState timerState = TimerState.initial(
        timerSettings: TimerSettings()
      ).copyWith(
        timerStatus: TimerStatus.paused,
      );

      await tester.pumpWidget(
        withAllContextProviders(
          BlocProvider<TimerBloc>.value(
            value: mockTimerBloc,
            child: TimerRunningControls(
              timerState: timerState,
            ),
          )
        )
      );
      await tester.pumpAndSettle();

      expect(
        find.byIcon(Icons.play_arrow_rounded),
        findsOneWidget
      );

    });

    testWidgets('shows pause menu when TimerStatus.paused and has warmup time', (WidgetTester tester) async {

      final TimerState timerState = TimerState.initial(
        timerSettings: TimerSettings()
      ).copyWith(
        timerStatus: TimerStatus.paused,
      );

      await tester.pumpWidget(
        withAllContextProviders(
          BlocProvider<TimerBloc>.value(
            value: mockTimerBloc,
            child: TimerRunningControls(
              timerState: timerState,
            ),
          )
        )
      );
      await tester.pumpAndSettle();

      expect(
        find.byKey(const Key('timer_running_controls_discard_button')),
        findsOneWidget
      );

      expect(
        find.byKey(const Key('timer_running_controls_finish_button')),
        findsNothing
      );

    });


    testWidgets('shows pause menu when TimerStatus.paused and has no warmup time', (WidgetTester tester) async {

      final TimerState timerState = TimerState.initial(
        timerSettings: TimerSettings(
          warmup: Duration.zero,
        )
      ).copyWith(
        timerStatus: TimerStatus.paused,
        elapsedTime: Duration(minutes: 2),
      );

      await tester.pumpWidget(
        withAllContextProviders(
          BlocProvider<TimerBloc>.value(
            value: mockTimerBloc,
            child: TimerRunningControls(
              timerState: timerState,
            ),
          )
        )
      );
      await tester.pumpAndSettle();

      expect(
        find.byKey(const Key('timer_running_controls_discard_button')),
        findsOneWidget
      );

      expect(
        find.byKey(const Key('timer_running_controls_finish_button')),
        findsOneWidget
      );

    });


    testWidgets('can pause the timer', (WidgetTester tester) async {

      final TimerState timerState = TimerState.initial(
        timerSettings: TimerSettings(
        )
      ).copyWith(
        timerStatus: TimerStatus.running,
      );

      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>.value(
            value: mockServices,
            child: BlocProvider<TimerBloc>.value(
              value: mockTimerBloc,
              child: TimerRunningControls(
                timerState: timerState,
              ),
            )
          )
        )
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('timer_running_controls_main_button')));

      verify(() => mockTimerBloc.add(
        TimerEvent.paused()
      )).called(1);

    });


    testWidgets('can resume the timer', (WidgetTester tester) async {

      final TimerState timerState = TimerState.initial(
        timerSettings: TimerSettings(
        )
      ).copyWith(
        timerStatus: TimerStatus.paused,
      );

      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>.value(
            value: mockServices,
            child: BlocProvider<TimerBloc>.value(
              value: mockTimerBloc,
              child: TimerRunningControls(
                timerState: timerState,
              ),
            )
          )
        )
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('timer_running_controls_main_button')));

      verify(() => mockTimerBloc.add(
        TimerEvent.resumed()
      )).called(1);

    });

    // Testing against popping routes is a bit tricky
    testWidgets('can discard the session', (WidgetTester tester) async {

      TimerState timerState = TimerState.initial(
        timerSettings: TimerSettings(
          warmup: Duration.zero,
        ),
      ).copyWith(
        timerStatus: TimerStatus.paused,
        elapsedTime: Duration(minutes: 2),
      );
      bool didPop = false;

      final GoRouter goRouter = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => SizedBox.shrink(),
          ),
          GoRoute(
            path: '/test',
            name: 'test',
            onExit: (context, state) {
              didPop = true;
              return true;
            },
            builder: (context, state) {
              return withAllContextProviders(
                Provider<Services>.value(
                  value: mockServices,
                  child: BlocProvider<TimerBloc>.value(
                    value: mockTimerBloc,
                    child: TimerRunningControls(
                      timerState: timerState,
                    ),
                  )
                )
              );
            },
          )
        ]
      );

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: goRouter,
        ),
      );

      goRouter.pushNamed('test');
      await tester.pumpAndSettle();

      // Start the pause menu reveal animation to show the discard button
      final TimerRunningControlsState state =
        tester.state(find.byType(TimerRunningControls));
      state.animationController.forward();
      await tester.pumpAndSettle();

      expect(
        find.byKey(const Key('timer_running_controls_discard_button')),
        findsOneWidget
      );

      // Tap the discard button
      await tester.tap(find.byKey(const Key('timer_running_controls_discard_button')));
      await tester.pumpAndSettle();

      // Check that the route was popped
      expect(didPop, isTrue);
      expect(find.byType(TimerRunningControls), findsNothing);

    });


    testWidgets('can finish the timer', (WidgetTester tester) async {

      final TimerState timerState = TimerState.initial(
        timerSettings: TimerSettings(
        )
      ).copyWith(
        timerStatus: TimerStatus.paused,
        elapsedTime: Duration(minutes: 2),
        timerStage: TimerStage.timer,
      );

      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>.value(
            value: mockServices,
            child: BlocProvider<TimerBloc>.value(
              value: mockTimerBloc,
              child: TimerRunningControls(
                timerState: timerState,
              ),
            )
          )
        )
      );

      // Start the pause menu reveal animation to show the finish button
      final TimerRunningControlsState state =
        tester.state(find.byType(TimerRunningControls));
      state.animationController.forward();
      await tester.pumpAndSettle();

      await tester.tap(
        find.byKey(const Key('timer_running_controls_finish_button'))
      );

      verify(() => mockTimerBloc.add(
        TimerEvent.finished()
      )).called(1);

    });



  }); // eof group
} // eof main
