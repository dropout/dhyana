import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'timer_localizations_en.dart';
import 'timer_localizations_hu.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of TimerLocalizations
/// returned by `TimerLocalizations.of(context)`.
///
/// Applications need to include `TimerLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/timer_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: TimerLocalizations.localizationsDelegates,
///   supportedLocales: TimerLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the TimerLocalizations.supportedLocales
/// property.
abstract class TimerLocalizations {
  TimerLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static TimerLocalizations of(BuildContext context) {
    return Localizations.of<TimerLocalizations>(context, TimerLocalizations)!;
  }

  static const LocalizationsDelegate<TimerLocalizations> delegate =
      _TimerLocalizationsDelegate();

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

  /// No description provided for @inputWarmupLabel.
  ///
  /// In en, this message translates to:
  /// **'Warmup'**
  String get inputWarmupLabel;

  /// No description provided for @inputStartingSoundLabel.
  ///
  /// In en, this message translates to:
  /// **'Starting sound'**
  String get inputStartingSoundLabel;

  /// No description provided for @inputDurationLabel.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get inputDurationLabel;

  /// No description provided for @inputIntervalCountLabel.
  ///
  /// In en, this message translates to:
  /// **'Intervals'**
  String get inputIntervalCountLabel;

  /// No description provided for @intervalNoIntervalsText.
  ///
  /// In en, this message translates to:
  /// **'No interval sounds will be played.'**
  String get intervalNoIntervalsText;

  /// No description provided for @intervalOneIntervalText.
  ///
  /// In en, this message translates to:
  /// **'At the half of the session.'**
  String get intervalOneIntervalText;

  /// No description provided for @intervalTwoIntervalsText.
  ///
  /// In en, this message translates to:
  /// **'At the third and two-thirds of the session.'**
  String get intervalTwoIntervalsText;

  /// No description provided for @intervalThreeIntervalsText.
  ///
  /// In en, this message translates to:
  /// **'At the quarter, half and three-quarters.'**
  String get intervalThreeIntervalsText;

  /// No description provided for @inputEndingSoundLabel.
  ///
  /// In en, this message translates to:
  /// **'Ending sound'**
  String get inputEndingSoundLabel;

  /// No description provided for @startTimerButtonText.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startTimerButtonText;

  /// No description provided for @noSound.
  ///
  /// In en, this message translates to:
  /// **'No sound'**
  String get noSound;

  /// No description provided for @inputSoundChukpi.
  ///
  /// In en, this message translates to:
  /// **'Chukpi'**
  String get inputSoundChukpi;

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

  /// No description provided for @timerFinishSessionButtonText.
  ///
  /// In en, this message translates to:
  /// **'Finish session'**
  String get timerFinishSessionButtonText;

  /// No description provided for @timerDiscardSessionButtonText.
  ///
  /// In en, this message translates to:
  /// **'Discard session'**
  String get timerDiscardSessionButtonText;

  /// No description provided for @timerSettingsHistory.
  ///
  /// In en, this message translates to:
  /// **'Settings history'**
  String get timerSettingsHistory;

  /// No description provided for @timerSettingsHistoryApplied.
  ///
  /// In en, this message translates to:
  /// **'Timer settings applied.'**
  String get timerSettingsHistoryApplied;

  /// No description provided for @timerSettingsHistoryEmpty.
  ///
  /// In en, this message translates to:
  /// **'There are no timer settings\n saved in history yet.'**
  String get timerSettingsHistoryEmpty;

  /// No description provided for @noInterval.
  ///
  /// In en, this message translates to:
  /// **'No interval'**
  String get noInterval;

  /// No description provided for @noWarmup.
  ///
  /// In en, this message translates to:
  /// **'No warmup time'**
  String get noWarmup;

  /// No description provided for @secondsAbbr.
  ///
  /// In en, this message translates to:
  /// **'s'**
  String get secondsAbbr;

  /// No description provided for @minutesPlural.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{minute} =1{minute} =2{minutes} few{minutes} many{minutes} other{minutes}}'**
  String minutesPlural(num count);

  /// No description provided for @minutesPluralWithNumber.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{{count} minute} =1{{count} minute} =2{{count} minutes} few{{count} minutes} many{{count} minutes} other{{count} minutes}}'**
  String minutesPluralWithNumber(num count);

  /// No description provided for @intervalPlural.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{interval} =1{interval} =2{intervals} few{intervals} many{intervals} other{intervals}}'**
  String intervalPlural(num count);

  /// No description provided for @intervalPluralWithNumber.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{{count} interval} =1{{count} interval} =2{{count} intervals} few{{count} intervals} many{{count} intervals} other{{count} intervals}}'**
  String intervalPluralWithNumber(num count);
}

class _TimerLocalizationsDelegate
    extends LocalizationsDelegate<TimerLocalizations> {
  const _TimerLocalizationsDelegate();

  @override
  Future<TimerLocalizations> load(Locale locale) {
    return SynchronousFuture<TimerLocalizations>(
      lookupTimerLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hu'].contains(locale.languageCode);

  @override
  bool shouldReload(_TimerLocalizationsDelegate old) => false;
}

TimerLocalizations lookupTimerLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return TimerLocalizationsEn();
    case 'hu':
      return TimerLocalizationsHu();
  }

  throw FlutterError(
    'TimerLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
