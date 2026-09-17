import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:core/core.dart';
import 'package:timer/timer.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: TimerSettingsHistoryListItem,
  path: '[Timer]/timer_settings_history/',
)
Widget buildTimerSettingsHistoryListItem(BuildContext context) {
  final warmupMinutes = context.knobs.int.slider(
    label: 'Warmup (minutes)',
    initialValue: 1,
    min: 0,
    max: 5,
  );

  final durationMinutes = context.knobs.int.slider(
    label: 'Duration (minutes)',
    initialValue: 10,
    min: 1,
    max: 60,
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
    ),
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(DesignSpec.paddingLg),
      child: TimerSettingsHistoryListItem(
        timerSettingsHistoryRecord: timerSettingsHistoryRecord,
        onTap: () {},
      ),
    ),
  );
}
