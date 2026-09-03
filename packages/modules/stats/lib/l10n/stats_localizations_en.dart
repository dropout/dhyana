// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'stats_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class StatsLocalizationsEn extends StatsLocalizations {
  StatsLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get days => 'Days';

  @override
  String get weeks => 'Weeks';

  @override
  String get months => 'Months';

  @override
  String get years => 'Years';

  @override
  String get profileStats => 'Statistics';

  @override
  String get averagePerDay => 'Average per day';

  @override
  String get averagePerWeek => 'Average per week';

  @override
  String get averagePerMonth => 'Average per month';

  @override
  String get averagePerYear => 'Average per year';

  @override
  String get averageAbbr => 'Avg.';

  @override
  String get statsLoadingData => 'Loading data...';

  @override
  String get pleaseWait => 'Please wait';

  @override
  String get statsTotalSessions => 'Total sessions';

  @override
  String get statsTotalTimeSpent => 'Total time';

  @override
  String weekNumber(Object weekNumber, Object year) {
    return '$year W$weekNumber';
  }
}
