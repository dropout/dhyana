import 'package:bar_chart/bar_chart.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';

class StatsBarChart extends StatefulWidget {

  final List<BarData> barData;
  final InfoBuilderDelegate? infoBuilderDelegate;

  final XAxisLabelFormatter xAxisLabelFormatter;

  const StatsBarChart({
    this.barData = const [],
    this.infoBuilderDelegate,
    this.xAxisLabelFormatter = const XAxisLabelFormatter(),
    super.key,
  });

  @override
  State<StatsBarChart> createState() => _StatsBarChartState();
}

class _StatsBarChartState extends State<StatsBarChart> {

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DesignSpec.paddingXl),
      child: InfoHeaderBarChart(
        dataSource: widget.barData,
        displayRangeSetter: DisplayRangeSetters.durationDisplayRangeSetter,
        xAxisIntervalSetter: (dataSource) => 1,
        xAxisLabelFormatter: XAxisLabelFormatter(
          color: Colors.grey.shade700,
        ),

        yAxisIntervalSetter: (displayRange) => (displayRange / 3),
        yAxisLabelFormatter: CustomYAxisLabelFormatter(
          context: context,
          color: Colors.grey.shade700,
        ),

        infoBuilderDelegate: (context, index) {
          if (widget.infoBuilderDelegate == null) {
            return const SizedBox.shrink();
          }
          return widget.infoBuilderDelegate!.call(context, index);
        },
        averageLabel: AppLocalizations.of(context).averageAbbr.toLowerCase(),

        onInfoTriggered: (index, barData) {
          context.services.hapticsService.select();
        },
        onInfoChanged: (index, barData) {
          context.services.hapticsService.select();
        },
        onInfoDismissed: (index, barData) {
          context.services.hapticsService.select();
        },
      ),

    );
  }

}

class CustomYAxisLabelFormatter extends YAxisLabelFormatter {

  final BuildContext context;

  const CustomYAxisLabelFormatter({
    required this.context,
    super.color = Colors.white,
  });

  @override
  TextPainter format(double value, double max) {

    if (max < 90) {
      int minutes = value.toInt();
      String postFix = AppLocalizations.of(context).minutesAbbr.toLowerCase();
      return createTextPainter(
        '${minutes.toStringAsFixed(0)}$postFix',
        TextAlign.left,
        size: 12,
        color: color,
      );
    }

    String postFix = AppLocalizations.of(context).hoursAbbr.toLowerCase();
    int hours = (value ~/ 60);
    return createTextPainter(
      '${hours.toStringAsFixed(0)}$postFix',
      TextAlign.left,
      size: 12,
      color: color,
    );

  }

}
