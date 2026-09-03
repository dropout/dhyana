// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'chanting_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class ChantingLocalizationsHu extends ChantingLocalizations {
  ChantingLocalizationsHu([String locale = 'hu']) : super(locale);

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
  String get statsTotal => 'Összesen';

  @override
  String get chantingTitle => 'Éneklés';

  @override
  String get chantingAddChantSheetTitle => 'Hozzáadás';

  @override
  String get chantingAddChantSheetEmptyState => 'Nincs elérhető ének.';

  @override
  String get chantingAddChantListItemAddAction => 'Hozzáadás';

  @override
  String get chantingAddChantListItemAddedAction => 'Hozzáadva';

  @override
  String get chantingPlaylistSheetTitle => 'Lejátszási lista';

  @override
  String get chantingPlaylistBadgePlaying => 'Lejátszás';

  @override
  String get chantingPlaylistBadgePaused => 'Szünet';
}
