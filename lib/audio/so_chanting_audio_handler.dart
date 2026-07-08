import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:dhyana/model/chanting_settings.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

enum SoLoudChantingAudioHandlerCustomAction { setup }

class _PlaylistEntry {
  final AudioSource source;
  final MediaItem mediaItem;

  const _PlaylistEntry({required this.source, required this.mediaItem});
}

/// Bridges the OS media session with audio playback using flutter_soloud.
/// Manually manages a playlist since flutter_soloud has no built-in
/// playlist support.
class SoLoudChantingAudioHandler extends BaseAudioHandler {
  static const handlerId = 'SoLoudChantingAudioHandler';

  final SoLoud soloud;

  List<_PlaylistEntry> _playlist = [];
  int _currentIndex = -1;
  SoundHandle? _soundHandle;
  StreamSubscription<void>? _trackEndedSub;
  Timer? _positionTimer;

  SoLoudChantingAudioHandler({required this.soloud})
    : assert(
        soloud.isInitialized,
        'SoLoud instance must be initialized before creating the audio handler',
      );

  @override
  Future<dynamic> customAction(
    String name, [
    Map<String, dynamic>? extras,
  ]) async {
    final action = SoLoudChantingAudioHandlerCustomAction.values.firstWhere(
      (e) => e.name == name,
      orElse: () => throw UnimplementedError('Unknown custom action: $name'),
    );
    switch (action) {
      case SoLoudChantingAudioHandlerCustomAction.setup:
        try {
          final chantingSettings = ChantingSettings.fromJson(
            extras!['chantingSettings'] as Map<String, Object?>,
          );
          final localAudioPaths =
              (extras['localAudioPaths'] ?? extras['resourceUrls'])
                  as Map<String, String>;
          final duration = await setup(chantingSettings, localAudioPaths);
          return duration ?? Duration.zero;
        } catch (e) {
          throw ArgumentError('Invalid extras for `$action` action: $extras');
        }
    }
  }

  /// Loads all chants from local files into the playlist and returns the
  /// of the first track.
  Future<Duration?> setup(
    ChantingSettings settings,
    Map<String, String> localAudioPaths,
  ) async {
    await _clearPlaylist();

    final entries = <_PlaylistEntry>[];
    for (final chant in settings.selectedChants) {
      final localPath = localAudioPaths[chant.id];
      if (localPath == null) {
        throw ArgumentError('No local audio path found for chant: ${chant.id}');
      }
      final file = File(localPath);
      if (!await file.exists()) {
        throw FileSystemException('Local audio file not found', localPath);
      }

      final source = await soloud.loadFile(localPath, mode: LoadMode.disk);
      entries.add(
        _PlaylistEntry(
          source: source,
          mediaItem: MediaItem(
            id: chant.id,
            title: chant.name,
            duration: chant.length,
          ),
        ),
      );
    }

    _playlist = entries;
    _currentIndex = entries.isEmpty ? -1 : 0;

    if (_playlist.isNotEmpty) {
      mediaItem.add(_playlist[0].mediaItem);
      return _playlist[0].mediaItem.duration;
    }
    return Duration.zero;
  }

  @override
  Future<void> play() async {
    if (_playlist.isEmpty || _currentIndex < 0) return;

    if (_soundHandle != null && soloud.getIsValidVoiceHandle(_soundHandle!)) {
      soloud.setPause(_soundHandle!, false);
    } else {
      await _playCurrentTrack();
    }

    // need to be short enough to keep word highlighting precise
    _startPositionTimer(intervalMs: 64); // 15 fps?
    _broadcastPlaybackState();
  }

  @override
  Future<void> pause() async {
    if (_soundHandle == null) return;
    if (soloud.getPause(_soundHandle!)) return; // already paused

    soloud.setPause(_soundHandle!, true);
    _stopPositionTimer();
    _broadcastPlaybackState();
  }

  @override
  Future<void> seek(Duration position) async {
    if (_soundHandle == null || !soloud.getIsValidVoiceHandle(_soundHandle!)) {
      return;
    }
    soloud.seek(_soundHandle!, position);
    _broadcastPlaybackState();
  }

  @override
  Future<void> stop() async {
    _stopPositionTimer();
    _trackEndedSub?.cancel();
    _trackEndedSub = null;

    if (_soundHandle != null && soloud.getIsValidVoiceHandle(_soundHandle!)) {
      await soloud.stop(_soundHandle!);
    }
    _soundHandle = null;

    mediaItem.add(null);
    playbackState.add(
      PlaybackState(
        controls: [MediaControl.play],
        processingState: AudioProcessingState.idle,
        playing: false,
        updatePosition: Duration.zero,
      ),
    );
  }

  @override
  Future<void> skipToPrevious() async {
    if (_currentIndex <= 0) return;
    final wasPlaying = _isPlaying;
    await _stopCurrentHandle();
    _currentIndex--;
    _updateCurrentMediaItem();
    if (wasPlaying) await _playCurrentTrack();
    _broadcastPlaybackState();
  }

  @override
  Future<void> skipToNext() async {
    if (_currentIndex >= _playlist.length - 1) return;
    final wasPlaying = _isPlaying;
    await _stopCurrentHandle();
    _currentIndex++;
    _updateCurrentMediaItem();
    if (wasPlaying) await _playCurrentTrack();
    _broadcastPlaybackState();
  }

  bool get _isPlaying {
    if (_soundHandle == null) return false;
    if (!soloud.getIsValidVoiceHandle(_soundHandle!)) return false;
    return !soloud.getPause(_soundHandle!);
  }

  Future<void> _playCurrentTrack() async {
    if (_playlist.isEmpty ||
        _currentIndex < 0 ||
        _currentIndex >= _playlist.length) {
      return;
    }
    final entry = _playlist[_currentIndex];
    _soundHandle = soloud.play(entry.source);
    _trackEndedSub?.cancel();
    _trackEndedSub = entry.source.allInstancesFinished.listen((_) {
      _onTrackEnded();
    });
  }

  void _onTrackEnded() {
    _trackEndedSub?.cancel();
    _trackEndedSub = null;
    _soundHandle = null;

    if (_currentIndex < _playlist.length - 1) {
      _currentIndex++;
      _updateCurrentMediaItem();
      _playCurrentTrack().then((_) => _broadcastPlaybackState());
    } else {
      _stopPositionTimer();
      playbackState.add(
        PlaybackState(
          controls: [MediaControl.play],
          processingState: AudioProcessingState.completed,
          playing: false,
          queueIndex: _currentIndex,
          updatePosition: Duration.zero,
        ),
      );
    }
  }

  Future<void> _stopCurrentHandle() async {
    _trackEndedSub?.cancel();
    _trackEndedSub = null;
    if (_soundHandle != null && soloud.getIsValidVoiceHandle(_soundHandle!)) {
      await soloud.stop(_soundHandle!);
    }
    _soundHandle = null;
  }

  void _updateCurrentMediaItem() {
    if (_currentIndex < 0 || _currentIndex >= _playlist.length) return;
    mediaItem.add(_playlist[_currentIndex].mediaItem);
  }

  Future<void> _clearPlaylist() async {
    _stopPositionTimer();
    await _stopCurrentHandle();
    for (final entry in _playlist) {
      if (soloud.isInitialized) {
        await soloud.disposeSource(entry.source);
      }
    }
    _playlist = [];
    _currentIndex = -1;
  }

  int getIntervalMs(Duration duration) {
    if (duration <= const Duration(seconds: 30)) {
      return 32;
    } else if (duration <= const Duration(minutes: 1)) {
      return 100;
    } else if (duration <= const Duration(minutes: 5)) {
      return 250;
    } else if (duration <= const Duration(minutes: 10)) {
      return 500;
    } else {
      return 1000;
    }
  }

  void _startPositionTimer({int intervalMs = 250}) {
    _positionTimer?.cancel();
    _positionTimer = Timer.periodic(
      Duration(milliseconds: intervalMs),
      (_) => _broadcastPlaybackState(),
    );
  }

  void _stopPositionTimer() {
    _positionTimer?.cancel();
    _positionTimer = null;
  }

  void _broadcastPlaybackState() {
    final position =
        _soundHandle != null && soloud.getIsValidVoiceHandle(_soundHandle!)
        ? soloud.getPosition(_soundHandle!)
        : Duration.zero;

    final playing = _isPlaying;
    playbackState.add(
      PlaybackState(
        controls: [playing ? MediaControl.pause : MediaControl.play],
        systemActions: const {},
        processingState: playing
            ? AudioProcessingState.ready
            : AudioProcessingState.idle,
        playing: playing,
        queueIndex: _currentIndex >= 0 ? _currentIndex : null,
        updatePosition: position,
      ),
    );
  }

  @override
  Future<void> click([MediaButton button = MediaButton.media]) async {
    // Disabled — handler does not react to media button clicks.
  }

  void close() {
    _stopPositionTimer();
    _trackEndedSub?.cancel();
    _trackEndedSub = null;
    if (_soundHandle != null &&
        soloud.isInitialized &&
        soloud.getIsValidVoiceHandle(_soundHandle!)) {
      soloud.stop(_soundHandle!);
    }
    _soundHandle = null;
    if (soloud.isInitialized) {
      for (final entry in _playlist) {
        soloud.disposeSource(entry.source);
      }
    }
    _playlist = [];
    _currentIndex = -1;
  }
}
