import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/service/timer_audio_service.dart';
import 'package:dhyana/util/localization.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:flutter/material.dart';

/// A page in the [SoundInputView] page view, displaying a single sound option.
class SoundInputPage extends StatelessWidget {

  /// The sound to display and play on tap.
  final Sound sound;

  /// The audio service used to play the sound on tap.
  final TimerAudioService audioService;

  /// The size of the sound image.
  final double size;
  
  /// Creates a [SoundInputPage] with the given [sound] and [audioService].
  const SoundInputPage({
    required this.sound,
    required this.audioService,
    this.size = 128.0,
    super.key,
  });

  void _onImageTap(BuildContext context) {
    if (audioService.isPlaying) {
      audioService.stop();
    } else {
      audioService.playSound(sound);
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
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            )
          )
        ]
    );
  }
}
