import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'profile_localizations_en.dart';
import 'profile_localizations_hu.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of ProfileLocalizations
/// returned by `ProfileLocalizations.of(context)`.
///
/// Applications need to include `ProfileLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/profile_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ProfileLocalizations.localizationsDelegates,
///   supportedLocales: ProfileLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the ProfileLocalizations.supportedLocales
/// property.
abstract class ProfileLocalizations {
  ProfileLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ProfileLocalizations of(BuildContext context) {
    return Localizations.of<ProfileLocalizations>(
      context,
      ProfileLocalizations,
    )!;
  }

  static const LocalizationsDelegate<ProfileLocalizations> delegate =
      _ProfileLocalizationsDelegate();

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

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @sessionsHistory.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get sessionsHistory;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @donate.
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get donate;

  /// No description provided for @profileImageLabel.
  ///
  /// In en, this message translates to:
  /// **'Profile image'**
  String get profileImageLabel;

  /// No description provided for @profileFirstnameLabel.
  ///
  /// In en, this message translates to:
  /// **'Firstname'**
  String get profileFirstnameLabel;

  /// No description provided for @profileLastnameLabel.
  ///
  /// In en, this message translates to:
  /// **'Lastname'**
  String get profileLastnameLabel;

  /// No description provided for @profileLocationLabel.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get profileLocationLabel;

  /// No description provided for @profileWizardTitle.
  ///
  /// In en, this message translates to:
  /// **'Complete your profile!'**
  String get profileWizardTitle;

  /// No description provided for @profileWizardDescription.
  ///
  /// In en, this message translates to:
  /// **'Add your name and profile photo to complete the profile and unlock the full potential of the application.'**
  String get profileWizardDescription;

  /// No description provided for @profileSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileSettings;

  /// No description provided for @profileStats.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get profileStats;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Signout'**
  String get signOut;

  /// No description provided for @deleteProfileScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete profile!'**
  String get deleteProfileScreenTitle;

  /// No description provided for @deleteProfileScreenText.
  ///
  /// In en, this message translates to:
  /// **'To delete your profile, you need to sign in again for security reasons.'**
  String get deleteProfileScreenText;

  /// No description provided for @deleteProfileScreenSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Your profile\nhas been deleted!'**
  String get deleteProfileScreenSuccessTitle;

  /// No description provided for @deleteProfileScreenOkayButtonText.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get deleteProfileScreenOkayButtonText;

  /// No description provided for @milestones.
  ///
  /// In en, this message translates to:
  /// **'Milestones'**
  String get milestones;

  /// No description provided for @consecutiveDays.
  ///
  /// In en, this message translates to:
  /// **'Consecutive days'**
  String get consecutiveDays;

  /// No description provided for @statsSignedUp.
  ///
  /// In en, this message translates to:
  /// **'Joined'**
  String get statsSignedUp;

  /// No description provided for @statsFirstSession.
  ///
  /// In en, this message translates to:
  /// **'First session'**
  String get statsFirstSession;

  /// No description provided for @statsLastSession.
  ///
  /// In en, this message translates to:
  /// **'Last session'**
  String get statsLastSession;

  /// No description provided for @statsCurrentStreak.
  ///
  /// In en, this message translates to:
  /// **'Current streak'**
  String get statsCurrentStreak;

  /// No description provided for @statsStartedAt.
  ///
  /// In en, this message translates to:
  /// **'Started at'**
  String get statsStartedAt;

  /// No description provided for @statsNotyetStarted.
  ///
  /// In en, this message translates to:
  /// **'Not yet started'**
  String get statsNotyetStarted;

  /// No description provided for @statsLastCheckedAt.
  ///
  /// In en, this message translates to:
  /// **'Last checked'**
  String get statsLastCheckedAt;

  /// No description provided for @statsNotyetChecked.
  ///
  /// In en, this message translates to:
  /// **'Not yet checked'**
  String get statsNotyetChecked;

  /// No description provided for @statsLongestStreak.
  ///
  /// In en, this message translates to:
  /// **'Longest streak'**
  String get statsLongestStreak;

  /// No description provided for @statsSummary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get statsSummary;

  /// No description provided for @statsTotalTimeSpent.
  ///
  /// In en, this message translates to:
  /// **'Total time'**
  String get statsTotalTimeSpent;

  /// No description provided for @statsTotalSessions.
  ///
  /// In en, this message translates to:
  /// **'Total sessions'**
  String get statsTotalSessions;

  /// No description provided for @statsTotalDays.
  ///
  /// In en, this message translates to:
  /// **'Total days'**
  String get statsTotalDays;

  /// No description provided for @statsCount.
  ///
  /// In en, this message translates to:
  /// **'Count'**
  String get statsCount;

  /// No description provided for @statsNextMilestone.
  ///
  /// In en, this message translates to:
  /// **'Next milestone'**
  String get statsNextMilestone;

  /// No description provided for @statsNextMilestoneIn.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Next milestone in {count} more days.} =1{Next milestone in {count} more day.} =2{Next milestone in {count} more days.} few{Next milestone in {count} more days.} many{Next milestone in {count} more days.} other{Next milestone in {count} more days.}}'**
  String statsNextMilestoneIn(num count);

  /// No description provided for @statsNextMilestoneInShort.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{In {count} more days} =1{In {count} more day.} =2{In {count} more days} few{In {count} more days} many{In {count} more days} other{In {count} more days}}'**
  String statsNextMilestoneInShort(num count);

  /// No description provided for @sessionsPlural.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{session} =1{session} =2{sessions} few{sessions} many{sessions} other{sessions}}'**
  String sessionsPlural(num count);

  /// No description provided for @minutesPlural.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{minute} =1{minute} =2{minutes} few{minutes} many{minutes} other{minutes}}'**
  String minutesPlural(num count);

  /// No description provided for @daysPlural.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{day} =1{day} =2{days} few{days} many{days} other{days}}'**
  String daysPlural(num count);

  /// No description provided for @notAvailableAbbr.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get notAvailableAbbr;

  /// No description provided for @showStatsOnFinishScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Show statistics on\nSession Finish Screen'**
  String get showStatsOnFinishScreenTitle;

  /// No description provided for @showStatsOnFinishScreenDescription.
  ///
  /// In en, this message translates to:
  /// **'When enabled, your statistics updated with the finished session will be displayed on the Session Finish screen.'**
  String get showStatsOnFinishScreenDescription;

  /// No description provided for @usePresenceFeatureTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable Presence feature'**
  String get usePresenceFeatureTitle;

  /// No description provided for @usePresenceFeatureDescription.
  ///
  /// In en, this message translates to:
  /// **'When enabled, user will be able to see other users who are currently practicing.'**
  String get usePresenceFeatureDescription;

  /// No description provided for @clearCache.
  ///
  /// In en, this message translates to:
  /// **'Clear cache'**
  String get clearCache;

  /// No description provided for @clearCacheDescription.
  ///
  /// In en, this message translates to:
  /// **'\'Clears all cached audio and lyrics files for chants. This will free up storage space, but you will need to re-download the files if you want to play them again.\''**
  String get clearCacheDescription;

  /// No description provided for @healthConnect_initializingTitle_ios.
  ///
  /// In en, this message translates to:
  /// **'Save completed sessions to\nApple Health'**
  String get healthConnect_initializingTitle_ios;

  /// No description provided for @healthConnect_initializingText_ios.
  ///
  /// In en, this message translates to:
  /// **'Checking service availability...'**
  String get healthConnect_initializingText_ios;

  /// No description provided for @healthConnect_initializingTitle_android.
  ///
  /// In en, this message translates to:
  /// **'Save completed sessions to\nGoogle Health Connect'**
  String get healthConnect_initializingTitle_android;

  /// No description provided for @healthConnect_initializingText_android.
  ///
  /// In en, this message translates to:
  /// **'Checking service availability...'**
  String get healthConnect_initializingText_android;

  /// No description provided for @healthConnect_serviceNotAvailableTitle_ios.
  ///
  /// In en, this message translates to:
  /// **'Save completed sessions to\nApple Health'**
  String get healthConnect_serviceNotAvailableTitle_ios;

  /// No description provided for @healthConnect_serviceNotAvailableText_ios.
  ///
  /// In en, this message translates to:
  /// **'Apple Health Connect service is not available on this device. Please check if the service is installed and enabled.'**
  String get healthConnect_serviceNotAvailableText_ios;

  /// No description provided for @healthConnect_serviceNotAvailableTitle_android.
  ///
  /// In en, this message translates to:
  /// **'Save completed sessions to\nGoogle Health Connect'**
  String get healthConnect_serviceNotAvailableTitle_android;

  /// No description provided for @healthConnect_serviceNotAvailableText_android.
  ///
  /// In en, this message translates to:
  /// **'Google Health Connect service is not available on this device. Please check if you have the latest updates installed.'**
  String get healthConnect_serviceNotAvailableText_android;

  /// No description provided for @healthConnect_readyTitle_ios.
  ///
  /// In en, this message translates to:
  /// **'Save completed sessions to\nApple Health'**
  String get healthConnect_readyTitle_ios;

  /// No description provided for @healthConnect_readyText_ios.
  ///
  /// In en, this message translates to:
  /// **'Sync the time you\'ve spent meditating in the application to Apple Health and keep your health data centralized.'**
  String get healthConnect_readyText_ios;

  /// No description provided for @healthConnect_readyTitle_android.
  ///
  /// In en, this message translates to:
  /// **'Save completed sessions to\nGoogle Health'**
  String get healthConnect_readyTitle_android;

  /// No description provided for @healthConnect_readyText_android.
  ///
  /// In en, this message translates to:
  /// **'Keep the time you\'ve spent meditating in the application in sync with Google Health Connect.'**
  String get healthConnect_readyText_android;

  /// No description provided for @healthConnect_unnecessaryTitle_ios.
  ///
  /// In en, this message translates to:
  /// **'Save completed sessions to\nApple Health'**
  String get healthConnect_unnecessaryTitle_ios;

  /// No description provided for @healthConnect_unnecessaryText_ios.
  ///
  /// In en, this message translates to:
  /// **'Keep the time you\'ve spent meditating in sync with Apple Health. To manage permissions, go to Settings > Apps > Health > Data Access & Devices.'**
  String get healthConnect_unnecessaryText_ios;

  /// No description provided for @healthConnect_unnecessaryTitle_android.
  ///
  /// In en, this message translates to:
  /// **'Save completed sessions to\nGoogle Health Connect'**
  String get healthConnect_unnecessaryTitle_android;

  /// No description provided for @healthConnect_unnecessaryText_android.
  ///
  /// In en, this message translates to:
  /// **'Keep the time you\'ve spent meditating in the application in sync with Google Health Connect. To manage permissions, go to Settings > Security & Privacy > Privacy > Health Connect.'**
  String get healthConnect_unnecessaryText_android;
}

class _ProfileLocalizationsDelegate
    extends LocalizationsDelegate<ProfileLocalizations> {
  const _ProfileLocalizationsDelegate();

  @override
  Future<ProfileLocalizations> load(Locale locale) {
    return SynchronousFuture<ProfileLocalizations>(
      lookupProfileLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hu'].contains(locale.languageCode);

  @override
  bool shouldReload(_ProfileLocalizationsDelegate old) => false;
}

ProfileLocalizations lookupProfileLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return ProfileLocalizationsEn();
    case 'hu':
      return ProfileLocalizationsHu();
  }

  throw FlutterError(
    'ProfileLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
