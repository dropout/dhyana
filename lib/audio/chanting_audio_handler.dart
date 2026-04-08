import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dhyana/util/throttle_stream_transformer.dart';

enum ChantingHandlerCustomAction { loadChant, release }

/// Bridges the OS media session with audio playback.
/// The [_chantPlayer] drives the OS lock screen / notification controls via
/// the [playbackState] and [mediaItem] subjects inherited from
/// [BaseAudioHandler].
class ChantingAudioHandler extends BaseAudioHandler {
  
  static const handlerId = 'ChantingAudioHandler';

  final AudioPlayer _chantPlayer = AudioPlayer();

  StreamSubscription<PlayerState>? _chantStateSubscription;
  StreamSubscription<Duration>? _chantPositionSubscription;

  ChantingAudioHandler() {
    _chantPlayer.setReleaseMode(ReleaseMode.stop);

    _chantStateSubscription = _chantPlayer.onPlayerStateChanged
      .distinct()
      .listen(_onChantPlayerStateChanged);

    _chantPositionSubscription = _chantPlayer.onPositionChanged
      .transform(ThrottleStreamTransformer(Duration(milliseconds: 100)))
      .listen((p) {
        playbackState.add(playbackState.value.copyWith(updatePosition: p));
      });
  }

  @override
  Future<dynamic> customAction(
    String name, [
    Map<String, dynamic>? extras,
  ]) async {
    final action = ChantingHandlerCustomAction.values.firstWhere(
      (e) => e.name == name,
      orElse: () => throw UnimplementedError('Unknown custom action: $name'),
    );

    switch (action) {
      case ChantingHandlerCustomAction.loadChant:
        try {
          final url = extras!['url'] as String;
          final title = extras['title'] as String?;
          return loadChant(url, title: title);
        } catch (e) {
          throw ArgumentError('Invalid extras for loadChant action: $extras');
        }
      case ChantingHandlerCustomAction.release:
        mediaItem.add(null);
        playbackState.add(PlaybackState(
          controls: [],
          systemActions: const {},
          androidCompactActionIndices: const [],
        ));
        return _chantPlayer.release();
    }

  }

  /// Loads a chant from [url] and updates the OS media session [mediaItem]
  /// with [title] so the lock screen shows the chant name.
  Future<Duration?> loadChant(String url, {String? title}) async {
    await _chantPlayer.setSourceUrl(url);
    final duration = await _chantPlayer.getDuration();
    mediaItem.add(
      MediaItem(
        id: url,
        title: title ?? '',
        album: "Science Friday",
        artist: "Science Friday and WNYC Studios",
        duration: duration,
        artUri: Uri.parse(
          'https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg',
        ),
      ),
    );
    return duration;
  }

  @override
  Future<void> play() =>
    _chantPlayer.resume();
  
  @override
  Future<void> pause() => 
    _chantPlayer.pause();

  @override
  Future<void> seek(Duration position) => 
    _chantPlayer.seek(position);
  
  @override
  Future<void> stop() async {
    await _chantPlayer.stop();
    playbackState.add(
      playbackState.value.copyWith(
        playing: false,
        processingState: AudioProcessingState.idle,
        controls: [],
      ),
    );
  }
  
  void _onChantPlayerStateChanged(PlayerState state) {
    final isNowPlaying = (state == PlayerState.playing);
    playbackState.add(
      playbackState.value.copyWith(
        controls: [isNowPlaying ? MediaControl.pause : MediaControl.play],
        systemActions: const {},
        processingState: _toProcessingState(state),
        playing: isNowPlaying,
      ),
    );
  }

  AudioProcessingState _toProcessingState(PlayerState state) => switch (state) {
    PlayerState.playing => AudioProcessingState.ready,
    PlayerState.paused => AudioProcessingState.ready,
    PlayerState.stopped => AudioProcessingState.idle,
    PlayerState.completed => AudioProcessingState.completed,
    PlayerState.disposed => AudioProcessingState.idle,
  };

  @override
  Future<void> click([MediaButton button = MediaButton.media]) async {
    // ovveride BaseAudioHandler.click to disable functionality
    // added there.
    // Timer Audio Handler does not need to react to bluetooth
    // and headphone controller button clicks just yet
  }

  void close() {
    _chantStateSubscription?.cancel();
    _chantPositionSubscription?.cancel();
    _chantPlayer.dispose();
  }

}
