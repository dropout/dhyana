// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'social_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SocialLocalizationsEn extends SocialLocalizations {
  SocialLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get presence => 'Presence';

  @override
  String get presenceScreenSubTitle =>
      'Move the slider to adjust presence timerframe.';

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

  @override
  String get loadMore => 'Load more';

  @override
  String get loading => 'Loading...';
}
