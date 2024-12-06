import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/chart/bar_chart_bar_delegate.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';

import 'data/bar_chart_data.dart';

class BarChart extends StatefulWidget {

  final String? title;
  final BarChartData data;
  final BarChartBarDelegate barDelegate;
  final double barGap;

  const BarChart({
    required this.data,
    this.barDelegate = const DefaultBarChartBarDelegate(),
    this.barGap = 2.0,
    this.title,
    super.key,
  });

  @override
  State<BarChart> createState() => _BarChartState();

}

class _BarChartState extends State<BarChart> {

  late double minValue;
  late double maxValue;

  void _calculateMinMax() {
    minValue = widget.data.data.map((e) => e.value).reduce((value, element) => value < element ? value : element);
    maxValue = widget.data.data.map((e) => e.value).reduce((value, element) => value > element ? value : element);
  }

  @override
  void initState() {
    _calculateMinMax();
    super.initState();
  }

  @override
  void didUpdateWidget(BarChart oldWidget) {
    _calculateMinMax();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(AppThemeData.borderRadiusLg),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppThemeData.spacingMd,
            vertical: AppThemeData.spacingXl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.title == null ? const SizedBox.shrink() :
              Text(
                widget.title ?? '',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Gap.medium(),

              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 20,
                      height: double.infinity,
                    ),
                    ...widget.data.data.map((e) {
                      return Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                  child: widget.barDelegate.build(context, e.value/maxValue)
                              ),
                              Gap.small(),
                              Text(e.label.toUpperCase(),
                                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                      );
                    }).toList().intersperse(SizedBox(width: widget.barGap))
                  ],
              //     children: widget.data.data.map((e) {
              //       return Expanded(
              //         child: Column(
              //           mainAxisSize: MainAxisSize.max,
              //           children: [
              //             Expanded(
              //               child: widget.barDelegate.build(context, e.value/maxValue)
              //             ),
              //             Gap.small(),
              //             Text(e.label.toUpperCase(),
              //               style: Theme.of(context).textTheme.labelSmall!.copyWith(
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ],
              //         )
              //       );
              //     }).toList().intersperse(SizedBox(width: widget.barGap)),
                ),
              ),
            ],
          ),
        ),
      )
    );

  }

}
