import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:core/core.dart';
import 'package:timer/timer.dart';


class MockTimerSettingsCubit extends Mock implements TimerSettingsCubit {}

@widgetbook.UseCase(
  name: 'Default',
  type: TimerSettingsView,
  path: '[Timer]/public/view/',
)
Widget buildTimerSettingsView(BuildContext context) {
  final warmupMinutes = context.knobs.int.slider(
    label: 'Warmup (minutes)',
    initialValue: 1,
    min: 0,
    max: 5,
  );

  final startingSound = context.knobs.object.dropdown(
    label: 'Starting Sound',
    options: Sound.values,
    initialOption: Sound.smallBell,
  );  

  final durationMinutes = context.knobs.int.slider(
    label: 'Duration (minutes)',
    initialValue: 10,
    min: 1,
    max: 60,
  );

  final intervalCount = context.knobs.int.slider(
    label: 'Interval Count',
    initialValue: 0,
    min: 0,
    max: 3,
  );

   final intervalSound = context.knobs.object.dropdown(
    label: 'Interval Sound',
    options: Sound.values,
    initialOption: Sound.triangle,
  ); 

  final endingSound = context.knobs.object.dropdown(
    label: 'Ending Sound',
    options: Sound.values,
    initialOption: Sound.smallBell,
  );

  final timerSettings = TimerSettings(
    warmup: Duration(minutes: warmupMinutes),
    duration: Duration(minutes: durationMinutes),
    intervalCount: intervalCount,
    startingSound: startingSound,
    endingSound: endingSound,
    intervalSound: intervalSound,
  );


  registerFallbackValue(timerSettings);
  final mockCubit = MockTimerSettingsCubit();
  when(() => mockCubit.timerSettingsChanged(any())).thenAnswer((_) async {});

  return Provider<TimerSettingsCubit>.value(
    value: mockCubit,
    child: Center(
      child: TimerSettingsView(
        timerSettings: timerSettings,
      ),
    ),
  );
}