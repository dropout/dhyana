import 'package:audio_service/audio_service.dart';
import 'package:dhyana/audio/chanting_audio_handler.dart';
import 'package:dhyana/audio/app_audio_handler.dart';
import 'package:dhyana/model/chanting_settings.dart';

class ChantingAudioService {
  final AppAudioHandler audioHandler;

  ChantingAudioService(this.audioHandler) {
    _switchToChantingAudioHandler();
  }

  Future<Duration> setup(
    ChantingSettings settings, 
    Map<String, String> resourceUrls
  ) async {
    final result = await audioHandler.customAction(
      ChantingHandlerCustomAction.setup.name, {
        'chantingSettings': settings.toJson(),
        'resourceUrls': resourceUrls,
      }
    );
    return result;
  }

  Future<void> play() => audioHandler.play();
  Future<void> pause() => audioHandler.pause();
  Future<void> seek(Duration position) => audioHandler.seek(position);
  Future<void> stop() => audioHandler.stop();
  Future<void> prev() => audioHandler.skipToPrevious();
  Future<void> next() => audioHandler.skipToNext();

  bool get playing => audioHandler.playbackState.value.playing;
  
  // Duration
  Duration get duration => mediaItem?.duration ?? Duration.zero;
  Stream<Duration?> get durationStream =>
    audioHandler.mediaItem.where((m) => m != null).map((m) => m!.duration);

  // MediaItem
  Stream<MediaItem?> get mediaItemStream => audioHandler.mediaItem;
  MediaItem? get mediaItem => audioHandler.mediaItem.value;

  // PlaybackState
  Stream<PlaybackState> get playbackStateStream => audioHandler.playbackState;
  PlaybackState get playbackState => audioHandler.playbackState.value;

  // Position  
  Stream<Duration> get positionStream => audioHandler.playbackState
    .map((pb) => pb.position);
  Duration get position => audioHandler.playbackState.value.position;
  Future<Duration> get outputLatency => audioHandler.outputLatency;

  void _switchToChantingAudioHandler() {
    audioHandler.customAction(AppAudioHandler.switchAction, {
      'handlerId': ChantingAudioHandler.handlerId,
    });
  }
}
