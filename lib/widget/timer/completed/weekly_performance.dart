import 'package:dhyana/bloc/days/days_bloc.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/bloc_provider/days_bloc_provider.dart';
import 'package:dhyana/widget/util/intersperse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

const double _size = 40.0;

class WeeklyPerformance extends StatelessWidget {

  final Profile profile;

  const WeeklyPerformance({
    required this.profile,
    super.key
  });

  /// The [weekday] may be 0 for Sunday, 1 for Monday, etc. up to 7 for Sunday.
  DateTime mostRecentWeekday(DateTime date, int weekday) =>
      DateTime(date.year, date.month, date.day - (date.weekday - weekday) % 7);

  @override
  Widget build(BuildContext context) {
    final DateTime mostRecentFirstDayOfTheWeek = mostRecentWeekday(DateTime.now(), 1);
    return DaysBlocProvider(
      initialEvent: DaysEvent.queryDays(
        profileId: profile.id,
        from: mostRecentFirstDayOfTheWeek,
        to: mostRecentFirstDayOfTheWeek.add(const Duration(days: 7)),
      ),
      child: buildChild(context),
    );
  }

  Widget buildChild(BuildContext context) {
    return BlocBuilder<DaysBloc, DaysState>(
      builder: (BuildContext context, DaysState state) {
        switch (state) {
          case DaysLoaded():
            return buildDays(context, state.days);
          case DaysLoading():
            return const Text('Loading');
          default:
            return const Text('Idle');
        }
      }
    );
  }

  Widget buildDays(BuildContext context, List<Day> days) {
    return Wrap(
      children: days.map((d) => buildDay(context, d))
        .toList()
        .intersperse(const SizedBox(width: AppThemeData.spacingXs)),
    );
  }

  Widget buildDay(BuildContext context, Day day) {

    Color bColor;
    Color fColor;
    if (day.sessions.isEmpty) {
      bColor = Colors.grey.shade800;
      fColor = Colors.white;
    } else {
      bColor = Colors.white;
      fColor = Colors.black;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 512),
          width: _size,
          height: _size,
          padding: const EdgeInsets.all(AppThemeData.paddingXs),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bColor,
          ),
          child: Center(
            child: Text(
              _getDayShortName(day).toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: fColor,
                fontWeight: FontWeight.bold,
              )
            ),
          ),
        ),
      ],
    );
  }

  String _getDayShortName(Day day) {
    DateFormat dateFormat = DateFormat.E('HU');
    return dateFormat.format(day.startDate);
  }

}
