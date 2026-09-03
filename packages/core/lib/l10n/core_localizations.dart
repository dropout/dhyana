import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'core_localizations_en.dart';
import 'core_localizations_hu.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of CoreLocalizations
/// returned by `CoreLocalizations.of(context)`.
///
/// Applications need to include `CoreLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/core_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CoreLocalizations.localizationsDelegates,
///   supportedLocales: CoreLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the CoreLocalizations.supportedLocales
/// property.
abstract class CoreLocalizations {
  CoreLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CoreLocalizations of(BuildContext context) {
    return Localizations.of<CoreLocalizations>(context, CoreLocalizations)!;
  }

  static const LocalizationsDelegate<CoreLocalizations> delegate =
      _CoreLocalizationsDelegate();

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

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @profileDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Profile'**
  String get profileDeleteTitle;

  /// No description provided for @profileDeleteQuestion.
  ///
  /// In en, this message translates to:
  /// **'All your data will be permanently deleted and cannot be restored.\nAre you sure?'**
  String get profileDeleteQuestion;

  /// No description provided for @profileDeleteCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get profileDeleteCancel;

  /// No description provided for @profileDeleteYes.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get profileDeleteYes;

  /// No description provided for @imageNotSafeDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Unsafe image'**
  String get imageNotSafeDialogTitle;

  /// No description provided for @imageNotSafeDialogText.
  ///
  /// In en, this message translates to:
  /// **'The selected image may contain inappropriate content. Please choose a different image.'**
  String get imageNotSafeDialogText;

  /// No description provided for @imageNotSafeDialogButtonText.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get imageNotSafeDialogButtonText;

  /// No description provided for @photoAccessDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Cannot access photos'**
  String get photoAccessDialogTitle;

  /// No description provided for @photoAccessDialogText.
  ///
  /// In en, this message translates to:
  /// **'The application doesn\'t have a permission to access you photos. Please go into \'Settings\' and give access to the photos in order to change you profile photo.'**
  String get photoAccessDialogText;

  /// No description provided for @photoAccessDialogButtonText.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get photoAccessDialogButtonText;

  /// No description provided for @profileSignoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Signout'**
  String get profileSignoutTitle;

  /// No description provided for @profileSignoutQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get profileSignoutQuestion;

  /// No description provided for @profileSignoutCancel.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get profileSignoutCancel;

  /// No description provided for @profileSignoutYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get profileSignoutYes;

  /// No description provided for @signOutSuccessfulMessage.
  ///
  /// In en, this message translates to:
  /// **'Successfully signed out!'**
  String get signOutSuccessfulMessage;

  /// No description provided for @locationInputPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Select your city'**
  String get locationInputPlaceholder;

  /// No description provided for @locationInputNoSelection.
  ///
  /// In en, this message translates to:
  /// **'No city selected yet'**
  String get locationInputNoSelection;

  /// No description provided for @locationInputCurrentSelection.
  ///
  /// In en, this message translates to:
  /// **'Current selection:'**
  String get locationInputCurrentSelection;

  /// No description provided for @locationInputErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occured.\nPlease try again later.'**
  String get locationInputErrorMessage;

  /// No description provided for @minutesPlural.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{minute} =1{minute} =2{minutes} few{minutes} many{minutes} other{minutes}}'**
  String minutesPlural(num count);

  /// No description provided for @minutesAbbr.
  ///
  /// In en, this message translates to:
  /// **'m'**
  String get minutesAbbr;

  /// No description provided for @hoursAbbr.
  ///
  /// In en, this message translates to:
  /// **'h'**
  String get hoursAbbr;

  /// No description provided for @millionShort.
  ///
  /// In en, this message translates to:
  /// **'m'**
  String get millionShort;

  /// No description provided for @million.
  ///
  /// In en, this message translates to:
  /// **'million'**
  String get million;

  /// No description provided for @thousandShort.
  ///
  /// In en, this message translates to:
  /// **'k'**
  String get thousandShort;

  /// No description provided for @thousand.
  ///
  /// In en, this message translates to:
  /// **'thousand'**
  String get thousand;

  /// No description provided for @startTimerButtonText.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startTimerButtonText;

  /// No description provided for @profileSaveButtonIdle.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get profileSaveButtonIdle;

  /// No description provided for @profileSaveButtonSaving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get profileSaveButtonSaving;

  /// No description provided for @profileSaveButtonSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved!'**
  String get profileSaveButtonSaved;

  /// No description provided for @errorHeadline.
  ///
  /// In en, this message translates to:
  /// **'Ooops!'**
  String get errorHeadline;

  /// No description provided for @errorText.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error has occured.'**
  String get errorText;

  /// No description provided for @errorButtonText.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get errorButtonText;

  /// No description provided for @noSound.
  ///
  /// In en, this message translates to:
  /// **'No sound'**
  String get noSound;

  /// No description provided for @inputSoundVibrate.
  ///
  /// In en, this message translates to:
  /// **'Vibrate'**
  String get inputSoundVibrate;

  /// No description provided for @inputSoundSmallBell.
  ///
  /// In en, this message translates to:
  /// **'Small Bell'**
  String get inputSoundSmallBell;

  /// No description provided for @inputSoundTriangle.
  ///
  /// In en, this message translates to:
  /// **'Triangle'**
  String get inputSoundTriangle;

  /// No description provided for @inputSoundChukpi.
  ///
  /// In en, this message translates to:
  /// **'Chukpi'**
  String get inputSoundChukpi;
}

class _CoreLocalizationsDelegate
    extends LocalizationsDelegate<CoreLocalizations> {
  const _CoreLocalizationsDelegate();

  @override
  Future<CoreLocalizations> load(Locale locale) {
    return SynchronousFuture<CoreLocalizations>(
      lookupCoreLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hu'].contains(locale.languageCode);

  @override
  bool shouldReload(_CoreLocalizationsDelegate old) => false;
}

CoreLocalizations lookupCoreLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return CoreLocalizationsEn();
    case 'hu':
      return CoreLocalizationsHu();
  }

  throw FlutterError(
    'CoreLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
