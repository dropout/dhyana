import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/timer/settings/sound_input_button.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/util/localization.dart';
import 'package:dhyana/widget/app_colors.dart';

import 'sound_input_view.dart';

class SoundInput extends StatefulWidget {

  final String label;
  final Sound value;
  final void Function(Sound sound)? onChange;

  const SoundInput({
    required this.label,
    required this.value,
    this.onChange,
    super.key
  });

  @override
  State<SoundInput> createState() => _SoundInputState();
}

class _SoundInputState extends State<SoundInput> {

  void _onSelected(BuildContext context, Sound sound) {
    widget.onChange?.call(sound);
    context.pop();
  }

  void _onInputTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.backgroundPaper,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      useRootNavigator: true,
      builder: (context) {
        return SoundInputView(
          title: widget.label,
          initialValue: widget.value,
          onSelect: (Sound sound) => _onSelected(context, sound),
        );
      }
    );
    context.hapticsTap();
  }
  
  @override
  Widget build(BuildContext context) {
    return SoundInputButton(
      padding: const EdgeInsets.symmetric(
        horizontal: AppThemeData.spacingMd,
        vertical: AppThemeData.spacingSm,
      ),
      onTap: () => _onInputTap(context),
      child: Text(
        getLocalizedSoundName(
          widget.value,
          AppLocalizations.of(context)
        ),
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        )
      ),
    );
  }

}
