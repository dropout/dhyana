import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/modules/practice/timer/domain/model/timer_settings.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

enum SoTimerHandlerCustomAction { start, playSound }

/// Custom [AudioHandler] that manages audio for the timer session, including
/// maintaining an active media session for background execution and lock screen
/// integration, as well as playing discrete sounds for timer cues.
/// It also serves as a source of truth for the timer.
///
/// Uses [flutter_soloud] for audio playback instead of just_audio.
class SoTimerAudioHandler extends BaseAudioHandler {
  static const handlerId = 'TimerAudioHandler';

  final SoLoud soloud;

  /// Cached [AudioSource] for the silent background audio used to hold
  /// the OS media session open. Kept across sessions to avoid reloading.
  AudioSource? _bgSource;

  /// Active [SoundHandle] for the looping background audio.
  SoundHandle? _bgHandle;

  /// Cache of preloaded [AudioSource]s for bell sounds, keyed by [Sound].
  final Map<Sound, AudioSource> _soundSources = {};

  /// Active [SoundHandle] for the most recently played discrete sound.
  SoundHandle? _soundHandle;

  Timer? _positionTimer;
  DateTime? _lastPositionUpdateTime;
  Duration _sessionDuration = Duration.zero;

  SoTimerAudioHandler({required this.soloud})
    : assert(
      soloud.isInitialized,
      'SoLoud instance must be initialized before creating the handler',
    );

  @override
  Future<dynamic> customAction(
    String name, [
    Map<String, dynamic>? extras,
  ]) async {
    final action = SoTimerHandlerCustomAction.values.firstWhere(
      (e) => e.name == name,
      orElse: () => throw UnimplementedError('Unknown custom action: $name'),
    );
    switch (action) {
      case SoTimerHandlerCustomAction.start:
        try {
          final timerSettings = TimerSettings.fromJson(extras!);
          return _start(timerSettings);
        } catch (e) {
          throw ArgumentError(
            'Invalid timer settings for start action: $extras',
          );
        }
      case SoTimerHandlerCustomAction.playSound:
        try {
          final soundValue = extras!['sound'] as String;
          final sound = Sound.values.firstWhere(
            (s) => s.name == soundValue,
            orElse: () =>
                throw ArgumentError('Unknown sound value: $soundValue'),
          );
          return _playSound(sound);
        } catch (e) {
          throw ArgumentError('Invalid sound for playSound action: $extras');
        }
    }
  }

  @override
  Future<void> play() async {
    if (_bgHandle != null && soloud.getIsValidVoiceHandle(_bgHandle!)) {
      soloud.setPause(_bgHandle!, false);
    }
    _lastPositionUpdateTime = DateTime.now();
    _startPositionTimer();
    _broadcastPlaybackState();
  }

  @override
  Future<void> pause() async {
    if (_bgHandle != null && soloud.getIsValidVoiceHandle(_bgHandle!)) {
      soloud.setPause(_bgHandle!, true);
    }
    _stopPositionTimer();
    _broadcastPlaybackState();
  }

  @override
  Future<void> stop() async {
    _stopPositionTimer();
    if (_bgHandle != null && soloud.getIsValidVoiceHandle(_bgHandle!)) {
      await soloud.stop(_bgHandle!);
    }
    _bgHandle = null;
    _lastPositionUpdateTime = null;
    _sessionDuration = Duration.zero;
    playbackState.add(
      PlaybackState(
        controls: [],
        processingState: AudioProcessingState.idle,
        playing: false,
        updatePosition: Duration.zero,
      ),
    );
  }

  Future<void> _start(TimerSettings timerSettings) async {
    await stop();

    // Load the silent background audio source once and reuse it across sessions.
    _bgSource ??= await soloud.loadAsset(Sound.none.assetPath, mode: .disk);
    _bgHandle = soloud.play(_bgSource!, looping: true);

    // Eagerly load the sounds this session will use so they're ready when cued.
    for (final sound in {
      timerSettings.startingSound,
      timerSettings.endingSound,
    }) {
      if (_isSoundPlayable(sound)) {
        _soundSources[sound] ??= await soloud.loadAsset(sound.assetPath);
      }
    }

    mediaItem.add(
      MediaItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: 'Timer Session',
        artist: 'Dhyana App',
        album: 'Current Timer Session',
        duration: timerSettings.totalTime,
        artUri: Uri.parse(
          'https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg',
        ),
      ),
    );

    _lastPositionUpdateTime = DateTime.now();
    _sessionDuration = Duration.zero;
    _startPositionTimer();
    playbackState.add(
      PlaybackState(
        controls: [],
        systemActions: const {},
        processingState: AudioProcessingState.ready,
        playing: true,
        updatePosition: Duration.zero,
      ),
    );
  }

  Future<void> _playSound(Sound sound) async {
    if (!_isSoundPlayable(sound)) return;

    if (_soundHandle != null && soloud.getIsValidVoiceHandle(_soundHandle!)) {
      await soloud.stop(_soundHandle!);
    }

    final source =
        _soundSources[sound] ?? await soloud.loadAsset(sound.assetPath);
    _soundSources[sound] = source;
    _soundHandle = soloud.play(source);
  }

  bool _isSoundPlayable(Sound sound) =>
      sound != Sound.none && sound != Sound.vibrate;

  void _startPositionTimer() {
    _positionTimer?.cancel();
    _positionTimer = Timer.periodic(
      const Duration(milliseconds: 250),
      (_) => _onPositionTimerTick(),
    );
  }

  void _stopPositionTimer() {
    _positionTimer?.cancel();
    _positionTimer = null;
  }

  void _onPositionTimerTick() {
    final now = DateTime.now();
    if (_lastPositionUpdateTime != null) {
      _sessionDuration += now.difference(_lastPositionUpdateTime!);
    }
    _lastPositionUpdateTime = now;
    _broadcastPlaybackState();
  }

  void _broadcastPlaybackState() {
    final isPlaying =
        _bgHandle != null &&
        soloud.getIsValidVoiceHandle(_bgHandle!) &&
        !soloud.getPause(_bgHandle!);
    playbackState.add(
      PlaybackState(
        controls: [],
        systemActions: const {},
        processingState: AudioProcessingState.ready,
        playing: isPlaying,
        updatePosition: _sessionDuration,
      ),
    );
  }

  @override
  Future<void> click([MediaButton button = MediaButton.media]) async {
    // Disabled — handler does not react to media button clicks.
  }

  void close() {
    _stopPositionTimer();
    if (_bgHandle != null &&
        soloud.isInitialized &&
        soloud.getIsValidVoiceHandle(_bgHandle!)) {
      soloud.stop(_bgHandle!);
    }
    _bgHandle = null;
    if (_soundHandle != null &&
        soloud.isInitialized &&
        soloud.getIsValidVoiceHandle(_soundHandle!)) {
      soloud.stop(_soundHandle!);
    }
    _soundHandle = null;
    if (soloud.isInitialized) {
      if (_bgSource != null) soloud.disposeSource(_bgSource!);
      for (final source in _soundSources.values) {
        soloud.disposeSource(source);
      }
    }
    _bgSource = null;
    _soundSources.clear();
  }
}
