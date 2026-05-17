import 'package:dhyana/audio/app_audio_handler.dart';
import 'package:dhyana/audio/so_chanting_audio_handler.dart';

import 'chanting_audio_service.dart';

class SoLoudChantingAudioService extends ChantingAudioService {
  
  SoLoudChantingAudioService(super.audioHandler) {
      _switchToChantingAudioHandler();
  }

  void _switchToChantingAudioHandler() {
    audioHandler.customAction(AppAudioHandler.switchAction, {
      'handlerId': SoLoudChantingAudioHandler.handlerId,
    });
  }
}
