import 'dart:async';

import 'package:dhyana/bloc/days/days_bloc.dart';
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


class DaysStatsView extends StatelessWidget {

  final Profile profile;

  const DaysStatsView({
    required this.profile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _DaysStatsViewBlocProvider(
      profile: profile,
      statisticsRepository: context.repos.statisticsRepository,
      crashlyticsService: context.services.crashlyticsService,
    );
  }
}

class _DaysStatsViewBlocProvider extends StatefulWidget {

  final Profile profile;
  final StatisticsRepository statisticsRepository;
  final CrashlyticsService crashlyticsService;

  const _DaysStatsViewBlocProvider({
    required this.profile,
    required this.statisticsRepository,
    required this.crashlyticsService,
    super.key,
  });

  @override
  State<_DaysStatsViewBlocProvider> createState() => _DaysStatsViewBlocProviderState();
}

class _DaysStatsViewBlocProviderState extends State<_DaysStatsViewBlocProvider> {

  late final DaysBloc daysBloc;

  @override
  void initState() {
    daysBloc = DaysBloc(
      statisticsRepository: widget.statisticsRepository,
      crashlyticsService: widget.crashlyticsService
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DaysStatsViewContent(
      profile: widget.profile,
      daysBloc: daysBloc,
    );
  }

  @override
  void dispose() {
    daysBloc.close();
    super.dispose();
  }

}

class DaysStatsViewContent extends StatefulWidget {

  final Profile profile;
  final DaysBloc daysBloc;

  const DaysStatsViewContent({
    required this.profile,
    required this.daysBloc,
    super.key,
  });

  @override
  State<DaysStatsViewContent> createState() => _DaysStatsViewContentState();
}

class _DaysStatsViewContentState extends State<DaysStatsViewContent> {

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

  StreamSubscription<DaysState>? _daysBlocSubscription;

  @override
  void initState() {
    from = DateTime.now().subtract(const Duration(days: 7));
    to = DateTime.now();
    barChartData = _defaultBarChartData;

    _daysBlocSubscription = widget.daysBloc.stream.listen((DaysState state) {
      if (state is DaysLoadedState) {
        setState(() {
          List<BarChartDataItem> items = state.days.map((day) {
            return BarChartDataItem(
              value: day.minutesCount.toDouble(),
              label: DateFormat.E(Localizations.localeOf(context).toString()).format(day.startDate)
            );
          }).toList();
          barChartData = BarChartData(items);
        });
      }
    });

    widget.daysBloc.add(
      DaysEvent.queryDays(
        profileId: widget.profile.id,
        from: from,
        to: to,
      )
    );

    super.initState();
  }

  void _queryDays() {
    widget.daysBloc.add(
      QueryDaysEvent(
        profileId: widget.profile.id,
        from: from,
        to: to,
      )
    );
  }

  void onLeftArrowPressed() {
    setState(() {
      from = from.subtract(const Duration(days: 7));
      to = to.subtract(const Duration(days: 7));
    });
    _queryDays();
  }

  void onRightAwayPressed() {
    setState(() {
      from = from.add(const Duration(days: 7));
      to = to.add(const Duration(days: 7));
    });
    _queryDays();
  }

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<DaysBloc, DaysState>(
    //   builder: (BuildContext context, DaysState state) {
    //     switch (state) {
    //       case DaysLoading():
    //         return Center(child: CircularProgressIndicator());
    //       case DaysLoadingError():
    //         return Center(child: Text('Error'));
    //       case DaysLoaded():
    //         return _buildContent(context, barChartData);
    //       default:
    //         return const SizedBox.shrink();
    //     }
    //   }
    // );
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
            Text(AppLocalizations.of(context).days, style: Theme.of(context).textTheme.titleLarge),
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

            buildRow(context),

          ],
        ),
      ),
    );
  }

  Widget buildRow(BuildContext context) {
    final int totalMinutes = barChartData.data.fold(0, (int sum, BarChartDataItem item) => sum + item.value.toInt());
    final averageMinutes = totalMinutes ~/ barChartData.data.length;

    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        buildRowItem(context, 'Total time spent', '${totalMinutes} minutes'),
        buildRowItem(context, 'Total sessions', '51'),
        buildRowItem(context, 'Average time spent', '${averageMinutes} minutes'),
        buildRowItem(context, 'Average sessions', '51'),
      ],
    );
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
                  label,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
    super.dispose();
  }

}
