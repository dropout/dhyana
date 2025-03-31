import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

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

String getLocalizedRoundedNumber(
    BuildContext context,
    num number, {
      bool shorten = false
    }
    ) {
  if (number >= 1000000) {
    String roundedNumber = (number / 1000000).toStringAsFixed(1);
    String localizedUnit = shorten ? AppLocalizations.of(context).millionShort :  AppLocalizations.of(context).million;
    return shorten ? '$roundedNumber$localizedUnit' : '$roundedNumber $localizedUnit';
  } else if (number >= 1000) {
    String roundedNumber = (number / 1000).toStringAsFixed(1);
    String localizedUnit = shorten ? AppLocalizations.of(context).thousandShort : AppLocalizations.of(context).thousand;
    return shorten ? '$roundedNumber$localizedUnit' : '$roundedNumber $localizedUnit';
  } else {
    return number.toString();
  }
}
