import 'dart:async';

import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/service/audio_service.dart';
import 'package:flutter/material.dart';

class SoundInputPlayButton extends StatefulWidget {

  final Sound sound;
  final AudioService audioService;

  const SoundInputPlayButton({
    required this.sound,
    required this.audioService,
    super.key,
  });

  @override
  State<SoundInputPlayButton> createState() => _SoundInputPlayButtonState();
}

class _SoundInputPlayButtonState extends State<SoundInputPlayButton> {
  
  bool _isPlaying = false;
  late final StreamSubscription<bool> _isPlayingSubscription;
  
  @override
  initState() {
    _isPlayingSubscription = widget.audioService.
      isPlayingStream.listen((isPlaying) {
        setState(() {
          _isPlaying = isPlaying;
        });
      });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if (widget.sound == Sound.none) {
      return IconButton(
        icon: const Icon(
            size: 48,
            Icons.play_circle_fill_rounded,
        ),
        onPressed: null,
      );
    }

    if (_isPlaying) {
      return IconButton(
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
        icon: const Icon(
          Icons.play_circle_fill_rounded,
          size: 48,
        ),
        onPressed: () {
          widget.audioService.play(widget.sound);
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
