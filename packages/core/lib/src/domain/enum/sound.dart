enum SoundType { audio, haptic }

enum Sound {
  none(0, 0, SoundType.audio),
  vibrate(1, 1, SoundType.haptic),
  smallBell(2, 2, SoundType.audio),
  triangle(3, 3, SoundType.audio);

  const Sound(this.id, this.priority, this.type);
  final int id;
  final int priority;
  final SoundType type;
}

extension ImageResourceUrl on Sound {
  String get imagePath {
    switch (this) {
      case Sound.none:
        return 'packages/core/assets/images/no_sound.jpg';
      case Sound.smallBell:
        return 'packages/core/assets/images/small_bell.jpg';
      case Sound.vibrate:
        return 'packages/core/assets/images/vibrate.jpg';
      case Sound.triangle:
        return 'packages/core/assets/images/triangle.jpg';
    }
  }
}

extension ResourceUrl on Sound {
  String get assetPath {
    switch (this) {
      case Sound.none:
        return 'packages/core/assets/sounds/no_sound.mp3';
      case Sound.smallBell:
        return 'packages/core/assets/sounds/small_bell.mp3';
      case Sound.vibrate:
        return 'packages/core/assets/haptics/vibration.ahap';
      case Sound.triangle:
        return 'packages/core/assets/sounds/triangle.mp3';
    }
  }
}

Sound getSoundById(int id) {
  return Sound.values.firstWhere(
    (sound) => sound.id == id,
    orElse: () => Sound.none,
  );
}
