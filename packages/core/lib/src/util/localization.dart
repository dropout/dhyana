import 'package:core/src/domain/enum/sound.dart';
import 'package:core/l10n/core_localizations.dart';
import 'package:material_ui/material_ui.dart';

extension LocalizedSoundNameExtension on Sound {
  String getLocalizedName(dynamic localizations) => switch (this) {
    .none => localizations.noSound,
    .vibrate => localizations.inputSoundVibrate,
    .smallBell => localizations.inputSoundSmallBell,
    .triangle => localizations.inputSoundTriangle,
  };
}

extension LocalizedRoundedNumberExtension on num {
  String getLocalizedRoundedNumber(
    BuildContext context, {
    bool shorten = false,
  }) {
    if (this >= 1000000) {
      String roundedNumber = (this / 1000000).toStringAsFixed(1);
      String localizedUnit = shorten
          ? CoreLocalizations.of(context).millionShort
          : CoreLocalizations.of(context).million;
      return shorten
          ? '$roundedNumber$localizedUnit'
          : '$roundedNumber $localizedUnit';
    } else if (this >= 1000) {
      String roundedNumber = (this / 1000).toStringAsFixed(1);
      String localizedUnit = shorten
          ? CoreLocalizations.of(context).thousandShort
          : CoreLocalizations.of(context).thousand;
      return shorten
          ? '$roundedNumber$localizedUnit'
          : '$roundedNumber $localizedUnit';
    } else {
      return toString();
    }
  }
}
