import 'package:dhyana/bloc/timer_settings/timer_settings_cubit.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/profile_settings.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/default/default_shader_service.dart';
import 'package:dhyana/service/overlay_service.dart';
import 'package:dhyana/service/shader_service.dart';
import 'package:dhyana/widget/session/session_start_button.dart';
import 'package:dhyana/widget/timer/settings/duration_input.dart';
import 'package:dhyana/widget/timer/settings/sound_input.dart';
import 'package:dhyana/widget/timer/settings/timer_start_button.dart';
import 'package:dhyana/widget/timer/settings/warmup_input.dart';
import 'package:dhyana/widget/timer/timer_settings_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../mock_definitions.dart';
import '../../test_context_providers.dart';

void main() {

  group('TimerSettingsView', () {

    late MockServices mockServices;
    late ShaderService shaderService;
    late OverlayService mockOverlayService;

    setUpAll(() async {
      mockServices = MockServices();
      shaderService = DefaultShaderService();
      mockOverlayService = MockOverlayService();

      when(() => mockServices.shaderService).thenReturn(shaderService);
      when(() => mockServices.overlayService).thenReturn(mockOverlayService);

      await shaderService.loadShader('shaders/gradient_flow.frag');
    });

    tearDown(() {
      shaderService.close();
    });

    testWidgets('TimerSettingsView has all the necessary interface elements', (WidgetTester tester) async {

      TimerSettings timerSettings = TimerSettings();

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: withAllContextProviders(
            BlocProvider<TimerSettingsCubit>(
              create: (context) => MockTimerSettingsCubit(),
              child: TimerSettingsView(
                timerSettings: timerSettings,
                profileSettings: ProfileSettings(id: 'profileSettingsId'),
              )
            )
          )
        )
      );

      await tester.pump();

      expect(find.byType(WarmupTimeInput), findsOneWidget);
      expect(find.byType(SoundInput), findsExactly(2));
      expect(find.byType(DurationInput), findsOneWidget);
      expect(find.byType(SessionStartButton), findsOneWidget);

    });


  });

}
