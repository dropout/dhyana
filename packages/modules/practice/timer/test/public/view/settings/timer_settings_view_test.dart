import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import 'package:core/core.dart';
import 'package:timer/src/public/model/timer_settings.dart';
import 'package:timer/src/public/view/timer_settings/interval_input.dart';
import 'package:timer/src/public/viewmodel/timer_settings_cubit.dart';

import 'package:timer/src/public/view/timer_settings/duration_input.dart';
import 'package:timer/src/public/view/timer_settings/sound_input.dart';
import 'package:timer/src/public/view/timer_settings/warmup_input.dart';
import 'package:timer/src/public/view/timer_settings/timer_settings_view.dart';

import '../../../timer_mock_definitions.dart';
import '../../../timer_test_helper.dart';


void main() {
  group('TimerSettingsView', () {
    late MockServices mockServices;
    late OverlayService mockOverlayService;

    setUpAll(() async {
      mockServices = MockServices();
      mockOverlayService = MockOverlayService();

      when(() => mockServices.overlayService).thenReturn(mockOverlayService);
    });

    tearDown(() {});

    testWidgets('TimerSettingsView has all the necessary interface elements', (
      WidgetTester tester,
    ) async {
      TimerSettings timerSettings = TimerSettings();

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: TimerTestHelper.withLocalizationProvider(
            BlocProvider<TimerSettingsCubit>(
              create: (context) => MockTimerSettingsCubit(),
              child: ShaderRenderingScope(
                enabled: false, 
                child: TimerSettingsView(timerSettings: timerSettings)
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(WarmupInput), findsOneWidget);
      expect(find.byType(SoundInput), findsExactly(2));
      expect(find.byType(DurationInput), findsOneWidget);
      expect(find.byType(IntervalInput), findsOneWidget);
      expect(find.byType(SessionStartButton), findsOneWidget);
    });
  });
}
