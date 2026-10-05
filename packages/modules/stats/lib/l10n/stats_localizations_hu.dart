// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'stats_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class StatsLocalizationsHu extends StatsLocalizations {
  StatsLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get days => 'Napok';

  @override
  String get weeks => 'Hetek';

  @override
  String get months => 'Hónapok';

  @override
  String get years => 'Évek';

  @override
  String get profileStats => 'Statisztika';

  @override
  String get averagePerDay => 'Átlagosan naponta';

  @override
  String get averagePerWeek => 'Átlagosan hetente';

  @override
  String get averagePerMonth => 'Átlagosan havonta';

  @override
  String get averagePerYear => 'Átlagosan évente';

  @override
  String get averageAbbr => 'Átl.';

  @override
  String get statsLoadingData => 'Adatok betöltése...';

  @override
  String get pleaseWait => 'Kérlek várj';

  @override
  String get statsTotalSessions => 'Összes alkalom';

  @override
  String get statsTotalTimeSpent => 'Összes idő';

  @override
  String weekNumber(Object weekNumber, Object year) {
    return '$year ${weekNumber}H';
  }
}
