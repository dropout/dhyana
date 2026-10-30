// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get underMaintenanceTitle => 'Karbantartás';

  @override
  String get underMaintenanceBody =>
      'Az alkalmazás karbantartás alatt áll. Kérlek nézz vissza később.';

  @override
  String get initErrorTitle => 'Váratlan hiba!';

  @override
  String get initErrorBody =>
      'Nem sikerült elindítani az alkalmazást. Kérlek próbáld újra később.';
}
