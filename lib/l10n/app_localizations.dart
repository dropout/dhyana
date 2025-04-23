import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hu.dart';

// ignore_for_file: type=lint

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

  /// No description provided for @minutes.
  ///
  /// In hu, this message translates to:
  /// **'Perc'**
  String get minutes;

  /// No description provided for @day.
  ///
  /// In hu, this message translates to:
  /// **'Nap'**
  String get day;

  /// No description provided for @days.
  ///
  /// In hu, this message translates to:
  /// **'Napok'**
  String get days;

  /// No description provided for @week.
  ///
  /// In hu, this message translates to:
  /// **'Hét'**
  String get week;

  /// No description provided for @weeks.
  ///
  /// In hu, this message translates to:
  /// **'Hetek'**
  String get weeks;

  /// No description provided for @month.
  ///
  /// In hu, this message translates to:
  /// **'Hónap'**
  String get month;

  /// No description provided for @months.
  ///
  /// In hu, this message translates to:
  /// **'Hónapok'**
  String get months;

  /// No description provided for @year.
  ///
  /// In hu, this message translates to:
  /// **'Év'**
  String get year;

  /// No description provided for @years.
  ///
  /// In hu, this message translates to:
  /// **'Évek'**
  String get years;

  /// No description provided for @milestone.
  ///
  /// In hu, this message translates to:
  /// **'Mérföldkő'**
  String get milestone;

  /// No description provided for @milestones.
  ///
  /// In hu, this message translates to:
  /// **'Mérföldkövek'**
  String get milestones;

  /// No description provided for @okay.
  ///
  /// In hu, this message translates to:
  /// **'Rendben'**
  String get okay;

  /// No description provided for @warmup.
  ///
  /// In hu, this message translates to:
  /// **'Felkészülés'**
  String get warmup;

  /// No description provided for @loading.
  ///
  /// In hu, this message translates to:
  /// **'Betöltés...'**
  String get loading;

  /// No description provided for @loadMore.
  ///
  /// In hu, this message translates to:
  /// **'Több betöltése'**
  String get loadMore;

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

  /// No description provided for @session.
  ///
  /// In hu, this message translates to:
  /// **'Ülés'**
  String get session;

  /// No description provided for @sessions.
  ///
  /// In hu, this message translates to:
  /// **'Ülések'**
  String get sessions;

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

  /// No description provided for @sessionsHistory.
  ///
  /// In hu, this message translates to:
  /// **'Ülések'**
  String get sessionsHistory;

  /// No description provided for @editProfile.
  ///
  /// In hu, this message translates to:
  /// **'Profil szerkesztése'**
  String get editProfile;

  /// No description provided for @timerSettingsHistory.
  ///
  /// In hu, this message translates to:
  /// **'Legutóbbi beállítások'**
  String get timerSettingsHistory;

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

  /// No description provided for @profileWizardTitle.
  ///
  /// In hu, this message translates to:
  /// **'Véglegesítsd a profilodat!'**
  String get profileWizardTitle;

  /// No description provided for @photoAccessDialogTitle.
  ///
  /// In hu, this message translates to:
  /// **'Fotók nem érhetőek el'**
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

  /// No description provided for @profileStats.
  ///
  /// In hu, this message translates to:
  /// **'Statisztika'**
  String get profileStats;

  /// No description provided for @consecutiveDays.
  ///
  /// In hu, this message translates to:
  /// **'Egymás utáni napok'**
  String get consecutiveDays;

  /// No description provided for @highlights.
  ///
  /// In hu, this message translates to:
  /// **'Kiemelt adatok'**
  String get highlights;

  /// No description provided for @average.
  ///
  /// In hu, this message translates to:
  /// **'Átlag'**
  String get average;

  /// No description provided for @averageAbbr.
  ///
  /// In hu, this message translates to:
  /// **'Átl.'**
  String get averageAbbr;

  /// No description provided for @statsCurrentStreak.
  ///
  /// In hu, this message translates to:
  /// **'Aktuális sorozat'**
  String get statsCurrentStreak;

  /// No description provided for @statsStartedAt.
  ///
  /// In hu, this message translates to:
  /// **'Aktuálist sorozat kezdete'**
  String get statsStartedAt;

  /// No description provided for @statsNotyetStarted.
  ///
  /// In hu, this message translates to:
  /// **'Még nem kezdted el'**
  String get statsNotyetStarted;

  /// No description provided for @statsLastCheckedAt.
  ///
  /// In hu, this message translates to:
  /// **'Legutolsó ellenőrzés'**
  String get statsLastCheckedAt;

  /// No description provided for @statsNotyetChecked.
  ///
  /// In hu, this message translates to:
  /// **'Még nincs ellenőrizve'**
  String get statsNotyetChecked;

  /// No description provided for @statsLongestStreak.
  ///
  /// In hu, this message translates to:
  /// **'Leghosszabb sorozat'**
  String get statsLongestStreak;

  /// No description provided for @statsTimePerDay.
  ///
  /// In hu, this message translates to:
  /// **'Idő naponta'**
  String get statsTimePerDay;

  /// No description provided for @statsTimePerWeek.
  ///
  /// In hu, this message translates to:
  /// **'Idő hetente'**
  String get statsTimePerWeek;

  /// No description provided for @statsTimePerMonth.
  ///
  /// In hu, this message translates to:
  /// **'Idő havonta'**
  String get statsTimePerMonth;

  /// No description provided for @statsTimePerYear.
  ///
  /// In hu, this message translates to:
  /// **'Idő évente'**
  String get statsTimePerYear;

  /// No description provided for @statsSummary.
  ///
  /// In hu, this message translates to:
  /// **'Összesítés'**
  String get statsSummary;

  /// No description provided for @statsTotalTimeSpent.
  ///
  /// In hu, this message translates to:
  /// **'Összes idő'**
  String get statsTotalTimeSpent;

  /// No description provided for @statsTotalSessions.
  ///
  /// In hu, this message translates to:
  /// **'Összes alkalom'**
  String get statsTotalSessions;

  /// No description provided for @statsTotalDays.
  ///
  /// In hu, this message translates to:
  /// **'Összes nap'**
  String get statsTotalDays;

  /// No description provided for @statsAverageTimeSpent.
  ///
  /// In hu, this message translates to:
  /// **'Átlagos idő'**
  String get statsAverageTimeSpent;

  /// No description provided for @statsAverageSessions.
  ///
  /// In hu, this message translates to:
  /// **'Átlagos alkalom'**
  String get statsAverageSessions;

  /// No description provided for @statsCount.
  ///
  /// In hu, this message translates to:
  /// **'Darab'**
  String get statsCount;

  /// No description provided for @statsNextMilestone.
  ///
  /// In hu, this message translates to:
  /// **'Következő mérföldkő'**
  String get statsNextMilestone;

  /// No description provided for @signOut.
  ///
  /// In hu, this message translates to:
  /// **'Kijelentkezés'**
  String get signOut;

  /// No description provided for @profileSignoutTitle.
  ///
  /// In hu, this message translates to:
  /// **'Kijelentkezés'**
  String get profileSignoutTitle;

  /// No description provided for @profileSignoutQuestion.
  ///
  /// In hu, this message translates to:
  /// **'Biztos, hogy ki akarsz jelentkezni?'**
  String get profileSignoutQuestion;

  /// No description provided for @profileSignoutYes.
  ///
  /// In hu, this message translates to:
  /// **'Igen'**
  String get profileSignoutYes;

  /// No description provided for @profileSignoutCancel.
  ///
  /// In hu, this message translates to:
  /// **'Mégsem'**
  String get profileSignoutCancel;

  /// No description provided for @presence.
  ///
  /// In hu, this message translates to:
  /// **'Jelenlét'**
  String get presence;

  /// No description provided for @presenceScreenSubTitle.
  ///
  /// In hu, this message translates to:
  /// **'Mozgasd a csuszkát a jelenlét időkeretének beállításához.'**
  String get presenceScreenSubTitle;

  /// No description provided for @minutesAbbr.
  ///
  /// In hu, this message translates to:
  /// **'p'**
  String get minutesAbbr;

  /// No description provided for @minutesPlural.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{perc} =1{perc} =2{perc} few{perc} many{perc} other{perc}}'**
  String minutesPlural(num count);

  /// No description provided for @minutesPluralWithNumber.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{{count} perc} =1{{count} perc} =2{{count} perc} few{{count} perc} many{{count} perc} other{{count} perc}}'**
  String minutesPluralWithNumber(num count);

  /// No description provided for @hoursAbbr.
  ///
  /// In hu, this message translates to:
  /// **'ó'**
  String get hoursAbbr;

  /// No description provided for @hoursPlural.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{óra} =1{óra} =2{óra} few{óra} many{óra} other{óra}}'**
  String hoursPlural(num count);

  /// No description provided for @hoursPluralWithNumber.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{{count} óra} =1{{count} óra} =2{{count} óra} few{{count} óra} many{{count} óra} other{{count} óra}}'**
  String hoursPluralWithNumber(num count);

  /// No description provided for @sessionsPlural.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{ülés} =1{ülés} =2{ülés} few{ülés} many{ülés} other{ülés}}'**
  String sessionsPlural(num count);

  /// No description provided for @sessionsPluralWithNumber.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{{count} ülés} =1{{count} ülés} =2{{count} ülés} few{{count} ülés} many{{count} ülés} other{{count} ülés}}'**
  String sessionsPluralWithNumber(num count);

  /// No description provided for @daysPlural.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{nap} =1{nap} =2{nap} few{nap} many{nap} other{nap}}'**
  String daysPlural(num count);

  /// No description provided for @daysPluralWithNumber.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{{count} nap} =1{{count} nap} =2{{count} nap} few{{count} nap} many{{count} nap} other{{count} nap}}'**
  String daysPluralWithNumber(num count);

  /// No description provided for @consecutiveDaysPlural.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{{count} nap} =1{{count} nap} =2{{count} egymás utáni nap} few{{count} egymás utáni nap} many{{count} egymás utáni nap} other{{count} egymás utáni nap}}'**
  String consecutiveDaysPlural(num count);

  /// No description provided for @consecutiveDaysPluralWithNumber.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{{count} nap} =1{{count} nap} =2{{count} egymás utáni nap} few{{count} egymás utáni nap} many{{count} egymás utáni nap} other{{count} egymás utáni nap}}'**
  String consecutiveDaysPluralWithNumber(num count);

  /// No description provided for @thousand.
  ///
  /// In hu, this message translates to:
  /// **'ezer'**
  String get thousand;

  /// No description provided for @thousandShort.
  ///
  /// In hu, this message translates to:
  /// **'e'**
  String get thousandShort;

  /// No description provided for @million.
  ///
  /// In hu, this message translates to:
  /// **'millió'**
  String get million;

  /// No description provided for @millionShort.
  ///
  /// In hu, this message translates to:
  /// **'m'**
  String get millionShort;
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
