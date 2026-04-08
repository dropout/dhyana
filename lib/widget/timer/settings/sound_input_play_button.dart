import 'dart:async';

import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/service/timer_audio_service.dart';
import 'package:flutter/material.dart';

/// A button that plays the given sound when pressed, 
/// and shows a stop button while the sound is playing.
class SoundInputPlayButton extends StatefulWidget {

  /// The sound to play when the button is pressed.
  final Sound sound;

  /// The audio service to use for playing the sound.
  final TimerAudioService audioService;

  const SoundInputPlayButton({
    required this.sound,
    required this.audioService,
    super.key,
  });

  @override
  State<SoundInputPlayButton> createState() => SoundInputPlayButtonState();
}

class SoundInputPlayButtonState extends State<SoundInputPlayButton> {
  
  bool isPlaying = false;
  late final StreamSubscription<bool> _isPlayingSubscription;
  
  @override
  initState() {
    _isPlayingSubscription = widget.audioService.
      isPlayingStream.listen((isPlaying) {
        setState(() {
          this.isPlaying = isPlaying;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sound == Sound.none) {
      return IconButton(
        key: const Key('sound_input_play_button_none'),
        icon: const Icon(
          size: 48,
          Icons.play_circle_fill_rounded,
        ),
        onPressed: null,
      );
    }

    if (isPlaying) {
      return IconButton(
        key: const Key('sound_input_play_button_stop'),
        icon: const Icon(
          size: 48,
          Icons.stop_circle_rounded
        ),
        onPressed: () {
          widget.audioService.stop();
        },
      );
    } else {
      return IconButton(
        key: const Key('sound_input_play_button_play'),
        icon: const Icon(
          Icons.play_circle_fill_rounded,
          size: 48,
        ),
        onPressed: () {
          widget.audioService.playSound(widget.sound);
        },
      );
    }
  }

  @override
  void dispose() {
    _isPlayingSubscription.cancel();
    super.dispose();
  }

}
