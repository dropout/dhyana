import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:profile/profile.dart';

@widgetbook.UseCase(
	name: 'Default',
	type: ConsecutiveDaysView,
	path: '[Profile]/public/view/stats/',
)
Widget buildConsecutiveDaysView(BuildContext context) {
	final currentDays = context.knobs.int.slider(
		label: 'Current Days',
		initialValue: 5,
		min: 0,
		max: 365,
	);
	final longestDays = context.knobs.int.slider(
		label: 'Longest Days',
		initialValue: 12,
		min: 0,
		max: 365,
	);

	final profile = Profile.anonymous().copyWith(
		statsReport: ProfileStatsReport(
			consecutiveDays: ConsecutiveDays(
				current: currentDays,
				longest: longestDays,
				startedAt: DateTime.now().subtract(Duration(days: currentDays)),
				lastChecked: DateTime.now(),
			),
		),
	);

	return Center(
		child: Padding(
			padding: const EdgeInsets.all(16),
			child: ConsecutiveDaysView(profile: profile),
		),
	);
}

