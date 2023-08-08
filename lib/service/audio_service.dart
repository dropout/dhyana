import 'dart:async';

import 'package:dhyana/enum/sound.dart';

abstract class AudioService  {

  Future<void> play(Sound sound);
  void close();

}
