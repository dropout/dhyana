enum Sound {
  none,
  smallBell,
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
