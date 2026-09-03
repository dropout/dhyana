// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'social_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class SocialLocalizationsHu extends SocialLocalizations {
  SocialLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get presence => 'Jelenlét';

  @override
  String get presenceScreenSubTitle =>
      'Mozgasd a csuszkát a jelenlét időkeretének beállításához.';

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

  @override
  String get loadMore => 'Több betöltése';

  @override
  String get loading => 'Betöltés...';
}
