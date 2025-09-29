import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/default_shader_service.dart';
import 'package:dhyana/service/overlay_service.dart';
import 'package:dhyana/service/shader_service.dart';
import 'package:dhyana/widget/timer/all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../test_context_providers.dart';

class MockTimerSettingsBloc
  extends MockBloc<TimerSettingsEvent, TimerSettingsState>
  implements TimerSettingsBloc {}

class MockServices
  extends Mock
  implements DefaultServices {}

class MockOverlayService
  extends Mock
  implements OverlayService {}

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
            BlocProvider<TimerSettingsBloc>(
              create: (context) => MockTimerSettingsBloc(),
              child: TimerSettingsView(timerSettings: timerSettings)
            )
          )
        )
      );

      await tester.pump();

      expect(find.byType(WarmupTimeInput), findsOneWidget);
      expect(find.byType(SoundInput), findsExactly(2));
      expect(find.byType(DurationInput), findsOneWidget);
      expect(find.byType(TimerStartButton), findsOneWidget);

    });


  });

}
