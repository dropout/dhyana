import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'social_localizations_en.dart';
import 'social_localizations_hu.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of SocialLocalizations
/// returned by `SocialLocalizations.of(context)`.
///
/// Applications need to include `SocialLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/social_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: SocialLocalizations.localizationsDelegates,
///   supportedLocales: SocialLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the SocialLocalizations.supportedLocales
/// property.
abstract class SocialLocalizations {
  SocialLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static SocialLocalizations of(BuildContext context) {
    return Localizations.of<SocialLocalizations>(context, SocialLocalizations)!;
  }

  static const LocalizationsDelegate<SocialLocalizations> delegate =
      _SocialLocalizationsDelegate();

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

  /// No description provided for @presence.
  ///
  /// In en, this message translates to:
  /// **'Presence'**
  String get presence;

  /// No description provided for @presenceScreenSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Move the slider to adjust presence timerframe.'**
  String get presenceScreenSubTitle;

  /// No description provided for @minutesPluralWithNumber.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{{count} minute} =1{{count} minute} =2{{count} minutes} few{{count} minutes} many{{count} minutes} other{{count} minutes}}'**
  String minutesPluralWithNumber(num count);

  /// No description provided for @loadMore.
  ///
  /// In en, this message translates to:
  /// **'Load more'**
  String get loadMore;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;
}

class _SocialLocalizationsDelegate
    extends LocalizationsDelegate<SocialLocalizations> {
  const _SocialLocalizationsDelegate();

  @override
  Future<SocialLocalizations> load(Locale locale) {
    return SynchronousFuture<SocialLocalizations>(
      lookupSocialLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hu'].contains(locale.languageCode);

  @override
  bool shouldReload(_SocialLocalizationsDelegate old) => false;
}

SocialLocalizations lookupSocialLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return SocialLocalizationsEn();
    case 'hu':
      return SocialLocalizationsHu();
  }

  throw FlutterError(
    'SocialLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
