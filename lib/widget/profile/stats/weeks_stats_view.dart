import 'dart:async';

import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/bloc/weeks/weeks_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/statistics_details.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/chart/all.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


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
            buildRow(context),
          ],
        ),
      ),
    );
  }

  Widget buildRow(BuildContext context) {
    if (isLoading) {
      return Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          buildRowItem(context, 'Total time spent', '-'),
          buildRowItem(context, 'Total sessions', '-'),
          buildRowItem(context, 'Average time spent', '-'),
          buildRowItem(context, 'Average sessions', '-'),
        ],
      );
    } else {
      WeeksLoadedState daysLoadedState = widget.weeksBloc.state as WeeksLoadedState;
      StatisticsDetails statisticsDetails = daysLoadedState.statisticsDetails;
      return Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          buildRowItem(
              context,
              AppLocalizations.of(context).statsTotalTimeSpent,
              '${statisticsDetails.totalMinutes} minutes'
          ),
          buildRowItem(
              context,
              AppLocalizations.of(context).statsTotalSessions,
              '${statisticsDetails.totalSessions} sessions'
          ),
          buildRowItem(
              context,
              AppLocalizations.of(context).statsAverageTimeSpent,
              '${statisticsDetails.averageMinutes.toInt()} minutes'
          ),
          buildRowItem(
              context,
              AppLocalizations.of(context).statsAverageSessions,
              '${statisticsDetails.averageSessions.toInt()} sessions'
          ),
        ],
      );
    }
  }

  Widget buildRowItem(BuildContext context, String label, String value) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(AppThemeData.borderRadiusLg))
            ),
            width: constraints.maxWidth / 2 - 4,
            height: 120,
            padding: const EdgeInsets.all(AppThemeData.paddingMd),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      label.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        shadows: [
                          const Shadow(
                            blurRadius: 48.0,
                            color: Colors.black87,
                          ),
                        ],
                        fontWeight: FontWeight.bold,
                        height: 1.0,
                      )
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                      value,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        shadows: [
                          const Shadow(
                            blurRadius: 48.0,
                            color: Colors.black87,
                          ),
                        ],
                        fontWeight: FontWeight.bold,
                        height: 1.0,
                      )
                  ),
                ),
              ],
            )
        );
      },
    );
  }

  @override
  void dispose() {
    _weeksBlocSubscription?.cancel();
    _statsIntervalBlocSubscription?.cancel();
    super.dispose();
  }
}

