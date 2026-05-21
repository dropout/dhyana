import 'dart:async';

import 'package:dhyana/enum/sound.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

/// A simple audio service that can play discrete sounds without
/// maintaining an active media session with the OS.
class SimpleAudioService {
  final SoLoud _soloud;
  AudioSource? _soundSource;
  SoundHandle? _soundHandle;
  final StreamController<bool> _isPlayingController =
      StreamController<bool>.broadcast();

  SimpleAudioService({required SoLoud soloud}) : _soloud = soloud;

  bool get isPlaying {
    if (_soundHandle != null && _soloud.getIsValidVoiceHandle(_soundHandle!)) {
      return _soloud.getPause(_soundHandle!) == false;
    } else {
      return false;
    }
  }

  Stream<bool> get isPlayingStream => _isPlayingController.stream;

  Future<void> play(Sound sound) async {
    await _disposeSoundResources();
    final s = await _soloud.loadAsset(sound.assetPath);
    _soundHandle = _soloud.play(s);
    _isPlayingController.add(true);
    s.allInstancesFinished      
      .first.then((_) {
        if (_isPlayingController.isClosed) return;
        _isPlayingController.add(false);
        _soloud.disposeSource(s);
      });
  }

  Future<void> stop() async {
    if (_soundHandle != null && _soloud.getIsValidVoiceHandle(_soundHandle!)) {
      await _soloud.stop(_soundHandle!);
    }
  }

  Future<void> _disposeSoundResources() async {
    if (_soundHandle != null && _soloud.getIsValidVoiceHandle(_soundHandle!)) {
      await _soloud.stop(_soundHandle!);
      _soundHandle = null;
    }
    if (_soundSource != null) {
      await _soloud.disposeSource(_soundSource!);
      _soundSource = null;
    }
  }

  Future<void> dispose() async {
    await _disposeSoundResources();
    _isPlayingController.close();
  }
}
