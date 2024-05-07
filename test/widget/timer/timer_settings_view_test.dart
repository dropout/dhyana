import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/timer/all.dart';
import 'package:dhyana/widget/timer/settings/duration_input.dart';
import 'package:dhyana/widget/timer/settings/sound_input.dart';
import 'package:dhyana/widget/timer/settings/warmup_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_context_providers.dart';

class MockTimerSettingsBloc
    extends MockBloc<TimerSettingsEvent, TimerSettingsState>
    implements TimerSettingsBloc {}

void main() {

  group('TimerSettingsView', () {

    testWidgets('TimerSettingsView has all the necessary interface elements', (WidgetTester tester) async {

      TimerSettings timerSettings = TimerSettings.initial();

      await tester.pumpWidget(
        getAllTestContextProviders(
          BlocProvider<TimerSettingsBloc>(
            create: (context) => MockTimerSettingsBloc(),
            child: TimerSettingsView(timerSettings: timerSettings)
          )
        )
      );

      await tester.pumpAndSettle();

      expect(find.byType(WarmupTimeInput), findsOneWidget);
      expect(find.byType(SoundInput), findsExactly(2));
      expect(find.byType(DurationInput), findsOneWidget);
      expect(find.text('START'), findsOneWidget);

    });

  });

}
