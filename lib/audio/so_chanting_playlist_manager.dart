import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/chant_local_resources.dart';

typedef SoChantingPlaylistIndexChanged = Future<void> Function();

class SoChantingPlaylistEntry {
  final ChantLocalResources source;
  final MediaItem mediaItem;

  const SoChantingPlaylistEntry({
    required this.source,
    required this.mediaItem,
  });
}

/// Manages a playlist of chanting audio tracks for playback.
/// 
class SoChantingPlaylistManager {
  final SoChantingPlaylistIndexChanged? onCurrentIndexChanged;

  List<SoChantingPlaylistEntry> _entries = [];
  int _currentIndex = -1;

  SoChantingPlaylistManager({this.onCurrentIndexChanged});

  List<SoChantingPlaylistEntry> get entries => _entries;

  int get currentIndex => _currentIndex;

  bool get hasCurrent => _currentIndex >= 0 && _currentIndex < _entries.length;

  SoChantingPlaylistEntry? get currentEntry =>
      hasCurrent ? _entries[_currentIndex] : null;

  MediaItem? get currentMediaItem => currentEntry?.mediaItem;

  Future<void> setup(List<SoChantingPlaylistEntry> entries) async {
    await clear();
    _entries = List.of(entries);
    _currentIndex = _entries.isEmpty ? -1 : 0;
  }

  Future<void> skipToPrevious() async {
    if (_currentIndex <= 0) throw StateError('No previous entry to skip to');
    await _setCurrentIndex(_currentIndex - 1);
  }

  Future<void> skipToNext() async {
    if (_currentIndex < 0 || _currentIndex >= _entries.length - 1) {
      throw StateError('No next entry to skip to');
    }
    await _setCurrentIndex(_currentIndex + 1);
  }

  Future<void> clear() async {
    final hadCurrentState = hasCurrent || _entries.isNotEmpty;
    _entries = [];
    _currentIndex = -1;

    if (hadCurrentState) {
      await _notifyIndexChanged();
    }
  }

  Future<void> _setCurrentIndex(int nextIndex) async {
    if (_currentIndex == nextIndex) return;
    _currentIndex = nextIndex;
    await _notifyIndexChanged();
  }

  Future<void> _notifyIndexChanged() async {
    if (onCurrentIndexChanged != null) {
      await onCurrentIndexChanged!();
    }
  }
}