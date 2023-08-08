import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/l10n/app_localizations.dart';

String getLocalizedSoundName(
  Sound sound,
  AppLocalizations localizations
) {
  switch (sound) {
    case Sound.none:
      return localizations.noSound;
    case Sound.smallBell:
      return localizations.inputSoundSmallBell;
  }
}
