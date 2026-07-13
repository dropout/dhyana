import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:dhyana/audio/so_chanting_audio_resource_manager.dart';
import 'package:dhyana/audio/so_chanting_playlist_manager.dart';
import 'package:dhyana/audio/so_chanting_playback_reporter.dart';
import 'package:dhyana/model/chant_local_resources.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

enum SoLoudChantingAudioHandlerCustomAction { setup }

/// Bridges the OS media session with audio playback using flutter_soloud.
/// Manually manages a playlist since flutter_soloud has no built-in
/// playlist support.
class SoLoudChantingAudioHandler extends BaseAudioHandler {
  static const handlerId = 'SoLoudChantingAudioHandler';

  final SoLoud soloud;

  late final SoChantingAudioResourceManager _audioResourceManager;
  late final SoChantingPlaylistManager _playlistManager;
  late final SoChantingPlaybackReporter _playbackReporter;

  SoundHandle? _soundHandle;

  StreamSubscription<void>? _trackEndedSub;

  SoLoudChantingAudioHandler({
    required this.soloud,
    SoChantingAudioResourceManager? audioResourceManager,
    SoChantingPlaylistManager? playlistManager,
    SoChantingPlaybackReporter? playbackReporter,
  })
    : assert(
        soloud.isInitialized,
        'SoLoud instance must be initialized before creating the audio handler',
      ) {
    _audioResourceManager =
        audioResourceManager ??
        SoLoudSoChantingAudioResourceManager(soloud: soloud);
    _playlistManager =
        playlistManager ??
        SoChantingPlaylistManager(
          onCurrentIndexChanged: _audioResourceManager.invalidate,
        );
    _playbackReporter =
      playbackReporter ??
      SoLoudSoChantingPlaybackReporter(
        playbackStateSink: playbackState.add,
        positionProvider: () =>
          _soundHandle != null && soloud.getIsValidVoiceHandle(_soundHandle!)
          ? soloud.getPosition(_soundHandle!)
          : Duration.zero,
        playingProvider: () => _isPlaying,
        queueIndexProvider: () => _playlistManager.currentIndex >= 0
          ? _playlistManager.currentIndex
          : null,
      );
  }

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
      case .setup:
        try {
          // Expecting extras to contain a JSON-encoded list of ChantLocalResources
          final resourcesJson = extras!['resources'] as String?;
          final List<ChantLocalResources> resources = resourcesJson != null
              ? (jsonDecode(resourcesJson) as List)
                    .map(
                      (item) => ChantLocalResources.fromJson(
                        item as Map<String, Object?>,
                      ),
                    )
                    .toList()
              : [];
          return await setup(resources);
        } catch (e) {
          throw ArgumentError('Invalid extras for `$action` action: $extras');
        }
    }
  }

  /// Loads all chants from local files into the playlist and returns the
  /// duration of the first track.
  Future<Duration?> setup(List<ChantLocalResources> resources) async {
    await _clearPlaylist();

    // Guard against empty resources list
    if (resources.isEmpty) {
      return Duration.zero;
    }

    final entries = <SoChantingPlaylistEntry>[];
    for (final r in resources) {
      final chant = r.chant;
      final localPath = r.audioLocalPath;
      final file = File(localPath);
      if (!await file.exists()) {
        throw FileSystemException('Local audio file not found', localPath);
      }

      entries.add(
        SoChantingPlaylistEntry(
          source: r,
          mediaItem: MediaItem(
            id: chant.id,
            title: chant.name,
            duration: chant.length,
          ),
        ),
      );
    }

    await _playlistManager.setup(entries);

    final currentMediaItem = _playlistManager.currentMediaItem;
    if (currentMediaItem != null) {
      mediaItem.add(currentMediaItem);
      return currentMediaItem.duration;
    }
    return Duration.zero;
  }

  @override
  Future<void> play() async {
    if (!_playlistManager.hasCurrent) {
      debugPrint('No track to play. Playlist is empty or index is invalid.');
      return;
    }
    if (_soundHandle != null && soloud.getIsValidVoiceHandle(_soundHandle!)) {
      soloud.setPause(_soundHandle!, false);
      _playbackReporter.start();
      _playbackReporter.emitCurrentState();
    } else {
      await _playCurrentTrack();
    }
  }

  @override
  Future<void> pause() async {
    if (_soundHandle == null) return;
    if (soloud.getPause(_soundHandle!)) return; // already paused

    soloud.setPause(_soundHandle!, true);
    _playbackReporter.stop();
    _playbackReporter.emitCurrentState();
  }

  @override
  Future<void> seek(Duration position) async {
    if (_soundHandle == null || !soloud.getIsValidVoiceHandle(_soundHandle!)) {
      return;
    }
    soloud.seek(_soundHandle!, position);
    _playbackReporter.emitCurrentState();
  }

  @override
  Future<void> stop() async {
    _trackEndedSub?.cancel();
    _trackEndedSub = null;

    if (_soundHandle != null && soloud.getIsValidVoiceHandle(_soundHandle!)) {
      await soloud.stop(_soundHandle!);
    }
    _soundHandle = null;
    _playbackReporter.stop();
    mediaItem.add(null);
    _playbackReporter.emitStopped();
  }

  @override
  Future<void> skipToPrevious() async {
    if (!_playlistManager.hasCurrent) return;
    final wasPlaying = _isPlaying;
    await _stopCurrentHandle();
    try {
      await _playlistManager.skipToPrevious();
    } on StateError catch (e) {
      debugPrint('Cannot skip to previous: ${e.message}');
      return;
    }
    _updateCurrentMediaItem();
    if (wasPlaying) {
      await _playCurrentTrack();
    } else {
      _playbackReporter.emitCurrentState();
    }
  }

  @override
  Future<void> skipToNext() async {
    if (!_playlistManager.hasCurrent) return;
    final wasPlaying = _isPlaying;
    await _stopCurrentHandle();
    try {
      await _playlistManager.skipToNext();
    } on StateError catch (e) {
      debugPrint('Cannot skip to next: ${e.message}');
      return;
    }
    _updateCurrentMediaItem();
    if (wasPlaying) {
      await _playCurrentTrack();
    } else {
      _playbackReporter.emitCurrentState();
    }
  }

  bool get _isPlaying {
    if (_soundHandle == null) return false;
    if (!soloud.getIsValidVoiceHandle(_soundHandle!)) return false;
    return !soloud.getPause(_soundHandle!);
  }

  Future<void> _playCurrentTrack() async {
    if (!_playlistManager.hasCurrent) {
      return;
    }

    if (!_audioResourceManager.isLoaded) {
      _playbackReporter.emitLoading();
    }

    final currentEntry = _playlistManager.currentEntry;
    if (currentEntry == null) return;

    final source = await _audioResourceManager.load(
      currentEntry.source.audioLocalPath,
    );

    if (source != null) {
      _soundHandle = soloud.play(source);
      _playbackReporter.start();
      _playbackReporter.emitCurrentState();
      _trackEndedSub?.cancel();
      _trackEndedSub = source.allInstancesFinished.listen((_) {
        _onTrackEnded();
      });
    } else {
      debugPrint('Current source is null. Cannot play track.');
    }
  }

  Future<void> _onTrackEnded() async {
    _trackEndedSub?.cancel();
    _trackEndedSub = null;
    _soundHandle = null;
    _playbackReporter.stop();


    try {
      await _playlistManager.skipToNext();
      _updateCurrentMediaItem();
      _playCurrentTrack();
    } catch (e) {
      debugPrint('Cannot skip to next: ${e.toString()}');            
    } finally {
      _playbackReporter.emitCurrentState();
    }

  }

  Future<void> _stopCurrentHandle() async {
    _trackEndedSub?.cancel();
    _trackEndedSub = null;
    if (_soundHandle != null && soloud.getIsValidVoiceHandle(_soundHandle!)) {
      await soloud.stop(_soundHandle!);
    }
    _playbackReporter.stop();
    _soundHandle = null;
  }

  void _updateCurrentMediaItem() {
    final item = _playlistManager.currentMediaItem;
    if (item == null) return;
    mediaItem.add(item);
  }

  Future<void> _clearPlaylist() async {
    await _stopCurrentHandle();
    await _playlistManager.clear();
  }

  @override
  Future<void> click([MediaButton button = MediaButton.media]) async {
    // Disabled — handler does not react to media button clicks.
  }

  void close() {
    _trackEndedSub?.cancel();
    _trackEndedSub = null;
    if (_soundHandle != null &&
        soloud.isInitialized &&
        soloud.getIsValidVoiceHandle(_soundHandle!)) {
      soloud.stop(_soundHandle!);
    }
    _soundHandle = null;
    _playbackReporter.stop();
    unawaited(_playlistManager.clear());
  }
}


