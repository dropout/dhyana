import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/profile/all.dart';
import 'package:dhyana/widget/screen/all.dart';
import 'package:dhyana/widget/timer/all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_context_providers.dart';

class MockTimerSettingsBloc
    extends MockBloc<TimerSettingsEvent, TimerSettingsState>
    implements TimerSettingsBloc {}

class MockAuthBloc
    extends MockBloc<AuthEvent, AuthState>
    implements AuthBloc {}

void main() {

  group('HomeScreenContent signed out', () {
    late MockAuthBloc authBloc;
    late MockTimerSettingsBloc timerSettingsBloc;

    setUp(() {
      authBloc = MockAuthBloc();
      timerSettingsBloc = MockTimerSettingsBloc();

      when(() => authBloc.state).thenReturn(const AuthState.signedOut());
    });


    testWidgets('HomeScreenContent can display a loading state', (WidgetTester tester) async {

      when(() => timerSettingsBloc.state)
        .thenReturn(const TimerSettingsState.loading());

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
            child: const HomeScreenContent(),
          )
        )
      );
      await tester.pumpAndSettle();
      expect(find.text('Loading'), findsOne);
    });


    testWidgets('HomeScreenContent can display an error state', (WidgetTester tester) async {

      when(() => timerSettingsBloc.state)
        .thenReturn(const TimerSettingsState.error());

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
            child: const HomeScreenContent(),
          )
        )
      );

      await tester.pumpAndSettle();
      expect(find.text('Error occured'), findsOne);
    });


    testWidgets('HomeScreen can a loaded state', (WidgetTester tester) async {

      when(() => timerSettingsBloc.state).thenReturn(
        TimerSettingsState.loaded(timerSettings: TimerSettings.initial())
      );

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
                child: const HomeScreenContent(),
              )
          )
      );

      await tester.pumpAndSettle();
      expect(find.byType(TimerSettingsView), findsOneWidget);
      expect(find.byType(ProfileButton), findsOneWidget);
    });

  });



}
