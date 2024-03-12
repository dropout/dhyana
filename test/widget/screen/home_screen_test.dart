import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/screen/all.dart';
import 'package:dhyana/widget/timer/all.dart';
import 'package:dhyana/widget/timer/settings/duration_input.dart';
import 'package:dhyana/widget/timer/settings/sound_input.dart';
import 'package:dhyana/widget/timer/settings/warmup_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../context_providers.dart';

class MockTimerSettingsBloc
    extends MockBloc<TimerSettingsEvent, TimerSettingsState>
    implements TimerSettingsBloc {}

class MockAuthBloc
    extends MockBloc<AuthEvent, AuthState>
    implements AuthBloc {}


void main() {

  group('HomeScreen', () {
    late MockAuthBloc authBloc;
    late MockTimerSettingsBloc timerSettingsBloc;

    setUp(() {
      authBloc = MockAuthBloc();
      timerSettingsBloc = MockTimerSettingsBloc();

      when(() => authBloc.state).thenReturn(const AuthState.signedOut());
      when(() => timerSettingsBloc.state).thenReturn(const TimerSettingsState.loading());
    });


    testWidgets('HomeScreen can display a loading state', (WidgetTester tester) async {
      await tester.pumpWidget(
        getAllTestContextProviders(
          MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(
                create: (context) => authBloc,
              ),
              BlocProvider<TimerSettingsBloc>(
                create: (context) => timerSettingsBloc,
              ),
            ],
            child: const HomeScreen(),
          )
        )
      );
      await tester.pumpAndSettle();
      expect(find.text('Loading'), findsOneWidget);
    });

    /*
    testWidgets('HomeScreen can display an error state', (WidgetTester tester) async {

      TimerSettings timerSettings = TimerSettings.initial();

      await tester.pumpWidget(
        getAppProviders(
          getLocalizationsProvider(
              const Locale('hu', 'HU'),
              BlocProvider<TimerSettingsBloc>(
                  create: (context) => _MockTimerSettingsBloc(),
                  child: TimerSettingsView(timerSettings: timerSettings)
              )
          )
        )
      );

      await tester.pumpAndSettle();

    });

    testWidgets('HomeScreen can a loaded state', (WidgetTester tester) async {

      TimerSettings timerSettings = TimerSettings.initial();

      await tester.pumpWidget(
          getLocalizationsProvider(
              const Locale('hu', 'HU'),
              BlocProvider<TimerSettingsBloc>(
                  create: (context) => _MockTimerSettingsBloc(),
                  child: TimerSettingsView(timerSettings: timerSettings)
              )
          )
      );

      await tester.pumpAndSettle();

    });

     */

  });



}
