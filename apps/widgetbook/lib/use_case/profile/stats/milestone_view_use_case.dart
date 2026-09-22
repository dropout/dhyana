import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:profile/profile.dart';

@widgetbook.UseCase(
	name: 'Default',
	type: MilestonesView,
	path: '[Profile]/public/view/stats/',
)
Widget buildMilestonesView(BuildContext context) {
	final milestoneCount = context.knobs.int.slider(
		label: 'Milestone Count',
		initialValue: 3,
		min: 0,
		max: 50,
	);
	final completedDays = context.knobs.int.slider(
		label: 'Completed Days',
		initialValue: 4,
		min: 0,
		max: 7,
	);
	final showMeter = context.knobs.boolean(
		label: 'Show Meter',
		initialValue: true,
	);

	return Center(
		child: Padding(
			padding: const EdgeInsets.all(16),
			child: MilestonesView(
				profileStatsReport: ProfileStatsReport(
					milestoneCount: milestoneCount,
					milestoneProgress: MilestoneProgress(
						completedDaysCount: completedDays,
					),
				),
				showMeter: showMeter,
			),
		),
	);
}
