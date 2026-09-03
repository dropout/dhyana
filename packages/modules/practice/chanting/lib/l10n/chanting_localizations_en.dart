// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'chanting_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class ChantingLocalizationsEn extends ChantingLocalizations {
  ChantingLocalizationsEn([String locale = 'en']) : super(locale);

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
  String get statsTotal => 'Total';

  @override
  String get chantingTitle => 'Chanting';

  @override
  String get chantingAddChantSheetTitle => 'Add Chant';

  @override
  String get chantingAddChantSheetEmptyState => 'No chants available.';

  @override
  String get chantingAddChantListItemAddAction => 'Add to playlist';

  @override
  String get chantingAddChantListItemAddedAction => 'Added';

  @override
  String get chantingPlaylistSheetTitle => 'Playlist';

  @override
  String get chantingPlaylistBadgePlaying => 'Playing';

  @override
  String get chantingPlaylistBadgePaused => 'Paused';
}
