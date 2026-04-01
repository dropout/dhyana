import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/util/debounce_stream_transformer.dart';
import 'package:dhyana/util/logger_mixin.dart';

/// Bridges the OS media session with audio playback.
///
/// Uses two separate [AudioPlayer] instances:
/// - [_bellPlayer]: low-latency player for discrete bell sound cues.
/// - [_chantPlayer]: standard player for URL-based chanting audio.
///
/// The [_chantPlayer] drives the OS lock screen / notification controls via
/// the [playbackState] and [mediaItem] subjects inherited from
/// [BaseAudioHandler].
class DhyanaAudioHandler extends BaseAudioHandler with LoggerMixin {
  
  final AudioPlayer _bellPlayer = AudioPlayer();
  final AudioPlayer _chantPlayer = AudioPlayer();

  StreamSubscription<PlayerState>? _chantStateSubscription;
  StreamSubscription<Duration>? _chantPositionSubscription;

  DhyanaAudioHandler() {
    _bellPlayer.setPlayerMode(PlayerMode.lowLatency);
    _bellPlayer.setReleaseMode(ReleaseMode.stop);
    _chantPlayer.setReleaseMode(ReleaseMode.stop);

    _chantStateSubscription = _chantPlayer.onPlayerStateChanged
      .distinct()
      .listen(_onChantPlayerStateChanged);

    _chantPositionSubscription = _chantPlayer.onPositionChanged.transform(
      DebounceStreamTransformer(Duration(milliseconds: 100)),
    ).listen((p) {
      playbackState.add(playbackState.value.copyWith(updatePosition: p));
    });
  }

  // ── Streams exposed for AudioHandlerAudioService ─────────────────────────

  Stream<Duration> get positionStream => _chantPlayer.onPositionChanged;

  Stream<bool> get isPlayingStream =>
      _chantPlayer.onPlayerStateChanged.map((s) => s == PlayerState.playing);

  Stream<void> get onCompletedStream => _chantPlayer.onPlayerComplete;

  bool get isPlaying => _chantPlayer.state == PlayerState.playing;

  // ── Bell playback ─────────────────────────────────────────────────────────

  /// Plays a discrete bell sound using the low-latency player.
  /// Does not affect the OS media session.
  Future<void> playSound(Sound sound) async {
    if (sound == Sound.none) {
      logger.t('No bell sound to play');
      return;
    }
    if (_bellPlayer.state == PlayerState.playing) {
      await _bellPlayer.stop();
    }
    logger.t('Playing bell sound: ${sound.name}');
    await _bellPlayer.play(AssetSource(sound.audioResourcePath));
  }

  // ── Chant playback ────────────────────────────────────────────────────────

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

  Future<void> release() async {
    await _chantPlayer.release();
  }

  // ── BaseAudioHandler overrides ────────────────────────────────────────────

  @override
  Future<void> play() async {
    logger.t('Handler play');
    await _chantPlayer.resume();
  }

  @override
  Future<void> pause() async {
    logger.t('Handler pause');
    await _chantPlayer.pause();
  }

  @override
  Future<void> stop() async {
    logger.t('Handler stop');
    await _chantPlayer.stop();
    playbackState.add(
      playbackState.value.copyWith(
        playing: false,
        processingState: AudioProcessingState.idle,
        controls: [],
      ),
    );
  }

  @override
  Future<void> seek(Duration position) async {
    logger.t('Handler seek: ${position.inSeconds}s');
    await _chantPlayer.seek(position);
  }

  // ── Internal ──────────────────────────────────────────────────────────────

  void _onChantPlayerStateChanged(PlayerState state) {
    final isNowPlaying = state == PlayerState.playing;
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

  void close() {
    _chantStateSubscription?.cancel();
    _chantPositionSubscription?.cancel();
    _bellPlayer.dispose();
    _chantPlayer.dispose();
  }
}
