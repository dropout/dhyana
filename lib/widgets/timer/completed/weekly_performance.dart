import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widgets/app_theme_data.dart';
import 'package:dhyana/widgets/util/intersperse.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


const double _size = 36.0;

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

    return Wrap(
      children: intersperseWidgets(const SizedBox(width: AppThemeData.spacingSm), [
        ...List.generate(7, (int index) {
          return buildDay(context, index);
        })
      ]).toList(),
    );
  }

  Widget buildDay(BuildContext context, int index) {
    return Stack(
      children: [
        Container(
          width: _size,
          height: _size,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              _getDayShortName(index).toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )
            ),
          ),
        ),
      ],
    );
  }

  String _getDayShortName(int index) {
    DateTime firstDayOfWeek = mostRecentWeekday(DateTime.now(), 1);
    DateTime actualDay = DateTime(
      firstDayOfWeek.year,
      firstDayOfWeek.month,
      firstDayOfWeek.day + index,
    );

    DateFormat dateFormat = DateFormat.E('HU');
    
    return dateFormat.format(actualDay);
  }

}
