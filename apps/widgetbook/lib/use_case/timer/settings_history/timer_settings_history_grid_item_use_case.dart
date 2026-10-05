import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:core/core.dart';
import 'package:timer/timer.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: TimerSettingsHistoryGridItem,
  path: '[Timer]/public/view/timer_settings_history/',
)
Widget buildTimerSettingsHistoryGridItem(BuildContext context) {

  final durationMinutes = context.knobs.int.slider(
    label: 'Duration (minutes)',
    initialValue: 10,
    min: 1,
    max: 60,
  );

  final warmupMinutes = context.knobs.int.slider(
    label: 'Warmup (minutes)',
    initialValue: 1,
    min: 0,
    max: 5,
  );

  final intervalCount = context.knobs.int.slider(
    label: 'Interval Count',
    initialValue: 0,
    min: 0,
    max: 3,
  );

  final useCount = context.knobs.int.slider(
    label: 'Use Count',
    initialValue: 3,
    min: 0,
    max: 20,
  );

  final timerSettingsHistoryRecord = TimerSettingsHistoryRecord(
    id: 'preview-id',
    useCount: useCount,
    lastUsed: DateTime.now(),
    timerSettings: TimerSettings(
      warmup: Duration(minutes: warmupMinutes),
      duration: Duration(minutes: durationMinutes),
      intervalCount: intervalCount,
    ),
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(DesignSpec.paddingLg),
      child: SizedBox(
        width: 220,
        child: TimerSettingsHistoryGridItem(
          timerSettingsHistoryRecord: timerSettingsHistoryRecord,
          onTap: () {},
        ),
      ),
    ),
  );
}
