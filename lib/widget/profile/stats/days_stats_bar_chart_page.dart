import 'package:bar_chart/bar_chart.dart';
import 'package:dhyana/bloc/days/days_bloc.dart';
import 'package:dhyana/model/day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DaysStatsBarChartPage extends StatelessWidget {

  final int pageIndex;

  // forward these to the actual barchart infotrigger bars implementation
  final void Function(int index, Day day)? onInfoTriggered;
  final void Function(int index, Day day)? onInfoChanged;
  final void Function(int index, Day day)? onInfoDismissed;

  final void Function(List<Day> days)? onDaysLoaded;

  const DaysStatsBarChartPage({
    required this.pageIndex,
    this.onInfoTriggered,
    this.onInfoChanged,
    this.onInfoDismissed,
    this.onDaysLoaded,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DaysBloc, DaysState>(
      builder: (context, state) {
        switch (state) {
          case DaysLoadingState():
            return buildLoadingState(context);
          case DaysLoadingErrorState():
            return const SizedBox.shrink();
          case DaysLoadedState():
            return buildLoadedState(context, state);
        }
      },
      listener: (context, state) {
        if (state is DaysLoadedState) {
          onDaysLoaded?.call(state.days);
        }
      },
      listenWhen: (previous, current) =>
        current is DaysLoadedState && previous is! DaysLoadedState,
    );
  }

  Widget buildLoadingState(BuildContext context) {
    return StatsBarChart(
      key: ValueKey(pageIndex),
      barData: List.generate(14, (index) {
        return BarData(
          value: 0,
          label: '${index + 1}',
        );
      }),
    );
  }

  Widget buildLoadedState(BuildContext context, DaysLoadedState state) {
    return StatsBarChart(
      key: ValueKey(pageIndex),
      barData: state.days.map((day) {
        return BarData(
          value: day.minutesCount.toDouble(),
          label: DateFormat.EEEE(Localizations.localeOf(context).toString()).format(day.startDate).toUpperCase(),
        );
      }).toList(),
      onInfoTriggered: (index, _) => onInfoTriggered?.call(index, state.days[index]),
      onInfoChanged: (index, _) => onInfoChanged?.call(index, state.days[index]),
      onInfoDismissed: (index, _) => onInfoDismissed?.call(index, state.days[index]),
    );
  }

}


class StatsBarChart extends StatefulWidget {

  final List<BarData> barData;

  final void Function(int index, BarData data)? onInfoTriggered;
  final void Function(int index, BarData data)? onInfoChanged;
  final void Function(int index, BarData data)? onInfoDismissed;

  const StatsBarChart({
    this.barData = const [],
    this.onInfoTriggered,
    this.onInfoChanged,
    this.onInfoDismissed,
    super.key,
  });

  factory StatsBarChart.empty() =>
    const StatsBarChart(
      barData: [],
    );

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
    final EdgeInsets barPadding = EdgeInsets.only(
      top: 10,
      right: 32,
      bottom: 21,
      left: 0,
    );
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: BarChart(
        dataSource: widget.barData,
        displayRangeSetter: (max) => 90,
        axisBuilder: (context, barChartContext) {
          return DefaultBarChartAxis(
            barPadding: barPadding,
            color: Colors.grey.shade700,
            barChartContext: barChartContext,
            xAxisIntervalSetter: (dataSource) {
              return 7;
            },
            yAxisIntervalSetter: (dataSource) {
              return 30.0;
            },
          );
        },
        barBuilder: (context, barChartContext) {
          return Padding(
            padding: barPadding,
            child: InfoTriggerBars(
              barColor: Colors.grey.shade500,
              selectedBarColor: Colors.white,
              barChartContext: barChartContext,
              onInfoTriggered: (index, data) =>
                widget.onInfoTriggered?.call(index, data),
              onInfoChanged: (index, data) =>
                widget.onInfoChanged?.call(index, data),
              onInfoDismissed: (index, data) =>
                widget.onInfoDismissed?.call(index, data),
            ),
          );
        },
        overlayBuilder: (context, barChartContext) {
          return Padding(
            padding: barPadding,
            child: AverageBarChartOverlay(barChartContext: barChartContext),
          );
        },
      ),
    );
  }
}


String _defaultYAxisLabelFormatter(double value) => value.toStringAsFixed(0);
String _defaultXAxisLabelFormatter(BarData barChartData) => barChartData.label;
double _defaultYAxisIntervalSetter(double displayRange) => (displayRange / 4);
int _defaultXAxisIntervalSetter(int barCount) => 1;
class DefaultBarChartAxis extends StatefulWidget {

  final Color color;
  final BarChartContext barChartContext;
  final EdgeInsets barPadding;

  final double Function(double displayRange) yAxisIntervalSetter;
  final int Function(int barCount) xAxisIntervalSetter;

  final String Function(double value) yAxisLabelFormatter;
  final String Function(BarData barChartData) xAxisLabelFormatter;

  const DefaultBarChartAxis({
    required this.barChartContext,
    required this.color,
    required this.barPadding,
    this.yAxisIntervalSetter = _defaultYAxisIntervalSetter,
    this.xAxisIntervalSetter = _defaultXAxisIntervalSetter,
    this.yAxisLabelFormatter = _defaultYAxisLabelFormatter,
    this.xAxisLabelFormatter = _defaultXAxisLabelFormatter,
    super.key,
  });

  @override
  State<DefaultBarChartAxis> createState() => _DefaultBarChartAxisState();
}

class _DefaultBarChartAxisState extends State<DefaultBarChartAxis> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AxisPainter(
        xIntervalCount: widget.xAxisIntervalSetter(widget.barChartContext.dataSource.length),
        yIntervalCount: widget.yAxisIntervalSetter(widget.barChartContext.displayRange),
        xAxisLabelFormatter: widget.xAxisLabelFormatter,
        yAxisLabelFormatter: widget.yAxisLabelFormatter,
        color: widget.color,
        barChartContext: widget.barChartContext,
        barPadding: widget.barPadding,
      ),
    );
  }
}


class AverageBarChartOverlay extends StatefulWidget {

  final BarChartContext barChartContext;

  const AverageBarChartOverlay({
    required this.barChartContext,
    super.key,
  });

  @override
  State<AverageBarChartOverlay> createState() => _AverageBarChartOverlayState();
}

class _AverageBarChartOverlayState extends State<AverageBarChartOverlay>
  with SingleTickerProviderStateMixin {

  late final AnimationController animationController;
  late final Animation<double> lineProgressAnimation;
  late final Animation<double> textOpacityAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Durations.long2,
    );
    lineProgressAnimation = Tween(begin: 0.0, end: 1.0)
      .chain(CurveTween(curve: Curves.easeOutExpo))
      .animate(CurvedAnimation(parent: animationController, curve: Interval(0.0, 0.5)));
    textOpacityAnimation = Tween(begin: 0.0, end: 1.0)
      .chain(CurveTween(curve: Curves.easeOutExpo))
      .animate(CurvedAnimation(parent: animationController, curve: Interval(0.5, 1.0)));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AverageBarChartOverlay oldWidget) {
    if (widget.barChartContext.avg > 0.0 && oldWidget.barChartContext.avg == 0.0) {
      animationController.reset();
      animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: RepaintBoundary(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return CustomPaint(
              painter: AverageOverlayPainter(
                average: widget.barChartContext.avg,
                displayRange: widget.barChartContext.displayRange,
                color: Colors.white,
                lineProgress: lineProgressAnimation.value,
                textOpacity: textOpacityAnimation.value,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

}
