import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:dhyana/model/chanting_settings.dart';
import 'package:just_audio/just_audio.dart';

enum ChantingHandlerCustomAction { setup }

/// Bridges the OS media session with audio playback.
/// The [_chantPlayer] drives the OS lock screen / notification controls via
/// the [playbackState] and [mediaItem] subjects inherited from
/// [BaseAudioHandler].
class ChantingAudioHandler extends BaseAudioHandler {
  static const handlerId = 'ChantingAudioHandler';

  final AudioPlayer _chantPlayer = AudioPlayer();

  StreamSubscription<int?>? _currentIndexSub;
  StreamSubscription<PlayerState>? _stateSub;
  StreamSubscription<Duration>? _positionSub;

  ChantingAudioHandler() {
    _currentIndexSub = _chantPlayer.currentIndexStream.distinct().listen(_onCurrentIndexChanged);

    // Propagating player state
    _stateSub = _chantPlayer.playerStateStream.listen(
      _onChantPlayerStateChanged,
    );

    // Updating player position
    _positionSub = _chantPlayer.positionStream.listen(
      _onPositionChanged      
    );
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
      case ChantingHandlerCustomAction.setup:
        try {
          final chantingSettings = ChantingSettings.fromJson(
            extras!['chantingSettings'],
          );
          final resourceUrls = extras['resourceUrls'] as Map<String, String>;
          final duration = await setup(chantingSettings, resourceUrls);
          return duration ?? Duration.zero;
        } catch (e) {
          throw ArgumentError('Invalid extras for `$action` action: $extras');
        }
    }
  }

  /// Sets up the chanting the audioplayer with chanting playlist,
  /// and returns the duration of the first chant.
  Future<Duration?> setup(
    ChantingSettings settings,
    Map<String, String> resourceUrls,
  ) async {
    final audioSources = settings.selectedChants.map((chant) {
      final url = resourceUrls[chant.id];
      if (url == null) {
        throw ArgumentError('No URL found for chant: ${chant.id}');
      }
      return AudioSource.uri(
        Uri.parse(url),
        tag: MediaItem(
          id: chant.id, 
          title: chant.name, 
          duration: chant.length,
        ),
      );
    }).toList();
    await _chantPlayer.clearAudioSources();
    final duration = await _chantPlayer.setAudioSources(
      audioSources,
      initialIndex: 0,
      initialPosition: Duration.zero,
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
    _chantPlayer.clearAudioSources();
    mediaItem.add(null);
  }

  @override
  Future<void> skipToPrevious() => 
    _chantPlayer.seekToPrevious();

  @override
  Future<void> skipToNext() => 
    _chantPlayer.seekToNext();

  void _onChantPlayerStateChanged(_) => 
    _broadCastPlayerStateChange();

  void _onPositionChanged(_) => 
    _broadCastPlayerStateChange();

  void _broadCastPlayerStateChange() {
    playbackState.add(
      PlaybackState(
        controls: [
          _chantPlayer.playing ? MediaControl.pause : MediaControl.play,
        ],
        systemActions: const {},
        processingState: _toProcessingState(_chantPlayer.playerState),
        playing: _chantPlayer.playing,
        queueIndex: _chantPlayer.currentIndex,
        bufferedPosition: _chantPlayer.bufferedPosition,
        updatePosition: _chantPlayer.position,
      ),
    );
  }

  void _onCurrentIndexChanged(int? index) { 
    if (index == null) return;
    final sequence = _chantPlayer.sequence;
    if (index >= sequence.length) return;
    final source = sequence[index];
    final mediaItem = source.tag as MediaItem;    
    this.mediaItem.add(mediaItem);
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
    _currentIndexSub?.cancel();
    _stateSub?.cancel();
    _positionSub?.cancel();
    _chantPlayer.dispose();
  }
}
