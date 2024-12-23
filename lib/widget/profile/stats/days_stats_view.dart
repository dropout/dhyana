import 'dart:async';

import 'package:dhyana/bloc/days/days_bloc.dart';
import 'package:dhyana/bloc/stats_interval/stats_interval_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/statistics_details.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/chart/all.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DaysStatsView extends StatelessWidget {

  final Profile profile;
  final StatsIntervalBloc statsIntervalBloc;

  const DaysStatsView({
    required this.profile,
    required this.statsIntervalBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DaysBloc>(
      create: (BuildContext context) {
        return DaysBloc(
          statisticsRepository: context.repos.statisticsRepository,
          crashlyticsService: context.services.crashlyticsService
        );
      },
      child: DaysStatsViewContentBuilder(
        profile: profile,
      ),
    );
  }

}

class DaysStatsViewContentBuilder extends StatelessWidget {

  final Profile profile;

  const DaysStatsViewContentBuilder({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    DaysBloc daysBloc = BlocProvider.of<DaysBloc>(context);
    StatsIntervalBloc statsIntervalBloc = BlocProvider.of<StatsIntervalBloc>(context);
    return DaysStatsViewContent(
      profile: profile,
      daysBloc: daysBloc,
      statsIntervalBloc: statsIntervalBloc,
    );
  }
}

class DaysStatsViewContent extends StatefulWidget {

  final Profile profile;
  final DaysBloc daysBloc;
  final StatsIntervalBloc statsIntervalBloc;

  const DaysStatsViewContent({
    required this.profile,
    required this.daysBloc,
    required this.statsIntervalBloc,
    super.key,
  });

  @override
  State<DaysStatsViewContent> createState() => _DaysStatsViewContentState();
}

class _DaysStatsViewContentState extends State<DaysStatsViewContent> {

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

      BarChartDataItem(value: 0, label: ''),
      BarChartDataItem(value: 0, label: ''),
    ]
  );

  late BarChartData barChartData;
  bool isLoading = true;

  StreamSubscription<DaysState>? _daysBlocSubscription;
  StreamSubscription<StatsIntervalState>? _statsIntervalBlocSubscription;

  @override
  void initState() {
    barChartData = _defaultBarChartData;

    _daysBlocSubscription = widget.daysBloc.stream.listen((DaysState state) {
      if (state is DaysLoadedState) {
        setState(() {
          List<BarChartDataItem> items = state.days.map((day) {
            return BarChartDataItem(
              value: day.minutesCount.toDouble(),
              label: DateFormat.E(Localizations.localeOf(context).toString()).format(day.startDate).substring(0,1),
            );
          }).toList();
          barChartData = BarChartData(items);
          isLoading = false;
        });
      }
    });

    widget.daysBloc.add(
      DaysEvent.queryDays(
        profileId: widget.profile.id,
        from: widget.statsIntervalBloc.state.statsInterval.from,
        to: widget.statsIntervalBloc.state.statsInterval.to,
      )
    );


    _statsIntervalBlocSubscription = widget.statsIntervalBloc.stream.listen((StatsIntervalState state) {
      widget.daysBloc.add(
        DaysEvent.queryDays(
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
              child: BarChart(
                title: AppLocalizations.of(context).statsTimePerDay,
                data: barChartData,
                // yZoom: 359 * 60,
                // yZoom: 359 * 60,
              )
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
      DaysLoadedState daysLoadedState = widget.daysBloc.state as DaysLoadedState;
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
    _daysBlocSubscription?.cancel();
    _statsIntervalBlocSubscription?.cancel();
    super.dispose();
  }



}
