import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/util/profile_stats_calculator.dart';
import 'package:flutter/material.dart';

class ConsecutiveDays extends StatefulWidget {

  final Profile profile;
  final bool shouldCalculate;

  const ConsecutiveDays({
    required this.profile,
    this.shouldCalculate = false,
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
    final int consecutiveDays = widget.profile.stats.consecutiveDays;
    return Column(
      children: [
        Text(consecutiveDays.toString(),
            style: Theme.of(context).textTheme.displaySmall
        ),
        Text('consecutive days',
            style: Theme.of(context).textTheme.bodyLarge
        ),
        Text(AppLocalizations.of(context).testPlural(1)),
        Text(AppLocalizations.of(context).testPlural(2)),
      ],
    );
  }

  int getCalculatedConsecutiveDays() {
    if (widget.shouldCalculate) {
      return profileStatsCalculator.getCalculatedConsecutiveDays(widget.profile.stats);
    } else {
      return widget.profile.stats.consecutiveDays;
    }
  }

}
