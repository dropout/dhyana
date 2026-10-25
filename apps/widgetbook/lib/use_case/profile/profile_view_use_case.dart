// ignore_for_file: implementation_imports

import 'package:material_ui/material_ui.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/presentation/view/profile_view.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: ProfileView,
  path: '[Profile]/internal/view/',
)
Widget buildProfileView(BuildContext context) {
  final firstName = context.knobs.string(
    label: 'First name',
    initialValue: 'Layman',
  );
  final lastName = context.knobs.string(
    label: 'Last name',
    initialValue: 'Pang',
  );
  final showStats = context.knobs.boolean(
    label: 'Show stats',
    initialValue: true,
  );

  final profile = Profile.anonymous().copyWith(
    id: 'widgetbook-profile',
    firstName: firstName,
    lastName: lastName,
    settings: ProfileSettings(showStats: showStats),
    statsReport: const ProfileStatsReport(
      consecutiveDays: ConsecutiveDays(current: 12, longest: 23),
      milestoneProgress: MilestoneProgress(
        completedDaysCount: 5,
        targetDaysCount: 7,
      ),
      milestoneCount: 6,
      completedMinutesCount: 840,
      completedSessionsCount: 56,
      completedDaysCount: 32,
    ),
  );

  return Center(
    child: SingleChildScrollView(child: ProfileView(profile: profile)),
  );
}
