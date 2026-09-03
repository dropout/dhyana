import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'stats_localizations_en.dart';
import 'stats_localizations_hu.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of StatsLocalizations
/// returned by `StatsLocalizations.of(context)`.
///
/// Applications need to include `StatsLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/stats_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: StatsLocalizations.localizationsDelegates,
///   supportedLocales: StatsLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the StatsLocalizations.supportedLocales
/// property.
abstract class StatsLocalizations {
  StatsLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static StatsLocalizations of(BuildContext context) {
    return Localizations.of<StatsLocalizations>(context, StatsLocalizations)!;
  }

  static const LocalizationsDelegate<StatsLocalizations> delegate =
      _StatsLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hu'),
  ];

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @weeks.
  ///
  /// In en, this message translates to:
  /// **'Weeks'**
  String get weeks;

  /// No description provided for @months.
  ///
  /// In en, this message translates to:
  /// **'Months'**
  String get months;

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get years;

  /// No description provided for @profileStats.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get profileStats;

  /// No description provided for @averagePerDay.
  ///
  /// In en, this message translates to:
  /// **'Average per day'**
  String get averagePerDay;

  /// No description provided for @averagePerWeek.
  ///
  /// In en, this message translates to:
  /// **'Average per week'**
  String get averagePerWeek;

  /// No description provided for @averagePerMonth.
  ///
  /// In en, this message translates to:
  /// **'Average per month'**
  String get averagePerMonth;

  /// No description provided for @averagePerYear.
  ///
  /// In en, this message translates to:
  /// **'Average per year'**
  String get averagePerYear;

  /// No description provided for @averageAbbr.
  ///
  /// In en, this message translates to:
  /// **'Avg.'**
  String get averageAbbr;

  /// No description provided for @statsLoadingData.
  ///
  /// In en, this message translates to:
  /// **'Loading data...'**
  String get statsLoadingData;

  /// No description provided for @pleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please wait'**
  String get pleaseWait;

  /// No description provided for @statsTotalSessions.
  ///
  /// In en, this message translates to:
  /// **'Total sessions'**
  String get statsTotalSessions;

  /// No description provided for @statsTotalTimeSpent.
  ///
  /// In en, this message translates to:
  /// **'Total time'**
  String get statsTotalTimeSpent;

  /// No description provided for @weekNumber.
  ///
  /// In en, this message translates to:
  /// **'{year} W{weekNumber}'**
  String weekNumber(Object weekNumber, Object year);
}

class _StatsLocalizationsDelegate
    extends LocalizationsDelegate<StatsLocalizations> {
  const _StatsLocalizationsDelegate();

  @override
  Future<StatsLocalizations> load(Locale locale) {
    return SynchronousFuture<StatsLocalizations>(
      lookupStatsLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hu'].contains(locale.languageCode);

  @override
  bool shouldReload(_StatsLocalizationsDelegate old) => false;
}

StatsLocalizations lookupStatsLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return StatsLocalizationsEn();
    case 'hu':
      return StatsLocalizationsHu();
  }

  throw FlutterError(
    'StatsLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
