import 'dart:async';

import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/bloc/days/days_bloc.dart';
import 'package:dhyana/bloc/weeks/weeks_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/chart/all.dart';
import 'package:dhyana/widget/profile/stats/calculated_stats_view.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'calculated_stats_view.dart';


class WeeksStatsView extends StatelessWidget {

  final Profile profile;
  final StatsIntervalBloc statsIntervalBloc;

  const WeeksStatsView({
    required this.profile,
    required this.statsIntervalBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeeksBloc>(
      create: (BuildContext context) {
        return WeeksBloc(
          statisticsRepository: context.repos.statisticsRepository,
          crashlyticsService: context.services.crashlyticsService,
        );
      },
      child: WeeksStatsViewContentBuilder(
        profile: profile,
      )
    );
  }
}

class WeeksStatsViewContentBuilder extends StatelessWidget {

  final Profile profile;

  const WeeksStatsViewContentBuilder({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    WeeksBloc weeksBloc = BlocProvider.of<WeeksBloc>(context);
    StatsIntervalBloc statsIntervalBloc = BlocProvider.of<StatsIntervalBloc>(context);
    return WeeksStatsViewContent(
      profile: profile,
      weeksBloc: weeksBloc,
      statsIntervalBloc: statsIntervalBloc,
    );
  }
}

class WeeksStatsViewContent extends StatefulWidget {

  final Profile profile;
  final WeeksBloc weeksBloc;
  final StatsIntervalBloc statsIntervalBloc;

  const WeeksStatsViewContent({
    required this.profile,
    required this.weeksBloc,
    required this.statsIntervalBloc,
    super.key
  });

  @override
  State<WeeksStatsViewContent> createState() => _WeeksStatsViewContentState();
}

class _WeeksStatsViewContentState extends State<WeeksStatsViewContent> {

  static const _defaultBarChartData = BarChartData(
      [
        BarChartDataItem(value: 0, label: ''),
        BarChartDataItem(value: 0, label: ''),
        BarChartDataItem(value: 0, label: ''),
        BarChartDataItem(value: 0, label: ''),

        BarChartDataItem(value: 0, label: ''),
        BarChartDataItem(value: 0, label: ''),
        BarChartDataItem(value: 0, label: ''),
        BarChartDataItem(value: 0, label: ''),

        BarChartDataItem(value: 0, label: ''),
        BarChartDataItem(value: 0, label: ''),
        BarChartDataItem(value: 0, label: ''),
        BarChartDataItem(value: 0, label: ''),
      ]
  );


  late BarChartData barChartData;
  bool isLoading = true;

  StreamSubscription<WeeksState>? _weeksBlocSubscription;
  StreamSubscription<StatsIntervalState>? _statsIntervalBlocSubscription;

  @override
  void initState() {
    barChartData = _defaultBarChartData;

    _weeksBlocSubscription = widget.weeksBloc.stream.listen((WeeksState state) {
      if (state is WeeksLoadedState) {
        setState(() {
          List<BarChartDataItem> items = state.weeks.map((day) {
            return BarChartDataItem(
              value: day.minutesCount.toDouble(),
              label: day.startDate.day.toString(),
            );
          }).toList();
          barChartData = BarChartData(items);
          isLoading = false;
        });
      }
    });

    widget.weeksBloc.add(
      WeeksEvent.queryWeeks(
        profileId: widget.profile.id,
        from: widget.statsIntervalBloc.state.statsInterval.from,
        to: widget.statsIntervalBloc.state.statsInterval.to,
      )
    );

    _statsIntervalBlocSubscription = widget.statsIntervalBloc.stream.listen((StatsIntervalState state) {
      widget.weeksBloc.add(
        WeeksEvent.queryWeeks(
          profileId: widget.profile.id,
          from: widget.statsIntervalBloc.state.statsInterval.from,
          to: widget.statsIntervalBloc.state.statsInterval.to,
        )
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent(context, barChartData);
  }

  Widget _buildContent(BuildContext context, BarChartData barChartData) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(AppThemeData.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: 350,
                child: BarChart(data: barChartData)
            ),
            Gap.medium(),
            buildCalculatedStats(context),
          ],
        ),
      ),
    );
  }

  Widget buildCalculatedStats(BuildContext context) {
    if (isLoading) {
      return CalculatedStatsView(calculatedStats: const CalculatedStats(
        totalMinutes: 0,
        totalSessions: 0,
        averageMinutes: 0,
        averageSessions: 0,
      ));
    } else {
      WeeksLoadedState weeksLoadedState = widget.weeksBloc.state as WeeksLoadedState;
      CalculatedStats calculatedStats = weeksLoadedState.calculatedStats;
      return CalculatedStatsView(calculatedStats: calculatedStats);
    }
  }

  @override
  void dispose() {
    _weeksBlocSubscription?.cancel();
    _statsIntervalBlocSubscription?.cancel();
    super.dispose();
  }
}

