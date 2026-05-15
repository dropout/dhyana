import 'package:audio_service/audio_service.dart';
import 'package:dhyana/audio/chanting_audio_handler.dart';
import 'package:dhyana/audio/app_audio_handler.dart';
import 'package:dhyana/model/chanting_settings.dart';

class ChantingAudioService {
  final AppAudioHandler _audioHandler;

  ChantingAudioService(this._audioHandler) {
    _switchToChantingAudioHandler();
  }

  Future<Duration> setup(
    ChantingSettings settings, 
    Map<String, String> resourceUrls
  ) async {
    final result = await _audioHandler.customAction(
      ChantingHandlerCustomAction.setup.name, {
        'chantingSettings': settings.toJson(),
        'resourceUrls': resourceUrls,
      }
    );
    return result;
  }

  Future<void> play() => _audioHandler.play();
  Future<void> pause() => _audioHandler.pause();
  Future<void> seek(Duration position) => _audioHandler.seek(position);
  Future<void> stop() => _audioHandler.stop();
  Future<void> prev() => _audioHandler.skipToPrevious();
  Future<void> next() => _audioHandler.skipToNext();

  bool get playing => _audioHandler.playbackState.value.playing;
  
  // Duration
  Duration get duration => mediaItem?.duration ?? Duration.zero;
  Stream<Duration?> get durationStream =>
    _audioHandler.mediaItem.where((m) => m != null).map((m) => m!.duration);

  // MediaItem
  Stream<MediaItem?> get mediaItemStream => _audioHandler.mediaItem;
  MediaItem? get mediaItem => _audioHandler.mediaItem.value;

  // PlaybackState
  Stream<PlaybackState> get playbackStateStream => _audioHandler.playbackState;
  PlaybackState get playbackState => _audioHandler.playbackState.value;

  void _switchToChantingAudioHandler() {
    _audioHandler.customAction(AppAudioHandler.switchAction, {
      'handlerId': ChantingAudioHandler.handlerId,
    });
  }
}
