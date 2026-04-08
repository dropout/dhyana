import 'package:audio_service/audio_service.dart';
import 'package:dhyana/audio/chanting_audio_handler.dart';
import 'package:dhyana/audio/app_audio_handler.dart';
import 'package:dhyana/enum/playback_state.dart';

class ChantingAudioService {
  final AppAudioHandler _audioHandler;

  ChantingAudioService(this._audioHandler) {
    _switchToHandler();
  }

  Future<Duration> loadChant(String url, {String? title}) async {
    try {
      final result = await _audioHandler.customAction(
        ChantingHandlerCustomAction.loadChant.name,
        {'url': url, 'title': title},
      );
      return result as Duration;
    } catch (e) {
      // default to zero if the handler doesn't return a duration
      return Duration.zero;
    }
  }

  Future<void> play() => _audioHandler.play();
  Future<void> pause() => _audioHandler.pause();
  Future<void> seek(Duration position) => _audioHandler.seek(position);
  Future<void> stop() => _audioHandler.stop();
  Future<void> release() =>
      _audioHandler.customAction(ChantingHandlerCustomAction.release.name);

  bool get playing =>
    _audioHandler.playbackState.value.playing;
  
  Duration get position =>
    _audioHandler.playbackState.value.position;
  
  Stream<Duration> get positionStream =>
    AudioService.position;
  
  Duration get duration =>
    mediaItem?.duration ?? Duration.zero;
  
  Stream<Duration?> get durationStream =>
    _audioHandler.mediaItem
      .where((m) => m != null)
      .map((m) => m!.duration);  

  AudioPlaybackState get playbackState =>
    _toAudioPlaybackState(_audioHandler.playbackState.value);  

  MediaItem? get mediaItem {
    return _audioHandler.mediaItem.value;
  }

  Stream<AudioPlaybackState> get playbackStateStream =>
    _audioHandler.playbackState.map(_toAudioPlaybackState);  

  AudioPlaybackState _toAudioPlaybackState(PlaybackState playbackState) {

  
    if (playbackState.playing) {
      return AudioPlaybackState.playing;
    }

    switch (playbackState.processingState) {
      case AudioProcessingState.idle:
        return AudioPlaybackState.idle;
      case AudioProcessingState.loading:
      case AudioProcessingState.ready:
        return AudioPlaybackState.stopped;
      case AudioProcessingState.completed:
        return AudioPlaybackState.completed;
      default:
        return AudioPlaybackState.idle;
    }
  }

  void _switchToHandler() {
    _audioHandler.customAction(AppAudioHandler.switchAction, {
      'handlerId': ChantingAudioHandler.handlerId,
    });
  }

}
