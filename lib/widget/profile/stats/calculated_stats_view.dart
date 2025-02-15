import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_animation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CalculatedStatsView extends StatefulWidget {

  final CalculatedStats calculatedStats;

  const CalculatedStatsView({
    required this.calculatedStats,
    super.key,
  });

  @override
  State<CalculatedStatsView> createState() => _CalculatedStatsViewState();
}

class _Entry {
  final String label;
  final String value;

  _Entry(this.label, this.value);

}

class _CalculatedStatsViewState extends State<CalculatedStatsView>
  with SingleTickerProviderStateMixin {

  String uuid = Uuid().v4();
  int totalSessions = 0;
  int totalMinutes = 0;
  int averageSessions = 0;
  int averageMinutes = 0;
  List<_Entry> entries = [];

  late final AnimationController _animationController;
  late final Animation<double> _mainAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Durations.long4,
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant CalculatedStatsView oldWidget) {
    if (oldWidget.calculatedStats != widget.calculatedStats) {
      setState(() {
        uuid = Uuid().v4();
      });

      _animationController.reverse(from: 1.0).then((_) {
        _animationController.forward(from: 0.0);
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    CalculatedStats calculatedStats = widget.calculatedStats;
    return Column(
      children: [
        buildColumnItem(
          context,
          label: AppLocalizations.of(context).statsTotalSessions,
          value: '${calculatedStats.totalSessions} ${AppLocalizations.of(context).sessions}',
          order: 0,
        ),
        buildColumnItem(
          context,
          label: AppLocalizations.of(context).statsTotalTimeSpent,
          value: AppLocalizations.of(context).minutesPluralWithNumber(calculatedStats.totalMinutes),
          order: 1,
        ),
        buildColumnItem(
          context,
          label: AppLocalizations.of(context).statsAverageSessions,
          value: '${calculatedStats.averageSessions.toStringAsFixed(0)} ${AppLocalizations.of(context).sessions}',
          order: 2,
        ),
        buildColumnItem(
          context,
          label: AppLocalizations.of(context).statsAverageTimeSpent,
          value: AppLocalizations.of(context).minutesPluralWithNumber(calculatedStats.averageMinutes.toInt()),
          order: 3,
        ),
      ]
    );
  }

  Widget buildColumnItem(
    BuildContext context, {
    required String label,
    required String value,
    int order = 0,
  }) {
    return AnimatedSwitcher(
      duration: Durations.extralong2,
      transitionBuilder: (child, animation) {

        if (animation.isForwardOrCompleted) {
          // fading out in unison
          return FadeTransition(
            opacity: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Interval(
                0.5,
                1.0,
                curve: Curves.easeInOutCubicEmphasized
              ),
            )),
            child: child,
          );
        }

        // fading in staggered
        double staggerGap = 0.1 * order;
        return FadeTransition(
          opacity: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.5 + staggerGap,
                  1.0,
                ),
              )
          ),
          child: child,
        );
      },
      child: Card(
        key: ValueKey(widget.calculatedStats),
        color: AppColors.backgroundPaperLight,
        child: Padding(
          padding: const EdgeInsets.all(AppThemeData.paddingMd),
          child: Row(
            children: [
              Text(
                label.toUpperCase(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                value,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      )
    );
  }

}
