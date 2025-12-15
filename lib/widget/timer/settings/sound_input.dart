import 'package:dhyana/service/overlay_service.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/util/localization.dart';

import 'sound_input_view.dart';
import 'sound_input_button.dart';

/// A widget that allows users to select a starting sound
/// or an ending sound for a timer.
class SoundInput extends StatelessWidget {

  /// Label used for input view title.
  final String label;

  /// The selected sound value.
  final Sound value;

  /// Callback function that is called when the value changes.
  final void Function(Sound sound)? onChange;

  /// The service used to manage overlays, such as showing modal bottom sheets.
  final OverlayService overlayService;

  const SoundInput({
    required this.label,
    required this.value,
    required this.overlayService,
    this.onChange,
    super.key
  });

  void _onSelected(BuildContext context, Sound sound) {
    onChange?.call(sound);
    context.pop();
  }

  void _onInputTap(BuildContext context) {
    overlayService.showModalBottomSheet(
      context,
      (context) => SoundInputView(
        title: label,
        initialValue: value,
        onSelect: (Sound sound) => _onSelected(context, sound),
      ),
    );
    context.hapticsTap();
  }
  
  @override
  Widget build(BuildContext context) {
    return SoundInputButton(
      key: Key('sound_input_button'),
      padding: const EdgeInsets.symmetric(
        horizontal: DesignSpec.spacingMd,
        vertical: DesignSpec.spacingSm,
      ),
      onTap: () => _onInputTap(context),
      child: Text(
        getLocalizedSoundName(
          value,
          AppLocalizations.of(context)
        ),
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.backgroundPaperLight,
          fontWeight: FontWeight.w800,
        )
      ),
    );
  }

}
