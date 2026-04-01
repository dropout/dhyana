import 'dart:async';

import 'package:audio_service/audio_service.dart' as as_lib;
import 'package:dhyana/enum/playback_state.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/service/audio_service.dart';
import 'package:dhyana/service/default/dhyana_audio_handler.dart';

/// [AudioService] implementation that delegates to [DhyanaAudioHandler],
/// enabling lock screen / notification media controls for chanting playback.
class AudioHandlerAudioService implements AudioService {

  final DhyanaAudioHandler _handler;

  const AudioHandlerAudioService(this._handler);

  @override
  Future<void> playSound(Sound sound) => _handler.playSound(sound);

  @override
  Future<Duration?> loadFromUrl(String url, {String? title}) =>
    _handler.loadChant(url, title: title);

  @override
  Future<void> play() => _handler.play();

  @override
  Future<void> pause() => _handler.pause();

  @override
  Future<void> seek(Duration position) => _handler.seek(position);

  @override
  Future<void> stop() => _handler.stop();

  @override
  Future<void> release() => _handler.release();

  @override
  bool get isPlaying => _handler.isPlaying;

  @override
  Stream<bool> get isPlayingStream => _handler.isPlayingStream;

  @override
  Stream<Duration> get positionStream => _handler.positionStream;

  @override
  Stream<void> get onCompletedStream => _handler.onCompletedStream;

  @override
  Stream<PlaybackState> get playbackStateStream =>
      _handler.playbackState.stream.map(_toDomainState);

  @override
  void close() => _handler.close();

  PlaybackState _toDomainState(as_lib.PlaybackState state) {
    if (state.playing) return PlaybackState.playing;
    return switch (state.processingState) {
      as_lib.AudioProcessingState.idle => PlaybackState.stopped,
      as_lib.AudioProcessingState.loading => PlaybackState.loading,
      as_lib.AudioProcessingState.buffering => PlaybackState.loading,
      as_lib.AudioProcessingState.ready => PlaybackState.paused,
      as_lib.AudioProcessingState.completed => PlaybackState.completed,
      as_lib.AudioProcessingState.error => PlaybackState.error,
    };
  }
}
