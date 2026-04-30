enum Sound {
  none(0, 0),
  vibrate(1, 1),
  smallBell(2, 2);

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
      case Sound.vibrate:
        return 'assets/images/vibrate.jpg'; 
    }
  }
}

extension ResourceUrl on Sound {
  String get assetPath {
    switch (this) {
      case Sound.none:
        return 'assets/sounds/no_sound.mp3';
      case Sound.smallBell:
        return 'assets/sounds/small_bell.mp3';
      case Sound.vibrate:
        return 'assets/haptics/vibration.ahap';
    }
  }
}

Sound getSoundById(int id) {
  return Sound.values.firstWhere((sound) => sound.id == id, orElse: () => Sound.none);
}
