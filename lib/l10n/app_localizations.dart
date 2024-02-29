import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hu.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hu')
  ];

  /// No description provided for @minute.
  ///
  /// In hu, this message translates to:
  /// **'Perc'**
  String get minute;

  /// No description provided for @okay.
  ///
  /// In hu, this message translates to:
  /// **'Rendben'**
  String get okay;

  /// No description provided for @inputWarmupLabel.
  ///
  /// In hu, this message translates to:
  /// **'Felkészülés'**
  String get inputWarmupLabel;

  /// No description provided for @inputStartingSoundLabel.
  ///
  /// In hu, this message translates to:
  /// **'Kezdőhang'**
  String get inputStartingSoundLabel;

  /// No description provided for @inputDurationLabel.
  ///
  /// In hu, this message translates to:
  /// **'Időtartam'**
  String get inputDurationLabel;

  /// No description provided for @inputEndingSoundLabel.
  ///
  /// In hu, this message translates to:
  /// **'Végehang'**
  String get inputEndingSoundLabel;

  /// No description provided for @startTimerButtonText.
  ///
  /// In hu, this message translates to:
  /// **'Start'**
  String get startTimerButtonText;

  /// No description provided for @noSound.
  ///
  /// In hu, this message translates to:
  /// **'Nincs hang'**
  String get noSound;

  /// No description provided for @inputSoundChukpi.
  ///
  /// In hu, this message translates to:
  /// **'Chukpi'**
  String get inputSoundChukpi;

  /// No description provided for @inputSoundSmallBell.
  ///
  /// In hu, this message translates to:
  /// **'Csengettyű'**
  String get inputSoundSmallBell;

  /// No description provided for @errorHeadline.
  ///
  /// In hu, this message translates to:
  /// **'Hoppá!'**
  String get errorHeadline;

  /// No description provided for @errorText.
  ///
  /// In hu, this message translates to:
  /// **'Váratlan probléma támadt.'**
  String get errorText;

  /// No description provided for @errorButtonText.
  ///
  /// In hu, this message translates to:
  /// **'Rendben'**
  String get errorButtonText;

  /// No description provided for @timerFinishSessionButtonText.
  ///
  /// In hu, this message translates to:
  /// **'Befejezés'**
  String get timerFinishSessionButtonText;

  /// No description provided for @timerDiscardSessionButtonText.
  ///
  /// In hu, this message translates to:
  /// **'Megszakítás'**
  String get timerDiscardSessionButtonText;

  /// No description provided for @loginHeadline1.
  ///
  /// In hu, this message translates to:
  /// **'Ki'**
  String get loginHeadline1;

  /// No description provided for @loginHeadline2.
  ///
  /// In hu, this message translates to:
  /// **'vagy'**
  String get loginHeadline2;

  /// No description provided for @loginHeadline3.
  ///
  /// In hu, this message translates to:
  /// **'te?'**
  String get loginHeadline3;

  /// No description provided for @loginSigninGoogle.
  ///
  /// In hu, this message translates to:
  /// **'Bejelentkezés Google-lal'**
  String get loginSigninGoogle;

  /// No description provided for @loginSigninApple.
  ///
  /// In hu, this message translates to:
  /// **'Bejelentkezés Apple-lel'**
  String get loginSigninApple;

  /// No description provided for @loginLegalPart1.
  ///
  /// In hu, this message translates to:
  /// **'A bejelentkezéssel elfogadod az\n'**
  String get loginLegalPart1;

  /// No description provided for @loginLegalPart2.
  ///
  /// In hu, this message translates to:
  /// **'ÁSZF-et'**
  String get loginLegalPart2;

  /// No description provided for @loginLegalPart3.
  ///
  /// In hu, this message translates to:
  /// **' és az '**
  String get loginLegalPart3;

  /// No description provided for @loginLegalPart4.
  ///
  /// In hu, this message translates to:
  /// **'Adatvédelmi nyilatkozatot'**
  String get loginLegalPart4;

  /// No description provided for @profile.
  ///
  /// In hu, this message translates to:
  /// **'Profil'**
  String get profile;

  /// No description provided for @activity.
  ///
  /// In hu, this message translates to:
  /// **'Aktivitás'**
  String get activity;

  /// No description provided for @editProfile.
  ///
  /// In hu, this message translates to:
  /// **'Profil szerkesztése'**
  String get editProfile;

  /// No description provided for @signOut.
  ///
  /// In hu, this message translates to:
  /// **'Kijelentkezés'**
  String get signOut;

  /// No description provided for @profileFirstnameLabel.
  ///
  /// In hu, this message translates to:
  /// **'Keresztnév'**
  String get profileFirstnameLabel;

  /// No description provided for @profileLastnameLabel.
  ///
  /// In hu, this message translates to:
  /// **'Vezetéknév'**
  String get profileLastnameLabel;

  /// No description provided for @profileSaveButtonIdle.
  ///
  /// In hu, this message translates to:
  /// **'Ment'**
  String get profileSaveButtonIdle;

  /// No description provided for @profileSaveButtonSaving.
  ///
  /// In hu, this message translates to:
  /// **'Mentés...'**
  String get profileSaveButtonSaving;

  /// No description provided for @profileSaveButtonSaved.
  ///
  /// In hu, this message translates to:
  /// **'Elmentve!'**
  String get profileSaveButtonSaved;

  /// No description provided for @photoAccessDialogTitle.
  ///
  /// In hu, this message translates to:
  /// **'Fotók nem elérhetőek'**
  String get photoAccessDialogTitle;

  /// No description provided for @photoAccessDialogText.
  ///
  /// In hu, this message translates to:
  /// **'Az alkalmazásnak nincs engedélye hozzáférni a fotókhoz. Kérlek a telefon \'Beállítások\' menüjében engedélyezd a hozzáférést a fotókhoz, hogy meg tudjuk változtatni a profilképed.'**
  String get photoAccessDialogText;

  /// No description provided for @photoAccessDialogButtonText.
  ///
  /// In hu, this message translates to:
  /// **'Rendben'**
  String get photoAccessDialogButtonText;

  /// No description provided for @testPlural.
  ///
  /// In hu, this message translates to:
  /// **'{count,plural, =0{{count} sample0} =1{{count} sample1} =2{{count} sample2} few{{count} sampleFew} many{{count} sampleMany} other{{count} sampleOther}}'**
  String testPlural(num count);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'hu'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'hu': return AppLocalizationsHu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
