import 'package:dhyana/model/profile.dart';
import 'package:dhyana/util/profile_stats_calculator.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

class ConsecutiveDays extends StatefulWidget {

  final Profile profile;
  final bool overrideProfileValue;

  const ConsecutiveDays({
    required this.profile,
    this.overrideProfileValue = true,
    super.key
  });

  @override
  State<ConsecutiveDays> createState() => _ConsecutiveDaysState();
}

class _ConsecutiveDaysState extends State<ConsecutiveDays> {

  late final ProfileStatsCalculator profileStatsCalculator;

  @override
  void initState() {
    profileStatsCalculator = ProfileStatsCalculator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int consecutiveDays = getCalculatedConsecutiveDays();
    return Column(
      children: [
        buildNumber(context, consecutiveDays.toString()),
        Text('consecutive days',
            style: Theme.of(context).textTheme.bodyLarge
        ),
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

  int getCalculatedConsecutiveDays() {
    if (widget.overrideProfileValue) {
      return profileStatsCalculator.getCalculatedConsecutiveDays(widget.profile.statsReport);
    } else {
      return widget.profile.statsReport.consecutiveDays;
    }
  }

}
