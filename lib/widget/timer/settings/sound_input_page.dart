import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/service/audio_service.dart';
import 'package:dhyana/util/localization.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:flutter/material.dart';


/// No state management, because the playback state is
/// not displayed in this widget.
class SoundInputPage extends StatelessWidget {

  final double size;
  final Sound sound;
  final AudioService audioService;

  const SoundInputPage({
    required this.sound,
    required this.audioService,
    this.size = 128.0,
    super.key,
  });

  void _onImageTap(BuildContext context) {
    if (sound == Sound.none) return;

    if (audioService.isPlaying) {
      audioService.stop();
    } else {
      audioService.play(sound);
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
              key: const Key('sound_input_page_image_container'),
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(sound.imageResourcePath)
                )
              ),
            ),
          ),
          const SizedBox(height: DesignSpec.spacingLg),
          Text(
            getLocalizedSoundName(sound, AppLocalizations.of(context)),
            style: Theme.of(context).textTheme.titleMedium
          )
        ]
    );
  }
}
