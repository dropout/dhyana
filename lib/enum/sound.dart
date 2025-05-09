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
        return 'assets/images/00.png';
      case Sound.smallBell:
        return 'assets/images/01.png';
    }
  }
}

extension SoundResourceUrl on Sound {
  String get audioResourcePath {
    switch (this) {
      case Sound.none:
        return 'sounds/no_sound.mp3';
      case Sound.smallBell:
        return 'sounds/small_bell.mp3';
    }
  }
}

Sound getSoundById(int id) {
  return Sound.values.firstWhere((sound) => sound.id == id, orElse: () => Sound.none);
}
