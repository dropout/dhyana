// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'core_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class CoreLocalizationsEn extends CoreLocalizations {
  CoreLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get okay => 'Okay';

  @override
  String get close => 'Close';

  @override
  String get profileDeleteTitle => 'Delete Profile';

  @override
  String get profileDeleteQuestion =>
      'All your data will be permanently deleted and cannot be restored.\nAre you sure?';

  @override
  String get profileDeleteCancel => 'Cancel';

  @override
  String get profileDeleteYes => 'Delete';

  @override
  String get imageNotSafeDialogTitle => 'Unsafe image';

  @override
  String get imageNotSafeDialogText =>
      'The selected image may contain inappropriate content. Please choose a different image.';

  @override
  String get imageNotSafeDialogButtonText => 'Okay';

  @override
  String get photoAccessDialogTitle => 'Cannot access photos';

  @override
  String get photoAccessDialogText =>
      'The application doesn\'t have a permission to access you photos. Please go into \'Settings\' and give access to the photos in order to change you profile photo.';

  @override
  String get photoAccessDialogButtonText => 'Okay';

  @override
  String get profileSignoutTitle => 'Signout';

  @override
  String get profileSignoutQuestion => 'Are you sure you want to sign out?';

  @override
  String get profileSignoutCancel => 'No';

  @override
  String get profileSignoutYes => 'Yes';

  @override
  String get signOutSuccessfulMessage => 'Successfully signed out!';

  @override
  String get locationInputPlaceholder => 'Select your city';

  @override
  String get locationInputNoSelection => 'No city selected yet';

  @override
  String get locationInputCurrentSelection => 'Current selection:';

  @override
  String get locationInputErrorMessage =>
      'An unexpected error occured.\nPlease try again later.';

  @override
  String minutesPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'minutes',
      many: 'minutes',
      few: 'minutes',
      two: 'minutes',
      one: 'minute',
      zero: 'minute',
    );
    return '$_temp0';
  }

  @override
  String get minutesAbbr => 'm';

  @override
  String get hoursAbbr => 'h';

  @override
  String get millionShort => 'm';

  @override
  String get million => 'million';

  @override
  String get thousandShort => 'k';

  @override
  String get thousand => 'thousand';

  @override
  String get startTimerButtonText => 'Start';

  @override
  String get profileSaveButtonIdle => 'Save';

  @override
  String get profileSaveButtonSaving => 'Saving...';

  @override
  String get profileSaveButtonSaved => 'Saved!';

  @override
  String get errorHeadline => 'Ooops!';

  @override
  String get errorText => 'An unexpected error has occured.';

  @override
  String get errorButtonText => 'Okay';

  @override
  String get noSound => 'No sound';

  @override
  String get inputSoundVibrate => 'Vibrate';

  @override
  String get inputSoundSmallBell => 'Small Bell';

  @override
  String get inputSoundTriangle => 'Triangle';

  @override
  String get inputSoundChukpi => 'Chukpi';
}
