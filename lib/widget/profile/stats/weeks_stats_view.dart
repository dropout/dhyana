import 'dart:async';

import 'package:dhyana/bloc/weeks/weeks_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/chart/all.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class WeeksStatsView extends StatelessWidget {

  final Profile profile;

  const WeeksStatsView({
    required this.profile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _WeekStatsViewBlocProvider(
      profile: profile,
      statisticsRepository: context.repos.statisticsRepository,
      crashlyticsService: context.services.crashlyticsService,
    );
  }
}

class _WeekStatsViewBlocProvider extends StatefulWidget {

  final Profile profile;
  final StatisticsRepository statisticsRepository;
  final CrashlyticsService crashlyticsService;

  const _WeekStatsViewBlocProvider({
    required this.profile,
    required this.statisticsRepository,
    required this.crashlyticsService,
    super.key,
  });

  @override
  State<_WeekStatsViewBlocProvider> createState() => _WeekStatsViewBlocProviderState();
}

class _WeekStatsViewBlocProviderState extends State<_WeekStatsViewBlocProvider> {

  late final WeeksBloc weeksBloc;

  @override
  void initState() {
    weeksBloc = WeeksBloc(
      statisticsRepository: widget.statisticsRepository,
      crashlyticsService: widget.crashlyticsService,
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WeeksStatsViewContent(
      profile: widget.profile,
      weeksBloc: weeksBloc,
    );
  }

  @override
  void dispose() {
    weeksBloc.close();
    super.dispose();
  }
}

class WeeksStatsViewContent extends StatefulWidget {

  final Profile profile;
  final WeeksBloc weeksBloc;

  const WeeksStatsViewContent({
    required this.profile,
    required this.weeksBloc,
    super.key
  });

  @override
  State<WeeksStatsViewContent> createState() => _WeeksStatsViewContentState();
}

class _WeeksStatsViewContentState extends State<WeeksStatsViewContent> {

  static const _defaultBarChartData = BarChartData(
      [
        BarChartDataItem(value: 0, label: 'Mon'),
        BarChartDataItem(value: 0, label: 'Tue'),
        BarChartDataItem(value: 0, label: 'Wed'),
        BarChartDataItem(value: 0, label: 'Thu'),
        BarChartDataItem(value: 0, label: 'Fri'),
        BarChartDataItem(value: 0, label: 'Sat'),
        BarChartDataItem(value: 0, label: 'Sun'),
      ]
  );

  late DateTime from;
  late DateTime to;
  late BarChartData barChartData;

  StreamSubscription<WeeksState>? _weeksBlocSubscription;

  @override
  void initState() {
    from = DateTime.now().subtract(const Duration(days: 7));
    to = DateTime.now();
    barChartData = _defaultBarChartData;

    _weeksBlocSubscription = widget.weeksBloc.stream.listen((WeeksState state) {
      if (state is WeeksLoaded) {
        setState(() {
          List<BarChartDataItem> items = state.weeks.map((day) {
            return BarChartDataItem(
                value: day.minutesCount.toDouble(),
                label: DateFormat.E(Localizations.localeOf(context).toString()).format(day.startDate)
            );
          }).toList();
          barChartData = BarChartData(items);
        });
      }
    });

    widget.weeksBloc.add(
      WeeksEvent.queryWeeks(
        profileId: widget.profile.id,
        from: from,
        to: to,
      )
    );

    super.initState();
    super.initState();
  }

  void onLeftArrowPressed() {
    setState(() {
      from = from.subtract(const Duration(days: 7));
      to = to.subtract(const Duration(days: 7));
    });
    _queryWeeks();
  }

  void onRightAwayPressed() {
    setState(() {
      from = from.add(const Duration(days: 7));
      to = to.add(const Duration(days: 7));
    });
    _queryWeeks();
  }

  void _queryWeeks() {
    widget.weeksBloc.add(
      WeeksEvent.queryWeeks(
        profileId: widget.profile.id,
        from: from,
        to: to,
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return _buildContent(context, barChartData);
  }

  Widget _buildContent(BuildContext context, BarChartData barChartData) {
    return Padding(
      padding: const EdgeInsets.all(AppThemeData.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalizations.of(context).weeks, style: Theme.of(context).textTheme.titleLarge),
          Gap.medium(),

          SizedBox(
              height: 350,
              child: BarChart(data: barChartData)
          ),

          Gap.medium(),

          Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: onLeftArrowPressed,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: onRightAwayPressed,
                ),
              ]
          ),

          Text('Total time spent'),
          Text('Average time spent'),
          Text('Total sessions'),
          Text('Average sessions'),

          Text('Total time spent'),
          Text('Average time spent'),
          Text('Total sessions'),
          Text('Average sessions'),

          Text('Total time spent'),
          Text('Average time spent'),
          Text('Total sessions'),
          Text('Average sessions'),

        ],
      ),
    );
  }
}

