import 'package:flutter_soloud/flutter_soloud.dart';

abstract interface class SoChantingAudioResourceManager {
  bool get isLoaded;

  Future<AudioSource?> load(String localPath);

  Future<void> invalidate();

  Future<void> clear();
}

class SoLoudSoChantingAudioResourceManager
    implements SoChantingAudioResourceManager {
  final SoLoud soloud;

  AudioSource? _currentSource;
  String? _currentPath;

  SoLoudSoChantingAudioResourceManager({required this.soloud});

  @override
  bool get isLoaded => _currentSource != null && soloud.isInitialized;

  @override
  Future<AudioSource?> load(String localPath) async {
    if (_currentSource != null && _currentPath == localPath) {
      return _currentSource;
    }

    await invalidate();

    _currentSource = await soloud.loadFile(localPath);
    _currentPath = localPath;
    return _currentSource;
  }

  @override
  Future<void> invalidate() async {
    if (_currentSource != null && soloud.isInitialized) {
      await soloud.disposeSource(_currentSource!);
    }
    _currentSource = null;
    _currentPath = null;
  }

  @override
  Future<void> clear() async {
    await invalidate();
  }
}