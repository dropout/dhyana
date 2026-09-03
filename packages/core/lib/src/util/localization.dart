import 'package:core/src/domain/enum/sound.dart';
import 'package:core/l10n/core_localizations.dart';
import 'package:material_ui/material_ui.dart';

String getLocalizedSoundName(
  Sound sound,
  dynamic localizations
) {
  switch (sound) {
    case Sound.none:
      return localizations.noSound;
    case Sound.vibrate:
      return localizations.inputSoundVibrate;
    case Sound.smallBell:
      return localizations.inputSoundSmallBell;
    case Sound.triangle:
      return localizations.inputSoundTriangle;    
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
    String localizedUnit = shorten ? CoreLocalizations.of(context).millionShort :  CoreLocalizations.of(context).million;
    return shorten ? '$roundedNumber$localizedUnit' : '$roundedNumber $localizedUnit';
  } else if (number >= 1000) {
    String roundedNumber = (number / 1000).toStringAsFixed(1);
    String localizedUnit = shorten ? CoreLocalizations.of(context).thousandShort : CoreLocalizations.of(context).thousand;
    return shorten ? '$roundedNumber$localizedUnit' : '$roundedNumber $localizedUnit';
  } else {
    return number.toString();
  }
}
