import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:core/core.dart';
import 'package:session/session.dart';

@widgetbook.UseCase(
	name: 'Default',
	type: SessionHistoryListItem,
	path: '[Session]/presentation/view/history/',
)
Widget buildSessionHistoryListItem(BuildContext context) {
	final durationMinutes = context.knobs.int.slider(
		label: 'Duration (minutes)',
		initialValue: 10,
		min: 1,
		max: 120,
	);
	final startHour = context.knobs.int.slider(
		label: 'Start Hour',
		initialValue: 8,
		min: 0,
		max: 23,
	);
	final type = context.knobs.object.dropdown(
		label: 'Session Type',
		options: SessionType.values,
		initialOption: SessionType.timer,
	);

	final startTime = DateTime(2026, 1, 15, startHour);
	final endTime = startTime.add(Duration(minutes: durationMinutes));

	return Center(
		child: Padding(
			padding: const EdgeInsets.all(16),
			child: SessionHistoryListItem(
				startTime: startTime,
				endTime: endTime,
				duration: Duration(minutes: durationMinutes),
				type: type,
			),
		),
	);
}
