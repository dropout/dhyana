import 'dart:async';

import 'package:dhyana/enum/sound.dart';
import 'package:just_audio/just_audio.dart';

/// A simple audio service that can play discrete sounds without 
/// maintaining an active media session with the OS.
class SimpleAudioService {
	SimpleAudioService({AudioPlayer? player}) : _player = player ?? AudioPlayer();

	final AudioPlayer _player;

	Stream<Duration> get positionStream => _player.positionStream;

	bool get isPlaying => _player.playing;

	Stream<bool> get isPlayingStream => _player.playingStream;

	Future<void> play(Sound sound) async {
		await _player.stop();

		if (sound == Sound.none) {
			return;
		}

		await _player.setAsset(sound.assetPath);
		await _player.play();
	}

	Future<void> stop() => _player.stop();

	Future<void> dispose() => _player.dispose();
}
