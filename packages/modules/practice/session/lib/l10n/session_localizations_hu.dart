// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'session_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class SessionLocalizationsHu extends SessionLocalizations {
  SessionLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get session => 'Ülés';

  @override
  String get sessions => 'Ülések';

  @override
  String get sessionResultCompleted => 'Teljesítettél';

  @override
  String sessionResultMinutes(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'percet',
      many: 'percet',
      few: 'percet',
      two: 'percet',
      one: 'percet',
      zero: 'percet',
    );
    return '$_temp0';
  }

  @override
  String get sessionsHistory => 'Ülések';

  @override
  String minutesPluralWithNumber(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perc',
      many: '$count perc',
      few: '$count perc',
      two: '$count perc',
      one: '$count perc',
      zero: '$count perc',
    );
    return '$_temp0';
  }
}
