import 'package:audio_service/audio_service.dart';

abstract interface class AppAudioHandler implements AudioHandler {
  Future<Duration> get outputLatency;
  void switchToTimerAudioHandler();
  void switchToChantingAudioHandler();
}
