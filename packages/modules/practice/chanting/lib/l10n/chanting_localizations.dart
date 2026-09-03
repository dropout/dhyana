import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'chanting_localizations_en.dart';
import 'chanting_localizations_hu.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of ChantingLocalizations
/// returned by `ChantingLocalizations.of(context)`.
///
/// Applications need to include `ChantingLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/chanting_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ChantingLocalizations.localizationsDelegates,
///   supportedLocales: ChantingLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the ChantingLocalizations.supportedLocales
/// property.
abstract class ChantingLocalizations {
  ChantingLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ChantingLocalizations of(BuildContext context) {
    return Localizations.of<ChantingLocalizations>(
      context,
      ChantingLocalizations,
    )!;
  }

  static const LocalizationsDelegate<ChantingLocalizations> delegate =
      _ChantingLocalizationsDelegate();

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

  /// No description provided for @minutesPluralWithNumber.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{{count} minute} =1{{count} minute} =2{{count} minutes} few{{count} minutes} many{{count} minutes} other{{count} minutes}}'**
  String minutesPluralWithNumber(num count);

  /// No description provided for @statsTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get statsTotal;

  /// No description provided for @chantingTitle.
  ///
  /// In en, this message translates to:
  /// **'Chanting'**
  String get chantingTitle;

  /// No description provided for @chantingAddChantSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Chant'**
  String get chantingAddChantSheetTitle;

  /// No description provided for @chantingAddChantSheetEmptyState.
  ///
  /// In en, this message translates to:
  /// **'No chants available.'**
  String get chantingAddChantSheetEmptyState;

  /// No description provided for @chantingAddChantListItemAddAction.
  ///
  /// In en, this message translates to:
  /// **'Add to playlist'**
  String get chantingAddChantListItemAddAction;

  /// No description provided for @chantingAddChantListItemAddedAction.
  ///
  /// In en, this message translates to:
  /// **'Added'**
  String get chantingAddChantListItemAddedAction;

  /// No description provided for @chantingPlaylistSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Playlist'**
  String get chantingPlaylistSheetTitle;

  /// No description provided for @chantingPlaylistBadgePlaying.
  ///
  /// In en, this message translates to:
  /// **'Playing'**
  String get chantingPlaylistBadgePlaying;

  /// No description provided for @chantingPlaylistBadgePaused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get chantingPlaylistBadgePaused;
}

class _ChantingLocalizationsDelegate
    extends LocalizationsDelegate<ChantingLocalizations> {
  const _ChantingLocalizationsDelegate();

  @override
  Future<ChantingLocalizations> load(Locale locale) {
    return SynchronousFuture<ChantingLocalizations>(
      lookupChantingLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hu'].contains(locale.languageCode);

  @override
  bool shouldReload(_ChantingLocalizationsDelegate old) => false;
}

ChantingLocalizations lookupChantingLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return ChantingLocalizationsEn();
    case 'hu':
      return ChantingLocalizationsHu();
  }

  throw FlutterError(
    'ChantingLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
