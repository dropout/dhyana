import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'auth_localizations_en.dart';
import 'auth_localizations_hu.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AuthLocalizations
/// returned by `AuthLocalizations.of(context)`.
///
/// Applications need to include `AuthLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/auth_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AuthLocalizations.localizationsDelegates,
///   supportedLocales: AuthLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AuthLocalizations.supportedLocales
/// property.
abstract class AuthLocalizations {
  AuthLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AuthLocalizations of(BuildContext context) {
    return Localizations.of<AuthLocalizations>(context, AuthLocalizations)!;
  }

  static const LocalizationsDelegate<AuthLocalizations> delegate =
      _AuthLocalizationsDelegate();

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

  /// No description provided for @loginHeadline1.
  ///
  /// In en, this message translates to:
  /// **'Who'**
  String get loginHeadline1;

  /// No description provided for @loginHeadline2.
  ///
  /// In en, this message translates to:
  /// **'are'**
  String get loginHeadline2;

  /// No description provided for @loginHeadline3.
  ///
  /// In en, this message translates to:
  /// **'you?'**
  String get loginHeadline3;

  /// No description provided for @loginSigninGoogle.
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get loginSigninGoogle;

  /// No description provided for @loginSigninApple.
  ///
  /// In en, this message translates to:
  /// **'Login with Apple'**
  String get loginSigninApple;

  /// No description provided for @loginSigninEmailPassword.
  ///
  /// In en, this message translates to:
  /// **'Login with Email'**
  String get loginSigninEmailPassword;

  /// No description provided for @loginSigninEmailPasswordScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Login with Email'**
  String get loginSigninEmailPasswordScreenTitle;

  /// No description provided for @loginSigninEmailInputLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginSigninEmailInputLabel;

  /// No description provided for @loginSigninPasswordInputLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginSigninPasswordInputLabel;

  /// No description provided for @loginSigninEmailPasswordButtonText.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginSigninEmailPasswordButtonText;

  /// No description provided for @loginLegalPart1.
  ///
  /// In en, this message translates to:
  /// **'By logging in you accept the\n'**
  String get loginLegalPart1;

  /// No description provided for @loginLegalPart2.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get loginLegalPart2;

  /// No description provided for @loginLegalPart3.
  ///
  /// In en, this message translates to:
  /// **' and the '**
  String get loginLegalPart3;

  /// No description provided for @loginLegalPart4.
  ///
  /// In en, this message translates to:
  /// **'Privacy statement'**
  String get loginLegalPart4;

  /// No description provided for @loginGoToProfile.
  ///
  /// In en, this message translates to:
  /// **'Go to your profile'**
  String get loginGoToProfile;
}

class _AuthLocalizationsDelegate
    extends LocalizationsDelegate<AuthLocalizations> {
  const _AuthLocalizationsDelegate();

  @override
  Future<AuthLocalizations> load(Locale locale) {
    return SynchronousFuture<AuthLocalizations>(
      lookupAuthLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hu'].contains(locale.languageCode);

  @override
  bool shouldReload(_AuthLocalizationsDelegate old) => false;
}

AuthLocalizations lookupAuthLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AuthLocalizationsEn();
    case 'hu':
      return AuthLocalizationsHu();
  }

  throw FlutterError(
    'AuthLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
