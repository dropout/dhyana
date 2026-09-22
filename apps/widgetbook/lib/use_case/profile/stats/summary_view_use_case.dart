import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:profile/profile.dart';

@widgetbook.UseCase(
	name: 'Default',
	type: SummaryView,
	path: '[Profile]/public/view/stats/',
)
Widget buildSummaryView(BuildContext context) {
	final sessionCount = context.knobs.int.slider(
		label: 'Sessions',
		initialValue: 12,
		min: 0,
		max: 100,
	);
	final minutesCount = context.knobs.int.slider(
		label: 'Minutes',
		initialValue: 180,
		min: 0,
		max: 1000,
	);
	final daysCount = context.knobs.int.slider(
		label: 'Days',
		initialValue: 7,
		min: 0,
		max: 365,
	);

	return Center(
		child: Padding(
			padding: const EdgeInsets.all(16),
			child: SummaryView(
				sessionCount: sessionCount,
				minutesCount: minutesCount,
				daysCount: daysCount,
			),
		),
	);
}
