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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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

  /// Singular form of minute.
  ///
  /// In hu, this message translates to:
  /// **'Perc'**
  String get minute;

  /// Plural form of minute.
  ///
  /// In hu, this message translates to:
  /// **'Percek'**
  String get minutes;

  /// A(z) day fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Nap'**
  String get day;

  /// A(z) days fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Napok'**
  String get days;

  /// A(z) week fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Hét'**
  String get week;

  /// A(z) weeks fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Hetek'**
  String get weeks;

  /// A(z) month fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Hónap'**
  String get month;

  /// A(z) months fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Hónapok'**
  String get months;

  /// A(z) year fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Év'**
  String get year;

  /// A(z) years fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Évek'**
  String get years;

  /// A(z) milestone fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Mérföldkő'**
  String get milestone;

  /// A(z) milestones fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Mérföldkövek'**
  String get milestones;

  /// A(z) okay fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Rendben'**
  String get okay;

  /// A(z) close fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Bezárás'**
  String get close;

  /// A(z) cancel fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Mégsem'**
  String get cancel;

  /// A(z) warmup fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Felkészülés'**
  String get warmup;

  /// Under maintenance title text.
  ///
  /// In hu, this message translates to:
  /// **'Az alkalmazás karbantartás alatt van'**
  String get underMaintenanceTitle;

  /// Under maintenance body text.
  ///
  /// In hu, this message translates to:
  /// **'Kérlek nézz vissza később.'**
  String get underMaintenanceBody;

  /// A(z) loading fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Betöltés...'**
  String get loading;

  /// A(z) loadMore fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Több betöltése'**
  String get loadMore;

  /// A(z) pleaseWait fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Kérlek várj'**
  String get pleaseWait;

  /// A(z) notAvailable fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Nem elérhető'**
  String get notAvailable;

  /// A(z) notAvailableAbbr fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'N/A'**
  String get notAvailableAbbr;

  /// A(z) inputWarmupLabel fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Felkészülés'**
  String get inputWarmupLabel;

  /// A(z) inputStartingSoundLabel fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Kezdőhang'**
  String get inputStartingSoundLabel;

  /// A(z) inputDurationLabel fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Időtartam'**
  String get inputDurationLabel;

  /// Az időközök számának bemeneti címkéje.
  ///
  /// In hu, this message translates to:
  /// **'Időközök'**
  String get inputIntervalCountLabel;

  /// A(z) intervalNoIntervals fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Nincs időközi jelzés.'**
  String get intervalNoIntervalsText;

  /// A(z) intervalOneIntervalText fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Az ülés felénél egy időközi jelzés.'**
  String get intervalOneIntervalText;

  /// A(z) intervalTwoIntervalsText fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'A harmadánál és a kétharmadánál két időközi jelzés.'**
  String get intervalTwoIntervalsText;

  /// A(z) intervalThreeIntervalsText fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'A negyedénél, felénél és háromnegyedénél.'**
  String get intervalThreeIntervalsText;

  /// A(z) inputEndingSoundLabel fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Végehang'**
  String get inputEndingSoundLabel;

  /// A(z) startTimerButtonText fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Start'**
  String get startTimerButtonText;

  /// A(z) sessionModeTimerLabel fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Időzítő'**
  String get sessionModeTimerLabel;

  /// A(z) sessionModeChantingLabel fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Kántálás'**
  String get sessionModeChantingLabel;

  /// A(z) noSound fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Nincs hang'**
  String get noSound;

  /// A(z) inputSoundChukpi fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Chukpi'**
  String get inputSoundChukpi;

  /// A(z) inputSoundVibrate fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Rezgés'**
  String get inputSoundVibrate;

  /// A(z) inputSoundSmallBell fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Csengettyű'**
  String get inputSoundSmallBell;

  /// A(z) inputSoundTriangle fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Harang'**
  String get inputSoundTriangle;

  /// A(z) errorHeadline fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Hoppá!'**
  String get errorHeadline;

  /// A(z) errorText fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Váratlan probléma támadt.'**
  String get errorText;

  /// A(z) errorButtonText fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Rendben'**
  String get errorButtonText;

  /// A(z) session fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Ülés'**
  String get session;

  /// A(z) sessions fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Ülések'**
  String get sessions;

  /// A(z) sessionResultCompleted fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Teljesítettél'**
  String get sessionResultCompleted;

  /// A(z) sessionResultMinutes fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{percet} =1{percet} =2{percet} few{percet} many{percet} other{percet}}'**
  String sessionResultMinutes(int count);

  /// A(z) timerFinishSessionButtonText fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Befejezés'**
  String get timerFinishSessionButtonText;

  /// A(z) timerDiscardSessionButtonText fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Megszakítás'**
  String get timerDiscardSessionButtonText;

  /// A(z) loginHeadline1 fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Ki'**
  String get loginHeadline1;

  /// A(z) loginHeadline2 fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'vagy'**
  String get loginHeadline2;

  /// A(z) loginHeadline3 fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'te?'**
  String get loginHeadline3;

  /// A(z) loginSigninGoogle fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Bejelentkezés Google-lal'**
  String get loginSigninGoogle;

  /// A(z) loginSigninApple fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Bejelentkezés Apple-lel'**
  String get loginSigninApple;

  /// A(z) loginLegalPart1 fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'A bejelentkezéssel elfogadod az\n'**
  String get loginLegalPart1;

  /// A(z) loginLegalPart2 fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'ÁSZF-et'**
  String get loginLegalPart2;

  /// A(z) loginLegalPart3 fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **' és az '**
  String get loginLegalPart3;

  /// A(z) loginLegalPart4 fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Adatvédelmi nyilatkozatot'**
  String get loginLegalPart4;

  /// Login go to profile button text.
  ///
  /// In hu, this message translates to:
  /// **'Ugrás a profilodra'**
  String get loginGoToProfile;

  /// A(z) profile fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Profil'**
  String get profile;

  /// A(z) sessionsHistory fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Ülések'**
  String get sessionsHistory;

  /// A(z) editProfile fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Profil szerkesztése'**
  String get editProfile;

  /// A(z) donate fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Adományozás'**
  String get donate;

  /// A(z) timerSettingsHistory fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Legutóbbi beállítások'**
  String get timerSettingsHistory;

  /// A(z) timerSettingsHistoryApplied fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Időzítő beállítások alkalmazva.'**
  String get timerSettingsHistoryApplied;

  /// A(z) timerSettingsHistoryEmpty fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Még nincsenek legutóbbi időzítő beaállítások elmentve.'**
  String get timerSettingsHistoryEmpty;

  /// A(z) profileImageLabel fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Profil kép'**
  String get profileImageLabel;

  /// A(z) profileFirstnameLabel fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Keresztnév'**
  String get profileFirstnameLabel;

  /// A(z) profileLastnameLabel fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Vezetéknév'**
  String get profileLastnameLabel;

  /// A(z) profileLocationLabel fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Város'**
  String get profileLocationLabel;

  /// A(z) profileSaveButtonIdle fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Mentés'**
  String get profileSaveButtonIdle;

  /// A(z) profileSaveButtonSaving fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Mentés...'**
  String get profileSaveButtonSaving;

  /// A(z) profileSaveButtonSaved fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Elmentve!'**
  String get profileSaveButtonSaved;

  /// A(z) profileWizardTitle fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Véglegesítsd a profilodat!'**
  String get profileWizardTitle;

  /// Profile wizard description.
  ///
  /// In hu, this message translates to:
  /// **'Add meg a nevedet és profil fotódat a profil befejezéséhez és az alkalmazás teljes potenciáljának feloldásához.'**
  String get profileWizardDescription;

  /// A(z) photoAccessDialogTitle fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Fotók nem érhetőek el'**
  String get photoAccessDialogTitle;

  /// A(z) photoAccessDialogText fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Az alkalmazásnak nincs engedélye hozzáférni a fotókhoz. Kérlek a telefon \'Beállítások\' menüjében engedélyezd a hozzáférést a fotókhoz, hogy meg tudjuk változtatni a profilképed.'**
  String get photoAccessDialogText;

  /// A(z) photoAccessDialogButtonText fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Rendben'**
  String get photoAccessDialogButtonText;

  /// A(z) imageNotSafeDialogTitle fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Nem megfelelő kép'**
  String get imageNotSafeDialogTitle;

  /// Image not safe dialog text.
  ///
  /// In hu, this message translates to:
  /// **'A kiválasztott kép nem megfelelő a profilképként való használatra. Kérlek válassz egy másik képet.'**
  String get imageNotSafeDialogText;

  /// A(z) imageNotSafeDialogButtonText fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Rendben'**
  String get imageNotSafeDialogButtonText;

  /// A(z) profileSettings fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Beállítások'**
  String get profileSettings;

  /// A(z) showStatsOnFinishScreenTitle fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Statisztika megjelenítése a Gyakorlat befejezése képernyőn'**
  String get showStatsOnFinishScreenTitle;

  /// A(z) showStatsOnFinishScreenDescription fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Ha engedélyezve van, a gyakorlat befejezése képernyőn megjelenik a gyakorlat eredmény statisztikája.'**
  String get showStatsOnFinishScreenDescription;

  /// A(z) usePresenceFeatureTitle fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Jelenlét funkció engedélyezése'**
  String get usePresenceFeatureTitle;

  /// A(z) usePresenceFeatureDescription fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Ha engedélyezve van, láthatod kikkel gyakorolsz együtt. Ilyenkor mások számára is látható leszel, hogy te is gyakorolsz.'**
  String get usePresenceFeatureDescription;

  /// A(z) profileStats fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Statisztika'**
  String get profileStats;

  /// A(z) consecutiveDays fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Egymás utáni napok'**
  String get consecutiveDays;

  /// A(z) highlights fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Kiemelt adatok'**
  String get highlights;

  /// A(z) average fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Átlag'**
  String get average;

  /// A(z) averagePerDay fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Átlagosan naponta'**
  String get averagePerDay;

  /// A(z) averagePerWeek fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Átlagosan hetente'**
  String get averagePerWeek;

  /// A(z) averagePerMonth fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Átlagosan havonta'**
  String get averagePerMonth;

  /// A(z) averagePerYear fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Átlagosan évente'**
  String get averagePerYear;

  /// A(z) averageAbbr fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Átl.'**
  String get averageAbbr;

  /// A(z) statsSignedUp fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Csatlakozás'**
  String get statsSignedUp;

  /// A(z) statsFirstSession fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Első ülés'**
  String get statsFirstSession;

  /// A(z) statsLastSession fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Legutóbbi ülés'**
  String get statsLastSession;

  /// A(z) statsCurrentStreak fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Aktuális sorozat'**
  String get statsCurrentStreak;

  /// A(z) statsStartedAt fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Aktuálist sorozat kezdete'**
  String get statsStartedAt;

  /// A(z) statsNotyetStarted fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Még nem kezdted el'**
  String get statsNotyetStarted;

  /// A(z) statsLastCheckedAt fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Legutolsó ellenőrzés'**
  String get statsLastCheckedAt;

  /// A(z) statsNotyetChecked fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Még nincs ellenőrizve'**
  String get statsNotyetChecked;

  /// A(z) statsLongestStreak fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Leghosszabb sorozat'**
  String get statsLongestStreak;

  /// A(z) statsTimePerDay fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Idő naponta'**
  String get statsTimePerDay;

  /// A(z) statsTimePerWeek fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Idő hetente'**
  String get statsTimePerWeek;

  /// A(z) statsTimePerMonth fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Idő havonta'**
  String get statsTimePerMonth;

  /// A(z) statsTimePerYear fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Idő évente'**
  String get statsTimePerYear;

  /// A(z) statsSummary fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Összesítés'**
  String get statsSummary;

  /// A(z) statsTotalTimeSpent fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Összes idő'**
  String get statsTotalTimeSpent;

  /// A(z) statsTotalSessions fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Összes alkalom'**
  String get statsTotalSessions;

  /// A(z) statsTotalDays fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Összes nap'**
  String get statsTotalDays;

  /// A(z) statsAverageTimeSpent fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Átlagos idő'**
  String get statsAverageTimeSpent;

  /// A(z) statsAverageSessions fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Átlagos alkalom'**
  String get statsAverageSessions;

  /// A(z) statsCount fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Darab'**
  String get statsCount;

  /// A(z) statsNextMilestone fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Következő mérföldkő'**
  String get statsNextMilestone;

  /// A(z) statsNextMilestoneIn fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{Még {count} a következő mérföldkőig.} =1{Még {count} a következő mérföldkőig.} =2{Még {count} a következő mérföldkőig.} few{Még {count} a következő mérföldkőig.} many{Még {count} a következő mérföldkőig.} other{Még {count} a következő mérföldkőig.}}'**
  String statsNextMilestoneIn(num count);

  /// A(z) statsNextMilestoneInShort fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{{count} nap múlva} =1{{count} nap múlva} =2{{count} nap múlva} few{{count} nap múlva} many{{count} nap múlva} other{{count} nap múlva}}'**
  String statsNextMilestoneInShort(num count);

  /// A(z) statsLoadingData fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Adatok betöltése...'**
  String get statsLoadingData;

  /// A(z) signOut fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Kijelentkezés'**
  String get signOut;

  /// A(z) signOutSuccessfulMessage fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Sikeresen kijelentkeztél!'**
  String get signOutSuccessfulMessage;

  /// A(z) profileSignoutTitle fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Kijelentkezés'**
  String get profileSignoutTitle;

  /// A(z) profileSignoutQuestion fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Biztos, hogy ki akarsz jelentkezni?'**
  String get profileSignoutQuestion;

  /// A(z) profileSignoutYes fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Igen'**
  String get profileSignoutYes;

  /// A(z) profileSignoutCancel fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Mégsem'**
  String get profileSignoutCancel;

  /// A(z) profileDeleteTitle fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Profil törlése'**
  String get profileDeleteTitle;

  /// A(z) profileDeleteQuestion fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Minden adatod véglegesen törlődni fog és nem lesz visszaállítható. Biztos vagy benne?'**
  String get profileDeleteQuestion;

  /// A(z) profileDeleteYes fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Törlés'**
  String get profileDeleteYes;

  /// A(z) profileDeleteCancel fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Mégsem'**
  String get profileDeleteCancel;

  /// A(z) deleteProfileScreenTitle fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Profil törlése!'**
  String get deleteProfileScreenTitle;

  /// A(z) deleteProfileScreenText fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Ahhoz, hogy töröljük a profilod, biztonsági okokból újra be kell jelentkezned.'**
  String get deleteProfileScreenText;

  /// A(z) deleteProfileScreenSuccessTitle fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'A profilodat töröltük!'**
  String get deleteProfileScreenSuccessTitle;

  /// A(z) deleteProfileScreenOkayButtonText fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Rendben'**
  String get deleteProfileScreenOkayButtonText;

  /// A(z) presence fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Jelenlét'**
  String get presence;

  /// A(z) presenceScreenSubTitle fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Mozgasd a csuszkát a jelenlét időkeretének beállításához.'**
  String get presenceScreenSubTitle;

  /// A(z) secondsAbbr fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'mp'**
  String get secondsAbbr;

  /// A(z) secondsPlural fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{másodperc} =1{másodperc} =2{másodperc} few{másodperc} many{másodperc} other{másodperc}}'**
  String secondsPlural(int count);

  /// A(z) secondsPluralWithNumber fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{{count} másodperc} =1{{count} másodperc} =2{{count} másodperc} few{{count} másodperc} many{{count} másodperc} other{{count} másodperc}}'**
  String secondsPluralWithNumber(int count);

  /// A(z) minutesAbbr fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'p'**
  String get minutesAbbr;

  /// A(z) minutesPlural fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{perc} =1{perc} =2{perc} few{perc} many{perc} other{perc}}'**
  String minutesPlural(int count);

  /// A(z) minutesPluralWithNumber fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{{count} perc} =1{{count} perc} =2{{count} perc} few{{count} perc} many{{count} perc} other{{count} perc}}'**
  String minutesPluralWithNumber(int count);

  /// A(z) hoursAbbr fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'ó'**
  String get hoursAbbr;

  /// A(z) hoursPlural fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{óra} =1{óra} =2{óra} few{óra} many{óra} other{óra}}'**
  String hoursPlural(int count);

  /// A(z) hoursPluralWithNumber fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{{count} óra} =1{{count} óra} =2{{count} óra} few{{count} óra} many{{count} óra} other{{count} óra}}'**
  String hoursPluralWithNumber(int count);

  /// A(z) sessionsPlural fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{ülés} =1{ülés} =2{ülés} few{ülés} many{ülés} other{ülés}}'**
  String sessionsPlural(int count);

  /// A(z) sessionsPluralWithNumber fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{{count} ülés} =1{{count} ülés} =2{{count} ülés} few{{count} ülés} many{{count} ülés} other{{count} ülés}}'**
  String sessionsPluralWithNumber(int count);

  /// A(z) daysPlural fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{nap} =1{nap} =2{nap} few{nap} many{nap} other{nap}}'**
  String daysPlural(int count);

  /// A(z) daysPluralWithNumber fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{{count} nap} =1{{count} nap} =2{{count} nap} few{{count} nap} many{{count} nap} other{{count} nap}}'**
  String daysPluralWithNumber(int count);

  /// A(z) weeksPlural fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{hét} =1{hét} =2{hét} few{hét} many{hét} other{hét}}'**
  String weeksPlural(int count);

  /// A(z) weeksPluralWithNumber fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{{count} hét} =1{{count} hét} =2{{count} hét} few{{count} hét} many{{count} hét} other{{count} hét}}'**
  String weeksPluralWithNumber(int count);

  /// A(z) weekNumber fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{year} {weekNumber}H'**
  String weekNumber(int year, int weekNumber);

  /// A(z) consecutiveDaysPlural fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{{count} nap} =1{{count} nap} =2{{count} egymás utáni nap} few{{count} egymás utáni nap} many{{count} egymás utáni nap} other{{count} egymás utáni nap}}'**
  String consecutiveDaysPlural(int count);

  /// A(z) consecutiveDaysPluralWithNumber fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{{count} nap} =1{{count} nap} =2{{count} egymás utáni nap} few{{count} egymás utáni nap} many{{count} egymás utáni nap} other{{count} egymás utáni nap}}'**
  String consecutiveDaysPluralWithNumber(int count);

  /// A(z) noInterval fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Nincs időköz'**
  String get noInterval;

  /// Az intervallum magyar fordítása többesszám formában.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{időköz} =1{időköz} =2{időköz} few{időköz} many{időköz} other{időköz}}'**
  String intervalPlural(int count);

  /// Az intervallum magyar fordítása többesszám formában, számmal együtt.
  ///
  /// In hu, this message translates to:
  /// **'{count, plural, =0{{count} időköz} =1{{count} időköz} =2{{count} időköz} few{{count} időköz} many{{count} időköz} other{{count} időköz}}'**
  String intervalPluralWithNumber(int count);

  /// A(z) thousand fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'ezer'**
  String get thousand;

  /// A(z) thousandShort fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'e'**
  String get thousandShort;

  /// A(z) million fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'millió'**
  String get million;

  /// A(z) millionShort fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'m'**
  String get millionShort;

  /// A(z) locationInputPlaceholder fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Válaszz egy várost'**
  String get locationInputPlaceholder;

  /// Location input current selection label.
  ///
  /// In hu, this message translates to:
  /// **'Jelenlegi választás:'**
  String get locationInputCurrentSelection;

  /// A(z) locationInputNoSelection fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Nincs kiválasztva város'**
  String get locationInputNoSelection;

  /// A(z) locationInputNoResults fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Nincs találat'**
  String get locationInputNoResults;

  /// A(z) locationInputErrorMessage fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Váratlan hiba történt.\nKérlek próbáld újra később.'**
  String get locationInputErrorMessage;

  /// A(z) chantingTitle fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Éneklés'**
  String get chantingTitle;

  /// A(z) chantingNextChantIn fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Következő éneklés'**
  String get chantingNextChantIn;

  /// A(z) chantingAddChantSheetTitle fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Hozzáadás'**
  String get chantingAddChantSheetTitle;

  /// A(z) chantingPlaylistSheetTitle fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Lejátszási lista'**
  String get chantingPlaylistSheetTitle;

  /// A(z) chantingPlaylistBadgeLoading fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Betöltés'**
  String get chantingPlaylistBadgeLoading;

  /// A(z) chantingPlaylistBadgePlaying fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Lejátszás'**
  String get chantingPlaylistBadgePlaying;

  /// A(z) chantingPlaylistBadgePaused fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Szünet'**
  String get chantingPlaylistBadgePaused;

  /// A(z) chantingPlaylistBadgeCompleted fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Befejezett'**
  String get chantingPlaylistBadgeCompleted;

  /// A(z) chantingPlaylistBadgeNext fordítási kulcs leírása.
  ///
  /// In hu, this message translates to:
  /// **'Következő'**
  String get chantingPlaylistBadgeNext;

  /// Health Connect initializing title for iOS.
  ///
  /// In hu, this message translates to:
  /// **'Befejezett ülések mentése az\nApple Health-be'**
  String get healthConnect_initializingTitle_ios;

  /// Health Connect initializing helper text for iOS.
  ///
  /// In hu, this message translates to:
  /// **'Szolgáltatás elérhetőségének ellenőrzése...'**
  String get healthConnect_initializingText_ios;

  /// Health Connect initializing title for Android.
  ///
  /// In hu, this message translates to:
  /// **'Befejezett ülések mentése a\nGoogle Health-be'**
  String get healthConnect_initializingTitle_android;

  /// Health Connect initializing helper text for Android.
  ///
  /// In hu, this message translates to:
  /// **'Szolgáltatás elérhetőségének ellenőrzése...'**
  String get healthConnect_initializingText_android;

  /// Health Connect service not available title for iOS.
  ///
  /// In hu, this message translates to:
  /// **'Befejezett ülések mentése az\nApple Health-be'**
  String get healthConnect_serviceNotAvailableTitle_ios;

  /// Health Connect service not available helper text for iOS.
  ///
  /// In hu, this message translates to:
  /// **'Az Apple Health szolgáltatás nem elérhető ezen az eszközön. Kérlek ellenőrizd, hogy a szolgáltatás telepítve és engedélyezve van-e.'**
  String get healthConnect_serviceNotAvailableText_ios;

  /// Health Connect service not available title for Android.
  ///
  /// In hu, this message translates to:
  /// **'Befejezett ülések mentése a\nGoogle Health-be'**
  String get healthConnect_serviceNotAvailableTitle_android;

  /// Health Connect service not available helper text for Android.
  ///
  /// In hu, this message translates to:
  /// **'A Google Health Connect szolgáltatás nem elérhető ezen az eszközön. Kérlek ellenőrizd, hogy a szolgáltatás telepítve és engedélyezve van-e.'**
  String get healthConnect_serviceNotAvailableText_android;

  /// Health Connect ready title for iOS.
  ///
  /// In hu, this message translates to:
  /// **'Befejezett ülések mentése az\nApple Health-be'**
  String get healthConnect_readyTitle_ios;

  /// Health Connect ready helper text for iOS.
  ///
  /// In hu, this message translates to:
  /// **'Engedélyezd az Apple Health szolgáltatást, hogy a meditációra fordított időt elmenthessük és ezáltal egy helyen tarthatod az egészségügyi adataidat.'**
  String get healthConnect_readyText_ios;

  /// Health Connect ready title for Android.
  ///
  /// In hu, this message translates to:
  /// **'Befejezett ülések mentése a\nGoogle Health-be'**
  String get healthConnect_readyTitle_android;

  /// Health Connect ready helper text for Android.
  ///
  /// In hu, this message translates to:
  /// **'Engedélyezd a Google Health Connect szolgáltatást, hogy a meditációra fordított időt elmenthessük és ezáltal egy helyen tarthatod az egészségügyi adataidat.'**
  String get healthConnect_readyText_android;

  /// Health Connect unnecessary title for iOS.
  ///
  /// In hu, this message translates to:
  /// **'Befejezett ülések mentése az\nApple Health-be'**
  String get healthConnect_unnecessaryTitle_ios;

  /// Health Connect unnecessary helper text for iOS.
  ///
  /// In hu, this message translates to:
  /// **'Az Apple Health szolgáltatás már engedélyezve van, így a meditációra fordított időt már elmenthetjük az Apple Health-be.'**
  String get healthConnect_unnecessaryText_ios;

  /// Health Connect unnecessary title for Android.
  ///
  /// In hu, this message translates to:
  /// **'Befejezett ülések mentése a\nGoogle Health-be'**
  String get healthConnect_unnecessaryTitle_android;

  /// Health Connect unnecessary helper text for Android.
  ///
  /// In hu, this message translates to:
  /// **'A Google Health Connect szolgáltatás már engedélyezve van, így a meditációra fordított időt már elmenthetjük a Google Health Connect-be.'**
  String get healthConnect_unnecessaryText_android;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hu'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hu':
      return AppLocalizationsHu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
