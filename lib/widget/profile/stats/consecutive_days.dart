import 'package:dhyana/model/consecutive_days.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/util/profile_stats_report_updater.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConsecutiveDaysDisplay extends StatefulWidget {

  final Profile profile;

  const ConsecutiveDaysDisplay({
    required this.profile,
    super.key
  });

  @override
  State<ConsecutiveDaysDisplay> createState() => _ConsecutiveDaysDisplayState();
}

class _ConsecutiveDaysDisplayState extends State<ConsecutiveDaysDisplay> {

  late final ProfileStatsReportUpdater profileStatsCalculator;

  @override
  void initState() {
    profileStatsCalculator = ProfileStatsReportUpdater();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int consecutiveDays = widget.profile.statsReport.consecutiveDays.current;
    return Column(
      children: [
        buildNumber(context, consecutiveDays.toString()),
        Text('consecutive days',
          style: Theme.of(context).textTheme.bodyLarge
        ),
        buildConsecutiveDaysStartTime(context),
      ],
    );
  }

  Widget buildNumber(BuildContext context, String value) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppThemeData.paddingXl),
        child: Text(value.toString(),
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: AppColors.backgroundPaperLight,
          ),
        ),
      )
    );
  }

  Widget buildConsecutiveDaysStartTime(BuildContext context) {
    final ConsecutiveDays consecutiveDays =
      widget.profile.statsReport.consecutiveDays;
    if (consecutiveDays.current > 0 && consecutiveDays.startedAt != null) {

      Locale locale = Localizations.localeOf(context);
      String formattedDate = DateFormat.yMMMMd(locale.toString()).format(consecutiveDays.startedAt!);

      return Text('Since $formattedDate',
        style: Theme.of(context).textTheme.bodySmall
      );
    } else {
      return const SizedBox.shrink();
    }

  }

}
