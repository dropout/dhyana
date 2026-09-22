import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:profile/profile.dart';

@widgetbook.UseCase(
	name: 'Default',
	type: MilestoneProgressView,
	path: '[Profile]/public/view/stats/',
)
Widget buildMilestoneProgressView(BuildContext context) {
	final targetDays = context.knobs.int.slider(
		label: 'Target Days',
		initialValue: 7,
		min: 1,
		max: 14,
	);
	final completedDays = context.knobs.int.slider(
		label: 'Completed Days',
		initialValue: 3,
		min: 0,
		max: targetDays,
	);
	final itemSize = context.knobs.double.slider(
		label: 'Item Size',
		initialValue: 36,
		min: 24,
		max: 64,
	);
	final showAnimation = context.knobs.boolean(
		label: 'Show Animation',
		initialValue: false,
	);
	final showText = context.knobs.boolean(
		label: 'Show Text',
		initialValue: true,
	);

	return Center(
		child: MilestoneProgressView(
			statsReport: ProfileStatsReport(
				milestoneProgress: MilestoneProgress(
					completedDaysCount: completedDays,
					targetDaysCount: targetDays,
				),
			),
			itemSize: itemSize,
			showAnimation: showAnimation,
			showText: showText,
		),
	);
}
