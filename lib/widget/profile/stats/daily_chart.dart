import 'dart:math';

import 'package:dhyana/bloc/days/days_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/util/remap_range.dart';
import 'package:dhyana/widget/bloc_provider/days_bloc_provider.dart';
import 'package:dhyana/widget/util/intersperse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyChart extends StatefulWidget {

  final Profile profile;
  final double height;

  const DailyChart({
    required this.profile,
    this.height = 96,
    super.key
  });

  @override
  State<DailyChart> createState() => _DailyChartState();
}

class _DailyChartState extends State<DailyChart> {

  @override
  Widget build(BuildContext context) {
    return DaysBlocProvider(
      initialEvent: DaysEvent.getDays(
        profileId: widget.profile.id,
        from: DateTime.now().subtract(const Duration(days: 30)),
      ),
      child: buildState(context)
    );
  }

  Widget buildState(BuildContext context) {
    return BlocBuilder<DaysBloc, DaysState>(
      builder: (context, state) {
        switch (state) {
          case DaysLoading():
            return buildLoading(context);
          case DaysLoaded():
            return buildLoaded(context, state);
          case DaysLoadingError():
            return const Text('error');
        }
      },
    );
  }

  Widget buildLoading(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List<double>.filled(widget.height.toInt(), 1.0).map((e) {
          return Expanded(
            child: Container(
              color: Colors.black,
              height: e,
            ),
          );
        }).toList()
      ),
    );
  }

  Widget buildLoaded(BuildContext context, DaysLoaded state) {

    int maxValue = state.days
      .map((day) {
        return day.minutes;
      })
      .reduce(max);



    List<double> remappedValues = state.days
      .map((e) {
        try {
          return e.minutes.toDouble().remap(0, maxValue, 1, widget.height).toDouble();
        } catch (err) {
          return 1.0;
        }
      }).toList();

    return SizedBox(
      height: widget.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: remappedValues.map((e) {
          return Expanded(
            child: Container(
              color: Colors.black,
              height: e,
            ),
          );
        }).toList().intersperse(const SizedBox(width: 2))
      ),
    );
  }

}
