import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

enum ChantingHandlerCustomAction { loadChant }

/// Bridges the OS media session with audio playback.
/// The [_chantPlayer] drives the OS lock screen / notification controls via
/// the [playbackState] and [mediaItem] subjects inherited from
/// [BaseAudioHandler].
class ChantingAudioHandler extends BaseAudioHandler {
  static const handlerId = 'ChantingAudioHandler';

  final AudioPlayer _chantPlayer = AudioPlayer();

  StreamSubscription<PlayerState>? _stateSub;
  StreamSubscription<Duration>? _positionSub;

  ChantingAudioHandler() {
    _stateSub = _chantPlayer.playerStateStream.distinct().listen(
      _onChantPlayerStateChanged,
    );
    _positionSub = _chantPlayer.positionStream.listen((p) {
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
    }
  }

  /// Loads a chant from [url] and updates the OS media session [mediaItem]
  /// with [title] so the lock screen shows the chant name.
  Future<Duration?> loadChant(String url, {String? title}) async {
    final duration = await _chantPlayer.setUrl(url);
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
  Future<void> play() => _chantPlayer.play();

  @override
  Future<void> pause() => _chantPlayer.pause();

  @override
  Future<void> seek(Duration position) => _chantPlayer.seek(position);

  @override
  Future<void> stop() async {
    await _chantPlayer.stop();
    mediaItem.add(null);
    playbackState.add(
      playbackState.value.copyWith(
        playing: false,
        processingState: AudioProcessingState.idle,
        controls: [],
      ),
    );
  }

  void _onChantPlayerStateChanged(PlayerState state) {
    playbackState.add(
      playbackState.value.copyWith(
        controls: [state.playing ? MediaControl.pause : MediaControl.play],
        systemActions: const {},
        processingState: _toProcessingState(state),
        playing: state.playing,
      ),
    );
  }

  AudioProcessingState _toProcessingState(PlayerState state) => switch (state) {
    PlayerState(processingState: ProcessingState.idle) =>
      AudioProcessingState.idle,
    PlayerState(processingState: ProcessingState.loading) =>
      AudioProcessingState.loading,
    PlayerState(processingState: ProcessingState.buffering) =>
      AudioProcessingState.buffering,
    PlayerState(processingState: ProcessingState.ready) =>
      AudioProcessingState.ready,
    PlayerState(processingState: ProcessingState.completed) =>
      AudioProcessingState.completed,
  };

  @override
  Future<void> click([MediaButton button = MediaButton.media]) async {
    // ovveride BaseAudioHandler.click to disable functionality
    // added there.
    // Timer Audio Handler does not need to react to bluetooth
    // and headphone controller button clicks just yet
  }

  void close() {
    _stateSub?.cancel();
    _positionSub?.cancel();
    _chantPlayer.dispose();
  }
  
}
