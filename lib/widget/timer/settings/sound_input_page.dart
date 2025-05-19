import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/service/audio_service.dart';
import 'package:dhyana/util/localization.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

class SoundInputPage extends StatefulWidget {

  final Sound sound;
  final AudioService audioService;

  const SoundInputPage({
    required this.sound,
    required this.audioService,
    super.key,
  });

  @override
  State<SoundInputPage> createState() => _SoundInputPageState();
}

class _SoundInputPageState extends State<SoundInputPage> {

  void _onImageTap(BuildContext context) {
    if (widget.sound != Sound.none) {
      widget.audioService.play(widget.sound);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => _onImageTap(context),
            child: Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.sound.imageResourcePath)
                )
              ),
            ),
          ),
          const SizedBox(height: AppThemeData.spacingLg),
          Text(
            getLocalizedSoundName(widget.sound, AppLocalizations.of(context)),
            style: Theme.of(context).textTheme.titleMedium
          )
        ]
    );
  }
}
