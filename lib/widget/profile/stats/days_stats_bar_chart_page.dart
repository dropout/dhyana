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
          label: DateFormat.E(Localizations.localeOf(context).toString()).format(day.startDate).substring(0,1),
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
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: BarChart(
        dataSource: widget.barData,
        displayRangeSetter: (max) => 100,
        axisSpacing: EdgeInsets.only(
          top: 10,
          right: 40,
          bottom: 21,
          left: 0,
        ),
        yAxisIntervalSetter: (dataSource) {
          return 10.0;
        },
        axisBuilder: (context, barChartContext) {
          return CustomPaint(
            painter: AxisPainter(
              color: Colors.grey.shade600,
              barChartContext: barChartContext,
            ),
          );
        },
        barBuilder: (context, barChartContext) {
          return InfoTriggerBars(
            barColor: Colors.grey,
            selectedBarColor: Colors.grey.shade200,
            barChartContext: barChartContext,
            onInfoTriggered: (index, data) =>
              widget.onInfoTriggered?.call(index, data),
            onInfoChanged: (index, data) =>
              widget.onInfoChanged?.call(index, data),
            onInfoDismissed: (index, data) =>
              widget.onInfoDismissed?.call(index, data),
          );
        },
        overlayBuilder: (context, barChartContext) {
          return AverageBarChartOverlay(barChartContext: barChartContext);
        },
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
    return AnimatedBuilder(
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
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

}
