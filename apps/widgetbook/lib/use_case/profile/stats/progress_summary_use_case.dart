import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:profile/profile.dart';

@widgetbook.UseCase(
	name: 'Default',
	type: ProgressSummary,
	path: '[Profile]/public/view/stats/',
)
Widget buildProgressSummary(BuildContext context) {
	final oldSessions = context.knobs.int.slider(
		label: 'Previous Sessions',
		initialValue: 10,
		min: 0,
		max: 10,
	);
	final newSessions = context.knobs.int.slider(
		label: 'Updated Sessions',
		initialValue: 11,
		min: 1,
		max: 11,
	);
	final oldMinutes = context.knobs.int.slider(
		label: 'Previous Minutes',
		initialValue: 150,
		min: 150,
		max: 170,
	);
	final newMinutes = context.knobs.int.slider(
		label: 'Updated Minutes',
		initialValue: 170,
		min: 170,
		max: 200,
	);
	final oldDays = context.knobs.int.slider(
		label: 'Previous Days',
		initialValue: 6,
		min: 6,
		max: 9,
	);
	final newDays = context.knobs.int.slider(
		label: 'Updated Days',
		initialValue: 9,
		min: 9,
		max: 12,
	);

	Profile buildProfile({
		required int sessions,
		required int minutes,
		required int days,
	}) {
		return Profile.anonymous().copyWith(
			statsReport: ProfileStatsReport(
				completedSessionsCount: sessions,
				completedMinutesCount: minutes,
				completedDaysCount: days,
			),
		);
	}

	return ColoredBox(
		color: Colors.black,
		child: Center(
			child: ProgressSummary(
				oldProfile: buildProfile(
					sessions: oldSessions,
					minutes: oldMinutes,
					days: oldDays,
				),
				updatedProfile: buildProfile(
					sessions: newSessions,
					minutes: newMinutes,
					days: newDays,
				),
			),
		),
	);
}
