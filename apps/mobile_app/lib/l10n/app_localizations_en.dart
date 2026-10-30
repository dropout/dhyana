// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get underMaintenanceTitle => 'The application is under maintenance';

  @override
  String get underMaintenanceBody => 'Please check back later.';

  @override
  String get initErrorTitle => 'Unexpected Error';

  @override
  String get initErrorBody =>
      'The app failed to initialize. Please try again later.';
}
