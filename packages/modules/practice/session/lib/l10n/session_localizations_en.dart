// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'session_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SessionLocalizationsEn extends SessionLocalizations {
  SessionLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get session => 'Session';

  @override
  String get sessions => 'Sessions';

  @override
  String get sessionResultCompleted => 'Completed';

  @override
  String sessionResultMinutes(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'minutes',
      many: 'minutes',
      few: 'minutes',
      two: 'minutes',
      one: 'minute',
      zero: 'minute',
    );
    return '$_temp0';
  }

  @override
  String get sessionsHistory => 'Sessions';

  @override
  String minutesPluralWithNumber(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      many: '$count minutes',
      few: '$count minutes',
      two: '$count minutes',
      one: '$count minute',
      zero: '$count minute',
    );
    return '$_temp0';
  }
}
