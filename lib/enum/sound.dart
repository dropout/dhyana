enum Sound {
  none(0, 0),
  smallBell(1, 1);

  const Sound(this.id, this.priority);
  final int id;
  final int priority;
}

extension ImageResourceUrl on Sound {
  String get imageResourcePath {
    switch (this) {
      case Sound.none:
        return 'assets/images/no_sound.jpg';
      case Sound.smallBell:
        return 'assets/images/small_bell.jpg';
    }
  }
}

extension SoundResourceUrl on Sound {
  String get audioResourcePath {
    switch (this) {
      case Sound.none:
        return 'assets/sounds/no_sound.mp3';
      case Sound.smallBell:
        return 'assets/sounds/small_bell.mp3';
    }
  }
}

Sound getSoundById(int id) {
  return Sound.values.firstWhere((sound) => sound.id == id, orElse: () => Sound.none);
}
